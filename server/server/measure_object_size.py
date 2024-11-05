from flask import Flask, request, jsonify
import cv2
import numpy as np
import cv2.aruco as aruco
from object_detector import HomogeneousBgDetector

# Initialize Flask application
app = Flask(__name__)

# ArUco marker detection setup
parameters = aruco.DetectorParameters()
aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_5X5_50)


# Load the object detector
detector = HomogeneousBgDetector()

@app.route('/detect_image', methods=['POST'])
def detect_image():
    """
    Endpoint to detect object dimensions in an image.
    Expects an image in the request body as bytes.
    Returns the width and height of the detected object in cm.
    """
    # Get image from POST request
    img_bytes = request.data
    np_arr = np.frombuffer(img_bytes, np.uint8)
    img = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

    # Detect ArUco markers in the image for calibration
    corners, _, _ = aruco.detectMarkers(img, aruco_dict, parameters=parameters)
    if corners:
        # Calculate the perimeter of the first detected ArUco marker
        aruco_perimeter = cv2.arcLength(corners[0], True)
        pixel_cm_ratio = aruco_perimeter / 20  # Example marker length in cm

        # Detect objects in the image using custom object detector
        contours = detector.detect_objects(img)
        dimensions = {}

        for cnt in contours:
            # Calculate minimum area rectangle around the detected object
            rect = cv2.minAreaRect(cnt)
            (x, y), (w, h), angle = rect

            # Convert pixel dimensions to cm using pixel_cm_ratio
            dimensions['width'] = round(w / pixel_cm_ratio, 1)
            dimensions['height'] = round(h / pixel_cm_ratio, 1)
            break  # Only measure the first detected object

        return jsonify(dimensions)
    else:
        # Return zero dimensions if no ArUco marker is detected
        return jsonify({'width': 0.0, 'height': 0.0})

if __name__ == '__main__':
    # Run the Flask application
    app.run(host='0.0.0.0', port=5000)

from flask import Flask, request, jsonify
import numpy as np
import base64
import cv2
import cv2.aruco as aruco
from object_detector import HomogeneousBgDetector
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Initialize object detector and Aruco dictionary
detector = HomogeneousBgDetector()
aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_5X5_50)
parameters = aruco.DetectorParameters()

@app.route('/detect_image', methods=['POST'])
def detect_objects():
    # Retrieve and decode the image
    image_data = request.form.get('image')
    if not image_data:
        return jsonify({"error": "No image provided"}), 400
    
    # Decode base64 image to OpenCV format
    img_bytes = base64.b64decode(image_data)
    np_array = np.frombuffer(img_bytes, np.uint8)
    img = cv2.imdecode(np_array, cv2.IMREAD_COLOR)

    # Detect Aruco markers
    corners, ids, _ = aruco.detectMarkers(img, aruco_dict, parameters=parameters)
    
    if not corners:
        return jsonify({"error": "No Aruco markers detected"}), 400
    
    # Calculate Aruco perimeter and pixel-to-cm ratio (assuming marker size is known, e.g., 20 cm)
    aruco_perimeter = cv2.arcLength(corners[0], True)
    pixel_cm_ratio = aruco_perimeter / 20  # Adjust this based on actual marker size

    # Detect other objects and calculate dimensions
    contours = detector.detect_objects(img)
    measurements = []

    for cnt in contours:
        # Get object dimensions
        rect = cv2.minAreaRect(cnt)
        (x, y), (w, h), angle = rect

        # Calculate real-world dimensions using pixel-to-cm ratio
        object_width = w / pixel_cm_ratio
        object_height = h / pixel_cm_ratio

        # Placeholder specific gravity for example (e.g., 3.99)
        specific_gravity = 3.99
        cutting_loss = 0.1  # 10% cutting loss for example
        
        # Calculate weight
        final_weight = (object_width * object_height) * specific_gravity * (1 - cutting_loss)
        
        measurements.append({
            'width_cm': round(object_width, 2),
            'height_cm': round(object_height, 2),
            'weight_g': round(final_weight, 2)
        })

    # Return all object measurements
    return jsonify({'measurements': measurements})

if __name__ == '__main__':
    app.run(debug=True, host='192.168.56.1', port=5000)

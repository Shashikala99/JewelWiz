from flask import Flask, request, jsonify
import cv2
import numpy as np
from measure_object_size import HomogeneousBgDetector  # import your object detector
import cv2.aruco as aruco

app = Flask(__name__) 

# Initialize Aruco parameters and detector
parameters = aruco.DetectorParameters()
aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_5X5_50)
detector = HomogeneousBgDetector()

@app.route('/measure', methods=['POST'])
def measure_object_size():
    try:
        # Get the image from the request
        file = request.files.get('image')
        if file is None:
            return jsonify({"error": "No image file provided"}), 400
        
        np_img = np.frombuffer(file.read(), np.uint8)
        img = cv2.imdecode(np_img, cv2.IMREAD_COLOR)

        # Ensure the image was loaded correctly
        if img is None:
            return jsonify({"error": "Image decoding failed"}), 400

        # Detect Aruco marker in the image
        corners, _, _ = aruco.detectMarkers(img, aruco_dict, parameters=parameters)

        if not corners:
            return jsonify({"error": "No Aruco markers detected in the image"}), 400

        # Calculate pixel-to-cm ratio using the first Aruco marker detected
        aruco_perimeter = cv2.arcLength(corners[0], True)
        if aruco_perimeter == 0:
            return jsonify({"error": "Invalid Aruco marker perimeter"}), 400
        
        pixel_cm_ratio = aruco_perimeter / 20

        # Detect objects in the image
        contours = detector.detect_objects(img)
        if not contours:
            return jsonify({"error": "No objects detected"}), 400

        # Measure each detected object's dimensions
        objects_dimensions = []
        for cnt in contours:
            rect = cv2.minAreaRect(cnt)
            (x, y), (w, h), angle = rect
            object_width = w / pixel_cm_ratio
            object_height = h / pixel_cm_ratio

            objects_dimensions.append({
                "width": round(object_width, 1),
                "height": round(object_height, 1)
            })

        return jsonify({"objects_dimensions": objects_dimensions})

    except Exception as e:
        print(f"Error processing image: {e}")
        return jsonify({"error": "An error occurred while processing the image"}), 500

if __name__ == "_main_":
    app.run(host="0.0.0.0", port=5000, debug=True)
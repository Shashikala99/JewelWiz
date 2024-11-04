from flask import Flask, request, jsonify
import numpy as np
import base64
import cv2
from object_detector import HomogeneousBgDetector  # Import the detector class
from flask_cors import CORS

# Initialize the Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for the app

detector = HomogeneousBgDetector()

@app.route('/detect', methods=['POST'])
def detect_objects():
    data = request.json
    image_data = data['image']  # Expecting a base64 encoded image

    # Decode the base64 image
    img_bytes = base64.b64decode(image_data)
    np_array = np.frombuffer(img_bytes, np.uint8)
    img = cv2.imdecode(np_array, cv2.IMREAD_COLOR)

    # Use your object detection logic here
    contours = detector.detect_objects(img)

    # Prepare the response
    response = {
        'contours': len(contours),
        # Optionally add more information (e.g., dimensions)
    }
    return jsonify(response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Change port if needed

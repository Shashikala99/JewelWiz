from flask import Flask, request, jsonify
import numpy as np
import base64
import cv2
from object_detector import HomogeneousBgDetector  # Import the detector class
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for the app

detector = HomogeneousBgDetector()

@app.route('/detect_image', methods=['POST'])
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
    }
    return jsonify(response)

@app.route('/calculate_weight', methods=['POST'])
def calculate_weight():
    data = request.json
    cut_type = data.get('cutType')
    specific_gravity = data.get('specificGravity')
    width = data.get('width')
    cutting_loss = data.get('cuttingLoss')
    
    final_weight = (width ** 2) * specific_gravity * (1 - cutting_loss) * specific_gravity  # Adjust based on your logic
    
    return jsonify({'finalWeight': final_weight})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

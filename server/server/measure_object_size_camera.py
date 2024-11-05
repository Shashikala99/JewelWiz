import cv2
from object_detector import *
import numpy as np
import cv2.aruco as aruco

# Load Aruco detector
parameters = cv2.aruco.DetectorParameters()
aruco_dict = aruco.getPredefinedDictionary(aruco.DICT_5X5_50)

# Load Object Detector
detector = HomogeneousBgDetector()

# Load Cap
cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)

# Variable to store object widths
object_widths = []

while True:
    _, img = cap.read()

    # Clear object_widths list for each new frame
    object_widths.clear()

    # Get Aruco marker
    corners, _, _ = cv2.aruco.detectMarkers(img, aruco_dict, parameters=parameters)
    if corners:
        # Draw polygon around the marker
        int_corners = np.int32(corners)
        cv2.polylines(img, int_corners, True, (0, 255, 0), 5)

        # Aruco Perimeter
        aruco_perimeter = cv2.arcLength(corners[0], True)

        # Pixel to cm ratio
        pixel_cm_ratio = aruco_perimeter / 20

        # Detect objects
        contours = detector.detect_objects(img)

        # Draw objects boundaries and calculate dimensions
        for cnt in contours:
            # Get rect
            rect = cv2.minAreaRect(cnt)
            (x, y), (w, h), angle = rect

            # Get Width and Height of the Objects by applying the Ratio pixel to cm
            object_width = w / pixel_cm_ratio
            object_height = h / pixel_cm_ratio

            # Save width to object_widths list
            object_widths.append(object_width)

            # Display rectangle and dimensions
            box = cv2.boxPoints(rect)
            box = np.int32(box)
            cv2.circle(img, (int(x), int(y)), 5, (0, 0, 255), -1)
            cv2.polylines(img, [box], True, (255, 0, 0), 2)
            cv2.putText(img, "Width {} cm".format(round(object_width, 1)), (int(x - 100), int(y - 20)),
                        cv2.FONT_HERSHEY_PLAIN, 2, (100, 200, 0), 2)
            cv2.putText(img, "Height {} cm".format(round(object_height, 1)), (int(x - 100), int(y + 15)),
                        cv2.FONT_HERSHEY_PLAIN, 2, (100, 200, 0), 2)

    # Display the image
    cv2.imshow("Image", img)
    key = cv2.waitKey(1)
    if key == 27:  # Press Esc to exit
        break

# Release resources
cap.release()
cv2.destroyAllWindows()

# Print the widths detected in the last frame
print("Object Widths in the last frame:", object_widths)

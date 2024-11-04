import base64

# Open the image file in binary mode and encode it in Base64
with open("phone_aruco_marker.jpg", "rb") as image_file:
    base64_image = base64.b64encode(image_file.read()).decode("utf-8")

# Write the Base64 string to a text file
with open("file.txt", "w") as file:
    file.write(base64_image)

print("Base64-encoded image saved to file.txt")

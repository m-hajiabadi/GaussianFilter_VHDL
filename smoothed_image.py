import cv2
import numpy as np

input_form_fpga = "smoothed_image.txt"
size = 126
I = np.zeros((size,size))
with open(input_form_fpga, "r") as image:
    img = image.readlines()
image.close()

for i in range(size):
    for j in range(size):
        I[i,j] = img[j+size*i].strip()

cv2.imwrite("smoothed_image.jpg", I)

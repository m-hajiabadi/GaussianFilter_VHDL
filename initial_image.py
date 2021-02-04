import cv2
import numpy as np
from skimage.util import random_noise

input_image = "image.jpg"
width = 128
height = 128
dim = (width, height)
I = cv2.imread(input_image, cv2.IMREAD_GRAYSCALE)
#add noise
noise_I = random_noise(I, mode='s&p',amount=0.1)
noise_I = np.array(255*noise_I, dtype = 'uint8')
noise_I = cv2.resize(noise_I,dim, interpolation = cv2.INTER_AREA)
cv2.imwrite("noisy_image.jpg", noise_I)
with open("noisy_image.txt", "w") as image:
    for row in noise_I:
        for i in range(noise_I.shape[1]):
            image.write('{0:08b}'.format(row[i]))
            image.write("\n")
image.close()


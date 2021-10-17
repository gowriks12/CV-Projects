from matplotlib import pyplot as plt
import cv2 as cv
import argparse
parser = argparse.ArgumentParser(description='Code for Histogram Equalization.')
parser.add_argument('--input', help='Path to input image.', default='lena.jpg')
args = parser.parse_args()
# src = cv.imread(cv.samples.findFile(args.input))
src = cv.imread("P1_lena_gray_512.png")
if src is None:
    print('Could not open or find the image:', args.input)
    exit(0)
src = cv.cvtColor(src, cv.COLOR_BGR2GRAY)
src_hist = cv.calcHist([src], [0], None, [256], [0, 256])
cv.imshow('Source image', src)
dst = cv.equalizeHist(src)
dst_hist = cv.calcHist([dst], [0], None, [256], [0, 256])
cv.imshow('Equalized Image', dst)

# plot the histogram
plt.figure()
plt.title("Grayscale Histogram")
plt.xlabel("Bins")
plt.ylabel("# of Pixels")
plt.plot(src_hist)
plt.xlim([0, 256])
plt.show()

# plot the histogram
plt.figure()
plt.title("Grayscale Histogram Equalized")
plt.xlabel("Bins")
plt.ylabel("# of Pixels")
plt.plot(dst_hist)
plt.xlim([0, 256])
plt.show()

cv.waitKey()
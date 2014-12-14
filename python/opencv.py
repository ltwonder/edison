# -*- coding: utf-8 -*-

import cv
import cv2

face_cascade = "/usr/local/Cellar/opencv/2.4.9/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml"

smile_cascade = "/usr/local/Cellar/opencv/2.4.9/share/OpenCV/haarcascades/haarcascade_smile.xml"

#image_path = "yukinosei.jpg"
image_path = "face.jpg"

color = (255, 255, 255)

image = cv2.imread(image_path)
image_gray = cv2.cvtColor(image, cv2.cv.CV_BGR2GRAY)

cascade = cv2.CascadeClassifier(face_cascade)
#cascade = cv2.CascadeClassfier(smile_path)

facerect = cascade.detectMultiScale(image_gray, scaleFactor=1.1, minNeighbors=1, minSize=(1, 1))

if len(facerect) > 0:
    smilerect = cv2.CascadeClassifier(smile_cascade).detectMultiScale(image_gray, scaleFactor=1.1, minNeighbors=30)
    print "smile result"
    print smilerect

if len(smilerect) > 0:
    for rect in smilerect:
        cv2.rectangle(image, tuple(rect[0:2]), tuple(rect[0:2]+rect[2:4]), color, thickness=2)
        cv2.imwrite("smile_detect.jpg", image)

#print "face rectangle"
#print facerect

'''
if len(facerect) > 0:
    #検出した顔を囲む矩形の作成
    for rect in facerect:
        cv2.rectangle(image, tuple(rect[0:2]),tuple(rect[0:2]+rect[2:4]), color, thickness=2)

        cv2.imwrite("smile_detect.jpg", image)
'''

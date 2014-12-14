require 'opencv'
include OpenCV

face_cascade = "/usr/local/Cellar/opencv/2.4.9/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml"
smile_cascade = "/usr/local/Cellar/opencv/2.4.9/share/OpenCV/haarcascades/haarcascade_smile.xml"

detector = OpenCV::CvHaarClassifierCascade::load face_cascade

image = OpenCV::IplImage.load("face.jpg")

detector.detect_objects(image).each do |rect|
  color = OpenCV::CvColor::Red
  image.rectangle! rect.top_left, rect.bottom_right, :color => OpenCV::CvColor::Red
  image.save_image("detect.jpg")
end


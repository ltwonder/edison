# ruby-opencv

An OpenCV wrapper for Ruby.

* Web site: <https://github.com/ruby-opencv/ruby-opencv>
* Ruby 1.9.3, 2.0.0, 2.1.x and OpenCV 2.4.8 are supported.

## Requirement

* OpenCV <http://opencv.org/>
  * [Download](http://sourceforge.net/projects/opencvlibrary/)
  * [Install guide](http://docs.opencv.org/doc/tutorials/introduction/table_of_content_introduction/table_of_content_introduction.html#table-of-content-introduction)

## Install
### Linux/Mac
1. Install [OpenCV](http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/)
2. Install ruby-opencv

```
$ gem install ruby-opencv -- --with-opencv-dir=/path/to/opencvdir
```

Note: **/path/to/opencvdir** is the directory where you installed OpenCV.


### Windows
You can use pre-build binary for Windows (mswin32).

1. Install [OpenCV](http://sourceforge.net/projects/opencvlibrary/files/opencv-win/)
2. Set path to OpenCV libraries. When you installed OpenCV to **C:\opencv**, add **C:\opencv\build\x86\vc10\bin** to the systems path.
3. Install ruby-opencv

```
$ gem install ruby-opencv
```

## Sample code
### Load and Display an Image

A sample to load and display an image. An equivalent code of [this tutorial](http://docs.opencv.org/doc/tutorials/introduction/display_image/display_image.html#display-image).

```ruby
require 'opencv'
include OpenCV

if ARGV.size == 0
  puts "Usage: ruby #{__FILE__} ImageToLoadAndDisplay"
  exit
end

image = nil
begin
  image = CvMat.load(ARGV[0], CV_LOAD_IMAGE_COLOR) # Read the file.
rescue
  puts 'Could not open or find the image.'
  exit
end

window = GUI::Window.new('Display window') # Create a window for display.
window.show(image) # Show our image inside it.
GUI::wait_key # Wait for a keystroke in the window.
```

### Face Detection

A sample to detect faces from an image.

```ruby
require 'opencv'
include OpenCV

if ARGV.length < 2
  puts "Usage: ruby #{__FILE__} source dest"
  exit
end

data = './data/haarcascades/haarcascade_frontalface_alt.xml'
detector = CvHaarClassifierCascade::load(data)
image = CvMat.load(ARGV[0])
detector.detect_objects(image).each do |region|
  color = CvColor::Blue
  image.rectangle! region.top_left, region.bottom_right, :color => color
end

image.save_image(ARGV[1])
window = GUI::Window.new('Face detection')
window.show(image)
GUI::wait_key
```

For more samples, see examples/*.rb

## LICENSE:

The BSD Liscense

see LICENSE.txt


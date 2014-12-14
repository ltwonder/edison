/************************************************************

   eigenfaces.cpp -

   $Author: ser1zw $

   Copyright (C) 2013 ser1zw

************************************************************/
#include <stdio.h>
#include "eigenfaces.h"
/*
 * Document-class: OpenCV::EigenFaces
 *
 */
__NAMESPACE_BEGIN_OPENCV
__NAMESPACE_BEGIN_EIGENFACES

VALUE rb_klass;

VALUE
rb_class()
{
  return rb_klass;
}

/* 
 * call-seq:
 *   EigenFaces.new(num_components=0, threshold=DBL_MAX)
 */
VALUE
rb_initialize(int argc, VALUE argv[], VALUE self)
{
  VALUE num_components_val, threshold_val;
  rb_scan_args(argc, argv, "02", &num_components_val, &threshold_val);

  int num_components = NIL_P(num_components_val) ? 0 : NUM2INT(num_components_val);
  double threshold = NIL_P(threshold_val) ? DBL_MAX : NUM2DBL(threshold_val);

  free(DATA_PTR(self));
  cv::Ptr<cv::FaceRecognizer> ptr = cv::createEigenFaceRecognizer(num_components, threshold);
  DATA_PTR(self) = ptr;

  cFaceRecognizer::guard_facerecognizer(DATA_PTR(self), ptr);

  return self;
}

void
init_ruby_class()
{
#if 0
  // For documentation using YARD
  VALUE opencv = rb_define_module("OpenCV");
  VALUE alghorithm = rb_define_class_under(opencv, "Algorithm", rb_cObject);
  VALUE face_recognizer = rb_define_class_under(opencv, "FaceRecognizer", alghorithm);
#endif

  if (rb_klass)
    return;
  /* 
   * opencv = rb_define_module("OpenCV");
   * 
   * note: this comment is used by rdoc.
   */
  VALUE opencv = rb_module_opencv();
  VALUE face_recognizer = cFaceRecognizer::rb_class();
  rb_klass = rb_define_class_under(opencv, "EigenFaces", face_recognizer);
  rb_define_alloc_func(rb_klass, cFaceRecognizer::allocate_facerecognizer);
  rb_define_private_method(rb_klass, "initialize", RUBY_METHOD_FUNC(rb_initialize), -1);
}

__NAMESPACE_END_EIGENFACES
__NAMESPACE_END_OPENCV


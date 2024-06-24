import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _categories = [
    {
      'name': "Top Songs",
      'image':
          'https://images.crunchbase.com/image/upload/c_pad,h_256,w_256,f_auto,q_auto:eco,dpr_1/vp5jhbgvt9byjwuc3ug8'
    },
    {
      'name': "Atif Hits",
      'image':
          'https://c-fa.cdn.smule.com/rs-s-sf-4/arr/e9/2c/c6288d72-0c48-4027-86ed-2814684c42e6.jpg'
    },
    {
      'name': "Nusrat Fateh Ali Khan",
      'image':
          'https://c-fa.cdn.smule.com/rs-s83/arr/15/ed/198b4f26-a8c7-4727-9791-937d7992f5ce.jpg'
    },
    {
      'name': "BTS Mega",
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF9fioQYRB7KDXcO7V7heCIx6GS384LathKA&s'
    },
  ];
  List<Map<String, dynamic>> get categories => _categories;
}

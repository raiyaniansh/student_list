import 'package:flutter/material.dart';
import 'package:student_list/screen/modal/modal.dart';

class HomeProvider extends ChangeNotifier
{
  List<Stdmodal> Std=[];

  void add(Stdmodal s1)
  {
    Std.add(s1);
    notifyListeners();
  }

  void update(int index,Stdmodal s1)
  {
    Std[index] = s1;
    notifyListeners();
  }

  void remove(int index)
  {
    Std.removeAt(index);
    notifyListeners();
  }
}
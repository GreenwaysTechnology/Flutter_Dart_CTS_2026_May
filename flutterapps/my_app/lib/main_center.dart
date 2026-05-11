
import 'package:flutter/material.dart';

void main(){
  //build tree model -parent and child
  const ChildWidget = Text(
      "Hello Flutter!!",
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
  );
  const ParentWidget = const Center(
    child: ChildWidget ,
  );
  runApp(ParentWidget);
}
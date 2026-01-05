import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  String typeName;

  TypeChip({required this.typeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(right: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.grey,
          width: 0.8
        )
      ),
      child: Center(
        child: Text(typeName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
      ),
    );
  }
}

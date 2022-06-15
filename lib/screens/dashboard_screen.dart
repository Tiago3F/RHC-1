import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade300,
        child: const Center(          
          child: Text("Dashboard"),
          ),
      );
  }
}
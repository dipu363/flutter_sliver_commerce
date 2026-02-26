import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.orange.shade100,
      child: PageView(
        children: [banner("Banner 1"), banner("Banner 2"), banner("Banner 3")],
      ),
    );
  }

  Widget banner(String text) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 22))),
    );
  }
}

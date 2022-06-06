import 'package:flutter/material.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({Key? key, this.content, this.title, this.image})
      : super(key: key);
  final String? content;
  final String? title;
  final String? image;

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(widget.title ?? "")),
      content: Container(
        height: 125,
        child: Column(
          children: [
            Image.asset(
              widget.image ?? "",
              height: 100,
            ),
            Text(widget.content ?? ""),
          ],
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          child: Text("Close"),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    ;
  }
}

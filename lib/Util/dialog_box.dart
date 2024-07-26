import 'package:flutter/material.dart';
import 'package:to_do_app/Util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controllar;
  final VoidCallback onSave;
  final VoidCallback onCancle;

  const DialogBox({super.key, 
  required this.controllar,
  required this.onSave,
  required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controllar,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withBlue(200)),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                //Hint Text
                hintText: 'Type your task',
                hintStyle: TextStyle(color: Colors.black.withAlpha(400)),
              ),
              //field text color
              style: TextStyle(color: Colors.black),
            ),
            //button save & cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 8),

                //cancel button
                MyButton(
                  text: "Cancle",
                  onPressed: onCancle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

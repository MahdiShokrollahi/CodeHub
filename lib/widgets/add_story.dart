import 'package:flutter/material.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(right: 25, left: 8, top: 1),
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
                color: Color(0xff1C1F2E),
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(17))),
            child: Image.asset('images/icon_plus.png'),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Your Story',
            style: themeData.textTheme.caption,
          )
        ],
      ),
    );
  }
}

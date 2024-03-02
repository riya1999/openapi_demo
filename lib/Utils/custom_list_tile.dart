import 'package:flutter/material.dart';
import 'customText.dart';

Widget customListTile(BuildContext context,String name, String details) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.94,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: CustomText(text: name, fontSize: 16,fontWeight: FontWeight.bold,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 2),
                  child: CustomText(text: details, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

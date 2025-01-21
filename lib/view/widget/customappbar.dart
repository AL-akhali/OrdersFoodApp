import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFav;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  const CustomAppBar(
      {super.key,
      required this.titleAppbar,
      this.onPressedIcon,
      this.onPressedSearch,
      this.onPressedIconFav,
      this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: onPressedSearch,
              ),
              hintText: titleAppbar.tr,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressedIcon,
                icon: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.grey[600],
                )),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

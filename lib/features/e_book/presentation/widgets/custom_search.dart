import 'package:e_book_flutter/core/utils/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController controller;

  CustomSearch(
      {this.onSubmitted, required this.controller, this.onChanged, super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  bool isShowClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      checkShowClearButton(widget.controller.text);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    print("textcontroller text = ${widget.controller.text}");
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 226, 226, 226),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSubmitted,
        controller: widget.controller,
        onChanged: (value) {
          checkShowClearButton(value);
          if (widget.onChanged != null) widget.onChanged!(value);
        },
        decoration: InputDecoration(
            hintText: AppStrings.hintSearch,
            hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.9)),
            contentPadding: EdgeInsets.only(left: 10, top: 12, bottom: 10),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            suffixIcon: Visibility(
              visible: isShowClearButton,
              child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  widget.controller.clear();
                  if (widget.onChanged != null) widget.onChanged!("");
                  checkShowClearButton("");
                },
              ),
            )),
      ),
    );
  }

  void checkShowClearButton(String value) {
    bool isChanged = false;
    if (value.isEmpty) {
      isChanged = isShowClearButton;
    } else {
      isChanged = !isShowClearButton;
    }

    if (isChanged) {
      setState(() {
        isShowClearButton = !isShowClearButton;
      });
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onTextChange;

  const SearchBar({@required this.onTextChange});

  @override
  Widget build(BuildContext context) {
    Color brightPurple = Theme.of(context).textTheme.headline6.color;

    return TextField(
      autofocus: true,
      style: TextStyle(color: Colors.white),
      onChanged: (str) => onTextChange(str),
      decoration: InputDecoration(
        labelText: "Search",
        labelStyle: TextStyle(color: brightPurple),
      ),
      cursorColor: brightPurple,
    );
  }
}

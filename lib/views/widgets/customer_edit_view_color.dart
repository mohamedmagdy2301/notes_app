import 'package:flutter/material.dart';
import 'package:notes/helper/constant.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/customer_color_circle.dart';

class CustomerEditColorList extends StatefulWidget {
  const CustomerEditColorList({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  State<CustomerEditColorList> createState() => _CustomerEditColorListState();
}

class _CustomerEditColorListState extends State<CustomerEditColorList> {
  late int indexSelected;

  @override
  Widget build(BuildContext context) {
    indexSelected = kColorsList.indexOf(Color(widget.noteModel.color));
    return SizedBox(
      height: 26 * 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.noteModel.color = kColorsList[index].value;
                indexSelected = index;
              });
            },
            child: CustomerColorCircle(
              isSelected: indexSelected == index,
              color: kColorsList[index],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/helper/constant.dart';

class CustomerColorList extends StatefulWidget {
  const CustomerColorList({
    super.key,
  });

  @override
  State<CustomerColorList> createState() => _CustomerColorListState();
}

class _CustomerColorListState extends State<CustomerColorList> {
  int? indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26 * 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                BlocProvider.of<AddNoteCubit>(context).color =
                    kColorsList[index];
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

class CustomerColorCircle extends StatelessWidget {
  const CustomerColorCircle({
    super.key,
    required this.isSelected,
    required this.color,
  });

  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: color,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: color,
            ),
          );
  }
}

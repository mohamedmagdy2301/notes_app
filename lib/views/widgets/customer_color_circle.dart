import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class CustomerColorList extends StatefulWidget {
  const CustomerColorList({
    super.key,
  });

  @override
  State<CustomerColorList> createState() => _CustomerColorListState();
}

class _CustomerColorListState extends State<CustomerColorList> {
  int? indexSelected = 0;
  List<Color> colorsList = [
    const Color.fromARGB(255, 255, 187, 68),
    const Color.fromARGB(255, 243, 255, 71),
    const Color.fromARGB(255, 163, 255, 93),
    const Color.fromARGB(255, 82, 255, 148),
    const Color.fromARGB(255, 112, 255, 241),
    const Color.fromARGB(255, 178, 108, 253),
    const Color.fromARGB(255, 231, 111, 255),
    const Color.fromARGB(255, 255, 101, 101),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26 * 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                BlocProvider.of<AddNoteCubit>(context).color =
                    colorsList[index];
                indexSelected = index;
              });
            },
            child: CustomerColorCircle(
              isSelected: indexSelected == index,
              color: colorsList[index],
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

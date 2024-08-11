import 'package:flutter/material.dart';

const kNoteBox = "notes_box";
const kPrimaryColor = Color(0xff62fCD7);
List<Color> kColorsList = [
  const Color.fromARGB(255, 255, 187, 68),
  const Color.fromARGB(255, 243, 255, 71),
  const Color.fromARGB(255, 163, 255, 93),
  const Color.fromARGB(255, 82, 255, 148),
  const Color.fromARGB(255, 112, 255, 241),
  const Color.fromARGB(255, 178, 108, 253),
  const Color.fromARGB(255, 231, 111, 255),
  const Color.fromARGB(255, 255, 101, 101),
];

messageIfUndo(context, cubitUsed, scaffoldMessenger, message) {
  Future.delayed(const Duration(seconds: 3))
      .whenComplete(() => scaffoldMessenger?.hideCurrentMaterialBanner());
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      backgroundColor: kPrimaryColor,
      padding: const EdgeInsets.only(left: 16, right: 8),
      contentTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            cubitUsed.notes?.last.delete();
            scaffoldMessenger?.hideCurrentMaterialBanner();
            cubitUsed.getNote();
          },
          child: const Text('Undo',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ),
  );
}

messageForDelete(context, cubitUsed, typeDelete, onPressed) {
  if (cubitUsed.notes!.isEmpty) {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 2000),
        content: Text(
          'No notes to delete!',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 120),
      ),
    );
  } else {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          title: Text('Delete $typeDelete'),
          content: Text('Are you sure you want to delete $typeDelete ?'),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

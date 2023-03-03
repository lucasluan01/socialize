import 'package:flutter/material.dart';
import 'dart:io';

CircleAvatar avatar({
  required BuildContext context,
  required dynamic photo,
  required double radius,
}) {
  if (photo == null) {
    return CircleAvatar(
      radius: radius,
      child: Icon(
        Icons.person,
        size: radius * 1.5,
        color: Colors.white,
      ),
    );
  }

  if (photo is String) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(photo),
    );
  }

  return CircleAvatar(
    radius: radius,
    backgroundImage: FileImage(photo as File),
  );
}

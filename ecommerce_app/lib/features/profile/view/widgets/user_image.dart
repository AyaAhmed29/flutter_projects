import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, this.image, this.imageUrl});
  final FileImage? image;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: Colors.grey[300],
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? CircleAvatar(radius: 50.r, backgroundImage: NetworkImage(imageUrl!))
          : image != null
          ? CircleAvatar(radius: 50.r, backgroundImage: image)
          : const Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}

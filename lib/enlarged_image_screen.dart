import 'package:flutter/material.dart';

class ShowEnlargedPictureScreen extends StatefulWidget {
  final String imageUrl;
  final String tag;
  const ShowEnlargedPictureScreen({Key? key, required this.imageUrl, required this.tag}) : super(key: key);

  @override
  State<ShowEnlargedPictureScreen> createState() => _ShowEnlargedPictureScreenState();
}

class _ShowEnlargedPictureScreenState extends State<ShowEnlargedPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(tag:widget.tag, child: Image.network(
          widget.imageUrl,
          errorBuilder: (ctx, str, _) =>
              Text('Image not loaded'),
          fit: BoxFit.fitWidth,
        ),),
      ),
    );
  }
}

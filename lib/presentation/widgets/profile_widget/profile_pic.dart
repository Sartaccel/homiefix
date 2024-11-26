import 'package:flutter/material.dart';
import 'package:homiefix_application/presentation/themes/colors.dart';
import 'package:homiefix_application/presentation/themes/size.dart';

class ProfilePic extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final BoxFit fit;
  final bool isNetworkImage;
  final String? imageUrl;
  final String fallbackAsset;

  const ProfilePic({
    super.key,
    this.width = Size.profilewidth,
    this.height = Size.profileheight,
    this.backgroundColor = AppColors.profilebackground,
    this.fit = BoxFit.cover,
    this.imageUrl,
    this.isNetworkImage = false,
    this.fallbackAsset = 'assets/images/DSC_0042.svg', 
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final profileSize = screenWidth * 0.15; // Adjust the size based on screen width

    return Container(
      width: profileSize,
      height: profileSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle, 
        color: backgroundColor, 
      ),
      child: Center(
        child: imageUrl != null
            ? Image(
                fit: fit,
                image: isNetworkImage
                    ? NetworkImage(imageUrl!)
                    : AssetImage(imageUrl!) as ImageProvider,
              )
            : Icon(Icons.person, size: profileSize / 2,),
      ),
    );
  }
}

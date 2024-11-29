import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homiefix_application/presentation/constants/image.dart';
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
    this.fallbackAsset = Appimage.profile,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final profileSize = screenWidth * 0.15;

    return Container(
      width: profileSize,
      height: profileSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: ClipOval(
        child: imageUrl != null
            ? Center(
                child: Image(
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(imageUrl!)
                      : AssetImage(imageUrl!) as ImageProvider,
                  width: profileSize * 0.8,
                  height: profileSize * 0.8,
                ),
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  fallbackAsset,
                  width: profileSize * 0.8,
                  height: profileSize * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
      ),
    );
  }
}

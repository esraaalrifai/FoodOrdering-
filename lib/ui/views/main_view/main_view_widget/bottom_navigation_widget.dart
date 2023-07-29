import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodorderproject/core/enums/profile_view.dart';
import 'package:foodorderproject/ui/shared/colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum,int)onTap;
  const BottomNavigationWidget({Key? key, required this.bottomNavigationEnum, required this.onTap}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidget();

}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack (
      alignment: Alignment.bottomCenter,
      children: [

      CustomPaint(
        painter:ClipShadowPainter(
          clipper: BottomNavigationClipper(),
          shadow:Shadow(blurRadius: 12, offset: Offset(0,-5)),
        ) ,
        child: ClipPath(
          clipper: BottomNavigationClipper(),
          child: Container(
            width: size.width,
            height: size.height*0.1,
            color: AppColors.mainWhiteColor,
          ),
        ),

      ),
        Positioned(bottom: size.width * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navItem(
                imageName: 'ic_menu',
                text: 'Menu',
                isSelected:
                widget.bottomNavigationEnum == BottomNavigationEnum.MENU,
                onTap: () {
                  widget.onTap(
                    BottomNavigationEnum.MENU,
                    0,
                  );
                },
                size: size,
              ),
              navItem(
                imageName: 'ic_shopping',
                text: 'Offers',
                isSelected:
                widget.bottomNavigationEnum == BottomNavigationEnum.OFFERS,
                onTap: () {
                  widget.onTap(
                    BottomNavigationEnum.OFFERS,
                    1,
                  );
                },
                size: size,
              ),
              SizedBox(
                width: size.width * 0.25,
              ),
              navItem(
                imageName: 'ic_user',
                text: 'Profile',
                isSelected:
                widget.bottomNavigationEnum == BottomNavigationEnum.PROFILE,
                onTap: () {
                  widget.onTap(
                    BottomNavigationEnum.PROFILE,
                    3,
                  );
                },
                size: size,
              ),
              navItem(
                imageName: 'ic_more',
                text: 'More',
                isSelected:
                widget.bottomNavigationEnum == BottomNavigationEnum.MORE,
                onTap: () {
                  widget.onTap(
                    BottomNavigationEnum.MORE,
                    4,
                  );
                },
                size: size,
              ),
            ],
          ),),
        Padding(
          padding:  EdgeInsets.only(bottom:size.width*0.14),
          child: InkWell(onTap: (){widget.onTap(BottomNavigationEnum.HOME,2); },
            child: CircleAvatar(
              backgroundColor:
              widget.bottomNavigationEnum == BottomNavigationEnum.HOME
                  ? AppColors.mainOrangeColor
                  : AppColors.greytextColor,
              child: SvgPicture.asset('images/ic_home.svg',color: AppColors.mainWhiteColor,),
              radius: size.width * 0.1,
            ),
          ),
        ),
      ],

    );
  }
  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function()? onTap,
    required Size size,
  }) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'images/$imageName.svg',
            color:
            isSelected ? AppColors.mainOrangeColor : AppColors.greytextColor,
            width: size.width * 0.05,
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(text,
              style: TextStyle(
                  color: isSelected
                      ? AppColors.mainOrangeColor
                      : AppColors.greytextColor,
                  fontSize: size.width * 0.03))
        ],
      ),
    );
  }
}

class  BottomNavigationClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3, 0);
    path0.quadraticBezierTo(
    size.width * 0.375,
    0,
    size.width * 0.375,
    size.height * 0.1,
    );
    path0.cubicTo(
    size.width * 0.4,
    size.height * 0.9,
    size.width * 0.6,
    size.height * 0.9,
    size.width * 0.625,
    size.height * 0.1,
    );
    path0.quadraticBezierTo(
    size.width * 0.625,
    0,
    size.width * 0.7,
    0.1,
    );
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.close();

    return path0;


  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
class ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

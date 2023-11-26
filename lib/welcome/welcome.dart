import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_bloc_app/common/values/images.dart';
import 'package:learning_bloc_app/util/extension.dart';
import 'package:learning_bloc_app/welcome/bloc/welcome_bloc.dart';
import 'package:learning_bloc_app/widgets/custom_button.dart';
import 'package:learning_bloc_app/widgets/custom_image.dart';
import 'package:learning_bloc_app/widgets/custom_text.dart';

import '../common/values/app_color.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              width: 375.w,
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (index){
                      context.read<WelcomeBloc>().add(WelcomeEvent(index: index));
                    },
                    children: const [
                      WelcomePageItemView(
                        image: kReadingImg,
                        title: "First See Learning",
                        subTitle:
                        "Forget about a for of paper all knowledge in one of learning",
                      ),
                      WelcomePageItemView(
                        image: kReadingImg,
                        title: "Connect With Everyone",
                        subTitle:
                        "Always keep in touch with tutor & friend. let's get connected",
                      ),
                      WelcomePageItemView(
                        image: kReadingImg,
                        title: "Always Fascinated Learning",
                        subTitle:
                        "Anywhere, anytime. The time is at your direction so study whenever you want",
                        buttonText: "Get Started",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page,
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class WelcomePageItemView extends StatelessWidget {
  const WelcomePageItemView({super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.buttonText,
    this.onPressed});

  final String title;
  final String subTitle;
  final String? buttonText;
  final String image;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          100.height,
          SizedBox(
            width: 345.w,
            height: 345.h,
            child: CustomImage(image: image),
          ),
          CustomText(
              textAlign: TextAlign.center,
              text: title,
              textStyle:
              CustomTextStyle.normalTextStyle().copyWith(fontSize: 24)),
          10.height,
          CustomText(
              textAlign: TextAlign.center,
              text: subTitle,
              textStyle: CustomTextStyle.smallTextStyle()
                  .copyWith(color: Colors.black.withOpacity(0.5))),
          40.height,
          CustomButton(
            text: buttonText ?? "Next",
            width: context.width,
            onPressed: onPressed ?? () {},
          ),
        ],
      ),
    );
  }
}

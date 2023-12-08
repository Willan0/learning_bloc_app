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
  final pageController = PageController();
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
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      state.page = index;
                      context.read<WelcomeBloc>().add(WelcomeEvent());
                    },
                    children: [
                      WelcomePageItemView(
                        pageController: pageController,
                        index: 0,
                        image: kReadingImg,
                        title: "First See Learning",
                        subTitle:
                            "Forget about a for of paper all knowledge in one of learning",
                      ),
                      WelcomePageItemView(
                        pageController: pageController,
                        index: 1,
                        image: kManIMmg,
                        title: "Connect With Everyone",
                        subTitle:
                            "Always keep in touch with tutor & friend. let's get connected",
                      ),
                      WelcomePageItemView(
                        pageController: pageController,
                        index: 2,
                        image: kBoyImg,
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
                        decorator: DotsDecorator(
                            size: const Size.square(8.0),
                            activeSize: const Size(18.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
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
  const WelcomePageItemView({
    super.key,
    required this.index,
    required this.title,
    required this.subTitle,
    required this.image,
    this.buttonText,
    required this.pageController,
    this.onPressed,
  });

  final int index;
  final String title;
  final String subTitle;
  final String? buttonText;
  final String image;
  final PageController pageController;
  final void Function()? onPressed;

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
            onPressed: onPressed ??
                () {
                  pageController.position;
                  // within 0-2 index
                  if (index < 2) {
                    pageController.animateToPage(index + 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                  } else {}
                },
          ),
        ],
      ),
    );
  }
}

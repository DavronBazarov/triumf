import 'package:flutter/material.dart';
import 'package:flutter_projects/values/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../values/images.dart';
import '../../values/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.originBlack,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.originWhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: SizeConfig.calculateVertical(450),
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.calculateVertical(24)),
                      getBrandImage(),
                      SizedBox(height: SizeConfig.calculateVertical(50)),
                      getNumber(),
                      SizedBox(height: SizeConfig.calculateVertical(36)),
                      getPassword(),
                      SizedBox(height: SizeConfig.calculateVertical(35)),
                      getButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material getButton() {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      child: Container(
        height: SizeConfig.calculateVertical(36),
        width: SizeConfig.calculateHorizontal(157),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: AppColors.ink),
        child: const Text(
          'Tasdiqlash',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.originWhite),
        ),
      ),
    );
  }

  Padding getPassword() {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.calculateHorizontal(16),
          right: SizeConfig.calculateVertical(16)),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.conBackColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextFormField(
            maxLength: 10,
            maxLines: 1,
            cursorColor: AppColors.originBlack,
            decoration: const InputDecoration(
              hintText: 'password',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              counter: Offstage(),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
      ),
    );
  }

  Padding getNumber() {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.calculateHorizontal(16),
          right: SizeConfig.calculateVertical(16)),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.conBackColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextField(
            maxLength: 17,
            maxLines: 1,
            cursorColor: AppColors.originBlack,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '+998 ## ### ## ##',
                filter: {"#": RegExp(r'[0-9]')},
                type: MaskAutoCompletionType.lazy,
              )
            ],
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'phone number',
              border: InputBorder.none,
              counter: Offstage(),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
      ),
    );
  }

  SizedBox getBrandImage() {
    return SizedBox(
      height: SizeConfig.calculateVertical(122),
      width: SizeConfig.calculateHorizontal(130),
      child: Image.asset(
        AppImages.brandImage,
        fit: BoxFit.fill,
      ),
    );
  }
}

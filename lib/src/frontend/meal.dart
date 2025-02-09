import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MealScreen extends StatelessWidget {
  MealScreen({Key? key})
    : super(
        key: key,
      );

  TextEditingController icononeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            spacing: 52,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildHeaderRow(context),
              _buildTextFieldColumn(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 16.h,
      ),
      decoration: AppDecoration.fillRedA,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSugarRun,
            height: 80.h,
            width: 286.h,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 24.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 58.h,
            width: 62.h,
            margin: EdgeInsets.only(left: 4.h),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTextFieldColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 34.h,
        right: 46.h,
      ),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: icononeController,
            hintText: "Label",
            textInputAction: TextInputAction.done,
            suffix: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 18.h,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgIcon,
                height: 20.h,
                width: 20.h,
                fit: BoxFit.contain,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 278.h,
            ),
            maxLines: 15,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 18.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "Supporting text",
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as context;

import '../../../../lib.dart';

extension CustomDialog on context.BuildContext {
  void successDialog({
    required String message,
    Function()? onPressed,
    bool isShowButton = false,
    TextStyle? style,
  }) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        bool isClose = false;

        void close(bool close) {
          if (close) {
            Navigator.pop(ctx);
            if (onPressed != null) onPressed();
          }
        }

        Timer.periodic(const Duration(seconds: 2), (timer) {
          timer.cancel();
          isClose = !isClose;
          close(isClose);
        });

        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils(ctx).getMediaQueryWidth() > 430
                ? ((ResponsiveUtils(ctx).getMediaQueryWidth() - 430) / 2) +
                    AppGap.extraLarge * 2
                : AppGap.extraLarge * 2,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          isClose = !isClose;
                          close(isClose);
                        },
                        child: Image.asset(
                          AppIcon.close,
                          width: AppIconSize.large,
                          height: AppIconSize.large,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        AppIcon.success,
                        width: AppIconSize.dialog,
                        height: AppIconSize.dialog,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(height: AppGap.medium),
              Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                style: style ?? AppTextStyle.semiBold,
              ),
              Visibility(
                visible: isShowButton,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppGap.large),
                  child: ButtonPrimary(
                    "OK",
                    width: 150,
                    borderRadius: AppBorderRadius.normal,
                    fontWeight: AppFontWeight.regular,
                    onPressed: () {
                      isClose = !isClose;
                      close(isClose);
                    },
                  ),
                ),
              ),
              const Gap(height: AppGap.normal),
            ],
          ),
        );
      },
    );
  }

  void errorDialog({required String message}) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (BuildContext context) {
        bool isClose = false;

        void close(bool close) {
          if (close) Navigator.pop(this);
        }

        Timer.periodic(const Duration(seconds: 2), (timer) {
          timer.cancel();
          isClose = !isClose;
          close(isClose);
        });

        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils(this).getMediaQueryWidth() > 430
                ? ((ResponsiveUtils(this).getMediaQueryWidth() - 430) / 2) +
                    AppGap.extraLarge * 2
                : AppGap.extraLarge * 2,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          isClose = !isClose;
                          close(isClose);
                        },
                        child: Image.asset(
                          AppIcon.close,
                          width: AppIconSize.large,
                          height: AppIconSize.large,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        AppIcon.error,
                        width: AppIconSize.dialog,
                        height: AppIconSize.dialog,
                        color: Colors.red,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(height: AppGap.medium),
              Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.semiBold,
              ),
              const Gap(height: AppGap.normal),
            ],
          ),
        );
      },
    );
  }
}

class BaseDialogCard extends StatelessWidget {
  const BaseDialogCard({Key? key, required List<Widget> children})
      : _children = children,
        super(key: key);

  final List<Widget> _children;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1,
      ),
      child: Dialog(
        backgroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.large),
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: responsive.getResponsiveSize(AppGap.big),
        ),
        child: ColumnPadding(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.getResponsiveSize(AppGap.large),
            vertical: responsive.getResponsiveSize(AppGap.extraLarge),
          ),
          mainAxisSize: MainAxisSize.min,
          children: _children,
        ),
      ),
    );
  }
}

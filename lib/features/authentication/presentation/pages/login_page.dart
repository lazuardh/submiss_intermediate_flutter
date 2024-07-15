import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../lib.dart';

class LoginPage extends StatefulWidget {
  final Function() _onLogin;
  final Function() _onRegister;

  const LoginPage({
    Key? key,
    required Function() onLogin,
    required Function() onRegister,
  })  : _onLogin = onLogin,
        _onRegister = onRegister,
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List<TextFieldEntity> _singInEntity = TextFieldEntity.authLogin;
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void initState() {
    for (var dt in _singInEntity) {
      dt.textController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              /* bacground */
              Container(
                height: ResponsiveUtils(context).getMediaQueryHeight() * 0.88,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(243, 244, 246, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),

              /* content */
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight:
                        ResponsiveUtils(context).getMediaQueryHeight() * 0.9,
                  ),
                  child: Form(
                    key: _formLoginKey,
                    child: ColumnPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppGap.extraLarge,
                        vertical: 8.0,
                      ),
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Login",
                              style: AppTextStyle.bold.copyWith(
                                color: AppColors.blackPrimary,
                                fontSize: AppFontSize.extraLarge,
                              ),
                            ),
                            const Gap(width: AppGap.tiny),
                            const CustomImageWrapper(
                              image: AppIcon.userIcon,
                              width: 24,
                              height: 24,
                              isNetworkImage: false,
                            )
                          ],
                        ),
                        const Gap(height: 5),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Welcome back, there",
                            style: AppTextStyle.regular.copyWith(
                              color: AppColors.blackLighter,
                              fontSize: AppFontSize.normal,
                            ),
                          ),
                        ),
                        const Spacer(),
                        CustomImageWrapper(
                          image: AppImageAssets.shoppingImage,
                          width: double.infinity,
                          height:
                              ResponsiveUtils(context).getMediaQueryHeight() *
                                  0.3,
                          fit: BoxFit.contain,
                          isNetworkImage: false,
                        ),
                        const Gap(height: AppGap.medium),
                        CustomTextFormField(
                          textFieldEntity: _singInEntity[0],
                        ),
                        const Gap(height: AppGap.medium),
                        CustomTextFormField(
                          textFieldEntity: _singInEntity[1],
                        ),
                        const Spacer(),
                        Consumer<AuthProvider>(
                          builder: (ctx, provider, child) {
                            return provider.isLoadingLogin
                                ? const ButtonLoading(
                                    width: double.infinity,
                                    height: 43,
                                    buttonColor: AppColors.red,
                                  )
                                : ButtonPrimary(
                                    "Login",
                                    width: double.infinity,
                                    height: 43,
                                    buttonColor: AppColors.red,
                                    onPressed: () => _onSubmitted(provider),
                                  );
                          },
                        ),
                        const Spacer(),
                        RowPadding(
                          padding: EdgeInsets.only(
                            bottom: ResponsiveUtils(context)
                                    .getMediaQueryPaddingBottom() +
                                42,
                          ),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account?",
                              style: AppTextStyle.regular.copyWith(
                                color: AppColors.blackLighter,
                                fontSize: AppFontSize.normal,
                              ),
                            ),
                            TextButton(
                              onPressed: () => widget._onRegister(),
                              child: Text(
                                "Sign Up",
                                style: AppTextStyle.bold.copyWith(
                                  color: AppColors.blackPrimary,
                                  fontSize: AppFontSize.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitted(AuthProvider state) async {
    if (_formLoginKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      final User user = User(
        email: _singInEntity[0].textController.text,
        password: _singInEntity[1].textController.text,
      );

      final result = await state.login(user);
      if (result) {
        widget._onLogin();
      } else {
        errorDialog(message: state.message);
      }
    }
  }

  void errorDialog({required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        bool isClose = false;

        void close(bool close) {
          if (close) Navigator.pop(context);
        }

        Timer.periodic(const Duration(seconds: 2), (timer) {
          timer.cancel();
          isClose = !isClose;
          close(isClose);
        });

        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils(context).getMediaQueryWidth() > 430
                ? ((ResponsiveUtils(context).getMediaQueryWidth() - 430) / 2) +
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

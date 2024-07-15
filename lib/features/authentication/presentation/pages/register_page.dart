import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../lib.dart';

class RegisterPage extends StatefulWidget {
  final Function() _onRegister;
  final Function() _onLogin;

  const RegisterPage({
    Key? key,
    required Function() onRegister,
    required Function() onLogin,
  })  : _onRegister = onRegister,
        _onLogin = onLogin,
        super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<TextFieldEntity> _registerEntity = TextFieldEntity.authRegister;
  final _formVerificationKey = GlobalKey<FormState>();

  @override
  void initState() {
    for (var dt in _registerEntity) {
      dt.textController.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Stack(
        children: [
          /* Background */
          Container(
            height: ResponsiveUtils(context).getMediaQueryHeight() * 0.93,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(243, 244, 246, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          /* Content */
          SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ResponsiveUtils(context).getMediaQueryHeight() * 0.9,
              ),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 80.0,
                    collapsedHeight: 80,
                    pinned: true,
                    floating: false,
                    backgroundColor:
                        Colors.transparent, // Make app bar transparent
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.all(12),
                      expandedTitleScale: 1,
                      title: _titleSilverAppBar(
                        title: "Register",
                        subtitle:
                            "Register here, if you don't have an Account!",
                      ),
                    ),
                  ),
                  Form(
                    key: _formVerificationKey,
                    child: SliverPadding(
                      padding: const EdgeInsets.all(AppGap.medium),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            const CustomImageWrapper(
                              image: AppImageAssets.shoppingImage,
                              width: double.infinity,
                              height: 211,
                              fit: BoxFit.contain,
                              isNetworkImage: false,
                            ),
                            const SizedBox(height: AppGap.medium),
                            CustomTextFormField(
                              textFieldEntity: _registerEntity[0],
                            ),
                            const SizedBox(height: AppGap.medium),
                            CustomTextFormField(
                              textFieldEntity: _registerEntity[1],
                            ),
                            const SizedBox(height: AppGap.medium),
                            CustomTextFormField(
                              textFieldEntity: _registerEntity[2],
                            ),
                            const SizedBox(height: AppGap.medium),
                            Consumer<AuthProvider>(
                              builder: (ctx, provider, child) {
                                return provider.isLoadingRegister
                                    ? const ButtonLoading(
                                        width: double.infinity,
                                        height: 43,
                                        buttonColor: AppColors.red,
                                      )
                                    : ButtonPrimary(
                                        "Register",
                                        width: double.infinity,
                                        height: 43,
                                        buttonColor: AppColors.red,
                                        onPressed: () => _onSubmitted(provider),
                                      );
                              },
                            ),
                            const SizedBox(height: AppGap.medium),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an Account?",
                                  style: AppTextStyle.regular.copyWith(
                                    color: AppColors.blackLighter,
                                    fontSize: AppFontSize.normal,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => widget._onLogin(),
                                  child: Text(
                                    "Sign in",
                                    style: AppTextStyle.bold.copyWith(
                                      color: AppColors.blackPrimary,
                                      fontSize: AppFontSize.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleSilverAppBar({required String title, required String subtitle}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
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
            subtitle,
            style: AppTextStyle.regular.copyWith(
              color: AppColors.blackLighter,
              fontSize: AppFontSize.normal,
            ),
          ),
        ),
      ],
    );
  }

  void _onSubmitted(AuthProvider state) async {
    if (_formVerificationKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      await context.read<AuthProvider>().signUp(
            _registerEntity[0].textController.text,
            _registerEntity[1].textController.text,
            _registerEntity[2].textController.text,
          );

      if (state.state == AuthState.hasData) {
        widget._onRegister();
      } else if (state.state == AuthState.error) {
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

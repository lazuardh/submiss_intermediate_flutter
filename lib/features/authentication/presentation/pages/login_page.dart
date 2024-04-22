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
                        context.watch<AuthProvider>().isLoadingLogin
                            ? ButtonLoading(
                                height: 43,
                                width: ResponsiveUtils(context)
                                    .getMediaQueryWidth(),
                                buttonColor: AppColors.red,
                                loadingColor: AppColors.white,
                              )
                            : ButtonPrimary(
                                "Login",
                                width: ResponsiveUtils(context)
                                    .getMediaQueryWidth(),
                                height: 43,
                                buttonColor: AppColors.red,
                                onPressed: () async {
                                  if (_formLoginKey.currentState!.validate()) {
                                    final User user = User(
                                      email:
                                          _singInEntity[0].textController.text,
                                      password:
                                          _singInEntity[0].textController.text,
                                    );

                                    final provider = Provider.of<AuthProvider>(
                                        context,
                                        listen: false);

                                    final result = await provider.login(user);

                                    if (result) {
                                      widget._onLogin;
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      context.errorDialog(
                                          message: provider.message);
                                    }
                                  }
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
                              onPressed: () => widget._onRegister,
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
}

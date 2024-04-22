import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../lib.dart';

class RegisterPage extends StatefulWidget {
  final Function() _onRegister;

  const RegisterPage({
    Key? key,
    required Function() onRegister,
  })  : _onRegister = onRegister,
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
      body: SafeArea(
        child: Form(
          key: _formVerificationKey,
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
              ColumnPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppGap.extraLarge, vertical: 8.0),
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Register",
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
                      "Register here, if you dont have an Account!",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.blackLighter,
                        fontSize: AppFontSize.normal,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CustomImageWrapper(
                    image: AppImageAssets.shoppingImage,
                    width: double.infinity,
                    height: 211,
                    fit: BoxFit.contain,
                    isNetworkImage: false,
                  ),
                  const Spacer(),
                  CustomTextFormField(
                    textFieldEntity: _registerEntity[0],
                  ),
                  const Gap(height: AppGap.medium),
                  CustomTextFormField(
                    textFieldEntity: _registerEntity[1],
                  ),
                  const Gap(height: AppGap.medium),
                  CustomTextFormField(
                    textFieldEntity: _registerEntity[2],
                    onChanged: (value) {},
                  ),
                  const Spacer(),
                  ButtonPrimary(
                    "Login",
                    width: ResponsiveUtils(context).getMediaQueryWidth(),
                    height: 43,
                    buttonColor: AppColors.red,
                    onPressed: () => _onSubmitted(context),
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
                        "have your Account?",
                        style: AppTextStyle.regular.copyWith(
                          color: AppColors.blackLighter,
                          fontSize: AppFontSize.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Sign in",
                          style: AppTextStyle.bold.copyWith(
                            color: AppColors.blackPrimary,
                            fontSize: AppFontSize.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitted(BuildContext context) async {
    if (_formVerificationKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      final User user = User(
        email: _registerEntity[0].textController.text,
        password: _registerEntity[1].textController.text,
      );

      final provider = Provider.of<AuthProvider>(context, listen: false);

      final result = await provider.saveUser(user);

      if (result) {
        widget._onRegister;
      } else {
        _showErrorDialog(context, provider.message);
      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    if (!mounted) return; // Pastikan widget masih aktif
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.errorDialog(message: message);
    });
  }

  void _showSuccessDialog(BuildContext context, String message) {
    if (!mounted) return; // Pastikan widget masih aktif
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.successDialog(message: message);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_fly_restaurant/controllers/blocs/login/login_bloc.dart';
import 'package:foodie_fly_restaurant/views/screens/main/screen_main_page.dart';
import 'package:foodie_fly_restaurant/views/widgets/class_widgets/demo_user.dart';
import 'package:foodie_fly_restaurant/views/widgets/function_widgets/toggle_password_function.dart';
import 'package:lottie/lottie.dart';
import '../../../../controllers/cubits/toggle_password/toggle_password_cubit.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/text_form_field_validators.dart';
import '../../../widgets/class_widgets/button_widget.dart';
import '../../../widgets/function_widgets/snackbar_function.dart';
import '../../../widgets/class_widgets/text_field_widget.dart';

class ScreenLoginPage extends StatefulWidget {
  const ScreenLoginPage({super.key});

  @override
  State<ScreenLoginPage> createState() => _ScreenLoginPageState();
}

class _ScreenLoginPageState extends State<ScreenLoginPage> {
  final formKey = GlobalKey<FormState>();

  final userController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          shadowColor: Colors.orange.withBlue(900),
          surfaceTintColor: Colors.orange.withBlue(900),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                kHight100,
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 18),
                ),
                kHight30,
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFieldWidget(
                        userController: userController,
                        label: 'Email-address:',
                        inputType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (value) {
                          const pattern = regexPatternForLoginAndSignUpByEmail;
                          final regex = RegExp(pattern);
                          return value!.isEmpty || !regex.hasMatch(value)
                              ? "Enter a valid Email Address"
                              : null;
                        },
                      ),
                      kHight10,
                      BlocBuilder<TogglepasswordCubit, bool>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            userController: passwordController,
                            label: 'Password:',
                            inputType: TextInputType.name,
                            obscureText: state,
                            suffixIcon: togglePassword(),
                            validator: (value) {
                              const pattern =
                                  regexPatternForLoginAndSignUpByPassword;
                              final regex = RegExp(pattern);
                              if (value!.isEmpty) {
                                return "Please Enter password";
                              } else {
                                if (!regex.hasMatch(value)) {
                                  return "Enter Valid Password";
                                } else {
                                  return null;
                                }
                              }
                            },
                          );
                        },
                      ),
                      kHight30,
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is SellerLoginSuccessState) {
                            print("success state worked");
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => ScreenMainPage(),
                            ));
                            showSnack(context, Colors.green,
                                "successfully signed up");
                          } else if (state
                              is SellerLoginFailedInvalidFieldsOrFailedToLogin) {
                            print(
                                "failed invalid fields or failed to register");
                            showSnack(context, Colors.red,
                                "failed invalid fields or failed to register");
                          } else if (state
                              is SellerLoginFieldToParseBodyState) {
                            print("failed to parse body");
                            showSnack(
                                context, Colors.red, "failed to parse body");
                          } else if (state is SellerLoginErrorState) {
                            print("Error");
                            showSnack(context, Colors.red, "Error");
                          }
                        },
                        builder: (context, state) {
                          return ButtonWidget(
                            width: size * 6 / 10,
                            text: 'Login',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final email = userController.text;
                                final password = passwordController.text;
                                context.read<LoginBloc>().add(SellerLoginEvent(
                                    email: email, password: password));
                              }
                            },
                            height: size * 2.7 / 10,
                          );
                        },
                      ),
                      kHight50,
                      const DemoUser(),
                    ],
                  ),
                ),
                kHight100,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
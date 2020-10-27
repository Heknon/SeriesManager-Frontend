import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_event.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_state.dart';
import 'package:seriesmanager_frontend/components/featured_text_form_field.dart';
import 'package:seriesmanager_frontend/services/auth_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/screen_manipulation.dart';
import 'main/page_container.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState() : super();

  final GlobalKey<FeaturedTextFormFieldState> usernameGlobalKey = GlobalKey();
  final GlobalKey<FeaturedTextFormFieldState> passwordGlobalKey = GlobalKey();

  final String bannerCountry = () {
    List<String> a = ["IL", "US", "GB", "AU", "IT", "SE", "FR", "CH"]..shuffle(Random(Random().nextInt(10000)));
    return a.first;
  }();

  @override
  Widget build(BuildContext context) {
    if (context.bloc<AuthBloc>().onChangeState == null) context.bloc<AuthBloc>().setOnStateChange(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Show_Gallery_BG_Netflix_${bannerCountry}_HQ.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstATop),
          ),
        ),
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{LogicalKeySet(LogicalKeyboardKey.enter): const NextFocusIntent()},
          child: FocusTraversalGroup(
            child: Form(
              onChanged: () => Form.of(primaryFocus.context).save(),
              child: Padding(
                padding: context.getProportionalInsets(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FeaturedTextFormField(
                      unselectedColor: Colors.white,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                      style: TextStyle(color: Colors.white),
                      key: usernameGlobalKey,
                    ),
                    SizedBox(height: context.getPixelCountFromScreenPercentage(height: 5).height),
                    FeaturedTextFormField(
                      unselectedColor: Colors.white,
                      validator: ValidationBuilder()
                          .minLength(8, "Password must be at least 8 characters!")
                          .maxLength(30, "Password must not exceed 30 characters!")
                          .required("This field is required!")
                          .build(),
                      obscureText: true,
                      obscureToggle: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      style: TextStyle(color: Colors.white),
                      key: passwordGlobalKey,
                    ),
                    SizedBox(height: context.getPixelCountFromScreenPercentage(height: 5).height),
                    ButtonTheme(
                      minWidth: context
                          .getPixelCountFromScreenPercentage(
                              width: 25.0 / (100.0 / 75.0 /* 75% of the 75% of the screen the text field takes */))
                          .width,
                      buttonColor: Theme.of(context).primaryColor,
                      child: RaisedButton(
                        child: Text("LOGIN",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                        onPressed: () {
                          FormState state = Form.of(usernameGlobalKey.currentContext);

                          state.save();
                          if (state.validate()) {
                            context.bloc<AuthBloc>().add(AuthLoginEvent(
                                usernameGlobalKey.currentState.textEditingController.value.text,
                                passwordGlobalKey.currentState.textEditingController.value.text,
                                true));
                          }
                        },
                      ),
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.status == 404
                            ? Text(
                                "Invalid username/password",
                                style: TextStyle(color: Theme.of(context).errorColor),
                              )
                            : Container();
                      },
                      buildWhen: (prev, curr) => curr.status == 404,
                      cubit: context.bloc<AuthBloc>(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import '../utils/screen_manipulation.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState() : super();

  final FocusNode _emailFocus = new FocusNode();
  final FocusNode _passwordFocus = new FocusNode();

  @override
  void initState() {
    _emailFocus.addListener(() {
      setState(() {});
    });

    _passwordFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter): const NextFocusIntent()
        },
        child: FocusTraversalGroup(
          child: Form(
            onChanged: () => Form.of(primaryFocus.context).save(),
            child: Padding(
              padding: context.getProportionalInsets(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true,
                    focusNode: _emailFocus,
                    validator: ValidationBuilder()
                        .email("Must be a valid email!")
                        .required("This field is required!")
                        .build(),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: _emailFocus.hasFocus
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                      height: context
                          .getPixelCountFromScreenPercentage(height: 5)
                          .height),
                  TextFormField(
                    focusNode: _passwordFocus,
                    validator: ValidationBuilder()
                        .minLength(8, "Password must be at least 8 characters!")
                        .maxLength(
                            30, "Password must not exceed 30 characters!")
                        .required("This field is required!")
                        .build(),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: _passwordFocus.hasFocus
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                      height: context
                          .getPixelCountFromScreenPercentage(height: 5)
                          .height),
                  ButtonTheme(
                    minWidth: context
                        .getPixelCountFromScreenPercentage(
                            width: 25.0 /
                                (100.0 /
                                    75.0 /* 75% of the 75% of the screen the text field takes */))
                        .width,
                    buttonColor: Theme.of(context).primaryColor,
                    child: RaisedButton(
                      child: Text("LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                      onPressed: () {
                        FormState state = Form.of(primaryFocus.context);

                        state.save();
                        if (state.validate()) {
                          print("LOGGING IN!");
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

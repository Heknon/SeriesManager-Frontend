import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<AuthBloc>(context).state.token);
    return Container(
      color: Colors.green,
    );
  }
}

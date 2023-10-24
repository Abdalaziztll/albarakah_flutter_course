import 'package:bloc_session/view/bloc/login_bloc.dart';
import 'package:bloc_session/view/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(SendLoginModel(
                            user: UserModel(
                                name: name.text, password: password.text)));
                      },
                      child: Text('Login')),
                ),
                Spacer(),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is Success) {
                      return Text("Success");
                    } else if (state is Error) {
                      return Text("Error");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ]),
            ),
          );
        }
      ),
    );
  }
}

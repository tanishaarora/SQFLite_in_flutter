import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Login"),
        ),
      body: const MyLoginPage(title: 'Login Screen',),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<MyLoginPage> {

  DateTime? selectedDate =  null;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(

                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      isDense: true,
                      border: OutlineInputBorder(),
                      labelText: 'Enter Password',
                      hintText: 'Enter Your Password'
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    else if (value.length < 5) {
                      return 'Please enter atleast 5 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Successful')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                    style: TextButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 2,
                        backgroundColor: Colors.white),
                  ),
                ),
                ElevatedButton(
                  child: Text("Show DatePicker"),
                  onPressed: (){
                    showDatePicker();
                  },
                ),
                Text(selectedDate == null? "" : "$selectedDate")
              ]),
        ));
  }

  void showDatePicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery
                .of(context)
                .copyWith()
                .size
                .height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                if (value != null && value != selectedDate)
                  setState(() {
                    selectedDate = value;
                  });
              },
              initialDateTime: DateTime.now(),
           /*   minimumYear: 2019,
              maximumYear: 2021,*/
            ),
          );
        }
    );
  }
}
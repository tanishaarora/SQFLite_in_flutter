import 'package:flutter/material.dart';
import 'package:flutter_demo/shared_preference/models.dart';
import 'package:flutter_demo/shared_preference/shared_preference_data.dart';

class Registration extends StatelessWidget {
  const Registration({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.comment),
          tooltip: 'Comment Icon',
          onPressed: (){},
    ), 
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Settings Icon',
            onPressed: (){},)],

        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ), //IconButton
      ),
      body: const MyRegistrationPage(title: 'Registration Screen',),
    );
  }
}

class MyRegistrationPage extends StatefulWidget {
  const MyRegistrationPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<MyRegistrationPage> {

 // final shared_preference_data = Shared_preference_data();
  final name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _character = Gender.FEMALE;
  var _isEmployed = false;

 // late List<bool> _isChecked;
  var _selectedCharacter = Set<MarvelCharacter>();

  @override
  void initState() {
    super.initState();
    // _populateFields();
  }

  String dropdownvalue = 'Item 1';
  var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  final phone_number = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  get dropdown => null;

 /* void _populateFields() async{
    final settings = await shared_preference_data.getSettings();
    setState(() {
      name.text = settings.name;
      email.text = settings.email;
      password.text = settings.password;
      _character = settings.character;
      _selectedCharacter = settings.selectedCharacter;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff81B2DCFF),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          color: Colors.blue,),
                        child: const Text('Register here',
                          style: TextStyle(color: Colors.white),),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.all(20.0)
                        ,),
                      const SizedBox(height: 20),
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
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText: 'Enter Phone Number',
                            hintText: 'Enter Phone Number',

                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          else if (value.length < 10) {
                            return 'Please enter atleast 10 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText: 'Enter Email',
                            hintText: 'Enter Your Email'

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          else if (value.length < 5) {
                            return 'Please enter atleast 5 characters';
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

                      RadioListTile(
                        title: Text('DC'),
                          value: Gender.MALE,
                          groupValue: _character,
                          onChanged:(newValue) {
                            setState(() {
                              _character = newValue as Gender;
                            });
                          },
                        ),

                      RadioListTile(
                        title: const Text('Marvel'),
                          value: Gender.FEMALE,
                          groupValue: _character,
                          onChanged: (newValue) {
                            setState(() {
                              _character = newValue as Gender;
                            });
                          },
                        ),
/*
                        ListView(
                          children: [buildCheckbox(),],),*/

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ), //BoxDecoration

                        /** CheckboxListTile Widget **/
                        child: CheckboxListTile(
                          title: const Text('Captain America'),
                          subtitle: const Text(
                              'Has all super powers in his shield and never gets old.'),
                          secondary: const Icon(Icons.code),
                          autofocus: false,
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          value: _selectedCharacter.contains(MarvelCharacter.Captain_America),
                          onChanged: (_) {
                            setState(() {
                              _selectedCharacter.contains(MarvelCharacter.Captain_America)
                                  ?_selectedCharacter.remove(MarvelCharacter.Captain_America)
                                  :_selectedCharacter.add(MarvelCharacter.Captain_America);
                            });
                          },
                        ), //CheckboxListTile
                      ), //Container
                      const SizedBox(height: 30,),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ), //BoxDecoration

                        /** CheckboxListTile Widget **/
                        child: CheckboxListTile(
                          title: const Text('Thor'),
                          subtitle: const Text(
                              'Has his superpowers in hammer'),
                          secondary: const Icon(Icons.code),
                          autofocus: false,
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                            value:_selectedCharacter.contains(MarvelCharacter.Thor),
                          onChanged: (_) {
                            setState(() {
                              _selectedCharacter.contains(MarvelCharacter.Thor)
                                  ?_selectedCharacter.remove(MarvelCharacter.Thor)
                                  :_selectedCharacter.add(MarvelCharacter.Thor);
                            });
                          },
                        ), //CheckboxListTile
                      ), //Container

                      const SizedBox(height: 30),

                      DropdownButton(
                        // Initial Value
                        value: dropdownvalue,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }
                        ).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },
                      ),

                      SwitchListTile(
                          title: const Text('Is a Marvel fan'),
                          value: _isEmployed,
                          onChanged: (newValue) =>
                              setState(() => _isEmployed = newValue)),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            /*ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text(
                                  'Successful')),
                            );*/
                            if (_selectedCharacter.contains(MarvelCharacter.Captain_America)
                                ||_selectedCharacter.contains(MarvelCharacter.Thor) == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Successful')),
                              );
                              saveSettings();
                            }
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text(
                                    'Please check your information again')),
                              );
                            }
                          }
                       /*   else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text(
                                  'Please check your information again')),
                            );
                          }*/
                        },
                        child: const Text('Submit'),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            elevation: 2,
                            backgroundColor: Colors.blue),
                      ),
                    ]),
              )
          )),

      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation bar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: Text('Inbox'),
              leading
                  : Icon(Icons.mail),
            ),
            ListTile(
              title: Text('Friends'),
              leading
                  : Icon(Icons.people),),
          ],
        ),
      ),

      bottomNavigationBar
          : BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.blue,
          items
              : const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.account_circle)),
          ],
          onTap: (int indexOfItem) {}),
    );
  }

    void saveSettings(){
      final newSettings = Settings(
          name: name.text,
          phone_number: int.parse(phone_number.text),
          email: email.text,
          password: password.text,
          character: _character,
          dropdown: dropdown,
          selectedCharacter: _selectedCharacter,
          switch_list: _isEmployed);

      print(newSettings);
      // shared_preference_data.saveSettings(newSettings);
  }
}



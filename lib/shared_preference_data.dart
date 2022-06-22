/*
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';

class Shared_preference_data{
  Future saveSettings(Settings settings) async{
    final preference = await SharedPreferences.getInstance();

    await preference.setString('name', settings.name);
    await preference.setInt('phone_number', settings.phone_number);
    await preference.setString('email', settings.email);
    await preference.setString('password', settings.password);
    await preference.setInt('radiobutton', settings.character.index);
    await preference.setStringList('checkbox', settings.selectedCharacter.map((lang) => lang.index.toString()).toList());
    await preference.setString('dropdown', settings.dropdown);
    await preference.setBool('switch_list', settings.switch_list);

    log('Saved Settings!');
  }

  Future<Settings> getSettings() async{
    final preference = await SharedPreferences.getInstance();

    final name = preference.getString('name');
    final phone_number = preference.getInt('phone_number');
    final email = preference.getString('email');
    final password = preference.getString('password');
    final radiobutton = Gender.values[preference.getInt('radiobutton') ?? 0];
    final checkbox = preference.getStringList('checkbox');

    final marvelCharacter = checkbox.map((stringIndex) => MarvelCharacter.values[int.parse(stringIndex)]).toSet();

    final dropdown = preference.getString('dropdown');
    final switch_list = preference.getBool('switch_list');
    
    return Settings(
        name: name ?? "",
        phone_number: phone_number ?? 0,
        email: email ?? "",
        password: password ?? "",
        character: radiobutton ,
        selectedCharacter: marvelCharacter,
        dropdown: dropdown ?? "",
        switch_list: switch_list ?? false);
  }
}
*/

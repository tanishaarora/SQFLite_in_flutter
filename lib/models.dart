enum Gender { MALE, FEMALE, OTHER }

enum MarvelCharacter { Captain_America, Thor, Iron_Man}

class Settings {
  final String name;
  final int phone_number;
  final String email;
  final String password;
  final Gender character;
  final String dropdown;
  final Set<MarvelCharacter> selectedCharacter;
  final bool switch_list;

  Settings(
      {required this.name, required this.phone_number, required this.email,
        required this.password, required this.character, required this.dropdown,
        required this.selectedCharacter, required this.switch_list});
}


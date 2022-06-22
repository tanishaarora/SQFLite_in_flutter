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
      {this.name, this.phone_number,  this.email,
        this.password,  this.character, this.dropdown,
       this.selectedCharacter, this.switch_list});
}


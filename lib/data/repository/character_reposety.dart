import '../model/character.dart';
import '../web_services/api_character.dart';

class CraracterReposetory{
  late final CharacterApi characterApi;
  CraracterReposetory(this.characterApi);
  Future<List<Character>> getAllCharacter()async {
final character =await characterApi.getAllCharactet();
return character.map((e) => Character.fromJson(e)).toList();
  }
}
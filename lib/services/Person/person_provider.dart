import 'package:comunicate_colegios_app/models/person_models.dart';
import 'package:comunicate_colegios_app/models/search_to_models.dart';
import 'package:comunicate_colegios_app/services/Auth/PreferenciasUsuario.dart';

import '../Providers.dart';

class PersonProvider {
  Future<List<SearchTo>> getTo(String filter) async {
    Providers obj = new Providers();

    try {
      PreferenciasUsuario _preferencias = new PreferenciasUsuario();
      int _user = Usuario.fromJson(_preferencias.usuario).perId;

      //http://www.comunicatecolegios.com/api/Mensajes/destinatarios?idusuario=73&filter=%C2%A0
      String json = await obj
          .getAPI('Mensajes/destinatarios?idusuario=$_user&filter=$filter');

      return searchToFromJson(json);
    } catch (e) {
      print(e);

      return <SearchTo>[];
    }
  }
}

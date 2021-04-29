import 'package:comunicate_colegios_app/helper/utilities.dart';
import 'package:comunicate_colegios_app/models/search_to_models.dart';
import 'package:comunicate_colegios_app/services/Person/person_provider.dart';
import 'package:flutter/material.dart';

class DataSearchPages extends SearchDelegate<DestinatariosModel> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              this.query = "";
            })
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        this.close(context, null);
      });

  @override
  Widget buildResults(BuildContext context) {
    return _getTo();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _getTo();
  }

  FutureBuilder<List<SearchTo>> _getTo() {
    final toServices = new PersonProvider();

    return FutureBuilder(
      future: toServices.getTo(query),
      builder: (_, AsyncSnapshot<List<SearchTo>> snapshot) {
        if (snapshot.hasData) {
          return _showResult(snapshot.data);
        } else {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 4,
          ));
        }
      },
    );
  }

  Widget _showResult(List<SearchTo> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, i) {
        final _result = data[i];

        _result.selected = false;

        return ListTile(
          trailing: _result.selected
              ? Icon(
                  Icons.check_circle,
                  color: Colors.blue[400],
                )
              : null,
          onTap: () {
            this.close(
                _,
                new DestinatariosModel(
                    perId: _result.perId,
                    tipo: _result.tipo,
                    apellido: _result.perApellidos,
                    nombre: _result.perNombres));
          },
          leading: CircleAvatar(
            backgroundColor: Utilities.hexToColor(_result.grEnColorBurbuja),
            radius: 25.0,
            child: Text(
              Utilities.inicialesUsuario(
                  _result.perNombres, _result.perApellidos),
              style: TextStyle(color: Colors.white),
            ),
          ),
          subtitle: Text(_result.curDescripcion),
          title: Text("${_result.perApellidos} ${_result.perNombres}"),
        );
      },
    );
  }
}

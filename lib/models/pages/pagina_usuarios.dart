import 'package:consumir_appi/models/usuario.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<ReqResUsuario>> getUsuarios() async {
  final resp =
      await http.get(Uri.parse('https://cenedic4.ucol.mx/demopa/usersApi.php'));
  return reqResUsuarioFromJson(resp.body);
}

class paginaUsuarios extends StatelessWidget {
  const paginaUsuarios({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.person_add_alt_1_outlined),
      ),
      body: FutureBuilder(
        future: getUsuarios(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // print(snapshot.connectionState);
          // ignore: duplicate_ignore
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ignore: prefer_const_constructors
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // inspect(snapshot.data);
            return _listaUsuarios(snapshot.data);
          }
        },
      ),
    );
  }
}

class _listaUsuarios extends StatelessWidget {
  final List<ReqResUsuario> usuarios;
  const _listaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(usuarios[i].nombre),
          subtitle: Text(usuarios[i].correo),
          leading: CircleAvatar(child: Text((i + 1).toString())),
          trailing: TextButton(
            onPressed: () {
              // ignore: avoid_print
              //print(usuarios[i].idUsuario);
            },
            child: Icon(Icons.delete),
          ),
        );
      },
    );
  }
}

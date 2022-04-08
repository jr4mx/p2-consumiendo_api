// To parse this JSON data, do
//
//     final reqResUsuario = reqResUsuarioFromJson(jsonString);

import 'dart:convert';

List<ReqResUsuario> reqResUsuarioFromJson(String str) =>
    List<ReqResUsuario>.from(
        json.decode(str).map((x) => ReqResUsuario.fromJson(x)));

String reqResUsuarioToJson(List<ReqResUsuario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqResUsuario {
  ReqResUsuario({
    required this.idUsuario,
    required this.correo,
    required this.nombre,
  });

  String idUsuario;
  String correo;
  String nombre;

  factory ReqResUsuario.fromJson(Map<String, dynamic> json) => ReqResUsuario(
        idUsuario: json["idUsuario"],
        correo: json["correo"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "correo": correo,
        "nombre": nombre,
      };
}

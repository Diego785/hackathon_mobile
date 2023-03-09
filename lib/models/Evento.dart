import 'package:alerta_temprana_scz/models/Foto.dart';

class Evento {
  int id;
  String nombre;
  FotoIncidente foto;
  Evento({required this.id, required this.nombre, required this.foto});
}

final eventos = [
  Evento(
      id: 1, nombre: "Incendios Forestales", foto: fotos_general_categories[0]),
  Evento(
      id: 2,
      nombre: "Incendios Estructurales",
      foto: fotos_general_categories[1]),
  Evento(
    id: 3,
    nombre: "Inundaciones",
    foto: fotos_general_categories[2],
  ),
  Evento(
      id: 4,
      nombre: "Deslizamientos",
      foto:fotos_general_categories[3]),
  Evento(
      id: 5,
      nombre: "Heladas",
      foto:
          fotos_general_categories[4]),
  Evento(
      id: 6,
      nombre: "Sequías",
      foto: fotos_general_categories[5]),
  Evento(
      id: 7,
      nombre: "Sismos/Terremotos",
      foto:
          fotos_general_categories[6]),
  Evento(
      id: 8,
      nombre: "Personas desaparecidas",
      foto:
          fotos_general_categories[7]),
  Evento(
      id: 9,
      nombre: "Conflictos Sociales",
      foto:
          fotos_general_categories[8]),
];

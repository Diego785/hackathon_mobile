import 'dart:io';

import 'package:alerta_temprana_scz/models/eventos.dart';
import 'package:alerta_temprana_scz/widget/headers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:geolocator/geolocator.dart';

class FormularioEmergencia extends StatefulWidget {
  const FormularioEmergencia({super.key});

  @override
  State<FormularioEmergencia> createState() => _FormularioEmergenciaState();
}

class _FormularioEmergenciaState extends State<FormularioEmergencia> {
  final _textControllerdescripcion = TextEditingController();
  final _creationDateTimeController = TextEditingController();
  bool _veifyVideo = false;
  bool _miubicacion = false;

  List<Eventos> eventos = [
    Eventos(id: 1, nombre: 'incendio'),
    Eventos(id: 2, nombre: 'inundacion'),
    Eventos(id: 3, nombre: 'sequia')
  ];

  DateTime? _creationDateTime = DateTime.now();

  String? eventoId;
  final picker = ImagePicker();
  void _selectDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        if (value != null) {
          _creationDateTime = value;
        }
        _creationDateTimeController.text = _creationDateTime.toString();
      });
    });
  }

  Future<void> _guardarPocision() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    _miubicacion = true;
    setState(() {});

    double latitude = position.latitude;
    double longitude = position.longitude;
  }

  final ImagePicker _video = ImagePicker();
  Future<void> _selectVideo() async {
    final XFile? video = await _video.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      final File image = File(video.path);
      _veifyVideo = true;
      setState(() {});
    } else {}
  }

  List<XFile?> _imageList = [];
  final int _maxImageCount = 5;
  bool isVerifying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: const [
                IconHeader(
                  titulo: 'Notificaciones',
                  color1: Color.fromARGB(255, 2, 57, 121),
                  color2: Color.fromARGB(214, 48, 255, 221),
                  grosor: 150,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.cyan.shade900, fontSize: 18),
                          controller: _textControllerdescripcion,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Brebe descripcion del evento",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _textControllerdescripcion.clear();
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                        (isVerifying && _textControllerdescripcion.text.isEmpty)
                            ? Text(
                                "Complete el campo descripcion",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              )
                            : SizedBox.shrink(),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _creationDateTimeController,
                                style: TextStyle(
                                    color: Colors.cyan.shade900, fontSize: 20),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: _creationDateTime.toString(),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () =>
                                        _creationDateTimeController.clear(),
                                    icon: Icon(Icons.clear),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => _selectDatePicker(),
                              icon: Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white, //<-- SEE HERE
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: DropdownButton(
                            style: TextStyle(
                                color: Colors.cyan.shade900, fontSize: 20),
                            hint: const Text(
                              "seleccione un evento",
                              style: TextStyle(color: Colors.grey),
                            ),
                            value: eventoId,
                            items: eventos.map((e) {
                              return DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(e.nombre));
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                eventoId = newValue.toString();
                                print(eventoId);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: 50,
                            color: Colors.cyan.shade200,
                            hoverColor: Colors.cyan.shade900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: <Widget>[
                                (_miubicacion != false)
                                    ? Icon(Icons.check, color: Colors.green)
                                    : Icon(Icons.add, color: Colors.red),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Guardar mi actual Ubicacion',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ],
                            ),
                            onPressed: _guardarPocision),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            height: 50,
                            color: Colors.cyan.shade400,
                            hoverColor: Colors.cyan.shade900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: <Widget>[
                                (_veifyVideo != false)
                                    ? Icon(Icons.check, color: Colors.green)
                                    : Icon(Icons.add, color: Colors.red),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'Subir un Video',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            onPressed: _selectVideo),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.cyan.shade300,
                          hoverColor: Colors.cyan.shade900,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () async {
                            if (_imageList.length < _maxImageCount) {
                              XFile? picker = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (picker != null) {
                                setState(() {
                                  _imageList.add(picker);
                                });
                              }
                            } else {
                              print('lista de imagenes' +
                                  '$_imageList'); // Muestra un mensaje al usuario indicando que ya ha seleccionado el n??mero m??ximo de im??genes
                            }
                          },
                          child: Text('Agregar im??genes',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            '${_imageList.length} / $_maxImageCount im??genes seleccionadas',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

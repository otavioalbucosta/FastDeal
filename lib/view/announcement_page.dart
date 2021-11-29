import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  bool _isSelected = false;
  String? valueChoose;
  List categoryList = [
    'Smartphones',
    'Carros',
    'Motos',
    'Bicicletas',
    'Videogames',
    'Televisões',
    'Computadores',
    'Headpgones',
    'Tablets'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Inserir Anúncio',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: GestureDetector(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage('assets/camera_icon.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {})),
              Expanded(
                  child: GestureDetector(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage('assets/camera_icon.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {})),
              Expanded(
                  child: GestureDetector(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage('assets/camera_icon.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      onTap: () {})),
            ]),
            Padding(
              padding: const EdgeInsets.all(10),
              child: buildTextField("Título", "Exemplo: Smartphone Samsung",
                  type: TextInputType.number),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: buildTextField("Descrição", "Exemplo: Memória 128gb",
                  type: TextInputType.number),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton(
                hint: const Text('Categorias: '),
                dropdownColor: Colors.white,
                icon: const Icon(Icons.expand_more),
                iconSize: 36,
                isExpanded: true,
                underline: const SizedBox(),
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue as String?;
                  });
                },
                items: categoryList.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: buildTextField("CEP", "60040-531",
                        type: TextInputType.number),
                  ),
                  const Divider(thickness: 10, indent: 40),
                  Expanded(
                    child: buildTextField("Preço", "900,00",
                        type: TextInputType.number),
                  ),
                ],
              ),
            ),
            LabeledCheckbox(
                label: 'Ocultar o meu telefone neste anúncio',
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                value: _isSelected,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected = newValue;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Os interessados entrarão em contato com você por meio do nosso chat :)',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                child: Center(
                  child: Ink(
                    width: 80,
                    height: 80,
                    decoration: const ShapeDecoration(
                      color: Colors.black12,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.done, size: 40),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  'Ao publicar você concorda e aceita nossos Termos de Uso e Privacidade',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint,
      {TextInputType type = TextInputType.text}) {
    return TextField(
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(fontSize: 16.0),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ));
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
    required this.controlAffinity,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(label, style: GoogleFonts.poppins(fontSize: 16)),
            ),
            Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

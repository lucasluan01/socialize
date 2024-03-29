import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropdownCustom extends StatefulWidget {
  const DropdownCustom({
    required this.dropdownType,
    required this.onChanged,
    required this.labelText,
    required this.initialValue,
    this.messageError,
    super.key,
  });

  final String dropdownType, labelText;
  final String? messageError, initialValue;
  final Function(String?) onChanged;

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  List<String> options = [];
  List<String> states = [
    "Acre",
    "Alagoas",
    "Amapá",
    "Amazonas",
    "Bahia",
    "Ceará",
    "Distrito Federal",
    "Espírito Santo",
    "Goiás",
    "Maranhão",
    "Mato Grosso",
    "Mato Grosso do Sul",
    "Minas Gerais",
    "Pará",
    "Paraíba",
    "Paraná",
    "Pernambuco",
    "Piauí",
    "Rio de Janeiro",
    "Rio Grande do Norte",
    "Rio Grande do Sul",
    "Rondônia",
    "Roraima",
    "Santa Catarina",
    "São Paulo",
    "Sergipe",
    "Tocantins"
  ];

  List<String> gender = [
    "Masculino",
    "Feminino",
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.dropdownType == "Gênero") {
      options = gender;
    } else if (widget.dropdownType == "Estado") {
      options = states;
    }

    return Observer(builder: (context) {
      return DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 24,
        value: widget.initialValue,
        elevation: 16,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
          errorText: widget.messageError,
        ),
        validator: (value) => widget.messageError,
        onChanged: (value) => widget.onChanged(value),
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/stores/user_store.dart';

class DropdownCustom extends StatefulWidget {
  const DropdownCustom({
    required this.dropdownType,
    super.key,
  });

  final String dropdownType;

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
    final userStore = GetIt.instance<UserStore>();

    if (widget.dropdownType == "Gênero") {
      options = gender;
    } else if (widget.dropdownType == "Estado") {
      options = states;
    }

    return Observer(builder: (context) {
      return DropdownButtonFormField(
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 24,
        value: widget.dropdownType == "Gênero"
            ? userStore.gender
            : userStore.state,
        elevation: 16,
        decoration: InputDecoration(
          labelText: widget.dropdownType,
          border: const OutlineInputBorder(),
          errorText: widget.dropdownType == "Gênero"
              ? userStore.genderError
              : userStore.stateError,
        ),
        validator: (value) => value == null
            ? widget.dropdownType == "Gênero"
                ? userStore.genderError
                : userStore.stateError
            : null,
        onChanged: (value) => widget.dropdownType == "Gênero"
            ? userStore.setGender(value.toString())
            : userStore.setState(value.toString()),
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

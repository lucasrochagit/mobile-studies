import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/models/api_response.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CarroFormPage extends StatefulWidget {
  final Carro? carro;

  const CarroFormPage({Key? key, this.carro}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarroFormPageState();
}

class _CarroFormPageState extends State<CarroFormPage> {
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final tNome = TextEditingController();
  final tDesc = TextEditingController();
  final tTipo = TextEditingController();

  int _radioIndex = 0;

  bool _showProgress = false;

  File? _file;

  Carro? get carro => widget.carro;

  // Add validate email function.
  String? _validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o nome do carro.';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    // Copia os dados do carro para o form
    if (carro != null) {
      tNome.text = (carro?.nome)!;
      tDesc.text = (carro?.descricao)!;
      _radioIndex = getTipoInt(carro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          carro?.nome ?? "Novo Carro",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: _form(),
      ),
    );
  }

  _form() {
    return Form(
      key: this._formKey,
      child: ListView(
        children: <Widget>[
          _headerFoto(),
          const Text(
            "Clique na imagem para tirar uma foto",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const Divider(),
          const Text(
            "Tipo",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          _radioTipo(),
          const Divider(),
          AppText(
            'Nome',
            '',
            controller: tNome,
            keyboardType: TextInputType.text,
            validator: _validateNome,
          ),
          const Divider(),
          AppText(
            'Descrição',
            '',
            controller: tDesc,
            keyboardType: TextInputType.text,
          ),
          const Divider(),
          AppButton(
            "Salvar",
            onPressed: _onClickSalvar,
            showProgress: _showProgress,
          ),
        ],
      ),
    );
  }

  _headerFoto() {
    return InkWell(
      onTap: onClickFoto,
      child: _file != null
          ? Image.file(
              _file!,
              height: 150,
            )
          : carro?.urlFoto != null
              ? CachedNetworkImage(
                  imageUrl: (carro?.urlFoto)!,
                  height: 150,
                )
              : Image.asset(
                  "assets/images/camera.png",
                  height: 150,
                ),
    );
  }

  _radioTipo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        const Text(
          "Clássicos",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
        Radio(
          value: 1,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        const Text(
          "Esportivos",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
        Radio(
          value: 2,
          groupValue: _radioIndex,
          onChanged: _onClickTipo,
        ),
        const Text(
          "Luxo",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
      ],
    );
  }

  void _onClickTipo(int? value) {
    setState(() {
      _radioIndex = value ?? 2;
    });
  }

  getTipoInt(Carro? carro) {
    if (carro?.tipo == null) {
      return 2;
    }
    switch (carro?.tipo!) {
      case "classicos":
        return 0;
      case "esportivos":
        return 1;
      default:
        return 2;
    }
  }

  String _getTipo() {
    switch (_radioIndex) {
      case 0:
        return "classicos";
      case 1:
        return "esportivos";
      default:
        return "luxo";
    }
  }

  _onClickSalvar() async {
    bool validate = _formKey.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }

    // Cria o carro
    var c = carro ?? Carro();
    c.nome = tNome.text;
    c.descricao = tDesc.text;
    c.tipo = _getTipo();

    print("Carro: $c");

    setState(() {
      _showProgress = true;
    });

    print("Salvar o carro $c");

    ApiResponse<bool> response = c.id != null
        ? await CarrosApi.update(c)
        : await CarrosApi.save(c, _file!);
    if (response.ok!) {
      alert(
        context,
        "Carro salvo com sucesso",
        callback: () => {pop(context)},
      );
    } else {
      alert(context, response.msg!);
    }

    setState(() {
      _showProgress = false;
    });

    print("Fim.");
  }

  void onClickFoto() async {
    print('Foto!!');
    var pickerFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      setState(() {
        _file = File(pickerFile.path);
      });
    }
  }
}

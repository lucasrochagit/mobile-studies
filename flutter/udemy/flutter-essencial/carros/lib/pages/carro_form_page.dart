import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CarroFormPage extends StatefulWidget {
  final Carro? carro;

  const CarroFormPage({Key? key, this.carro}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarroFormPageState();
}

class _CarroFormPageState extends State<CarroFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final tNome = TextEditingController();
  final tDesc = TextEditingController();
  final tTipo = TextEditingController();

  int _radioIndex = 0;

  bool _showProgress = false;

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
          TextFormField(
            controller: tNome,
            keyboardType: TextInputType.text,
            validator: _validateNome,
            style: const TextStyle(color: Colors.blue, fontSize: 20),
            decoration: const InputDecoration(
              hintText: '',
              labelText: 'Nome',
            ),
          ),
          TextFormField(
            controller: tDesc,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
            decoration: const InputDecoration(
              hintText: '',
              labelText: 'Descrição',
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 20.0),
            child: AppButton(
              "Salvar",
              onPressed: _onClickSalvar,
              showProgress: _showProgress,
            ),
          )
        ],
      ),
    );
  }

  _headerFoto() {
    return carro?.urlFoto != null
        ? CachedNetworkImage(
            imageUrl: (carro?.urlFoto)!,
          )
        : Image.asset(
            "assets/images/camera.png",
            height: 150,
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

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _showProgress = false;
    });

    print("Fim.");
  }
}

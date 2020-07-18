import 'package:bytebank/components/editor.dart';
import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciasState();
  }
}

class FormularioTransferenciasState extends State<FormularioTransferencias> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint('criado $transferencia');
      Navigator.pop(context, transferencia);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _titulo = 'Criando Transferência';
    final _rotuloNumeroConta = 'Número da Conta';
    final _dicaNumeroConta = '0000';
    final _rotuloValor = 'Valor';
    final _dicaValor = '0.00';


    final _tituloBotaoConfirmar = 'Confirmar';
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Editor(
              controlador: _controladorNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta),
          Editor(
            controlador: _controladorValor,
            rotulo: _rotuloValor,
            dica: _dicaValor,
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text(_tituloBotaoConfirmar),
            onPressed: () => _criarTransferencia(context),
          )
        ]),
      ),
    );
  }
}

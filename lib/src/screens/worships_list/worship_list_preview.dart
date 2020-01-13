import 'package:flutter/material.dart';

class WorshipListPreview extends StatefulWidget {
  @override
  _WorshipListPreviewState createState() => _WorshipListPreviewState();
}

class _WorshipListPreviewState extends State<WorshipListPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(      
      children: <Widget>[
         SizedBox(
          height: 20,
        ),

        Text('CELEBRAÇÂO'),
        Text('Como é precioso'),
        SizedBox(
          height: 20,
        ),

        Text('CELEBRAÇÂO'),
        Text('Como é precioso'),
        SizedBox(
          height: 20,
        ),
        Text('OFERTA'),
        Text('Oferta de Amor'),
        SizedBox(
          height: 20,
        ),

        Text('VISITANTE'),
        Text('Como é precioso'),
        SizedBox(
          height: 20,
        ),
        
        Text('ADORAÇÃO'),
        Text('Enche-me'),
        SizedBox(
          height: 20,
        ),

        Text('ADORAÇÃO'),
        Text('Poderoso Deus'),
        SizedBox(
          height: 20,
        ),

        Text('ADORAÇÃO'),
        Text('Formoso és'),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

//TODO: poder montar lista de forma variada, dar direcionamento durante a montagem exemplo: leitura biblica e o qual as palavras chave
//Definir limite de musicas para a lista
//Conseguir melhor gerenciar o ensaio
//Descrever de forma clara a maneira de como montar a lista
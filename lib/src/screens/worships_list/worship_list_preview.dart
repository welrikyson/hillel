import 'package:flutter/material.dart';

class WorshipListPreview extends StatefulWidget {
  @override
  _WorshipListPreviewState createState() => _WorshipListPreviewState();
}

class _WorshipListPreviewState extends State<WorshipListPreview> {
  List<Item> _items = MockItens().getAll();
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(      
      header: Text('List of songs'),
      children: [
        for (var item in _items) 
          ListTile(
            key: ValueKey(Item),
            title: Text(item.title),
          )
      ], onReorder: (int oldIndex, int newIndex) {
        setState(() {
          _updateMyItems(oldIndex,newIndex);
        });
      },       
      
    );
  }

  void _updateMyItems(int oldIndex, int newIndex) {
      if(newIndex > oldIndex){
        newIndex -= 1;
      }

      final Item item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);

  }
}


class Item {
  final String title;

  Item({this.title});

  
}

class MockItens {
  List<Item> getAll(){
    return <Item>[
      Item(title: 'Rei dos Reis'),
      Item(title: 'Vem essa é a hora da adoração'),
      Item(title: 'Ao Único'),
      Item(title: 'Doce Nome'),
    ];
  }
}
//TODO: poder montar lista de forma variada, dar direcionamento durante a montagem exemplo: leitura biblica e o qual as palavras chave
//Definir limite de musicas para a lista
//Conseguir melhor gerenciar o ensaio
//Descrever de forma clara a maneira de como montar a lista
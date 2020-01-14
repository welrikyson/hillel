import 'package:flutter/material.dart';
import 'package:hillel/src/widgets/common/list_view_card.dart';

class WorshipListPreview extends StatefulWidget {
  @override
  _WorshipListPreviewState createState() => _WorshipListPreviewState();
}

class _WorshipListPreviewState extends State<WorshipListPreview> {
  List<Item> _items = MockItens().getAll();

  showEditWorshipListItem(){
    
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      // header: Text('List of songs'),
      children: List.generate(_items.length, (index) {
        return ListViewCard(
          _items,
          index,
          Key('$index'),
          onTab: showEditWorshipListItem,
        );
      }),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          _updateMyItems(oldIndex, newIndex);
        });
      },
    );
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final Item item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
  }
}

class Item {
  final String title;
  final String style;
  Item({this.title, this.style});
}

class MockItens {
  List<Item> getAll() {
    return <Item>[
      Item(title: 'Rei dos Reis', style: 'Celebração'),
      Item(title: 'vinho e pão', style: 'Comunhão'),
      Item(title: 'Oferta de amor', style: 'Oferta'),
      Item(title: 'Vem essa é a hora da adoração', style: 'Celebração'),
      Item(title: 'Outra vez', style: 'Adoração'),
      Item(title: 'Ao Único', style: 'Adoração'),
      Item(title: 'Doce Nome', style: 'Adoração'),      
    ];
  }
}
//TODO: poder montar lista de forma variada, dar direcionamento durante a montagem exemplo: leitura biblica e o qual as palavras chave
//Definir limite de musicas para a lista
//Conseguir melhor gerenciar o ensaio
//Descrever de forma clara a maneira de como montar a lista

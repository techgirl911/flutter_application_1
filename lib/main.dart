import 'package:flutter/material.dart';

void main() => runApp(const ListApp());

// The data: one class, one object per row
class Item {
  const Item(this.name, this.detail, this.price);

  final String name;
  final String detail;
  final int price;
}

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      Item('Fresh mangoes', 'obili quater', 750),
      Item('Plantains', 'messasi market', 500),
      Item('Pineapples', 'Bastos supermarket', 400),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Market')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.eco)),
              title: Text(item.name),
              subtitle: Text(item.detail),
              trailing: Text('${item.price} XAF'),
            ),
          );
        },
      ),
    );
  }
}

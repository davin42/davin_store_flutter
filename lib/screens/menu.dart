import 'package:davin_store/screens/forms.dart';
import 'package:davin_store/screens/list_obj.dart';
import 'package:davin_store/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist_rounded, Colors.red),
    ShopItem("Tambah Item", Icons.add_box, Colors.blue),
    ShopItem("Logout", Icons.logout, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Davin Store'),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1, 
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }
                ).toList(),
              ),
          ]),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  void handleTap(BuildContext context, ShopItem item) { // Changed dynamic to ShopItem for better type safety
    if (item.name == "Tambah Item") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FormPage()),
      );
      } else if (item.name == "Lihat Item") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ListItem()),
        );
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.color,
      child: InkWell(
        onTap: () => handleTap(context, item),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                color: Colors.white,
                size: 60.0,
              ),
              const Padding(padding: EdgeInsets.all(3)),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20), // Reduced font size for better UI
              ),
            ],
          ),
        ),
      ),
    );
  }
}

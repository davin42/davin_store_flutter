import 'package:flutter/material.dart';
import 'package:davin_store/screens/forms.dart';
import 'package:davin_store/screens/menu.dart';
import 'package:davin_store/screens/list_obj.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: ListView(
        children: [
          const SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
              color: Colors.grey,
              ),
              child: Column(
                children: [
                  Text(
                    'Davin\nStore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Yuk Simpan Item",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.grey,
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Halaman Utama',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              )
            )
          ),
          ListTile(
            tileColor: Colors.grey,
            leading: const Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            title: const Text(
              'Tambah Item',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FormPage()))
          ),
          ListTile(
            tileColor: Colors.grey,
            leading: const Icon(
              Icons.checklist_rounded,
              color: Colors.white,
            ),
            title: const Text(
              'Lihat Item',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListItem()))
          ),
        ],
      ),
    );
  }
}
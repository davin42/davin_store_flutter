# davin_store

## Tugas 7
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

- Stateless Widget

    - StatelessWidget adalah jenis widget di mana keadaan (state) tidak mengalami perubahan—sifatnya tetap (immutable)—sehingga widget ini cenderung lebih statis dan menawarkan interaktivitas yang lebih sedikit.

- Stateful Widget

    - StatefulWidget merupakan widget yang dirancang dengan kemampuan untuk mengubah state-nya, yang mengizinkan widget tersebut untuk bersikap dinamis dan mendukung interaksi yang luas dan tidak terbatas.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

    - MaterialApp: Ini adalah widget yang membungkus sejumlah widget yang umumnya diperlukan untuk aplikasi yang menggunakan material design. Fungsi utamanya adalah untuk menjadi widget akar dari aplikasi Anda dan menyediakan konfigurasi seperti tema, judul, dan rute navigasi.

    - Scaffold: Scaffold digunakan untuk membuat tata letak dasar visual material design di Flutter. Ini menyediakan kerangka kerja yang standar, dengan app bar, body, floating action buttons, drawers, dan lain-lain.

    - AppBar: Ini adalah sebuah widget di bagian atas Scaffold yang biasanya menampilkan judul aplikasi, dan bisa juga menampilkan tombol aksi dan menu.

    - SingleChildScrollView: Sebuah widget yang menyediakan scroll pada anak-anaknya yang mungkin membutuhkan ruang layar yang lebih dari yang tersedia.

    - Padding: Widget yang digunakan untuk memberikan padding pada anak-anaknya, yaitu ruang kosong di sekitar widget yang ditentukan.

    - Column: Merupakan widget yang menata anak-anaknya secara vertikal.

    - GridView: Sebuah widget yang membuat grid dengan anak-anak yang diberikan. Dalam hal ini, menggunakan GridView.count untuk menentukan jumlah kolom dengan crossAxisCount.

    - Text: Widget ini menampilkan string teks dengan berbagai styling.

    - Icon: Menampilkan ikon dari library ikon material.

    - Material: Widget yang digunakan sebagai efek visual pada ShopCard yang mana menggunakan tinta untuk respons terhadap sentuhan.

    - InkWell: Sebuah widget material yang merespon ketika disentuh dengan efek semburat tinta. Dalam kasus ini, digunakan untuk mendeteksi tap dan menampilkan SnackBar.

    - Container: Widget yang bisa digunakan untuk dekorasi, padding, dan penentuan dimensi.

    - Center: Widget yang digunakan untuk menengahkan anak-anaknya.

    - SnackBar: Widget yang digunakan untuk menampilkan pesan ringkas di bagian bawah layar.

    - ScaffoldMessenger: Widget yang digunakan untuk menampilkan SnackBar dan pesan lainnya dari Scaffold.

3. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

    Saya meneruskan aplikasi davin store saya untuk saya develop menjadi aplikasi berbasis mobile menggunakan flutter.

4. Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item, Menambah item, Logout

- Saya membuat class ShopItem sebagai class yang dapat menginstansiasi object. Kemudian object-object tersebut disimpan di dalam list. Object-object yang tersimpan akan diiterasikan menggunakan GridView.

- GridView tersebut hanya mengiterasikan Item. Jadi, untuk membuat card, saya membuat class yang merupakan stateless widget untuk membuat card. Widget ini menerima Object sebagai content dari card. Kemudian dalam Widget ini saya buat container hingga menyerupai card dan mengakses atribut dari object item untuk ditampilkan di dalam container. Container tersebut kemudian saya berikan InkWell agar dapat menjalankan suatu action saat Card ditekan. Actionnya adalah menampilkan snackbar

- Saya memodifikasi sedikit pada bagian gridview. Saya tambahkan crossAxisCount agar setiap card tersusun secara vertikal. Di bawah ini adalah code nya

```dart
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
```

5. Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan. "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan. "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

- Telah saya jelaskan pada nomor 4 bahwa saya menambahkan InkWell agar saat container di tekan, maka SnackBar akan muncul tepat di bawah layar. Di bawah ini adalah code untuk mengimplementasikan snackbar

```dart
void handleTap(BuildContext context, ShopItem item) { 
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text("Kamu telah menekan tombol ${item.name}"),
      ));
  }

  child: InkWell(
    onTap: () => handleTap(context, item),
  )

```

6. Bonus

- Saya mengerjakan bonus dengan pendekatan menambahkan atribut color. Dengan hanya menambahkan warna yang berbeda untuk setiap objectnya, setiap card dapat memiliki warna yang beda dengan mengakses atribut baru yang saya beri nama color pada Widget material.

## Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

    - `Navigator.push()` merupakan metode yang memungkinkan transisi ke layar baru dan menempatkannya di atas tumpukan navigasi. Dengan ini, pengguna dapat kembali ke layar sebelumnya dengan menggunakan tombol kembali.

    - `Navigator.pushReplacement()` juga mengarahkan pengguna ke sebuah layar baru, namun ia menggantikan layar saat ini di tumpukan navigasi. Artinya, layar saat ini dihapus dan jika pengguna menekan tombol kembali, mereka akan diarahkan ke layar yang berada sebelum layar saat ini di tumpukan, bukan ke layar yang baru saja digantikan.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    - Widget layout single-child pada Flutter dirancang untuk mengatur tata letak satu child:

        - Align: Menempatkan satu child dalam dirinya dengan kemungkinan mengubah ukuran berdasarkan ukuran child tersebut.

        - AspectRatio: Mengatur ukuran child berdasarkan rasio aspek yang ditentukan.

        - Baseline: Menyelaraskan child berdasarkan garis dasar teks child tersebut.

        - Center: Memosisikan child di tengah-tengah widget.

        - ConstrainedBox: Memberi batasan ukuran tambahan ke child.

        - Container: Widget serbaguna yang bisa melakukan pengecatan, penempatan, dan pengaturan ukuran.

        - CustomSingleChildLayout: Mengatur tata letak satu child dengan bantuan delegasi.

        - Expanded: Memperluas child di dalam Row, Column, atau Flex agar memenuhi ruang yang tersedia.

        - FittedBox: Memastikan child cocok dalam ruang yang tersedia dengan mengubah skala dan posisinya.

        - FractionallySizedBox: Mengukur child berdasarkan sebagian dari total ruang yang ada.

        - IntrinsicHeight: Mengukur child berdasarkan tinggi intrinsiknya.

        - IntrinsicWidth: Mengukur child berdasarkan lebar intrinsiknya.

        - LimitedBox: Memaksa batasan ukuran pada child ketika tidak ada batasan dari orang tua.

        - Offstage: Menempatkan child pada pohon tanpa melukisnya.

        - OverflowBox: Memberi child batasan ukuran yang berbeda dari batasan yang diterima dari orang tua.

        - Padding: Menambahkan ruang di sekitar child.

        - SizedBox: Menyediakan kotak dengan ukuran tetap.

        - SizedOverflowBox: Memiliki ukuran tetap namun memperbolehkan child melewati batasan tersebut.

        - Transform: Menerapkan transformasi pada child sebelum dilukis.
            
    - Widget layout multi-child memungkinkan pengaturan beberapa child:

        - Column: Menyusun child secara vertikal.

        - CustomMultiChildLayout: Menyusun beberapa child dengan bantuan delegasi.

        - Flow: Menggunakan algoritma layout flow untuk menyusun child.

        - GridView: Membuat grid dari child yang disusun secara vertikal maupun horizontal.

        - IndexedStack: Menampilkan satu child dari daftar child berdasarkan indeks.

        - LayoutBuilder: Membuat pohon widget yang bisa beradaptasi dengan ukuran widget orang tua.

        - ListBody: Menyusun child secara berurutan pada sumbu tertentu.

        - ListView: Menampilkan daftar scrollable dari widget yang disusun secara linear.

        - Row: Menyusun child secara horizontal.

        - Stack: Menumpuk beberapa child secara sederhana.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

    - TextFormField untuk Nama: Elemen ini digunakan untuk memasukkan nama. Terdapat validator yang memastikan bahwa nama tidak boleh kosong dan harus berupa kata, bukan angka. Elemen ini penting untuk mengumpulkan informasi nama dari pengguna.

    - TextFormField untuk Amount: Elemen ini digunakan untuk memasukkan jumlah atau 'amount'. Validator di sini memastikan bahwa field tidak kosong dan hanya berisi angka. Ini penting untuk kasus-kasus di mana Anda perlu mengumpulkan informasi numerik seperti jumlah barang atau item.

    - TextFormField untuk Description: Elemen ini digunakan untuk memasukkan deskripsi. Validator memastikan bahwa deskripsi tidak boleh kosong dan harus berupa kata, bukan angka. Ini berguna untuk memberikan rincian tambahan tentang item atau informasi yang diinput.

    - Semua elemen ini penting dalam mengumpulkan data yang diperlukan dari pengguna. Validator yang digunakan memastikan bahwa data yang dimasukkan adalah valid dan sesuai dengan kebutuhan aplikasi. Penggunaan GlobalKey<FormState> memungkinkan untuk mengontrol state form secara keseluruhan, termasuk melakukan validasi data dan reset form setelah data berhasil disimpan.

4.  Bagaimana penerapan clean architecture pada aplikasi Flutter?

- Penerapan clean architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi lapisan-lapisan yang berbeda dengan tanggung jawab yang jelas. Tujuan utama dari pendekatan ini adalah untuk menciptakan kode yang mudah diuji, dipelihara, dan diperluas. Berikut ini adalah cara menerapkan clean architecture dalam Flutter:

1. Lapisan Domain
    - Entities: Objek dasar yang digunakan di seluruh aplikasi. Ini biasanya merepresentasikan model data.
    - Use Cases / Interactors: Mengandung logika bisnis aplikasi. Setiap use case bertanggung jawab untuk tugas spesifik, memisahkan logika bisnis dari UI dan data source.
2. Lapisan Data
    - Repositories: Interface yang mendefinisikan apa yang harus dilakukan oleh lapisan data. Lapisan domain berinteraksi dengan data melalui interface ini.
    - Data Sources: Implementasi konkret dari repositories. Ini bisa termasuk panggilan API, operasi database, dan lainnya.
    - Models: Representasi data yang spesifik untuk lapisan data, seringkali digunakan untuk serialisasi dan deserialisasi data (misalnya, dari/ke JSON).

3. Lapisan Presentation
    - Screens / Pages: Widget yang merepresentasikan halaman pada aplikasi.
    - Widgets: Komponen UI yang lebih kecil yang digunakan dalam screens/pages.
    - Bloc / Cubit (atau State Management lainnya): Mengelola state untuk UI dan menjembatani antara UI dan use cases.
4. Prinsip Umum
    - Dependency Inversion: Lapisan atas tidak harus bergantung pada lapisan bawah, tetapi keduanya bergantung pada abstraksi.

    - Single Responsibility: Setiap kelas harus memiliki satu alasan untuk berubah.

    - Testability: Kode harus ditulis sedemikian rupa sehingga mudah untuk diuji, terutama use cases dan repositories.

5. Integrasi dan Dependensi
    - Dependency Injection: Penggunaan dependency injection untuk mengelola ketergantungan antar lapisan, memudahkan penggantian implementasi dan pengujian.
    - Routing dan Navigasi: Dikelola secara terpusat untuk memudahkan pemahaman alur aplikasi.
6. Implementasi

    - Folder Structure: Memisahkan kode berdasarkan lapisan dan fungsi mereka, misalnya dengan memiliki folder terpisah untuk domain, data, dan presentation.
    - Continuous Refactoring: Terus-menerus memperbarui dan memperbaiki struktur kode untuk menjaga kebersihan dan keterbacaannya.

5. Penjelasan Implementasi

Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
 Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
 Memiliki sebuah tombol Save.
 Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
 Setiap elemen input tidak boleh kosong.
 Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

 ```dart
 import 'package:flutter/material.dart';
import 'package:davin_store/screens/menu.dart';
import 'package:davin_store/widgets/object.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Storage Form',
          ),
        ),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _name = value!;
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Nama tidak boleh kosong!"
                        : (int.tryParse(value) != null)
                            ? "Nama harus berupa kata!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) => setState(() {
                    _amount = int.parse(value!);
                  }),
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Amount tidak boleh kosong!"
                        : (int.tryParse(value) == null)
                            ? "Amount harus berupa angka!"
                            : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    return (value == null || value.isEmpty)
                        ? "Description tidak boleh kosong!"
                        : (int.tryParse(value) != null)
                            ? "Description harus berupa kata!"
                            : null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        listItem.add(Item(_name, _amount, _description));
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Item berhasil tersimpan',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: $_name'),
                                      Text('Amount: $_amount'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyHomePage(),
                                              )),
                                      child: const Text('SIP'))
                                ],
                              );
                            });
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 ```

 Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

 ```dart
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
 ```

 Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

 ```dart
 showDialog(
    context: context,
    builder: (context) {
        return AlertDialog(
        title: const Text(
            'Item berhasil tersimpan',
            style: TextStyle(
            color: Colors.green,
            ),
        ),
        content: SingleChildScrollView(
            child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
                Text('Name: $_name'),
                Text('Amount: $_amount'),
                Text('Description: $_description'),
            ],
            ),
        ),
        actions: [
            TextButton(
                onPressed: () =>
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(),
                        )),
                child: const Text('SIP'))
        ],
        );
    }
);
 ```

 Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
 Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
 Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
 Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

 ```dart
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
 ```

 6. Bonus
// object.dart
 ```dart
 class Item {
  final String name;
  final int amount;
  final String description;


  Item(this.name, this.amount, this.description);
}

var listItem = <Item>[];

// forms.dart
onPressed: () {
    if (_formKey.currentState!.validate()) {
    listItem.add(Item(_name, _amount, _description));
    ...

// list_obj.dart
import 'package:flutter/material.dart';
import 'package:davin_store/widgets/object.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Item",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: listItem.map((Item item) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ItemCard(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Amount: ${item.amount.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.blue),
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("description:", style: TextStyle(color: Colors.white),),
                    Text(item.description, style: const TextStyle(color: Colors.white),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


 ```
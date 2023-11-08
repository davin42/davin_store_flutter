# davin_store

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

run command: `flutter run -d chrome`

---

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

# Muhammad Rafi Darmawan(2206828052) - PBP B

# Essential Ease
"EssentialEase" adalah aplikasi unggulan yang dirancang untuk membuat belanja kebutuhansehari-hari Anda menjadi pengalaman yang lebih mudah, efisien, dan menyenangkan. Aplikasi ini adalah solusi lengkap untuk semua kebutuhan rumah tangga Anda.

EssentialEase adalah sahabat Anda dalam menjalani kehidupan sehari-hari yang sibuk. Dengan kemudahan belanja, pengiriman cepat, dan beragam fitur yang memudahkan, Anda dapat fokus pada hal-hal yang benar-benar penting dalam hidup Anda. Jadi, nikmati hidup tanpa stres dengan EssentialEase!\

![warehouse app](https://github.com/MuhRafliD/essential-ease-mobile/blob/main/assets/essential%20ease%20poster.jpg?raw=true)

# Tugas 7
### Nomor 1
Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
* StatelessWidget: Ini adalah widget yang tidak dapat diubah, artinya propertinya tidak dapat diubah selama masa pakainya.
 Semua nilai harus final dan  widget ini tidak menyimpan status internal apa pun.
 Jenis widget ini cocok untuk bagian antarmuka pengguna yang hanya bergantung pada informasi yang diteruskan ke dalamnya melalui konstruktor dan tidak memerlukan pembaruan dinamis atau interaksi pengguna yang dapat mengubah tampilan.
 Contoh widget stateless  adalah label atau ikon yang tidak berubah setelah ditampilkan.

 * StatefulWidget: Merupakan widget  dinamis dan dapat menangani status yang dapat diubah sepanjang siklus hidupnya.
 Hal ini dilakukan melalui objek State  terpisah yang menyimpan status dan dapat bertahan dalam pembuatan ulang widget.
 Jenis widget ini  berguna untuk antarmuka pengguna yang interaktif, seperti formulir masukan, animasi, atau komponen yang perlu diperbarui berdasarkan peristiwa pengguna atau perubahan pada data yang diterima.
 Contoh widget stateful  adalah slider, checkbox, atau widget  posisi gulir.

### Nomor 2
Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
 * `main.dart`
     - `MaterialApp`: Widget mendefinisikan tema dan navigasi aplikasi.

     - `ThemeData`: Widget mendefinisikan konfigurasi tema global untuk aplikasi.
      
     - `ColorScheme`: Digunakan di dalam ThemeData untuk menentukan skema warna dari tema.
      
     - `AppBarTheme`: Digunakan di dalam ThemeData untuk menentukan tema dari AppBar.
   
* `menu.dart`

     - `Scaffold`: Widget ini menyediakan struktur dasar untuk layar aplikasi Material Design. Di sini, itu digunakan sebagai kerangka kerja dasar untuk halaman utama aplikasi, dengan `appBar` dan `body`.

     - `AppBar`: Sebuah Material Design app bar, yang ditampilkan di bagian atas `Scaffold`. Di sini, itu mengandung judul aplikasi.

     - `Text`: Widget yang menampilkan string teks dengan gaya tertentu. Di kode ini, digunakan di dalam `AppBar` untuk judul dan di dalam `ShopCard` untuk menampilkan nama item.

     - `SingleChildScrollView`: Widget scrollable yang memungkinkan pengguna untuk scroll melalui konten yang mungkin melebihi layar.

     - `Padding`: Widget yang menambahkan padding di sekeliling widget anaknya. Ini digunakan beberapa kali di dalam kode: untuk menambah ruang di sekeliling isi `Column` dan di dalam `ShopCard` untuk ruang di sekeliling ikon dan teks.

     - `Column`: Widget layout yang menampilkan anak-anaknya dalam urutan vertikal. Digunakan untuk menampilkan widget `Text` dan `GridView.count` secara vertikal di dalam `SingleChildScrollView`.

     - `GridView.count`: Widget layout grid yang memungkinkan Anda membuat grid dengan jumlah kolom tetap. Di sini, digunakan untuk menampilkan item-item toko sebagai grid.

     - `Material`: Widget yang mengimplementasikan visual Material Design. Di `ShopCard`, digunakan untuk memberikan efek visual pada item yang akan diklik.

     - `InkWell`: Widget yang menanggapi sentuhan dengan efek semburat tinta. Di sini, digunakan untuk menanggapi taps pada `ShopCard` dan menampilkan `SnackBar`.

     - `Container`: Widget layout yang memungkinkan Anda menyesuaikan anaknya dalam berbagai cara, termasuk ukuran, padding, dan penempatan. Digunakan di dalam `ShopCard` untuk menentukan konten.

     - `Center`: Widget yang memusatkan anaknya dalam dirinya sendiri. Digunakan di `ShopCard` untuk memusatkan ikon dan teks.

     - `Icon`: Widget yang menampilkan ikon dari `IconData` yang diberikan. Di `ShopCard`, digunakan untuk menampilkan ikon yang terkait dengan item toko.

     - `SnackBar`: Widget Material Design yang menampilkan pesan ringkas di bagian bawah layar. Di `ShopCard`, digunakan untuk memberikan umpan balik ketika item diklik.


### Nomor 3
Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
* Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
    1. Melakukan instalasi flutter dan android studio
    2. Membuat project baru dengan nama Essential_ease
* Membuat tiga tombol sederhana dengan ikon dan teks dan memunculkan snackbar
    1. Buat file dart baru dengan nama `menu.dart` pada folder `lib`
    2. Di awal file `menu.dart`, tambahkan `import 'package:flutter/material.dart';` untuk mengimpor paket Material Design yang menyediakan sebagian besar widget           yang digunakan dalam aplikasi Flutter.
    3. Pindahkan kelas `MyHomePage` dari `main.dart` ke file `menu.dart` ini. Kelas ini akan bertanggung jawab untuk tampilan utama aplikasi. Hapus kelas `_MyHomePageState` karena kita akan membuat widget yang tidak memiliki state (stateless).
    ```
      import 'package:flutter/material.dart';
  
      class MyHomePage extends StatelessWidget {
          MyHomePage({Key? key}) : super(key: key);
  
  
          @override
          Widget build(BuildContext context) {
              ...
              return Scaffold(
              ...
          ...
    ```
    4. Buat kelas `ShopItem` dan `ShopCard` untuk membuat tombol dan snackbar
    ```
    class ShopItem {
      final String name;
      final IconData icon;
      final Color color;
    
      ShopItem(this.name, this.icon, this.color);
    }
    
    class ShopCard extends StatelessWidget {
      final ShopItem item;
    
      const ShopCard(this.item, {super.key}); // Constructor
    
      @override
      Widget build(BuildContext context) {
        return Material(
          color: item.color,
          child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
              // Memunculkan SnackBar ketika diklik
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
              // Container untuk menyimpan Icon dan Text
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```
    5. Modifikasi `MyHomePage` untuk menampilkan tiga tombol yang dibutuhkan
    ```
          class MyHomePage extends StatelessWidget {
      MyHomePage({Key? key}) : super(key: key);
      final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Color.fromARGB(255, 71, 255, 68)),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Color.fromARGB(255, 71, 255, 68)),
        ShopItem("Logout", Icons.logout, Color.fromARGB(255, 255, 68, 68)),
      ];
    
      @override
      Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Essential Ease',
            ),
          ),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'PBP Shop', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                      // Iterasi untuk setiap item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    ```

### Bonus
Saya telah menambahkan warna untuk setiap tombol dengan kode berikut
1. Menambahkan atribut
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```
2. Menambahkan warna di class MyHomePage
```
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Color.fromARGB(255, 71, 255, 68)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Color.fromARGB(255, 71, 255, 68)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 255, 68, 68)),
  ];
```
3. Memodifikasi class ShopCard
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      ...
```

# Tugas 8
### Nomor 1
Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push() dan Navigator.pushReplacement() merupakan dua metode yang digunakan dalam Flutter untuk melakukan navigasi antara halaman atau layar aplikasi.
Navigator.push() digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol kembali pada perangkat mereka. Contohnya, ketika pengguna menekan tombol untuk membuka halaman detail dari suatu item dalam daftar, maka halaman detail akan ditambahkan ke dalam tumpukan navigasi.
Di sisi lain, Navigator.pushReplacement() digunakan untuk mengganti halaman saat ini dengan halaman baru. Dalam hal ini, ketika pengguna menekan tombol kembali pada perangkat mereka, mereka akan langsung kembali ke halaman sebelumnya sebelum halaman saat ini. Contohnya, ketika pengguna menyelesaikan suatu tugas pada halaman saat ini dan ingin kembali ke halaman sebelumnya, maka halaman saat ini akan diganti dengan halaman baru yang menampilkan pesan sukses atau ringkasan dari tugas yang telah selesai.

### Nomor 2
Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Layout widget pada Flutter adalah widget yang digunakan untuk mengatur tata letak atau susunan dari widget-widget lainnya. Berikut adalah beberapa layout widget pada Flutter beserta konteks penggunaannya:

* Container: Widget ini digunakan untuk membuat kotak yang dapat diatur ukurannya, warnanya, dan dekorasinya. Container juga dapat digunakan untuk mengatur jarak antar widget dengan menggunakan properti padding dan margin.

* Row dan Column: Widget ini digunakan untuk mengatur tata letak secara horizontal (Row) atau vertikal (Column). Widget-widget yang ditempatkan di dalam Row atau Column akan diatur secara berurutan dari kiri ke kanan (Row) atau dari atas ke bawah (Column).

* Stack: Widget ini digunakan untuk menumpuk widget-widget di atas satu sama lain. Widget-widget yang ditempatkan di dalam Stack akan ditumpuk sesuai dengan urutan penempatannya.

* Expanded: Widget ini digunakan untuk mengisi ruang kosong yang tersisa pada Row atau Column. Widget yang ditempatkan di dalam Expanded akan diberikan ukuran yang tersisa setelah widget lainnya sudah diberikan ukuran.

* ListView: Widget ini digunakan untuk menampilkan daftar widget secara berurutan. ListView dapat digunakan untuk menampilkan daftar yang panjang atau tidak terbatas.

* GridView: Widget ini digunakan untuk menampilkan daftar widget dalam bentuk grid. GridView dapat digunakan untuk menampilkan daftar yang berisi banyak item dengan ukuran yang sama.

* Wrap: Widget ini digunakan untuk menampilkan daftar widget dalam bentuk baris yang dapat melintasi beberapa baris. Widget-widget yang ditempatkan di dalam Wrap akan diatur secara berurutan dari kiri ke kanan dan dari atas ke bawah.

* SizedBox: Widget ini digunakan untuk membuat kotak kosong dengan ukuran tertentu. SizedBox dapat digunakan untuk memberikan jarak antar widget atau untuk membuat widget dengan ukuran yang spesifik.

Setiap layout widget memiliki kegunaannya masing-masing dan dapat digunakan sesuai dengan kebutuhan dalam membuat tata letak pada aplikasi Flutter.



### Nomor 3
Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Terdapat 3 elemen input yaitu `name` item untuk menyimpan nama item, `amount` untuk menyimpan jumlah item, dan `description` untuk menyimpan deskripsi item. Ketiga elemen input ini digunakan untuk mengisi data item yang akan ditambahkan ke dalam database.


### Nomor 4
Bagaimana penerapan clean architecture pada aplikasi Flutter?

Clean Architecture merupakan metodologi dalam pengembangan perangkat lunak yang memfokuskan pada pemisahan kode menjadi berbagai lapisan dengan maksud untuk mempermudah pemahaman, pengujian, dan modifikasi kode. Dalam aplikasi Flutter, Clean Architecture bisa diimplementasikan dengan mematuhi prinsip-prinsip berikut:

* Pembagian kode menjadi lapisan-lapisan distinktif, yang mencakup:

* Lapisan Presentasi: Menangani aspek-aspek yang berhubungan dengan UI, termasuk widget dan manajemen state.

* Lapisan Domain: Mencakup logika bisnis aplikasi, seperti use cases dan entitas.

* Lapisan Data: Bertanggung jawab atas operasi data, termasuk repository dan sumber data.

* Penggunaan Injeksi Ketergantungan (Dependency Injection) untuk mendekatkan lapisan-lapisan ini. Teknik ini memasukkan objek yang diperlukan oleh suatu kelas melalui konstruktor atau metode lain, menghindari pembuatan objek secara langsung di dalam kelas.

* Implementasi Interface untuk membedakan antara definisi dan implementasi. Interface memastikan bahwa terdapat 'kontrak' yang menentukan bagaimana kelas-kelas berperilaku, memudahkan dalam pengujian dan pemodifikasian kode tanpa mengubah implementasi.

* Penerapan Unit Testing untuk memverifikasi fungsionalitas setiap lapisan secara independen. Teknik ini memungkinkan pemeriksaan terpisah dan terfokus pada setiap bagian kode untuk menjamin kinerja yang tepat.

Dalam konteks Flutter, pengembangan bisa didukung dengan berbagai pustaka seperti Provider untuk manajemen state, Dio untuk permintaan HTTP, dan Hive untuk penyimpanan lokal. Penggunaan pustaka-pustaka ini membantu dalam menerapkan Clean Architecture, memudahkan pemisahan kode sesuai dengan lapisan yang diinginkan.

### Nomor 5
Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

* Memakai minimal tiga elemen input, yaitu name, amount, description.Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
* Memiliki sebuah tombol Save.
* Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:  
* Setiap elemen input tidak boleh kosong.
* Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
* Step by step:
  * Buat direktori baru dengan nama screens dan buat file dart baru bernama `shoplist_form.dart` di dalamnya.
  * buatlah stateful widget bernama ShopFormPage
  * membuat form dengan global key dengan menambahkan final _formKey = GlobalKey(); serta elemen input yang dibutuhkan, yaitu name, amount, dan description.
  * buatlah form dalam body scaffold dan tambahkan validasi untuk semua elemen input. lalu tambahkan tombol save yang akan menampilkan dialog ketika berhasil disimpan.

```
import 'package:flutter/material.dart';
import 'package:essential_ease/widgets/left_drawer.dart';
import 'package:essential_ease/widgets/globals.dart' as globals;
import 'package:essential_ease/screens/data_item.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class Item {
  late String name;
  late int amount;
  late String description;

  Item(
      {required this.name, required this.amount, required this.description});
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  onPressed(BuildContext context) {
    var data =
      Item(name: _name, amount: _amount, description: _description);
    globals.semuaItem.add(data);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DataItemPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 81, 186),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nama Item",
                      labelText: "Nama Item",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Jumlah",
                      labelText: "Jumlah",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Harga harus berupa angka!";
                      }
                      return null;
                    },
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
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
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
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
                    MaterialStateProperty.all(Color.fromARGB(255, 0, 81, 186)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: $_name'),
                                  Text('Jumlah: $_amount'),
                                  Text('Deskripsi: $_description'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  onPressed(context);
                                },
                              ),
                            ],
                          );
                        },
                      );

                    }
                    _formKey.currentState!.reset();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ]),
      ),
    )
    );
  }
}
```

* Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

  * Caranya :Pada bagian onTap pada ShopCard, manfaatkan fungsi dari widget navigator yaitu Navigator.push() untuk menambahkan halaman baru ke dalam tumpukan navigasi.

* Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:

  * Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
  * Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
  * Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
  * Caranya: dalam direktori widgets tambahkan file dart baru dengan nama left_drawer.dart. buatlah drawer header. Lalu buatlah widget ListTile untuk menyimpan menu-menu yang akan ditampilkan pada drawer. Jangan lupa gunakan widget navigator untuk mengarahkan pengguna ke halaman yang diinginkan.

```
import 'package:flutter/material.dart';
import 'package:essential_ease/screens/menu.dart';
import 'package:essential_ease/screens/shoplist_form.dart';
import 'package:essential_ease/screens/data_item.dart';



class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 218, 26),
            ),
            child: Column(
              children: [
                Text(
                  'Essential Ease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 81, 186),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Get your Essential here!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 0, 81, 186),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Lihat Itemku'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataItemPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```

### BONUS
* buatlah class i pada shoplist_form.dart untuk menginisiasi objek Item saat menekan tombol save (apabila valid).

* buat globals.dart untuk menyimpan semua variabel global, dalam konteks ini untuk menyimpan list Item yang telah dibuat.

* buat tampilan baru yaitu data_Item.dart untuk menampilkan list Item yang telah dibuat. jangan lupa buat ListTile baru di dalam drawer dan lakukan routing untuk menuju page data_Item.dart


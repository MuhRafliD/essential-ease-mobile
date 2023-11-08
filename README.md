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



# Pixel Quest

Nama: Jehian

NIM: H1D022006

Shift Baru: D

jadi pixel quest itu seperti mini game. konsepnya rpg gitu, ada login, home, inventory, sama quest. tampilannya ala2 pixel art.

## fitur

1. **login** (lib/screens/login_screen.dart)
   - ada animasi text pake `AnimatedTextKit`
   - kalo login gagal, kotak loginnya goyang2

2. **home** (lib/screens/home_screen.dart)
   - ada ucapan selamat datang
   - background pake `RiveAnimation` biar gerak2

3. **inventory** (lib/screens/inventory_screen.dart)
   - list barang yang dipunya
   - pake layout grid, ada icon sama namanya

4. **quest** (lib/screens/quest_screen.dart)
   - disini bisa liat quest yang lagi dijalanin
   - ada progress bar sama tombol buat nyelesein quest
   - text quest-nya pake animasi juga

5. **side menu** (lib/widgets/side_menu.dart)
   - buat pindah-pindah halaman gampang
   - ada tombol logout juga

## bahan

- `flutter`: base nya
- `animated_text_kit`: buat bikin text yang gerak2
- `rive`: buat nambahin asset animasi, dipake di home screen
- `shared_preferences`: nyimpen data login gitu

## cara jalanin

1. pastiin udah install flutter
2. clone repo ini
3. jalanin `flutter pub get` buat install yang dibutuhin
4. terus tinggal `flutter run`

## demo
![](demo.gif)
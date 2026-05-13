# Flutter Learning Hub — Project Fungsi Sederhana

<img width="408" height="1600" alt="Image" src="https://github.com/user-attachments/assets/ab1f8927-3f53-4afd-9683-5acb821212b3" />

Aplikasi Flutter interaktif yang mendemonstrasikan 3 fungsi dasar Dart melalui antarmuka berbasis widget.

## Daftar Topik

| # | Topik | Fungsi | File |
|---|-------|--------|------|
| A | Menyapa (Greeting) | `greet(String name)` | `lib/functions/greeting.dart` |
| B | Kalkulator Luas Persegi | `calculateArea(double side)` | `lib/functions/square_area.dart` |
| C | Kalkulator Diskon | `finalPrice(double price, double discountPercent)` | `lib/functions/discount.dart` |

## Struktur Project

```
lib/
├── main.dart
├── functions/
│   ├── greeting.dart
│   ├── square_area.dart
│   └── discount.dart
├── pages/
│   └── home_page.dart
├── sections/
│   ├── greeting_section.dart
│   ├── square_area_section.dart
│   └── discount_section.dart
├── widgets/
│   ├── code_block.dart
│   └── result_box.dart
└── theme/
    └── app_theme.dart
```

## Penjelasan Teknis

### A. Fungsi Menyapa

```dart
String greet(String name) {
  return 'Hello, $name!';
}
```

- **Parameter**: `name` (String) — nama pengguna.
- **Return**: String sapaan `"Hello, [nama]!"`.
- **Konsep**: String interpolation dan return value.

### B. Kalkulator Luas Persegi

```dart
double calculateArea(double side) {
  return side * side;
}
```

- **Parameter**: `side` (double) — panjang sisi.
- **Return**: Luas persegi (sisi x sisi).
- **Konsep**: Parameter numerik dan operasi aritmatika.

### C. Kalkulator Diskon

```dart
double finalPrice(double price, double discountPercent) {
  return price * (1 - discountPercent / 100);
}
```

- **Parameter**: `price` (harga awal), `discountPercent` (persentase diskon).
- **Return**: Harga akhir setelah diskon.
- **Konsep**: Multiple parameter dan formula matematika.

## Arsitektur

Project ini menerapkan pemisahan antara **logic** dan **UI**:

- `functions/` — Fungsi Dart murni (pure functions), tanpa dependency Flutter.
- `sections/` — Widget StatefulWidget yang menghubungkan input dengan fungsi.
- `widgets/` — Komponen UI reusable (CodeBlock, ResultBox).

## Cara Menjalankan

```bash
cd project-sederhana
flutter pub get
flutter run
```

## Dependencies

| Package | Kegunaan |
|---------|----------|
| `google_fonts` | Font Inter dan JetBrains Mono |

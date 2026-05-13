# 🎓 Flutter Learning Hub — Project Fungsi Sederhana

Aplikasi Flutter interaktif yang mendemonstrasikan **3 fungsi dasar Dart** melalui antarmuka berbasis widget. Project ini dirancang sebagai media pembelajaran untuk memahami cara membuat dan menggunakan **fungsi (functions)** dalam bahasa pemrograman Dart.

---

## 📋 Daftar Topik

| # | Topik | Fungsi | File |
|---|-------|--------|------|
| A | **Menyapa (Greeting)** | `greet(String name)` | `lib/functions/greeting.dart` |
| B | **Kalkulator Luas Persegi** | `calculateArea(double side)` | `lib/functions/square_area.dart` |
| C | **Kalkulator Diskon** | `finalPrice(double price, double discountPercent)` | `lib/functions/discount.dart` |

---

## 🏗️ Struktur Project

```
project-sederhana/
├── lib/
│   ├── main.dart                          # Entry point aplikasi
│   ├── functions/                         # Fungsi-fungsi Dart murni (logic)
│   │   ├── greeting.dart                  # Fungsi menyapa
│   │   ├── square_area.dart               # Fungsi luas persegi
│   │   └── discount.dart                  # Fungsi kalkulator diskon
│   ├── pages/                             # Halaman utama
│   │   └── home_page.dart                 # HomePage dengan 3 section
│   ├── sections/                          # Widget section untuk setiap topik
│   │   ├── greeting_section.dart          # UI section Greeting
│   │   ├── square_area_section.dart       # UI section Square Area
│   │   └── discount_section.dart          # UI section Discount
│   ├── widgets/                           # Widget reusable
│   │   ├── code_block.dart                # Widget blok kode (syntax highlight)
│   │   └── result_box.dart                # Widget kotak hasil
│   └── theme/                             # Konfigurasi tema
│       └── app_theme.dart                 # Warna & tema Material 3
├── pubspec.yaml
└── README.md
```

---

## 🔧 Penjelasan Teknis

### A. Fungsi Menyapa (`greeting.dart`)

```dart
String greet(String name) {
  return 'Hello, $name!';
}
```

- **Parameter**: `name` (String) — nama pengguna yang akan disapa.
- **Return**: String berisi pesan sapaan `"Hello, [nama]!"`.
- **Konsep**: Demonstrasi fungsi dengan **1 parameter String** dan **return value bertipe String**. Menggunakan *string interpolation* (`$name`).

### B. Kalkulator Luas Persegi (`square_area.dart`)

```dart
double calculateArea(double side) {
  return side * side;
}
```

- **Parameter**: `side` (double) — panjang sisi persegi.
- **Return**: double berisi hasil luas persegi (sisi × sisi).
- **Konsep**: Demonstrasi fungsi dengan **1 parameter numerik** dan **operasi aritmatika** sederhana.

### C. Kalkulator Diskon (`discount.dart`)

```dart
double finalPrice(double price, double discountPercent) {
  return price * (1 - discountPercent / 100);
}
```

- **Parameter**:
  - `price` (double) — harga awal produk.
  - `discountPercent` (double) — persentase diskon (0–100).
- **Return**: double berisi harga akhir setelah dipotong diskon.
- **Konsep**: Demonstrasi fungsi dengan **2 parameter** dan **formula matematika**. Rumus: `harga_akhir = harga × (1 - diskon/100)`.

---

## 🎨 Arsitektur & Desain UI

### Pemisahan Logic dan UI

Project ini menerapkan prinsip **separation of concerns**:

- **`lib/functions/`** — Berisi fungsi Dart murni (*pure functions*) tanpa dependency ke Flutter. Fungsi-fungsi ini bisa di-*test* secara independen.
- **`lib/sections/`** — Berisi widget `StatefulWidget` yang menghubungkan input pengguna dengan fungsi di atas, kemudian menampilkan hasilnya.
- **`lib/widgets/`** — Komponen UI yang dapat digunakan ulang (*reusable*) di seluruh section.

### Komponen UI

| Widget | Deskripsi |
|--------|-----------|
| `CodeBlock` | Menampilkan source code Dart dengan syntax highlighting (warna berbeda untuk keyword, tipe data, nama fungsi, dan string) |
| `ResultBox` | Kotak hasil dengan border dashed yang menampilkan output fungsi |
| `HomePage` | Halaman utama yang menyusun ketiga section secara vertikal dengan scroll |
| Bottom Navigation | Navigasi bawah yang men-scroll ke section yang dipilih |

### Tema & Warna

Menggunakan **Material 3 Design System** dengan custom color scheme:

- **Primary (Biru Gelap)**: `#003F74` — Digunakan untuk section Greeting
- **Tertiary (Teal)**: `#004457` — Digunakan untuk section Square Area
- **Secondary (Biru)**: `#0061A3` — Digunakan untuk section Discount

### Font

- **Inter** — Font utama UI (Google Fonts)
- **JetBrains Mono** — Font monospace untuk blok kode

---

## 🚀 Cara Menjalankan

### Prasyarat

- Flutter SDK (versi 3.x atau lebih baru)
- Dart SDK
- Android Studio / VS Code dengan Flutter extension

### Langkah-langkah

```bash
cd project-sederhana

flutter pub get

flutter run
```

### Platform yang Didukung

- ✅ Android
- ✅ iOS
- ✅ Web

---

## 📦 Dependencies

| Package | Versi | Kegunaan |
|---------|-------|----------|
| `flutter` | SDK | Framework UI |
| `google_fonts` | ^8.1.0 | Font Inter & JetBrains Mono |

---

## 📝 Catatan

- Semua fungsi Dart ditulis sebagai **pure functions** (tidak memiliki side effects) sehingga mudah di-*test* dan di-*reuse*.
- Setiap section menampilkan **code snippet** dari fungsi yang digunakan, sehingga pengguna bisa langsung melihat implementasi kode.
- Bottom navigation bar digunakan untuk navigasi cepat antar section dengan animasi scroll yang halus.

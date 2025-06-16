# Riseon

<p align="center">
  <img src="./riseon-logo.png" width="150" />
</p>


Riseon adalah aplikasi investasi cerdas berbasis teknologi yang memungkinkan kamu mengelola berbagai jenis aset—mulai dari efek, komoditas, crypto, hingga forex—semua dalam satu platform. Dirancang untuk generasi investor modern, Riseon hadir dengan antarmuka yang intuitif, analitik yang kuat, serta fitur Shariah Mode untuk kamu yang ingin berinvestasi secara halal dan sesuai prinsip syariah Islam.

Riseon is a smart, technology-driven investment app that empowers you to manage multiple asset classes—including stocks/securities, commodities, crypto, and forex—all in one seamless platform.
Designed for the modern investor, Riseon offers an intuitive interface, powerful analytics, and a dedicated Shariah Mode for those who seek to invest in line with Islamic principles.

## Clean Architecture Pattern

```bash
lib/
├── main.dart
├── config/               # Konfigurasi umum (router, env, dll)
├── core/                 # Constants, theme, helpers, extensions
│   ├── constants/
│   ├── theme/
│   └── utils/
├── data/                 # Sumber data mentah (API, model, local storage)
│   ├── models/           # Data model (UserModel, InvestmentModel, dsb)
│   ├── services/         # Koneksi API, Firebase, Storage
│   └── repositories/     # Abstraksi untuk ambil data (pakai interface jika perlu)
├── domain/               # Logic aplikasi murni (opsional, jika mau DDD)
│   ├── entities/         # Class tanpa dependency luar
│   ├── usecases/         # Fungsi-fungsi utama 
│   └── repositories/     # Interface untuk repositori
├── presentation/         # Semua terkait tampilan UI
│   ├── screens/          # Halaman-halaman (home, login, detail, dsb)
│   │   ├── home/
│   │   ├── login/
│   │   └── portfolio/
│   ├── widgets/          # Widget reusable seperti card, button, dsb
│   └── providers/        # State management (Provider / Riverpod / Bloc)
│   └── layouts/          # Struktur kerangka
└── routes/               # Routing (pakai auto_route atau manual)
```

## Wireframe Sementara
<a href="https://whimsical.com/riseon-QDe6tVTpxBQP1p6D9xFt3s" target="_blank">Cek Disini</a>

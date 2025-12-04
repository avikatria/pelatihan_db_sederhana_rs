# Final Project Database Management — Pelatihan TSA Digitalent

## 📌 Deskripsi Proyek
Proyek ini merupakan tugas akhir (Final Project) yang dikerjakan secara berkelompok dalam program pelatihan **Talent Scouting Academy (TSA) Digitalent**.

Fokus tugas ini adalah merancang dan mengimplementasikan sistem database sederhana berbasis studi kasus rumah sakit, mencakup desain ERD, pembuatan tabel, constraints, sequence, view, indexing, dan pengujian relasi data.

---

## 🏥 Studi Kasus Sistem Rumah Sakit

Database dibangun menggunakan beberapa entitas utama:

- **Pasien**
- **Dokter**
- **Ruang inap**
- **Dirawat**
- **Merawat**

Relasi antar tabel mencerminkan proses perawatan pasien di rumah sakit, mulai dari pendaftaran hingga dirawat oleh dokter dan ditempatkan pada ruang rawat inap.

---

## 📌 Cakupan Pengerjaan

Proyek ini mencakup:

✔ Mendesain ERD  
✔ Membuat tabel dari ERD  
✔ Menambahkan constraint dan foreign key  
✔ Membuat sequence (auto numbering)  
✔ Menambahkan data sample ke database  
✔ Membuat view database  
✔ Membuat index untuk optimasi pencarian  
✔ Membuat synonym  
✔ Melakukan uji query (testing relasi data)  
✔ Menyusun dokumentasi akhir dan presentasi kelompok

---

## 🛠️ Teknologi yang Digunakan

✔ **Oracle SQL Developer Data Modeler**  
→ untuk mendesain ERD, relasi tabel, dan proses modeling database

✔ **Oracle APEX**  
→ untuk eksekusi DDL, DML, testing data, pembuatan view, indexing, dan pengujian relasi


---

## 📑 Struktur Tabel (Ringkas)

1. **dokter** — menyimpan data dokter  
2. **pasien** — menyimpan data pasien  
3. **ruanginap** — menyimpan data kamar rawat inap  
4. **dirawat** — menangani hubungan pasien dengan ruang rawat  
5. **merawat** — menangani hubungan pasien dengan dokter

Seluruh tabel dilengkapi PRIMARY KEY dan FOREIGN KEY untuk menjaga integritas data.



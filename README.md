---
title: Sistem Perpustakaan
---
```mermaid
erDiagram
    peminjam ||--o{ buku : Meminjam
    buku }o--|| rak_buku : Menyimpan
    kategori ||--o{ buku : Memiliki
    petugas ||--o{ buku : Mengelola

    buku{
        int id_buku pk
        string judul_buku
        string penulis
        string penerbit
        int id_kategori fk
        int id_rak fk
        int id_peminjam fk
        int id_petugas fk
        datetime tgl_pinjam
        datetime tgl_pengembalian
    }
    kategori{
        int id_kategori pk
        string nama_kategori
    }
    peminjam{
        int id_peminjam pk
        string nama
        string alamat
        int id_buku fk
    }
    petugas{
        int id_petugas pk
        string nama
    }
    rak_buku{
        int id_rak pk
        string lokasi_rak
    }
    
---
title: Sistem Perpustakaan
---
```mermaid
erDiagram
    peminjam ||--o{ peminjaman : Meminjam
    buku }o--|| rak_buku : Menyimpan
    kategori ||--o{ buku : Memiliki
    petugas ||--o{ peminjaman : Mengelola
    penerbit ||--o{ buku : Memiliki
    penulis ||--o{ buku : Memiliki
    peminjaman ||--o| buku : memiliki

    buku{
        int id pk
        string judul_buku
        int id_penulis fk
        int id_penerbit fk
        int id_kategori fk
        int id_rak fk
    }
    penerbit{
        int id pk
        string nama_penerbit 
    }
    penulis{
        int id pk
        string firstname
        string lastname
    }
    kategori{
        int id pk
        string nama_kategori
    }
    peminjam{
        int id pk
        string nama
        string alamat
    }
    petugas{
        int id pk
        string nama
    }
    rak_buku{
        int id pk
        string nama_rak
    }
    peminjaman{
        int id pk
        int id_buku fk
        int id_peminjam fk
        int id_petugas fk
        datetime tgl_pinjam
        datetime tgl_pengembalian
    }
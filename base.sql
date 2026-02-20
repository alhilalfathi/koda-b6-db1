CREATE TABLE "kategori"(
    "id" SERIAL PRIMARY KEY,
    "nama_kategori" VARCHAR(255) NOT NULL
);
CREATE TABLE "peminjam"(
    "id" SERIAL PRIMARY KEY,
    "nama" VARCHAR(255) NOT NULL,
    "alamat" TEXT NOT NULL,
    "id_buku" INTEGER 
);
CREATE TABLE "petugas"(
    "id" SERIAL PRIMARY KEY,
    "nama_petugas" VARCHAR(255) NOT NULL
);
CREATE TABLE "buku"(
    "id" SERIAL PRIMARY KEY,
    "judul" VARCHAR(255) NOT NULL,
    "penulis" VARCHAR(255) NOT NULL,
    "penerbit" VARCHAR(255) NOT NULL,
    "tanggal_pinjam" DATE NOT NULL,
    "tanggal_pengembalian" DATE NOT NULL,
    "id_kategori" INTEGER REFERENCES "kategori"("id"),
    "id_rak" INTEGER REFERENCES "rak_buku"("id"),
    "id_peminjam" INTEGER REFERENCES "peminjam"("id"),
    "id_petugas" INTEGER REFERENCES "petugas"("id")
);
CREATE TABLE "rak_buku"(
    "id" SERIAL PRIMARY KEY,
    "nama_rak" VARCHAR(255)
);

SELECT "id", "nama_kategori" FROM "kategori";
INSERT INTO "kategori" ("nama_kategori") 
VALUES 
    ('Romance'),
    ('Inspiratif'),
    ('Komik'),
    ('Biografi'),
    ('Ensiklopedia'),
    ('Sains Fiksi'),
    ('Agama'),
    ('Sejarah'),
    ('Thriller'),
    ('Fantasy');

SELECT "id", "judul", "penulis", "penerbit", "tanggal_pinjam", "tanggal_pengembalian", 
"id_kategori", "id_rak", "id_peminjam", "id_petugas" FROM "buku";
INSERT INTO "buku" ("judul_buku","penulis","penerbit","tanggal_pinjam","tanggal_pengembalian","id_kategori","id_rak","id_peminjam","id_petugas");
VALUES 
    ('Home Sweet Loan','Almira Bastari','Gramedia','2026-02-19','2026-03-19',2,1,2,10),
    ('Winter in Tokyo','Ilana Tan','Gramedia','2026-01-20','2026-02-20',1,2,1,9),
    ('Hujan','Tere Liye','Gramedia','2026-02-06','2026-03-06',9,3,3,7),
    ('Shaman King','Hiroyuki Takei','m&c!','2026-02-16','2026-03-16',3,4,10,8),
    ('Doraemon','Fujiko F. Fujio','Gramedia','2026-01-10','2026-02-10',3,5,9,6),
    ('Tan Malaka','Taufik Adi Susilo','Garasi','2026-02-16','2026-03-16',4,6,7,3),
    ('Sapiens','Yuval Noah Harari','KPG','2026-02-03','2026-03-03',8,7,4,2),
    ('Harry Potter','J.K> Rowling','Bloomsburry','2026-02-04','2026-03-04',10,8,5,4),
    ('Seperti Dendam','Eka Kurniawan','Gramedia','2026-01-23','2026-02-23',9,9,5,1),
    ('The Prince of Mist','Carlos Ruiz Zafon','Editorial Planeta','2026-01-13','2026-02-13',9,10,8,5);

SELECT "id", "nama", "alamat", "id_buku" FROM "peminjam";
INSERT INTO "peminjam" ("nama", "alamat","id_buku") 
VALUES 
    ('Adit', 'Temanggung',2),
    ('Arif', 'Depok',1),
    ('Vincent', 'Bandung',3),
    ('Reza', 'Bandung',7),
    ('Anton', 'Tuban',8),
    ('Wildan', 'Tasikmalaya',9),
    ('Aska', 'Bekasi',6),
    ('Ghifar', 'Karawang',10),
    ('Jaka', 'Bogor',5),
    ('Hilmy', 'Jakarta',4);

SELECT "id", "nama_petugas" FROM "petugas";
INSERT INTO "petugas" ("nama_petugas") 
VALUES 
    ('Andi'),
    ('Siti'),
    ('Rizky'),
    ('Dewi'),
    ('Fauzan'),
    ('Budi'),
    ('Rina'),
    ('Fajar'),
    ('Intan'),
    ('Putri');

SELECT "id", "nama_rak" FROM "rak_buku";
INSERT INTO "rak_buku" ("nama_rak") 
VALUES 
    ('A1'),
    ('A2'),
    ('A3'),
    ('B1'),
    ('B2'),
    ('B3'),
    ('C1'),
    ('C2'),
    ('C3'),
    ('D1');



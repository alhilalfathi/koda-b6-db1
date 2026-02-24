CREATE TABLE "kategori"(
    "id" SERIAL PRIMARY KEY,
    "nama_kategori" VARCHAR(255) NOT NULL
);
CREATE TABLE "rak_buku"(
    "id" SERIAL PRIMARY KEY,
    "nama_rak" VARCHAR(255)
);
CREATE TABLE "peminjam"(
    "id" SERIAL PRIMARY KEY,
    "nama" VARCHAR(255) NOT NULL,
    "alamat" TEXT NOT NULL
);
CREATE TABLE "petugas"(
    "id" SERIAL PRIMARY KEY,
    "nama_petugas" VARCHAR(255) NOT NULL
);
CREATE TABLE "penerbit"(
    "id" SERIAL PRIMARY KEY,
    "nama_penerbit" VARCHAR(80) NOT NULL
);
CREATE TABLE "penulis"(
    "id" SERIAL PRIMARY KEY,
    "firstname" VARCHAR(255) NOT NULL,
    "lastname" VARCHAR(255) NOT NULL
);
CREATE TABLE "buku"(
    "id" SERIAL PRIMARY KEY,
    "judul" VARCHAR(255) NOT NULL,
    "id_penulis" INT NOT NULL,
    "id_penerbit" INT NOT NULL,
    "id_kategori" INT NOT NULL,
    "id_rak" INT NOT NULL,
    CONSTRAINT fk_penulis
        FOREIGN KEY ("id_penulis")
        REFERENCES "penulis"("id")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_penerbit
        FOREIGN KEY ("id_penerbit")
        REFERENCES "penerbit"("id")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_kategori
        FOREIGN KEY ("id_kategori")
        REFERENCES "kategori"("id")
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_rak
        FOREIGN KEY ("id_rak")
        REFERENCES "rak_buku"("id")
        ON UPDATE CASCADE ON DELETE RESTRICT

);
CREATE TABLE "peminjaman"(
    "id" SERIAL PRIMARY KEY,
    "tanggal_pinjam" DATE NOT NULL,
    "tanggal_pengembalian" DATE NOT NULL,
    "id_buku" INT NOT NULL,
    "id_peminjam" INT NOT NULL,
    "id_petugas" INT NOT NULL,

    CONSTRAINT fk_buku
        FOREIGN KEY ("id_buku")
        REFERENCES "buku"("id"),

    CONSTRAINT fk_peminjam
        FOREIGN KEY ("id_peminjam")
        REFERENCES "peminjam"("id"),

    CONSTRAINT fk_petugas
        FOREIGN KEY ("id_petugas")
        REFERENCES "petugas"("id")
);

SELECT 
    "id", 
    "nama_kategori" 
FROM "kategori";
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

SELECT 
    "id", 
    "nama_rak" 
FROM "rak_buku";
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

SELECT
    "id",
    "firstname",
    "lastname"
FROM "penulis";
INSERT INTO "penulis" ("firstname","lastname")
VALUES 
    ('Almira', 'Bastari'),
    ('Ilana', 'Tan'),
    ('Tere', 'Liye'),
    ('Hiroyuki', 'Takei'),
    ('Fujiko', 'F. Fujio'),
    ('Taufik', 'Adi Susilo'),
    ('Yuval', 'Noah Harari'),
    ('J.K', 'Rowling'),
    ('Eka', 'Kurniawan'),
    ('Carlos', 'Ruiz Zafon');

SELECT
    "id",
    "nama_penerbit"
FROM "penerbit";
INSERT INTO "penerbit" ("nama_penerbit")
VALUES
    ('Gramedia'),
    ('m&c!'),
    ('Garasi'),
    ('KPG'),
    ('Bloomsburry'),
    ('Editorial Planeta'),
    ('Mizan Publishing'),
    ('Bentang Pustaka'),
    ('Haru Publisher'),
    ('Mediakita');

SELECT 
    "id", 
    "judul", 
    "id_penulis", 
    "id_penerbit", 
    "id_kategori", 
    "id_rak" 
FROM "buku";
INSERT INTO "buku" ("judul","id_penulis","id_penerbit","id_kategori","id_rak")
VALUES 
    ('Home Sweet Loan',1,1,2,1),
    ('Winter in Tokyo',2,1,1,2),
    ('Hujan',3,1,9,3),
    ('Shaman King',4,2,3,4),
    ('Doraemon',5,1,3,5),
    ('Tan Malaka',6,3,4,6),
    ('Sapiens',7,4,8,7),
    ('Harry Potter',8,5,10,8),
    ('Seperti Dendam',9,1,9,9),
    ('The Prince of Mist',10,6,9,10);

SELECT 
    "id", 
    "nama", 
    "alamat" 
FROM "peminjam";
INSERT INTO "peminjam" ("nama", "alamat") 
VALUES 
    ('Adit', 'Temanggung'),
    ('Arif', 'Depok'),
    ('Vincent', 'Bandung'),
    ('Reza', 'Bandung'),
    ('Anton', 'Tuban'),
    ('Wildan', 'Tasikmalaya'),
    ('Aska', 'Bekasi'),
    ('Ghifar', 'Karawang'),
    ('Jaka', 'Bogor'),
    ('Hilmy', 'Jakarta');

SELECT 
    "id", 
    "nama_petugas" 
FROM "petugas";
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

SELECT
    "id",
    "id_buku",
    "id_peminjam",
    "id_petugas",
    "tanggal_pinjam",
    "tanggal_pengembalian"
FROM "peminjaman";
INSERT INTO "peminjaman" ("id_buku","id_peminjam","id_petugas","tanggal_pinjam","tanggal_pengembalian")
VALUES
    (1,2,10,'2026-02-19','2026-03-19'),
    (2,1,9,'2026-01-20','2026-02-20'),
    (3,3,7,'2026-02-06','2026-03-06'),
    (4,10,8,'2026-02-16','2026-03-16'),
    (5,9,6,'2026-01-10','2026-02-10'),
    (6,7,3,'2026-02-16','2026-03-16'),
    (7,4,2,'2026-02-03','2026-03-03'),
    (8,5,4,'2026-02-04','2026-03-04'),
    (9,6,1,'2026-01-23','2026-02-23'),
    (10,8,5,'2026-01-13','2026-02-13');

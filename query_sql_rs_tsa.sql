CREATE TABLE dirawat (
    kd_rawat   INTEGER NOT NULL,
    id_pasien  INTEGER NOT NULL,
    kd_ruangan INTEGER NOT NULL
);

ALTER TABLE dirawat ADD CONSTRAINT dirawatv1_pk PRIMARY KEY ( kd_rawat );

CREATE TABLE dokter (
    id_dokter   INTEGER NOT NULL,
    nama_dokter VARCHAR(100) NOT NULL
);

ALTER TABLE dokter ADD CONSTRAINT dokter_pk PRIMARY KEY ( id_dokter );

CREATE TABLE merawat (
    memeriksa VARCHAR(255) NOT NULL,
    id_dokter INTEGER NOT NULL,
    id_pasien INTEGER NOT NULL
);

CREATE TABLE pasien (
    id_pasien     INTEGER NOT NULL,
    nama_pasien   VARCHAR(100) NOT NULL,
    alamat        VARCHAR(255) NOT NULL,
    no_telp       VARCHAR(15) NOT NULL,
    jenis_kelamin CHAR(1) NOT NULL,
    tanggal_lahir DATE NOT NULL
);

ALTER TABLE pasien ADD CONSTRAINT pasien_pk PRIMARY KEY ( id_pasien );

CREATE TABLE ruanginap (
    kd_ruangan INTEGER NOT NULL,
    nama_kamar VARCHAR(100) NOT NULL,
    keterangan TEXT NOT NULL
);

ALTER TABLE ruanginap ADD CONSTRAINT ruanginap_pk PRIMARY KEY ( kd_ruangan );

ALTER TABLE merawat
    ADD CONSTRAINT dirawat_dokter_fk FOREIGN KEY ( id_dokter )
        REFERENCES dokter ( id_dokter );

ALTER TABLE merawat
    ADD CONSTRAINT dirawat_pasien_fk FOREIGN KEY ( id_pasien )
        REFERENCES pasien ( id_pasien );

ALTER TABLE dirawat
    ADD CONSTRAINT dirawat_pasien_fkv2 FOREIGN KEY ( id_pasien )
        REFERENCES pasien ( id_pasien );

ALTER TABLE dirawat
    ADD CONSTRAINT dirawat_ruanginap_fk FOREIGN KEY ( kd_ruangan )
        REFERENCES ruanginap ( kd_ruangan );
		
------------------D--O--K--T--E--R----------------
INSERT INTO dokter VALUES (1, 'dr. Andi Pratama');
INSERT INTO dokter VALUES (2, 'dr. Siti Mawar');
INSERT INTO dokter VALUES (3, 'dr. Budi Santoso');
INSERT INTO dokter VALUES (4, 'dr. Rahmawati');
INSERT INTO dokter VALUES (5, 'dr. Johan Wijaya');

-------------R--U--A--N--G--I--N--A--P-------------
INSERT INTO ruanginap VALUES (101, 'VIP I', 'Kamar VIP lantai 1');
INSERT INTO ruanginap VALUES (102, 'VIP II', 'Kamar VIP lantai 2');
INSERT INTO ruanginap VALUES (201, 'Kelas I', 'Kamar kelas 1');
INSERT INTO ruanginap VALUES (202, 'Kelas II', 'Kamar kelas 2');
INSERT INTO ruanginap VALUES (203, 'ICU', 'Ruang intensif perawatan');

------------------P--A--S--I--E--N-------------------
INSERT INTO pasien VALUES (1, 'Rudi Saputra', 'Bandung', '08123456789', 'L', '1995-02-11');
INSERT INTO pasien VALUES (2, 'Siska Amelia', 'Jakarta', '08234567891', 'P', '1998-06-25');
INSERT INTO pasien VALUES (3, 'Bambang Hadi', 'Surabaya', '08125678945', 'L', '1988-10-02');
INSERT INTO pasien VALUES (4, 'Nanda Putri', 'Medan', '08346789123', 'P', '2000-04-19');
INSERT INTO pasien VALUES (5, 'Agus Salim', 'Semarang', '08215674321', 'L', '1992-12-12');

------------------------D--I--R--A--W--A--T---------------------------------
INSERT INTO dirawat VALUES (1, 1, 101);
INSERT INTO dirawat VALUES (2, 2, 102);
INSERT INTO dirawat VALUES (3, 3, 201);
INSERT INTO dirawat VALUES (4, 4, 202);
INSERT INTO dirawat VALUES (5, 5, 203);

-------------------------M--E--R--A--W--A--T----------------------------------
INSERT INTO merawat VALUES ('Kontrol rutin', 1, 1);
INSERT INTO merawat VALUES ('Pemeriksaan demam', 2, 2);
INSERT INTO merawat VALUES ('Bedah ringan', 3, 3);
INSERT INTO merawat VALUES ('Rawat luka', 4, 4);
INSERT INTO merawat VALUES ('Perawatan ICU', 5, 5);

----------------------1. Membuat Sequence----------------
CREATE SEQUENCE seq_rawatt START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE seq_pasiens START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE seq_dokterr START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE seq_ruangg START WITH 6 INCREMENT BY 1;

INSERT INTO pasien VALUES (nextval('seq_pasiens'), 'Rudi', 'Jakarta', '081234', 'L', '1990-02-10');

------------ 2. Menambahkan Data Ke Tabel------------

INSERT INTO dokter VALUES (nextval('seq_dokterr'), 'dr. Hana');
INSERT INTO ruanginap VALUES (nextval('seq_ruangg'), 'VIP 1', 'Khusus pasien VIP');

---------------3. Membuat View----------------------
CREATE VIEW view_pasien_dokter AS
SELECT p.nama_pasien, d.nama_dokter
FROM merawat m
JOIN pasien p ON m.id_pasien = p.id_pasien
JOIN dokter d ON m.id_dokter = d.id_dokter;

--------------4. Membuat Index---------------
CREATE INDEX idx_nama_pasien ON pasien (nama_pasien);

--------------------5. Membuat Synonym---------------
CREATE SYNONYM pasien_view FOR view_pasien_dokter;

--------------6. Menguji Database-----------------------
SELECT p.nama_pasien, d.nama_dokter, r.nama_kamar
FROM dirawat dr
JOIN pasien p ON dr.id_pasien = p.id_pasien
JOIN ruanginap r ON dr.kd_ruangan = r.kd_ruangan;










-- ==============================
-- 1. STATISTIK BUKU (5 QUERY)
-- ==============================

-- 1. Total buku seluruhnya
SELECT COUNT(*) AS total_buku 
FROM buku;

-- 2. Total nilai inventaris (harga × stok)
SELECT SUM(harga * stok) AS total_inventaris 
FROM buku;

-- 3. Rata-rata harga buku
SELECT AVG(harga) AS rata_rata_harga 
FROM buku;

-- 4. Buku termahal (judul dan harga)
SELECT judul, harga 
FROM buku
ORDER BY harga DESC
LIMIT 1;

-- 5. Buku dengan stok terbanyak
SELECT judul, stok 
FROM buku
ORDER BY stok DESC
LIMIT 1;


-- ==============================
-- 2. FILTER DAN PENCARIAN (5 QUERY)
-- ==============================

-- 1. Buku kategori Programming dengan harga < 100000
SELECT * 
FROM buku
WHERE kategori = 'Programming' AND harga < 100000;

-- 2. Buku dengan judul mengandung "PHP" atau "MySQL"
SELECT * 
FROM buku
WHERE judul LIKE '%PHP%' OR judul LIKE '%MySQL%';

-- 3. Buku terbit tahun 2024
SELECT * 
FROM buku
WHERE tahun_terbit = 2024;

-- 4. Buku dengan stok antara 5 - 10
SELECT * 
FROM buku
WHERE stok BETWEEN 5 AND 10;

-- 5. Buku dengan pengarang "Budi Raharjo"
SELECT * 
FROM buku
WHERE pengarang = 'Budi Raharjo';


-- ==============================
-- 3. GROUPING DAN AGREGASI (3 QUERY)
-- ==============================

-- 1. Jumlah buku & total stok per kategori
SELECT kategori, COUNT(*) AS jumlah_buku, SUM(stok) AS total_stok
FROM buku
GROUP BY kategori;

-- 2. Rata-rata harga per kategori
SELECT kategori, AVG(harga) AS rata_rata_harga
FROM buku
GROUP BY kategori;

-- 3. Kategori dengan total inventaris terbesar
SELECT kategori, SUM(harga * stok) AS total_inventaris
FROM buku
GROUP BY kategori
ORDER BY total_inventaris DESC
LIMIT 1;


-- ==============================
-- 4. UPDATE DATA (2 QUERY)
-- ==============================

-- 1. Naikkan harga kategori Programming sebesar 5%
UPDATE buku
SET harga = harga + (harga * 0.05)
WHERE kategori = 'Programming';

-- 2. Tambah stok 10 untuk buku dengan stok < 5
UPDATE buku
SET stok = stok + 10
WHERE stok < 5;


-- ==============================
-- 5. LAPORAN KHUSUS (2 QUERY)
-- ==============================

-- 1. Buku yang perlu restocking (stok < 5)
SELECT * 
FROM buku
WHERE stok < 5;

-- 2. Top 5 buku termahal
SELECT judul, harga
FROM buku
ORDER BY harga DESC
LIMIT 5;
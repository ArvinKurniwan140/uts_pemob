import 'package:flutter/material.dart';
import '../models/berita_model.dart';

class BeritaFragment extends StatelessWidget {
  const BeritaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Berita> beritaList = [
      Berita(
        judul: 'Teknologi AI Terbaru Mengubah Industri Kesehatan',
        kategori: 'Teknologi',
        tanggal: '13 Nov 2024',
        ringkasan: 'Inovasi kecerdasan buatan membawa perubahan signifikan dalam diagnosis dan perawatan medis.',
        ikon: Icons.computer,
        warna: Colors.blue,
      ),
      Berita(
        judul: 'Perekonomian Indonesia Tumbuh 5.2% di Kuartal III',
        kategori: 'Ekonomi',
        tanggal: '12 Nov 2024',
        ringkasan: 'Pertumbuhan ekonomi didorong oleh konsumsi domestik dan investasi sektor swasta.',
        ikon: Icons.trending_up,
        warna: Colors.green,
      ),
      Berita(
        judul: 'Tim Nasional Raih Medali Emas di Ajang Internasional',
        kategori: 'Olahraga',
        tanggal: '12 Nov 2024',
        ringkasan: 'Prestasi membanggakan diraih atlet Indonesia di kejuaraan dunia bulutangkis.',
        ikon: Icons.sports_tennis,
        warna: Colors.orange,
      ),
      Berita(
        judul: 'Kampus ITN Luncurkan Program Beasiswa Unggulan',
        kategori: 'Pendidikan',
        tanggal: '11 Nov 2024',
        ringkasan: 'Program beasiswa baru untuk mahasiswa berprestasi dengan total dana 10 miliar rupiah.',
        ikon: Icons.school,
        warna: Colors.purple,
      ),
      Berita(
        judul: 'Penelitian Terbaru: Manfaat Olahraga Rutin untuk Kesehatan Mental',
        kategori: 'Kesehatan',
        tanggal: '11 Nov 2024',
        ringkasan: 'Studi menunjukkan olahraga 30 menit sehari dapat mengurangi risiko depresi hingga 40%.',
        ikon: Icons.favorite,
        warna: Colors.red,
      ),
      Berita(
        judul: 'Bandung Jadi Tuan Rumah Festival Teknologi Asia 2025',
        kategori: 'Event',
        tanggal: '10 Nov 2024',
        ringkasan: 'Festival akan menghadirkan inovator dan startup dari seluruh Asia.',
        ikon: Icons.event,
        warna: Colors.teal,
      ),
      Berita(
        judul: 'Aplikasi Mobile Karya Mahasiswa Menangkan Kompetisi Nasional',
        kategori: 'Prestasi',
        tanggal: '10 Nov 2024',
        ringkasan: 'Tim mahasiswa ITN berhasil mengembangkan aplikasi inovatif untuk pendidikan.',
        ikon: Icons.emoji_events,
        warna: Colors.amber,
      ),
      Berita(
        judul: 'Pemerintah Targetkan 100% Energi Terbarukan di 2045',
        kategori: 'Lingkungan',
        tanggal: '9 Nov 2024',
        ringkasan: 'Roadmap energi bersih mencakup pembangunan solar panel dan PLTA di berbagai daerah.',
        ikon: Icons.eco,
        warna: Colors.lightGreen,
      ),
      Berita(
        judul: 'Startup Indonesia Raih Pendanaan 50 Juta Dollar',
        kategori: 'Bisnis',
        tanggal: '9 Nov 2024',
        ringkasan: 'Investor asing tertarik dengan inovasi fintech lokal yang terus berkembang.',
        ikon: Icons.attach_money,
        warna: Colors.indigo,
      ),
      Berita(
        judul: 'Film Indonesia Masuk Nominasi Festival Cannes',
        kategori: 'Entertainment',
        tanggal: '8 Nov 2024',
        ringkasan: 'Karya sutradara muda Indonesia mendapat apresiasi tinggi dari juri internasional.',
        ikon: Icons.movie,
        warna: Colors.deepPurple,
      ),
      Berita(
        judul: 'Inovasi Smart City Bandung Jadi Percontohan Nasional',
        kategori: 'Teknologi',
        tanggal: '8 Nov 2024',
        ringkasan: 'Sistem transportasi pintar dan manajemen sampah digital diterapkan di seluruh kota.',
        ikon: Icons.location_city,
        warna: Colors.blueGrey,
      ),
      Berita(
        judul: 'Kuliner Nusantara Masuk Daftar UNESCO World Heritage',
        kategori: 'Kuliner',
        tanggal: '7 Nov 2024',
        ringkasan: 'Rendang dan nasi goreng diakui sebagai warisan budaya dunia.',
        ikon: Icons.restaurant,
        warna: Colors.brown,
      ),
      Berita(
        judul: 'Workshop Flutter Development untuk Mahasiswa',
        kategori: 'Pendidikan',
        tanggal: '7 Nov 2024',
        ringkasan: 'Pelatihan pengembangan aplikasi mobile gratis dibuka untuk 100 peserta.',
        ikon: Icons.code,
        warna: Colors.cyan,
      ),
      Berita(
        judul: 'Destinasi Wisata Baru di Bandung Raya Resmi Dibuka',
        kategori: 'Wisata',
        tanggal: '6 Nov 2024',
        ringkasan: 'Taman rekreasi dengan konsep edukasi alam menawarkan pengalaman unik.',
        ikon: Icons.landscape,
        warna: Colors.lime,
      ),
      Berita(
        judul: 'Breakthrough: Vaksin Baru untuk Penyakit Tropis',
        kategori: 'Kesehatan',
        tanggal: '6 Nov 2024',
        ringkasan: 'Peneliti Indonesia berkontribusi dalam pengembangan vaksin malaria generasi terbaru.',
        ikon: Icons.medical_services,
        warna: Colors.pink,
      ),
    ];

    return Column(
      children: [
        // Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade500],
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Berita Terkini',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Update berita terbaru hari ini',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),

        // List Berita
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: beritaList.length,
            itemBuilder: (context, index) {
              final berita = beritaList[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 15),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(berita.judul),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                const SizedBox(width: 5),
                                Text(berita.tanggal, style: TextStyle(color: Colors.grey)),
                                const SizedBox(width: 15),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: berita.warna.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    berita.kategori,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: berita.warna,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Text(berita.ringkasan),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Tutup'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: berita.warna.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            berita.ikon,
                            color: berita.warna,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 15),

                        // Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Kategori
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: berita.warna.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  berita.kategori,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: berita.warna,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Judul
                              Text(
                                berita.judul,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),

                              // Ringkasan
                              Text(
                                berita.ringkasan,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),

                              // Tanggal
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    berita.tanggal,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
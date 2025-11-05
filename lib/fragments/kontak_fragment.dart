import 'package:flutter/material.dart';
import '../models/kontak_model.dart';

class KontakFragment extends StatelessWidget {
  const KontakFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Kontak> kontakList = [
      Kontak(nama: 'Alan Suryajana', nomor: '081234567890', inisial: 'AS', warna: Colors.blue),
      Kontak(nama: 'Pashameng', nomor: '081234567891', inisial: 'PS', warna: Colors.green),
      Kontak(nama: 'Rizki Saepul Hidayatullah', nomor: '081234567892', inisial: 'RZ', warna: Colors.purple),
      Kontak(nama: 'Aji Gorbaji', nomor: '081234567893', inisial: 'AG', warna: Colors.orange),
      Kontak(nama: 'Epul Kircon', nomor: '081234567894', inisial: 'EK', warna: Colors.pink),
      Kontak(nama: 'Fajar Hidayat', nomor: '081234567895', inisial: 'FH', warna: Colors.teal),
      Kontak(nama: 'Gita Maharani', nomor: '081234567896', inisial: 'GM', warna: Colors.indigo),
      Kontak(nama: 'Hadi Wijaya', nomor: '081234567897', inisial: 'HW', warna: Colors.red),
      Kontak(nama: 'Indah Permata', nomor: '081234567898', inisial: 'IP', warna: Colors.cyan),
      Kontak(nama: 'Joko Susilo', nomor: '081234567899', inisial: 'JS', warna: Colors.amber),
      Kontak(nama: 'Kartika Sari', nomor: '081234567800', inisial: 'KS', warna: Colors.deepPurple),
      Kontak(nama: 'Lukman Hakim', nomor: '081234567801', inisial: 'LH', warna: Colors.lime),
      Kontak(nama: 'Maya Safitri', nomor: '081234567802', inisial: 'MS', warna: Colors.brown),
      Kontak(nama: 'Nugroho Adi', nomor: '081234567803', inisial: 'NA', warna: Colors.blueGrey),
      Kontak(nama: 'Olivia Rahmawati', nomor: '081234567804', inisial: 'OR', warna: Colors.deepOrange),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Kontak',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${kontakList.length} kontak tersimpan',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),

        // List Kontak
        Expanded(
          child: ListView.builder(
            itemCount: kontakList.length,
            itemBuilder: (context, index) {
              final kontak = kontakList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: kontak.warna,
                    radius: 25,
                    child: Text(
                      kontak.inisial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  title: Text(
                    kontak.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    kontak.nomor,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, color: Colors.green.shade600),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Memanggil ${kontak.nama}...'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.message, color: Colors.blue.shade600),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Mengirim pesan ke ${kontak.nama}...'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
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
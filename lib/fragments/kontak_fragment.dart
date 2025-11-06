import 'package:flutter/material.dart';
import '../models/kontak_model.dart';

class KontakFragment extends StatefulWidget {
  const KontakFragment({super.key});

  @override
  State<KontakFragment> createState() => _KontakFragmentState();
}

class _KontakFragmentState extends State<KontakFragment>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _searchController = TextEditingController();
  List<Kontak> _filteredKontakList = [];
  bool _isSearching = false;

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

  @override
  void initState() {
    super.initState();
    _filteredKontakList = kontakList;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.forward();
  }

  void _filterKontak(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredKontakList = kontakList;
      } else {
        _filteredKontakList = kontakList.where((kontak) {
          return kontak.nama.toLowerCase().contains(query.toLowerCase()) ||
              kontak.nomor.contains(query);
        }).toList();
      }
    });
  }

  void _showKontakDetail(Kontak kontak) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Avatar
            Hero(
              tag: 'avatar_${kontak.nama}',
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      kontak.warna,
                      kontak.warna.withOpacity(0.7),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kontak.warna.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    kontak.inisial,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Name
            Text(
              kontak.nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Phone number
            Text(
              kontak.nomor,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30),

            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.phone,
                      label: 'Telepon',
                      color: Colors.green,
                      onTap: () {
                        Navigator.pop(context);
                        _showActionSnackbar('Memanggil ${kontak.nama}...', Colors.green);
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.message,
                      label: 'Pesan',
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pop(context);
                        _showActionSnackbar('Mengirim pesan ke ${kontak.nama}...', Colors.blue);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.videocam,
                      label: 'Video Call',
                      color: Colors.purple,
                      onTap: () {
                        Navigator.pop(context);
                        _showActionSnackbar('Memulai video call dengan ${kontak.nama}...', Colors.purple);
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.email,
                      label: 'Email',
                      color: Colors.orange,
                      onTap: () {
                        Navigator.pop(context);
                        _showActionSnackbar('Mengirim email ke ${kontak.nama}...', Colors.orange);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.8)],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade700,
                Colors.blue.shade500,
                Colors.cyan.shade400,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daftar Kontak',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Kelola kontak Anda',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 28,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${kontakList.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterKontak,
                      decoration: InputDecoration(
                        hintText: 'Cari kontak...',
                        prefixIcon: Icon(Icons.search, color: Colors.blue.shade700),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _filterKontak('');
                          },
                        )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Contact List
        Expanded(
          child: _filteredKontakList.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 80,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 16),
                Text(
                  'Kontak tidak ditemukan',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: _filteredKontakList.length,
            itemBuilder: (context, index) {
              final kontak = _filteredKontakList[index];
              return TweenAnimationBuilder(
                duration: Duration(milliseconds: 300 + (index * 50)),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => _showKontakDetail(kontak),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            // Avatar
                            Hero(
                              tag: 'avatar_${kontak.nama}',
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      kontak.warna,
                                      kontak.warna.withOpacity(0.7),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kontak.warna.withOpacity(0.3),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    kontak.inisial,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Contact Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kontak.nama,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone_android,
                                        size: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        kontak.nomor,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Quick Actions
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildQuickActionButton(
                                  icon: Icons.phone,
                                  color: Colors.green,
                                  onTap: () {
                                    _showActionSnackbar(
                                      'Memanggil ${kontak.nama}...',
                                      Colors.green,
                                    );
                                  },
                                ),
                                const SizedBox(width: 8),
                                _buildQuickActionButton(
                                  icon: Icons.message,
                                  color: Colors.blue,
                                  onTap: () {
                                    _showActionSnackbar(
                                      'Mengirim pesan ke ${kontak.nama}...',
                                      Colors.blue,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildQuickActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
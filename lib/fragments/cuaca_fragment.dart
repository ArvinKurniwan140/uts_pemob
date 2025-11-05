import 'package:flutter/material.dart';

class CuacaFragment extends StatelessWidget {
  const CuacaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade600,
            Colors.blue.shade800,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Lokasi
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Bandung, Indonesia',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Tanggal
              Text(
                'Rabu, 13 November 2024',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),

              const SizedBox(height: 40),

              // Icon Cuaca
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.wb_sunny,
                  size: 100,
                  color: Colors.yellow,
                ),
              ),

              const SizedBox(height: 30),

              // Suhu
              const Text(
                '28°C',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              // Kondisi Cuaca
              const Text(
                'Cerah Berawan',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),

              // Detail Cuaca
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildWeatherDetail(
                      Icons.water_drop,
                      'Kelembapan',
                      '65%',
                    ),
                    const Divider(color: Colors.white30, height: 30),
                    _buildWeatherDetail(
                      Icons.air,
                      'Kecepatan Angin',
                      '12 km/h',
                    ),
                    const Divider(color: Colors.white30, height: 30),
                    _buildWeatherDetail(
                      Icons.visibility,
                      'Jarak Pandang',
                      '10 km',
                    ),
                    const Divider(color: Colors.white30, height: 30),
                    _buildWeatherDetail(
                      Icons.compress,
                      'Tekanan Udara',
                      '1013 hPa',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Prakiraan Harian
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prakiraan 5 Hari',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildForecastItem('Kamis', Icons.wb_cloudy, '27°C', '24°C'),
                    _buildForecastItem('Jumat', Icons.cloud, '26°C', '23°C'),
                    _buildForecastItem('Sabtu', Icons.wb_sunny, '29°C', '25°C'),
                    _buildForecastItem('Minggu', Icons.wb_cloudy, '28°C', '24°C'),
                    _buildForecastItem('Senin', Icons.cloud_queue, '27°C', '23°C'),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildForecastItem(String day, IconData icon, String maxTemp, String minTemp) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Icon(icon, color: Colors.white, size: 28),
          Text(
            '$maxTemp / $minTemp',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
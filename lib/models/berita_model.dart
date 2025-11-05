import 'package:flutter/material.dart';

class Berita {
  final String judul;
  final String kategori;
  final String tanggal;
  final String ringkasan;
  final IconData ikon;
  final Color warna;

  Berita({
    required this.judul,
    required this.kategori,
    required this.tanggal,
    required this.ringkasan,
    required this.ikon,
    required this.warna,
  });
}
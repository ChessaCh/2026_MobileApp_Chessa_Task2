import 'package:flutter/material.dart';

class DaftarPesananPage extends StatelessWidget {
  const DaftarPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'ini halaman Daftar pesanan',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IoT Monitoring',
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IoT Monitoring',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. HEADER (STATUS KONEKSI) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dashboard Monitoring Sensor',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Connected',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- 2. KARTU SENSOR (SUHU & KELEMBAPAN) ---
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.thermostat, color: Colors.blue),
                        SizedBox(height: 8),
                        Text(
                          'Temperature',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        Text(
                          '30.5°C',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Sensor DHT11',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.water_drop, color: Colors.green),
                        SizedBox(height: 8),
                        Text(
                          'Humidity',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        Text(
                          '75%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'Sensor DHT11',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- 3. KARTU INFO MQTT KONEKSI ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MQTT Connection',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Divider(height: 20, thickness: 1),
                  RowItem(title: 'Broker', value: 'broker.hivemq.com'),
                  SizedBox(height: 8),
                  RowItem(title: 'Topic', value: 'kampus/iot/kelas1/sensor'),
                  SizedBox(height: 8),
                  RowItem(title: 'Last Update', value: '10:15:30'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- 4. KARTU RIWAYAT (MONITORING HISTORY) ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Monitoring History',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Dummy Data',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Temperature (°C)',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 20),

                  // Teks di atas grafik (Persis seperti contoh dosen)
                  const Text(
                    'Contoh data simulasi untuk desain dashboard.',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Expand chart',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Gambar Grafik Garis Simulasi
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: CustomPaint(
                      size: const Size(
                        double.infinity,
                        120,
                      ), // Ukuran ruang grafik
                      painter: DummyChartPainter(), // Kode pelukis grafik ada di bawah
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tabel Dummy Data
                  const Center(
                    child: Text(
                      'Temperature',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('28°C'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:05',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('29°C'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:10',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('28.5°C'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '10:15',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('30.5°C'),
                      ],
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
}

// =========================================================================
// WIDGET-WIDGET BANTUAN BERADA DI SINI (JANGAN DIHAPUS)
// =========================================================================

// 1. Widget untuk merapikan baris teks (Kiri: Judul, Kanan: Isi)
class RowItem extends StatelessWidget {
  final String title;
  final String value;

  const RowItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }
}

// 2. Kode Pelukis (CustomPainter) untuk menggambar grafik garis simulasi
class DummyChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Pengaturan alat gambar (warna, tebal garis)
    final paintLine = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final paintDot = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    final paintAxis = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Gambar Garis Sumbu (Kiri vertikal & Bawah horizontal)
    canvas.drawLine(const Offset(0, 0), Offset(0, size.height), paintAxis);
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paintAxis,
    );

    // Titik koordinat data meniru tabel (28, 29, 28.5, 30.5)
    double getY(double value) {
      // Skala simulasi agar pas di layar
      return size.height - ((value - 27.5) / 3.5) * size.height;
    }

    // Posisi ke-4 titik
    final points = [
      Offset(size.width * 0.1, getY(28)),
      Offset(size.width * 0.35, getY(29)),
      Offset(size.width * 0.6, getY(28.5)),
      Offset(size.width * 0.85, getY(30.5)),
    ];

    // Menggambar Garis penghubung
    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paintLine);

    // Menggambar Titik biru di sudut-sudut garis
    for (final point in points) {
      canvas.drawCircle(point, 4, paintDot);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

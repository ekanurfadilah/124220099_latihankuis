import 'package:flutter/material.dart';
import 'dummy_data.dart';

class Homepage extends StatelessWidget {
  final String username;

  Homepage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo $username",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Selamat datang kembali",
            ),
          ],
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 171, 205, 255),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding untuk judul
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'List Kendaraan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            // Expanded digunakan agar GridView mengambil sisa ruang yang ada
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: vehicleList.length,
              itemBuilder: (context, index) {
                final Vehicle vehicle = vehicleList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0), // Margin untuk Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Sudut membulat
                  ),
                  elevation: 4, // Menambahkan efek bayangan
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        vehicle.imageUrls[0],
                        height: 150, // Tinggi gambar
                        width: double.infinity, // Lebar gambar penuh
                        fit: BoxFit.cover, // Memastikan gambar menutupi area
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Padding di sekitar teks
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicle.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4), // Jarak antara teks
                            Text(
                              vehicle.type,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 4),
                            Text(
                              vehicle.description,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Engine: ${vehicle.engine}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Fuel Type: ${vehicle.fuelType}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Price: ${vehicle.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green, // Warna hijau untuk harga
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30), // Spasi antara GridView dan tombol Log Out
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Log Out', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 20), // Tambahkan sedikit jarak di bawah tombol
        ],
      ),
    );
  }
}

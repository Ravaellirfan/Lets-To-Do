import 'package:flutter/material.dart';

class AktivitasScreen extends StatelessWidget {
  final List<Map<String, String>> todos = [
    {
      "title": "To do 1",
      "subtitle": "Activity",
      "date": "2024-09-09",
    },
    {
      "title": "To do 2",
      "subtitle": "Activity",
      "date": "2024-09-09",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
        backgroundColor: Colors.black,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_image.png'), // Ubah dengan path gambar profil
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.check_circle_outline, color: Colors.white),
            ),
            title: Text(
              "${todos[index]['title']} | ${todos[index]['subtitle']}",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "${todos[index]['title']} | ${todos[index]['date']}",
              style: TextStyle(color: Colors.white60),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                // Aksi ketika tombol hapus ditekan
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}

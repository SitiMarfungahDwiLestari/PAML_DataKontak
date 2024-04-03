import 'dart:io';
import 'package:http/http.dart' as http;

class KontakService {
  final String baseUrl = 'https://paml.tatiumy.com/api/';
  final String endpoint = 'people';

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }

  Future<http.Response> addPerson(Map<String, String> data, File? file) async {
    // Buat permintaan multipart dengan metode POST
    var request = http.MultipartRequest(
      'POST', 
      getUri(endpoint),
      )
      ..fields.addAll(data) // Tambahkan bidang data ke permintaan
      ..headers['Content-Type'] = 'application/json'; // Atur tipe konten sebagai JSON

      if (file != null) {
      // Jika file disediakan, tambahkan ke permintaan sebagai file multipart
      request.files.add(await http.MultipartFile.fromPath('gambar', file.path));
    } else {
      // Jika file tidak disediakan, tambahkan string kosong sebagai placeholder
      request.files.add(http.MultipartFile.fromString('gambar', ''));
    }

    // Kirim permintaan dan kembalikan responsenya
    return await http.Response.fromStream(await request.send());
  }
}
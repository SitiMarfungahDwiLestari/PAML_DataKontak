class Kontak {
  final String nama;
  final String email;
  final String alamat;
  final String noTelepon;
  final String foto;

  Kontak({
    required this.nama,
    required this.email,
    required this.alamat,
    required this.noTelepon,
    required this.foto,
  });

  Kontak copyWith({
    String? nama,
    String? email,
    String? alamat,
    String? noTelepon,
    String? foto,
  }) {
    return Kontak(
      nama: nama ?? this.nama,
      email: email ?? this.email,
      alamat: alamat ?? this.alamat,
      noTelepon: noTelepon ?? this.noTelepon,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'email': email,
      'alamat': alamat,
      'noTelepon': noTelepon,
      'foto': foto,
    };
  }

  factory Kontak.fromMap(Map<String, dynamic> map) {
    return Kontak(
      nama: map['nama'] as String,
      email: map['email'] as String,
      alamat: map['alamat'] as String,
      noTelepon: map['noTelepon'] as String,
      foto: map['foto'] as String,
    );
  }
}

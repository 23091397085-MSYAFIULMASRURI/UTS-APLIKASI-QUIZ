import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import SplashScreen

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(), // SplashScreen jadi halaman pertama
));

// // Fungsi utama yang menjalankan aplikasi Flutter
// void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di pojok kanan atas aplikasi
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz Mahasiswa Vokasi"), // Tambahkan judul di AppBar
          backgroundColor: Colors.black, // Warna AppBar
          foregroundColor: Colors.white, // Warna teks putih
          centerTitle: true, // Agar judul berada di tengah
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Latar belakang gradien biru ke ungu
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0), // Padding untuk mengatur jarak elemen dari sisi layar
              child: QuizPage(), // Memuat halaman kuis
            ),
          ),
        ),
      ),
    );
  }
}

// Widget Stateful untuk halaman kuis
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

// State dari halaman kuis
class _QuizPageState extends State<QuizPage> {
  int _score = 0; // Menyimpan skor pengguna
  int _currentQuestionIndex = 0; // Menyimpan indeks pertanyaan yang sedang ditampilkan

  // Daftar pertanyaan dengan opsi jawaban dan indeks jawaban yang benar
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Sekarang ada berapa program studi di Fakultas Vokasi Universitas Negeri Surabaya?',
      'options': ['5', '10', '15', '25'],
      'answerIndex': 1,
    },
    {
      'question': 'Lab komputer Manajemen Informatika berada di gedung?',
      'options': ['K10', 'K2', 'K9', 'K1'],
      'answerIndex': 0,
    },
    {
      'question': 'Terletak dimanakah Fakultas Vokasi?',
      'options': ['Unesa Lidah Wetan', 'Unesa Magetan', 'Unesa Ketintang', 'Unesa IKN'],
      'answerIndex': 2,
    },
    {
      'question': 'Berikut yang bukan program studi dari Fakultas Vokasi adalah?',
      'options': ['D4 Manajemen Informatika', 'D4 Desain Grafis', 'D4 Teknik Mesin', 'D4 Teknik Perkeretaapian'],
      'answerIndex': 3,
    },
    {
      'question': 'Ada berapa tempat parkir sepeda motor untuk mahasiswa/i di Fakultas Vokasi?',
      'options': ['Di depan, Di dalam, Di belakang', 'Di depan, Di samping, Di dalam', 'Di depan, Di dalam, Di atas', 'Semua Benar'],
      'answerIndex': 0,
    },
    {
      'question': 'Software apa yang sering digunakan dalam mata kuliah Database di Manajemen Informatika?',
      'options': ['Adobe Photoshop', 'AutoCAD', 'Blender', 'MySQL'],
      'answerIndex': 3,
    },
    {
      'question': 'Jika para mahasiswa/i ingin meminjam proyektor dimana tempatnya?',
      'options': ['Lab Komputer', 'Tata Usaha', 'Ruangan Dosen', 'Gedung Vokasi'],
      'answerIndex': 1,
    },
    {
      'question': 'Gedung rektorat Universitas Negeri Surabay terletak di kampus?',
      'options': ['Magetan', 'Ketintang', 'Lidah Wetan', 'Semua Salah'],
      'answerIndex': 2,
    },
    {
      'question': 'Siapakah sekarang yang menjabat sebagai rektor di Universitas Negeri Surabaya?',
      'options': ['Prof. Dr. H.Nurhasan M.Kes.', 'Prof. Dr. H. Warsono, M.S.', 'Prof. Dr. H. Muchlas Samani, M.Pd.', 'Prof. Dr. H.Haris Supratno M.Pd.'],
      'answerIndex': 0,
    },
    {
      'question': 'Dimana letak masjid di UNESA kampus ketintang?',
      'options': ['Depan Danau', 'Sebelah Fakultas FMIPA', 'Dekat Food Court', 'Semua Benar'],
      'answerIndex': 3,
    },
  ];

  // Fungsi untuk memeriksa jawaban yang dipilih oleh pengguna
  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[_currentQuestionIndex]['answerIndex']) {
      _score++; // Jika jawaban benar, tambah skor
    }
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++; // Pindah ke pertanyaan berikutnya jika masih ada
      } else {
        _showResultDialog(); // Tampilkan hasil jika semua pertanyaan telah dijawab
      }
    });
  }

  // Fungsi untuk menampilkan dialog hasil kuis
  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hasil Quiz'),
        content: Text('Skor Anda: $_score/${questions.length}'), // Menampilkan skor akhir pengguna
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _score = 0; // Reset skor
                _currentQuestionIndex = 0; // Reset ke pertanyaan pertama
              });
              Navigator.of(ctx).pop(); // Tutup dialog
            },
            child: Text('Ulangi'),
          ),
        ],
      ),
    );
  }

  // Fungsi yang membangun UI halaman kuis
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen secara vertikal
      crossAxisAlignment: CrossAxisAlignment.stretch, // Rentangkan elemen secara horizontal
      children: <Widget>[
        // Kotak untuk menampilkan pertanyaan
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white, // Latar belakang kotak pertanyaan
              borderRadius: BorderRadius.circular(15), // Membuat sudut membulat
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Efek bayangan
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Text(
              questions[_currentQuestionIndex]['question'], // Menampilkan teks pertanyaan
              textAlign: TextAlign.center, // Teks rata tengah
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 30), // Jarak antar elemen
        // Menampilkan tombol pilihan jawaban
        ...List.generate(questions[_currentQuestionIndex]['options'].length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
                foregroundColor: Colors.white, // Warna teks
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Membulatkan tombol
                ),
              ),
              onPressed: () => _checkAnswer(index), // Memeriksa jawaban ketika tombol diklik
              child: Text(
                questions[_currentQuestionIndex]['options'][index], // Menampilkan opsi jawaban
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        }),
      ],
    );
  }
}

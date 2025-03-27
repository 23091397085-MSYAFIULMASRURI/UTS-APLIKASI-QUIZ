import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Mengimpor halaman SplashScreen
import 'quiz_model.dart'; // Mengimpor model data untuk kuis (pertanyaan, opsi jawaban, dan indeks jawaban yang benar)
import 'question_widget.dart'; // Mengimpor widget khusus untuk menampilkan pertanyaan

// Fungsi utama yang menjalankan aplikasi Flutter
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, // Menyembunyikan label debug di pojok kanan atas
  home: SplashScreen(), // Menjadikan SplashScreen sebagai halaman pertama yang ditampilkan
));

//  Class utama yang mengatur tampilan aplikasi
class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan label debug
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz Mahasiswa Vokasi"), // Judul di AppBar
          backgroundColor: Colors.black, // Warna latar belakang AppBar
          foregroundColor: Colors.white, // Warna teks di AppBar
          centerTitle: true, // Membuat judul di tengah AppBar
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Gradasi warna latar belakang
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea( // Menghindari area yang tertutup oleh notch atau status bar
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(), // Menampilkan halaman kuis
            ),
          ),
        ),
      ),
    );
  }
}

//  Class QuizPage menggunakan StatefulWidget agar state bisa berubah selama aplikasi berjalan
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

//  Class State untuk QuizPage, tempat logika kuis dikelola
class _QuizPageState extends State<QuizPage> {
  int _score = 0; // Menyimpan skor pengguna
  int _currentQuestionIndex = 0; // Menyimpan indeks pertanyaan yang sedang ditampilkan
  final List<QuizModel> questions = quizQuestions; // Mengambil daftar pertanyaan dari quiz_model.dart

  //  POLYMORPHISM: Fungsi ini mengembalikan widget pertanyaan yang berbeda berdasarkan tipe pertanyaan
  Widget _getQuestionWidget(QuizModel question) {
    return TextQuestionWidget(text: question.question);
  }

  //  Fungsi untuk memeriksa jawaban yang dipilih oleh pengguna
  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[_currentQuestionIndex].answerIndex) {
      _score++; // Jika jawaban benar, skor bertambah
    }
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++; // Pindah ke pertanyaan berikutnya jika masih ada
      } else {
        _showResultDialog(); // Jika semua pertanyaan selesai, tampilkan hasil kuis
      }
    });
  }

  //  Fungsi untuk menampilkan dialog hasil kuis
  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Hasil Quiz'),
        content: Text('Skor Anda: $_score/${questions.length}'), // Menampilkan skor akhir
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _score = 0; // Mengatur ulang skor
                _currentQuestionIndex = 0; // Mengulang pertanyaan dari awal
              });
              Navigator.of(ctx).pop(); // Menutup dialog
            },
            child: Text('Ulangi'), // Tombol untuk mengulangi kuis
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Menengahkan konten secara vertikal
      crossAxisAlignment: CrossAxisAlignment.stretch, // Memastikan elemen mengambil seluruh lebar layar
      children: <Widget>[
        //  Tampilkan pertanyaan dengan Polymorphism
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white, // Latar belakang putih untuk pertanyaan
              borderRadius: BorderRadius.circular(15), // Membuat sudut melengkung
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10, // Membuat efek bayangan
                  spreadRadius: 2,
                ),
              ],
            ),
            child: _getQuestionWidget(questions[_currentQuestionIndex]), // Menampilkan pertanyaan
          ),
        ),
        SizedBox(height: 30), // Memberi jarak antara pertanyaan dan opsi jawaban
        //  Menampilkan opsi jawaban dalam bentuk tombol
        ...List.generate(questions[_currentQuestionIndex].options.length, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna tombol
                foregroundColor: Colors.white, // Warna teks tombol
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Membuat sudut tombol melengkung
                ),
              ),
              onPressed: () => _checkAnswer(index), // Memanggil fungsi untuk memeriksa jawaban
              child: Text(
                questions[_currentQuestionIndex].options[index], // Menampilkan teks opsi jawaban
                style: TextStyle(fontSize: 20.0), // Ukuran teks jawaban
              ),
            ),
          );
        }),
      ],
    );
  }
}

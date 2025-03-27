// ENCAPSULATION: Model untuk menyimpan pertanyaan quiz
class QuizModel {
  final String question;
  final List<String> options;
  final int answerIndex;

  QuizModel({required this.question, required this.options, required this.answerIndex});
}

List<QuizModel> quizQuestions = [
  QuizModel(
    question: 'Sekarang ada berapa program studi di Fakultas Vokasi Universitas Negeri Surabaya?',
    options: ['5', '10', '15', '25'],
    answerIndex: 1,
  ),
  QuizModel(
    question: 'Lab komputer Manajemen Informatika berada di gedung?',
    options: ['K10', 'K2', 'K9', 'K1'],
    answerIndex: 0,
  ),
  QuizModel(
    question: 'Terletak dimanakah Fakultas Vokasi?',
    options: ['Unesa Lidah Wetan', 'Unesa Magetan', 'Unesa Ketintang', 'Unesa IKN'],
    answerIndex: 2,
  ),
  QuizModel(
    question: 'Berikut yang bukan program studi dari Fakultas Vokasi adalah?',
    options: ['D4 Manajemen Informatika', 'D4 Desain Grafis', 'D4 Teknik Mesin', 'D4 Teknik Perkeretaapian'],
    answerIndex: 3,
  ),
  QuizModel(
    question: 'Ada berapa tempat parkir sepeda motor untuk mahasiswa/i di Fakultas Vokasi?',
    options: ['Di depan, Di dalam, Di belakang', 'Di depan, Di samping, Di dalam', 'Di depan, Di dalam, Di atas', 'Semua Benar'],
    answerIndex: 0,
  ),
  QuizModel(
    question: 'Software apa yang sering digunakan dalam mata kuliah Database di Manajemen Informatika?',
    options: ['Adobe Photoshop', 'AutoCAD', 'Blender', 'MySQL'],
    answerIndex: 3,
  ),
  QuizModel(
    question: 'Jika para mahasiswa/i ingin meminjam proyektor dimana tempatnya?',
    options: ['Lab Komputer', 'Tata Usaha', 'Ruangan Dosen', 'Gedung Vokasi'],
    answerIndex: 1,
  ),
  QuizModel(
    question: 'Gedung rektorat Universitas Negeri Surabaya terletak di kampus?',
    options: ['Magetan', 'Ketintang', 'Lidah Wetan', 'Semua Salah'],
    answerIndex: 2,
  ),
  QuizModel(
    question: 'Siapakah sekarang yang menjabat sebagai rektor di Universitas Negeri Surabaya?',
    options: ['Prof. Dr. H.Nurhasan M.Kes.', 'Prof. Dr. H. Warsono, M.S.', 'Prof. Dr. H. Muchlas Samani, M.Pd.', 'Prof. Dr. H.Haris Supratno M.Pd.'],
    answerIndex: 0,
  ),
  QuizModel(
    question: 'Dimana letak masjid di UNESA kampus ketintang?',
    options: ['Depan Danau', 'Sebelah Fakultas FMIPA', 'Dekat Food Court', 'Semua Benar'],
    answerIndex: 3,
  ),
];

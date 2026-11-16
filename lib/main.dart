import 'package:flutter/material.dart';

void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int questionNumber = 0;

  int correctAnswers = 0;

  final List<String> questions = [
    'Flutter là framework của Google?',
    'Dart là ngôn ngữ lập trình được sử dụng với Flutter?',
    'Flutter chỉ có thể làm ứng dụng Android?',
    'Widget là thành phần cơ bản trong Flutter?',
    'Một StatefulWidget có thể thay đổi trạng thái?',
    'Android Studio có thể dùng để lập trình Flutter?',
    'Flutter sử dụng ngôn ngữ Java?',
    'MaterialApp là một Widget trong Flutter?',
    'setState() dùng để cập nhật giao diện?',
    'Hot Reload giúp xem thay đổi code nhanh hơn?',
  ];

  final List<bool> answers = [
    true,
    true,
    false,
    true,
    true,
    true,
    false,
    true,
    true,
    true,
  ];

  void checkAnswer(bool userAnswer) {

    bool correctAnswer = answers[questionNumber];

    setState(() {

      if (userAnswer == correctAnswer) {
        correctAnswers++;
      }

      questionNumber++;

    });

  }

  void restartQuiz() {

    setState(() {
      questionNumber = 0;
      correctAnswers = 0;
    });

  }

  @override
  Widget build(BuildContext context) {

    // Nếu đã làm hết câu hỏi
    if (questionNumber >= questions.length) {

      return Scaffold(
        backgroundColor: Colors.blueGrey,

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const Text(
                  '🎉 HOÀN THÀNH! 🎉',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  'Bạn trả lời đúng $correctAnswers/${questions.length} câu',

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: restartQuiz,

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                  ),

                  child: const Text(
                    'CHƠI LẠI 🔄',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }

    // Màn hình câu hỏi
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: const Text(
          'QUIZZLER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        backgroundColor: Colors.blueGrey[900],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Số câu
            Text(
              'Câu ${questionNumber + 1}/${questions.length}',

              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 25),

            // CÂU HỎI
            Expanded(
              child: Center(
                child: Text(
                  questions[questionNumber],

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // NÚT ĐÚNG
            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(true);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),

                child: const Text(
                  'ĐÚNG 👍',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // NÚT SAI
            SizedBox(
              width: double.infinity,
              height: 65,

              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(false);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),

                child: const Text(
                  'SAI 👎',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
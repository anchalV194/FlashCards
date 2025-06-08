import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Master',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFD6EBEE),
        cardColor: const Color(0xFF001B48),
        primaryColor: const Color(0xFF018ABE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF02457A),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: TopicScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Topic {
  final String title;
  final String description;
  final Color color;
  final List<Flashcard> flashcards;
  final IconData icon;

  Topic({
    required this.title,
    required this.description,
    required this.color,
    required this.flashcards,
    required this.icon,
  });
}

class Flashcard {
  final String question;
  final String answer;

  Flashcard({required this.question, required this.answer});
}

class TopicScreen extends StatelessWidget {
  TopicScreen({super.key});

  final List<Topic> topics = [
    Topic(
      title: 'Flowers',
      description: 'Learn about different flowers',
      color: const Color(0xFF001B48),
      icon: FontAwesomeIcons.leaf,
      flashcards: [
        Flashcard(question: 'What flower symbolizes love?', answer: 'Rose'),
        Flashcard(question: 'Which flower follows the sun?', answer: 'Sunflower'),
        Flashcard(question: 'What flower is known for its calming scent?', answer: 'Lavender'),
        Flashcard(question: 'Which flower blooms in spring and has a bulb?', answer: 'Tulip'),
        Flashcard(question: 'What flower is associated with remembrance?', answer: 'Poppy'),
      ],
    ),
    Topic(
      title: 'Animals',
      description: 'Discover animal facts',
      color: const Color(0xFF02457A),
      icon: FontAwesomeIcons.paw,
      flashcards: [
        Flashcard(question: 'What is the fastest land animal?', answer: 'Cheetah'),
        Flashcard(question: 'Which animal is known as the king of the jungle?', answer: 'Lion'),
        Flashcard(question: 'What mammal lays eggs?', answer: 'Platypus'),
        Flashcard(question: 'What is the largest mammal on Earth?', answer: 'Blue Whale'),
        Flashcard(question: 'Which bird is known for its colorful tail?', answer: 'Peacock'),
      ],
    ),
    Topic(
      title: 'Countries',
      description: 'World geography facts',
      color: const Color(0xFF018ABE),
      icon: FontAwesomeIcons.globe,
      flashcards: [
        Flashcard(question: 'Which country has the largest population?', answer: 'India'),
        Flashcard(question: 'Which country is the largest by area?', answer: 'Russia'),
        Flashcard(question: 'Which country is known as the Land of the Rising Sun?', answer: 'Japan'),
        Flashcard(question: 'Which country has the most official languages?', answer: 'South Africa'),
        Flashcard(question: 'Which country hosts the Eiffel Tower?', answer: 'France'),
      ],
    ),
    Topic(
      title: 'Technology',
      description: 'Explore tech facts',
      color: const Color(0xFF02457A),
      icon: FontAwesomeIcons.laptopCode,
      flashcards: [
        Flashcard(question: 'Who founded Microsoft?', answer: 'Bill Gates and Paul Allen'),
        Flashcard(question: 'What does CPU stand for?', answer: 'Central Processing Unit'),
        Flashcard(question: 'What year was the first iPhone released?', answer: '2007'),
        Flashcard(question: 'What is the name of Google\'s mobile operating system?', answer: 'Android'),
        Flashcard(question: 'What does "HTML" stand for?', answer: 'HyperText Markup Language'),
      ],
    ),
    Topic(
      title: 'Politics',
      description: 'Understand Indian politics',
      color: const Color(0xFF018ABE),
      icon: FontAwesomeIcons.landmark,
      flashcards: [
        Flashcard(question: 'Who is known as the Father of the Indian Constitution?', answer: 'Dr. B. R. Ambedkar'),
        Flashcard(question: 'What is the lower house of India\'s Parliament called?', answer: 'Lok Sabha'),
        Flashcard(question: 'Which party is symbolized by a lotus flower?', answer: 'Bharatiya Janata Party (BJP)'),
        Flashcard(question: 'Who was the first Prime Minister of India?', answer: 'Jawaharlal Nehru'),
        Flashcard(question: 'Which article of the Constitution abolishes untouchability?', answer: 'Article 17'),
      ],
    ),
    Topic(
      title: 'Cricket',
      description: 'Understanding India\'s most loved sports',
      color: const Color(0xFF001B48),
      icon: FontAwesomeIcons.baseballBatBall,
      flashcards: [
        Flashcard(question: 'How many players are there in each cricket team?', answer: '11'),
        Flashcard(question: 'What are the three wooden stumps called?', answer: 'Wicket'),
        Flashcard(question: 'Which format has 50 overs per side?', answer: 'One Day International (ODI)'),
        Flashcard(question: 'What is a batsman scoring 100+ runs called?', answer: 'Centurion'),
        Flashcard(question: 'Where was cricket born?', answer: 'England'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: topic.color,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlashcardScreen(topic: topic),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          FaIcon(
                            topic.icon,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topic.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  topic.description,
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create Your Own Flashcards'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Coming Soon', style: TextStyle(color: Colors.black),
                    ),
                    content: const Text('Flashcard creation feature is under development.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  final Topic topic;

  const FlashcardScreen({super.key, required this.topic});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int currentIndex = 0;
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final flashcard = widget.topic.flashcards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.title),
        centerTitle: true,
        backgroundColor: widget.topic.color,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showAnswer = !showAnswer;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Card(
                  key: ValueKey<bool>(showAnswer),
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: showAnswer
                      ? const Color(0xFF97CADB)
                      : const Color(0xFF001B48),
                  shadowColor: Colors.black.withOpacity(0.4),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Text(
                        showAnswer ? flashcard.answer : flashcard.question,
                        style: TextStyle(
                          fontSize: 24,
                          color: showAnswer ? Colors.black : Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.topic.color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showAnswer = false;
                      currentIndex = (currentIndex - 1) % widget.topic.flashcards.length;
                      if (currentIndex < 0) {
                        currentIndex = widget.topic.flashcards.length - 1;
                      }
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text('Previous'),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.topic.color,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showAnswer = false;
                      currentIndex = (currentIndex + 1) % widget.topic.flashcards.length;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
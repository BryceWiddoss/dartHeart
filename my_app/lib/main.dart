import 'package:flutter/material.dart';

void main() {
  runApp(const SurveyApp());
}

/// --- Animated text widget provided by user (flashes color) ---
class ColorTweenText extends StatefulWidget {
  const ColorTweenText({
    required this.text,
    this.startColor = Colors.red,
    this.endColor = Colors.black,
    this.duration = const Duration(seconds: 2),
    super.key,
  });
  final String text;
  final Color startColor, endColor;
  final Duration duration;
  @override
  State<ColorTweenText> createState() => _ColorTweenTextState();
}

class _ColorTweenTextState extends State<ColorTweenText>
    with SingleTickerProviderStateMixin {
  late AnimationController ctrl;
  late Animation<Color?> _animation;

  @override
  void initState() {
    ctrl = AnimationController(
      vsync: this,
      duration: widget.duration, // Animation duration
    )..repeat(reverse: true); // Repeats the animation in reverse

    _animation = ColorTween(
      begin: widget.startColor, // Starting color
      end: widget.endColor, // Ending color
    ).animate(ctrl);

    _animation.addListener(() {
      setState(() {}); // Rebuilds the widget with the new color
    });
    super.initState();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
          color: _animation.value,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ));
  }
}

/// --- Main App ---
class SurveyApp extends StatelessWidget {
  const SurveyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Political Quiz',
      debugShowCheckedModeBanner: false, // debug tag removed
      theme: ThemeData.dark().copyWith(
        // Dark & classy theme
        scaffoldBackgroundColor: const Color(0xFF0B0F14),
        primaryColor: const Color(0xFF0A84FF),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF0A84FF),
          secondary: const Color(0xFFFF6B6B),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF071126),
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A84FF),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Roboto',
            ),
      ),
      home: const QuestionPage(),
    );
  }
}

/// Represents a Yes/No question and each candidate's stance (true = Yes, false = No)
class Question {
  final String text;
  final Map<String, bool> stance; // candidateName -> agrees(true)/disagrees(false)
  const Question(this.text, this.stance);
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  // ======= CANDIDATES =======
  // To add a new candidate: add their name to this list AND add a boolean entry
  // for that candidate in each Question.stance map below.
  final List<String> candidates = const ['Donald Trump', 'Kamala Harris', 'Bernie Sanders', 'Joe Biden', 'Mitch McConnell', 'Alexandria OcasioCortez'];

  // ======= QUESTIONS =======
  // All questions must have a stance map with an entry for each candidate above.
  // To add a question: append another Question(...) here with a stance map.
  final List<Question> _questions = const [
    Question('Support fully federally funded single‑payer Medicare for All?', {
      'Donald Trump': false,
      'Kamala Harris': false,
      'Bernie Sanders': true,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Increase taxes on the wealthy significantly?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Secure the border with stronger measures?', {
      'Donald Trump': true,
      'Kamala Harris': true,
      'Bernie Sanders': false,
      'Joe Biden': false,
      'Mitch McConnell': true,
      'Alexandria OcasioCortez': false,
    }),
    Question('Support declaring a climate emergency?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': true,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Do you think gay marriage should be legal?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': true,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Do you support increased legal protections for transgender individuals?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': true,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Should abortion be legal?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': true,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Should marijuana be federally legal?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Do you support abolishing the Senate Fillabuster?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Do you support active engagement with U.S. alliances and multilateral institutions (NATO, UN, etc.)?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': true,
      'Mitch McConnell': true,
      'Alexandria OcasioCortez': true,
    }),
    Question('Do you support using broad, across-the-board tariffs as a primary tool of economic policy?', {
      'Donald Trump': true,
      'Kamala Harris': false,
      'Bernie Sanders': false,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': false,
    }),
    Question('Do you support increasing federal minimum wage above current levels?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': true,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
    Question('Do you support broad mandatory national‑service or mandatory public‑service programs or mandatory military involvement for citizens?', {
      'Donald Trump': false,
      'Kamala Harris': false,
      'Bernie Sanders': false,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': false,
    }),
    Question('Do you support decriminalization of heavy drugs (cocaine, heroin, etc.)?', {
      'Donald Trump': false,
      'Kamala Harris': true,
      'Bernie Sanders': true,
      'Joe Biden': false,
      'Mitch McConnell': false,
      'Alexandria OcasioCortez': true,
    }),
  ];

  // -1 = unanswered, 0 = No, 1 = Yes
  late List<int> _answers;

  @override
  void initState() {
    super.initState();
    _answers = List<int>.filled(_questions.length, -1);
  }

  // Calculate scores based on answered questions only.
  Map<String, int> _calculateScores() {
    final Map<String, int> scores =
        {for (var c in candidates) c: 0}; // initialize
    for (int i = 0; i < _questions.length; i++) {
      final int ans = _answers[i];
      if (ans < 0) continue; // skip unanswered
      final bool userYes = (ans == 1);
      _questions[i].stance.forEach((cand, candYes) {
        if (userYes == candYes) {
          scores[cand] = (scores[cand] ?? 0) + 1;
        }
      });
    }
    return scores;
  }

  void _showResults() {
    final scores = _calculateScores();
    final int answered =
        _answers.where((a) => a >= 0).length; // number of questions answered
    // compute percentages (avoid division by zero)
    final List<MapEntry<String, double>> results = scores.entries
        .map((e) => MapEntry(e.key, answered > 0 ? 100.0 * e.value / answered : 0.0))
        .toList();
    results.sort((a, b) => b.value.compareTo(a.value));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsPage(results: results)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            // Header with animated title (red to blue)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const ColorTweenText(
                text: 'WHOS YOUR POLITICIAN?',
                startColor: Colors.red,
                endColor: Colors.blue,
                duration: Duration(milliseconds: 1200),
              ),
            ),

            // Short description row
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF071226),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Answer the yes/no questions below. At the end, see which candidate you align with most.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            // Questions list - scrollable
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, i) {
                  final q = _questions[i];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF081421),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(q.text,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),

                        // Use RadioListTile for questions? (Yes / No)
                        RadioListTile<int>(
                          title: const Text('Yes'),
                          value: 1,
                          groupValue: _answers[i],
                          onChanged: (v) {
                            setState(() {
                              _answers[i] = v!;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                        ),
                        RadioListTile<int>(
                          title: const Text('No'),
                          value: 0,
                          groupValue: _answers[i],
                          onChanged: (v) {
                            setState(() {
                              _answers[i] = v!;
                            });
                          },
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Reset answers button
                TextButton(
                        style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 0, 153, 255)),
                      ),
                  onPressed: () {
                    setState(() {
                      _answers = List<int>.filled(_questions.length, -1);
                    });
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: _showResults,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 124, 0, 0), // Sets the background color to red
                  ),
                  child: const Text('View Results'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Results screen - sorted by percentage from highest to lowest
class ResultsPage extends StatelessWidget {
  final List<MapEntry<String, double>> results;
  const ResultsPage({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Alignment')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text(
                'Candidates sorted by agreement %',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: results.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.white12),
                itemBuilder: (context, i) {
                  final e = results[i];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.key, style: const TextStyle(fontSize: 18)),
                      Text('${e.value.toStringAsFixed(1)}%',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
              ),
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

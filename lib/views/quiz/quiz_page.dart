import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/data/providers/quiz_provider.dart';
import 'package:quiz_app/views/quiz/quiz_state.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.catgoryId}) : super(key: key);
  final int catgoryId;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _quizIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Consumer(
        builder: (context, ref, child) {
          return Text(ref.watch(scoreProvider).toString());
        },
      )),
      body: Consumer(
        builder: (context, ref, child) {
          final _quizes = ref.watch(quizProvider(widget.catgoryId));
          return _quizes.when(
              data: (game) {
                List<String> options = [
                  game[_quizIndex].correctAnswer,
                  ...game[_quizIndex].incorrectAnswers
                ];
                options.shuffle();
                return Column(
                  children: [
                    Card(
                      child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.blue,
                          )),
                          child: Html(
                            data: game[_quizIndex].question,
                            style: {
                              'p': Style(
                                fontWeight: FontWeight.bold,
                              ),
                            },
                          )),
                    ),
                    ...options.map((e) => ListTile(
                          leading: Text((options.indexOf(e) + 1).toString()),
                          onTap: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            if (e == game[_quizIndex].correctAnswer) {
                              ref.read(scoreProvider.notifier).state++;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                content: Text('Correct Answer'),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                content: Text('Incorrect Answer'),
                              ));
                            }
                          },
                          title: Text(e),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _quizIndex++;
                          });
                        },
                        child: const Text('Next'))
                  ],
                );
              },
              error: (err, s) {
                return Text(err.toString());
              },
              loading: () => const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}

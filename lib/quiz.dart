import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State createState() => _Quiz();
}

class SingleModelClass {
  final String? question;
  final List<String>? options;
  final int? answerIndex;
  const SingleModelClass({this.question, this.options, this.answerIndex});
}

class _Quiz extends State {
  List questionList = [
    const SingleModelClass(
      question:
          "What is the primary programming language used for flutter app development? ",
      options: ["Java", "swift", "Dart", "Python"],
      answerIndex: 2,
    ),
    const SingleModelClass(
      question: "Which company developed flutter?",
      options: ["Google", "Apple", "Microsoft", "Facebook"],
      answerIndex: 0,
    ),
    const SingleModelClass(
      question: "who is the official mascot of flutter ",
      options: ["Fluttery", "dash", "dartie", "Flappy"],
      answerIndex: 1,
    )
  ];
  bool isScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnsCount = 0;

  MaterialStatePropertyAll<Color?>? CheckAns(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == questionList[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(
          Color.fromARGB(255, 163, 129, 211),
        );
      }
    } else {
      return const MaterialStatePropertyAll(
        Color.fromARGB(255, 163, 129, 211),
      );
    }
  }

  void pageValidation() {
    if (selectedAnswerIndex == -1) {
      return;
    }

    if (selectedAnswerIndex == questionList[questionIndex].answerIndex) {
      correctAnsCount += 1;
    }

    if (selectedAnswerIndex != -1) {
      if (questionIndex == questionList.length - 1) {
        setState(() {
          isScreen = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex++;
      });
    }
  }

  Scaffold screenCheck() {
    if (isScreen == true) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 163, 129, 211),
            centerTitle: true,
            title: const Text(
              "Quiz App",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Questions :",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      )),
                  Text("${questionIndex + 1}/${questionList.length}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("${questionList[questionIndex].question}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    fixedSize:
                        const MaterialStatePropertyAll(Size.fromWidth(400)),
                    backgroundColor: CheckAns(0),
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectedAnswerIndex == -1) {
                        selectedAnswerIndex = 0;
                      }
                    });
                  },
                  child: Text("A. ${questionList[questionIndex].options[0]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    fixedSize:
                        const MaterialStatePropertyAll(Size.fromWidth(400)),
                    backgroundColor: CheckAns(1),
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectedAnswerIndex == -1) {
                        selectedAnswerIndex = 1;
                      }
                    });
                  },
                  child: Text("B. ${questionList[questionIndex].options[1]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    fixedSize:
                        const MaterialStatePropertyAll(Size.fromWidth(400)),
                    backgroundColor: CheckAns(2),
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectedAnswerIndex == -1) {
                        selectedAnswerIndex = 2;
                      }
                    });
                  },
                  child: Text("C. ${questionList[questionIndex].options[2]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ))),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    fixedSize:
                        const MaterialStatePropertyAll(Size.fromWidth(400)),
                    backgroundColor: CheckAns(3),
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectedAnswerIndex == -1) {
                        selectedAnswerIndex = 3;
                      }
                    });
                  },
                  child: Text("D. ${questionList[questionIndex].options[3]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ))),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                pageValidation();
              });
            },
            child: const Icon(Icons.forward),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 163, 129, 211),
          centerTitle: true,
          title: const Text(
            "Quiz App",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
          ),
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmoGE8pGXE4aUURpYIETqvw6W5RZB-iVvKdw&usqp=CAU",
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Congratulation You Have Sccessfully Completed Test ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 20,
            ),
            Text("Score $correctAnsCount/${questionList.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionIndex = 0;
                    selectedAnswerIndex = -1;
                    isScreen = true;
                    correctAnsCount = 0;
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(fontWeight: FontWeight.normal),
                ))
          ]),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return screenCheck();
  }
}

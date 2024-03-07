import 'package:flutter/material.dart';
import 'package:quizapp/quiz.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var txtUserNameController = TextEditingController();

  var txtUseremailController = TextEditingController();

  var txtPhoneController = TextEditingController();

  var txtUserPwdController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? _validatename(value) {
    if (value!.isEmpty) {
      return "Please Enter a Username";
    }
    RegExp name = RegExp("^[[A-Z]|[a-z]][[A-Z]|[a-z]|\\d|[_]]{7,29}");
    if (!name.hasMatch(value)) {
      return "Pleae enter a valid Username";
    }

    return null;
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return "please Enter an Email-Id";
    }
    RegExp Email = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!Email.hasMatch(value)) {
      return "Please enter a valid Email";
    }

    return null;
  }

  String? _validatePhonenumber(value) {
    if (value!.isEmpty) {
      return "Please Enter a Phone number";
    }
    RegExp Phone = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (!Phone.hasMatch(value)) {
      return "Please enter a 10 digit  Phone Number";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("LOGIN "),
          titleTextStyle: const TextStyle(
            fontSize: 20,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 163, 129, 211),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 247, 249, 251),
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://tse3.mm.bing.net/th?id=OIP.1MPoNDAf3_Zuu2I3OX0I5wHaHa&pid=Api&P=0&h=180",
                      height: 100,
                      width: 100),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: txtUserNameController,
                    decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.person)),
                    validator: _validatename,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: txtUseremailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: const Icon(Icons.email)),
                    validator: _validateEmail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: txtPhoneController,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        prefixIcon: Icon(Icons.phone)),
                    validator: _validatePhonenumber,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: txtUserPwdController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon:
                              const Icon(Icons.remove_red_eye_outlined)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        } else {
                          return null;
                        }
                      }
                      // validator: _validatepassword,
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 163, 129, 211),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(_formkey.currentContext!)
                              .showSnackBar(
                            const SnackBar(
                              content: Text("Successful login!"),
                            ),
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Quiz()));
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:devhathon/auth%20screen/login_screen.dart';
import 'package:devhathon/utils/utils.dart';
import 'package:devhathon/widgets/roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  // final contactController = TextEditingController();
  bool _obsecureText = true;
  bool circularLoader = false;
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  // final CollectionReference fireStore =
  //     FirebaseFirestore.instance.collection("users");

  void obsecureText() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  Future<void> signUp() async {
    try {
      setState(() {
        circularLoader = true;
      });

      await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      // String id = DateTime.now().millisecondsSinceEpoch.toString();
      // String uid = auth.currentUser!.uid;
      // await fireStore.doc(uid).set({
      //   'id': uid,
      //   'username': userNameController.text.toString(),
      //   'contact': contactController.text.toString(),
      //   'email': emailController.text.toString()
      // });
      setState(() {
        circularLoader = false;
      });
      Utils().toastMessage("Your account has been successfully registered");

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      setState(() {
        circularLoader = false;
      });
      Utils().toastMessage(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // contactController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffFFFFFF),
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Color.fromRGBO(5, 50, 150, 1),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/signup.gif",
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: userNameController,
                          decoration: InputDecoration(
                            hintText: "User Name",
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Color(0xffB28CFF),
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.blue.shade50,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your User Name';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            suffixIcon: const Icon(
                              Icons.alternate_email,
                              color: Color(0xffB28CFF),
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.blue.shade50,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your email';
                            }
                            final emailRegex = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: _obsecureText,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xffB28CFF),
                            ),
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                obsecureText();
                              },
                              child: Icon(
                                _obsecureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xffB28CFF),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.blue.shade50,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.blue.shade100,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.5,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your Password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RoundButton(
                    circularLoader: circularLoader,
                    title: 'Sign Up',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        signUp();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ?   ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB28CFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

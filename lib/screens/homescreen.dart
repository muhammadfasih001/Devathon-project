import 'package:devhathon/auth%20screen/login_screen.dart';
import 'package:devhathon/screens/doctor_screen.dart';
import 'package:devhathon/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userId;

  Future<void> getUserData() async {
    final User? user = auth.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
      });
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Utils().toastMessage("Sign Out");

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (error) {
      Utils().toastMessage(error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffB28CFF),
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffB28CFF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                signOut();
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                            ),
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Color.fromARGB(255, 162, 118, 250),
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Let's find your top",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "doctor!",
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Doctor's Inn",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoctorScreen()));
                        },
                        child: rowCont1("assets/images/Group 24.png", "All"),
                      ),
                      rowCont1("assets/images/Group 20.png", "Cardialogy"),
                      rowCont1("assets/images/Group 21.png", "Medicine"),
                      rowCont1("assets/images/Group 25.png", "General"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: cont2("assets/images/d1.png", "Dr. Maria Waston",
                      "Heart Surgeon, London, England"),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: cont2("assets/images/d3.png", "Dr. Maria Waston",
                      "Heart Surgeon, London, England"),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: cont2("assets/images/d4.png", "Dr. Maria Waston",
                      "Heart Surgeon, London, England"),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: cont2("assets/images/d1.png", "Dr. Maria Waston",
                      "Heart Surgeon, London, England"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget rowCont1(String url, String text) {
  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Image.asset(url),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

Widget cont2(String url, String text1, String txt2) {
  return InkWell(
    child: Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[100]!,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  url,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.asset("assets/images/Star.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  txt2,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 33,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Appointment",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

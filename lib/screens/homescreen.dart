import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhathon/auth%20screen/login_screen.dart';
import 'package:devhathon/screens/appointment_screen.dart';
import 'package:devhathon/screens/doctor_screen.dart';
import 'package:devhathon/screens/widgets/categories.dart';
import 'package:devhathon/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userId;
  final firestore = FirebaseFirestore.instance.collection("doctor").snapshots();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.center,
                  //   end: Alignment.topCenter,
                  //   colors: [
                  //     Colors.black,
                  //     Color(0xffB28CFF),
                  //   ],
                  // ),
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
                            backgroundColor: Color.fromARGB(255, 162, 118, 250),
                            backgroundImage:
                                AssetImage("assets/images/profile.jpg"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Back",
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Let's find",
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "your top doctors!",
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Doctor's Inn",
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DoctorScreen(),
                            ),
                          );
                        },
                        child: const Categories(
                            url: "assets/images/all.png", text: "All"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/pediatrician.png",
                          text: "Pediatrician"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/heart.png", text: "Cardiology"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/surgeon.png", text: "Surgeon"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/medicine.png", text: "Medicine"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/pathologist.png",
                          text: "Pathologist"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/general.png", text: "General"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Categories(
                          url: "assets/images/psychiatrist.png",
                          text: "Psychiatrist"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: firestore,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xffB28CFF),
                        ),
                      );
                    }

                        if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.docs.isEmpty) {
                     
                      return const Center(child:  Text("No Data Available",style: TextStyle(fontSize: 30,),),);
                    }
                    if (snapshot.hasError) {
                      Utils().toastMessage(
                          "An error occurred: ${snapshot.error.toString()}");
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot dataIndex = snapshot.data!.docs[index];
                        String assetImage = dataIndex["image"];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppointmentScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(17),
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
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(3, 3),
                                    color: Colors.grey[300]!,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.asset(
                                            assetImage,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/Star.png",
                                            ),
                                            Text(
                                              dataIndex["rating"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataIndex["name"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          dataIndex["specialist"],
                                          style: GoogleFonts.poppins(
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Appointment",
                                              style: GoogleFonts.poppins(
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
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

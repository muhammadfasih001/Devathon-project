import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xffB28CFF)));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 28,
                color: Colors.black,
              ),
            );
          },
        ),
        title: const Text(
          "Top Doctor",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  enableSuggestions: true,
                  autocorrect: true,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "Search Doctor",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.blue.shade50,
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.blue.shade100,
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: cont2("assets/images/d1.png", "Dr. Maria Waston",
                  "Heart Surgeon, Dubai"),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: cont2("assets/images/d7.png", "Dr. Rodger Struck",
                  "Heart Surgeon, London, England"),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: cont2("assets/images/d6.png", "Dr. Kathy Pacheco",
                  "Heart Surgeon, New Zealand"),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: cont2("assets/images/d4.png", "Dr. Lorri Warf",
                  "Heart Surgeon, Africa"),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: cont2("assets/images/d5.png", "Dr. Chris Glasser",
                  "Heart Surgeon, London, Dubai"),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: cont2("assets/images/d2.png", "Dr. Stevi Jessi",
                  "Heart Surgeon, India"),
            ),
          ],
        ),
      )),
    );
  }
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

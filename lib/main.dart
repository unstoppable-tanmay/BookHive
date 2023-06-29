import 'package:bookhive/Pages/ForgotPassword.dart';
import 'package:bookhive/Pages/Login.dart';
import 'package:bookhive/Pages/OnBoarding.dart';
import 'package:bookhive/Pages/ViewBooks.dart';
import 'package:bookhive/Pages/admin/AdminAccount.dart';
import 'package:bookhive/Pages/admin/AdminManageLibrarian.dart';
import 'package:bookhive/Pages/admin/AdminManageStudent.dart';
import 'package:bookhive/Pages/librarian/LibrarianAcceptRequest.dart';
import 'package:bookhive/Pages/librarian/LibrarianAccount.dart';
import 'package:bookhive/Pages/librarian/LibrarianAddBooks.dart';
import 'package:bookhive/Pages/student/StudentAccount.dart';
import 'package:bookhive/Pages/student/StudentRequests.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'Pages/admin/AdminAllUsers.dart';
import 'Services/getData.dart';
import 'firebase_options.dart';

int? initScreen;
bool logined = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (FirebaseAuth.instance.currentUser != null) {
    await getUserData(FirebaseAuth.instance.currentUser!.uid);
    await getBooks();
    if (UserType == 'student') {
      await getRequest();
    } else if (UserType == 'librarian') {
      await getAllRequest();
    } else if (UserType == 'admin') {
      await getUsers();
    }
    logined = true;
  } else {
    logined = false;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookHive',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          // First Screens
          '/Login': (context) => const Login(),
          '/ForgotPassword': (context) => const ForgotPassword(),
          '/OnBoarding': (context) => const OnBoarding(),
          // Student pages
          '/StudentAccount': (context) => const StudentAccount(),
          '/StudentRequests': (context) => const StudentRequest(),
          // Librarian Pages
          '/LibrarianAccount': (context) => const LibrarianAccount(),
          '/LibrarianAddBooks': (context) => const LibrarianAddBooks(),
          '/LibrarianAcceptRequest': (context) =>
              const LibrarianAcceptRequest(),  
          // Admin pages
          '/AdminAccount': (context) => const AdminAccount(),
          '/AdminManageLibrarian': (context) => const AdminManageLibrarian(),
          '/AdminManageStudent': (context) => const AdminManageStudent(),
          '/AdminAllUsers': (context) => const AdminAllUsers(),
        },
        home: initScreen == 1
            ? logined
                ? UserType == 'student'
                    ? const ViewBooks(
                        usertype: 'student',
                      )
                    : UserType == 'librarian'
                        ? const ViewBooks(
                            usertype: 'librarian',
                          )
                        : UserType == 'admin'
                            ? const ViewBooks(
                                usertype: 'admin',
                              )
                            : const Login()
                : const Login()
            : const OnBoarding());
  }
}

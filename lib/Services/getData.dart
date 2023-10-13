import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var db = FirebaseFirestore.instance;

class BookData {
  final String name;
  final String author;
  final String image;
  final String color;
  final String star;
  final String pages;
  final String size;
  final String id;

  BookData(
      {required this.id,
      required this.image,
      required this.color,
      required this.name,
      required this.author,
      required this.star,
      required this.pages,
      required this.size});
}

class UserData {
  final String name;
  final String email;
  final String id;
  final String branch;
  final String role;
  final String uid;

  UserData(
      {required this.uid,
      required this.name,
      required this.email,
      required this.id,
      required this.branch,
      required this.role});
}

class RequestData {
  final String book;
  final DateTime date;
  final String status;
  final String uid;
  final String id;
  final String student;

  RequestData({
    required this.student,
    required this.id,
    required this.book,
    required this.date,
    required this.status,
    required this.uid,
  });
}

List<BookData> Books = [];
List<RequestData> Requests = [];
List<UserData> Users = [];
UserData? Userdata;
String UserType = '';
String Uid = '';

setBooks(List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
  Books = [];
  Books.addAll(data.map((e) => BookData(
      id: e.get('id'),
      image: e.get('image'),
      color: e.get('color'),
      name: e.get('name'),
      author: e.get('author'),
      star: e.get('star'),
      pages: e.get('pages'),
      size: e.get('size'))));
}

setRequests(List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
  Requests = [];
  for (var element in data) {
    Requests.add(RequestData(
        student: element.get('student'),
        id: element.get('id'),
        book: element.get('book'),
        date: element.get('date').toDate(),
        status: element.get('status'),
        uid: element.get('uid')));
  }
}

setUsers(List<QueryDocumentSnapshot<Map<String, dynamic>>> data) {
  Users = [];
  for (var element in data) {
    Users.add(UserData(
      uid: element.get('uid'),
      role: element.get('role'),
      id: element.get('id'),
      email: element.get('email'),
      branch: element.get('branch'),
      name: element.get('name'),
    ));
  }
}

setUser(data) {
  UserType = data.get('role');
  Userdata = UserData(
      uid: data.get('uid'),
      name: data.get('name'),
      email: data.get('email'),
      id: data.get('id'),
      branch: data.get('branch'),
      role: data.get('role'));
}

Color hexToColor(String code) {
  return Color(int.parse(code, radix: 16) + 0xFF000000);
}

getUserData(String uid) async {
  var user = await db.collection('user').doc(uid).get();
  UserType = user.get('role');
  setUser(user);
  Uid = uid;
}

getUsers() async {
  await db
      .collection('user')
      .where('role', whereIn: ['student', 'librarian'])
      .get()
      .then((value) {
        setUsers(value.docs);
      });
  print(Users.length);
}

getBooks() async {
  await db.collection('books').get().then((value) {
    setBooks(value.docs);
  });
}

getRequest() async {
  await db
      .collection('requests')
      .where('uid', isEqualTo: Uid)
      .get()
      .then((value) {
    setRequests(value.docs);
  });
}

getAllRequest() async {
  await db
      .collection('requests')
      .where(
        'status',
        isEqualTo: 'requested',
      )
      .get()
      .then((value) => setRequests(value.docs));
}

showToast(data) async {
  Fluttertoast.showToast(
      msg: data.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black26,
      textColor: Colors.black87,
      fontSize: 16.0);
}

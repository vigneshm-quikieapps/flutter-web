import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web_dashboard/model/admin.dart';

class AuthService {
  //Handle Authentication
  // handleAuth() {
  //   return StreamBuilder(
  //     stream: FirebaseAuth.instance.onAuthStateChanged,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //        // return HomePage();
  //       } else {
  //        // return LoginPage();
  //       }
  //     },
  //   );
  // }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((user) {
      print('Signed in');
    }).catchError((e) {
      print(e);
    });
  }
}

// class AuthServices {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   Stream<User> get user {
//     return auth.authStateChanges();
//   }

//   User getCurrentUser() {
//     try {
//       final user = auth.currentUser;
//       if (user != null) {
//         return user;
//       }
//       return null;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   Future registerWithEmailAndPassword(String lowerCase, String trim, {emailid, password}) async {
//     try {
//       final result = await auth.createUserWithEmailAndPassword(
//           email: emailid, password: password);

//       return result;
//     } catch (error) {
//       throw error;
//     }
//   }

//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       final result = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return result;
//     } catch (error) {
//       print(error.toString());
//       throw error;
//     }
//   }

//   // Future<Admin> validateAdmin(String email, String password) async {
//   //   Admin admin;
//   //   await firebaseFirestore
//   //       .collection("Admins")
//   //       .get()
//   //       .then((doc) => doc.docs.forEach((element) {
//   //             if (element.data()['email'] == email) {
//   //               if (element.data()['password'] == password) {
//   //                 admin = Admin(
//   //                     userType: element.data()['userType'],
//   //                     password: element.data()['password'],
//   //                     userId: element.id,
//   //                     email: email,
//   //                     name: element.data()['name'],
//   //                     phoneNumber: element.data()['phoneNumber']);
//   //               }
//   //             }
//   //           }));
//   //   return admin;
//   // }

//   // Future fetchAdmin(String userId) async {
//   //   Admin admin;
//   //   await firebaseFirestore
//   //       .collection("Admins")
//   //       .doc(userId)
//   //       .get()
//   //       .then((element) => {
//   //             admin = Admin(
//   //                 userId: element.id,
//   //                 email: element.data()['email'],
//   //                 name: element.data()['name'],
//   //                 phoneNumber: element.data()['phoneNumber'],
//   //                 userType: element.data()['userType'],
//   //                 isBlocked: element.data()['isBlocked'] ?? false),
//   //           });

//   //   return admin;
//   // }

//   Future resetPassword(String email) async {
//     await auth.sendPasswordResetEmail(email: email);
//   }

//   Future signOut() async {
//     try {
//       await auth.signOut();
//     } catch (error) {
//       print(error.toString());
//     }
//   }
// }

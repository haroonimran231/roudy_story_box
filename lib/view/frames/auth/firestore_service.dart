// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:roudy_story_box/view/frames/auth/user_profile.dart';

// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> createUserProfile(UserProfile userProfile) async {
//     try {
//       await _firestore.collection('users').doc(userProfile.uid).set({
//         'name': userProfile.name,
//         'email': userProfile.email,
//       });
//     } catch (e) {
//       print('Error creating user profile: $e');
//     }
//   }

//   Future<UserProfile?> getUserProfile(String uid) async {
//     try {
//       final DocumentSnapshot snapshot =
//           await _firestore.collection('users').doc(uid).get();

//       if (snapshot.exists) {
//         return UserProfile(
//           uid: uid,
//           name: snapshot['displayName'],
//           email: snapshot['email'],
//           password: snapshot['password'],
//         );
//       }
//     } catch (e) {
//       print('Error fetching user profile: $e');
//     }
//     return null;
//   }
// }

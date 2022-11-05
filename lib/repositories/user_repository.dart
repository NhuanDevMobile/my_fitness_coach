import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:global_configs/global_configs.dart';
import 'package:my_fitness_coach/models/user_model.dart';

import '../utils/singleton.dart';

String databaseRoot = GlobalConfigs().get("databaseRoot");
final FirebaseAuth auth = FirebaseAuth.instance;

class UserRepository {
  static final usersRef = FirebaseFirestore.instance
      .collection('${databaseRoot}users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

//Register with Email And Password
  static signUpWithEmail(UserModel user, String email, String password,
      Function finish, Function catchError) async {
    var uid = '';
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      uid = userCredential.user!.uid;
      if (uid != '') {
        addUser(user, (value) async {
          user.uid = uid;
          user.id = value.id;
          CollectionReference users =
              FirebaseFirestore.instance.collection('${databaseRoot}users');
          await users
              .doc(user.id)
              .update(user.toJson())
              .then((value) => finish(value))
              .catchError((error) => catchError(error));
        }, (msgError) {
          catchError(msgError);
        });
      }
    } on FirebaseAuthException catch (e) {
      catchError(e.message);
    }
  }

  static addUser(UserModel user, Function callBack, Function msgError) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('${databaseRoot}users');
    await users
        .add(user.toJson())
        .then((value) => callBack(value))
        .catchError((error) => msgError(error));
  }
//Login with Email And Password

  static login(email, password, Function callBack) async {
    bool isLogin = false;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (isAuthenticated()) {
        User? user = UserRepository.getCurrentUser();
        if (user == null) return;
        //get profile
        var profileUsers = await UserRepository.getUser(user.uid);
        if (profileUsers[0].data().uid != null) {
          print("Nhuan--${profileUsers[0].data().uid}");
          isLogin = true;
          UserModel userModel = profileUsers[0].data();
          print("Nhuan--${userModel.lastName}");
          await Singleton().signInCompleted(userModel);
          // await NotificationSetting.instance
          //     .updateTokenToUser(userModel.id.toString());
        }
        callBack(isLogin, "");
      }
      callBack(isLogin, "");
    } on FirebaseAuthException catch (e) {
      callBack(false, e.message);
    }
  }

  static bool isAuthenticated() {
    bool result = false;
    User? user = getCurrentUser();
    if (user != null) {
      result = true;
    }
    return result;
  }

  static User? getCurrentUser() {
    User? user = auth.currentUser;
    return user;
  }

  //Get User
  static Future<List<QueryDocumentSnapshot<UserModel>>> getUser(
      String uid) async {
    List<QueryDocumentSnapshot<UserModel>> users = await usersRef
        .where('uid', isEqualTo: uid)
        .get()
        .then((snapshot) => snapshot.docs);
    return users;
  }
}

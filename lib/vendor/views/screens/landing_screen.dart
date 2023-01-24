import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_only/vendor/models/vendor_user_models.dart';
import 'package:vendor_only/vendor/views/auth/vendor_register.dart';
import 'package:vendor_only/vendor/views/screens/main_vendor_screen.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final CollectionReference _vendorsStream = FirebaseFirestore.instance.collection('vendors');
    return Scaffold(
      body:  StreamBuilder<DocumentSnapshot>(
        stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          VendorUserModels _vendorUserModel = VendorUserModels.fromJson(snapshot.data!.data()! as Map<String, dynamic>);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(_vendorUserModel.image.toString(), width: 80, fit: BoxFit.cover,),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(_vendorUserModel.state.toString()),
                  Text(_vendorUserModel.businessName.toString(),
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Your Application Has Been Sent To Shop Admin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: ()async{
                        await _auth.signOut();
                      },
                      child: const Text('SignOut')
                  )
                ],
              ),
            );




        }
        )
    );
  }
}

import 'package:authentification/pages/Navigation_drawer_widgets.dart';
import 'package:authentification/screens/Data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool isloading=false;
  final user = FirebaseAuth.instance.currentUser;
  bool _nameValid=true;
  bool _bioValid=true;

  Column buildCountColumn (String label, int count){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 22.0,fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

      ],
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: Header(context,titleText:"profile"),
      body: Center(

        child: Column(
          // children: [
          //
          //   Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Column(
          //         children: [
          //           CircleAvatar(
          //             radius: 40.0,
          //             backgroundColor: Colors.grey,
          //             backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),),
          //           const SizedBox(height: 12,),
          //           Container(
          //
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                 image: AssetImage(currentUser.imageUrl),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //
          //             child: Container(
          //               child: Column(
          //                 children: [
          //                   Text(mail,style: TextStyle(fontWeight: FontWeight.bold),),
          //                   Text(mail,style: TextStyle(fontWeight: FontWeight.bold),
          //                     maxLines: 3,),
          //                 ],
          //               ),
          //             ),
          //
          //
          //           ),
          //
          //
          //         ],
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: Column(
          //           children: [
          //             Row(
          //               mainAxisSize: MainAxisSize.max,
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 buildCountColumn("posts",0),
          //                 buildCountColumn("followers",0),
          //                 buildCountColumn("following",0),
          //               ],
          //
          //             ),
          //             const SizedBox(height: 25.0,),
          //
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          //   Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //
          //       ElevatedButton(
          //         onPressed: ()=> Navigator.push(context,
          //           MaterialPageRoute(builder: (context)=> EditPage(user: currentUser,),),
          //         ),
          //         child: Text("Edit",
          //           style: TextStyle(
          //             fontStyle: FontStyle.italic,
          //             fontWeight: FontWeight.w400,
          //             fontSize: 25,
          //           ),
          //         ),),
          //       const SizedBox(width: 12,),
          //       ElevatedButton(
          //
          //         onPressed: ()=>{},
          //         child: Text("Follow",
          //           style: TextStyle(
          //             fontStyle: FontStyle.italic,
          //             fontWeight: FontWeight.w400,
          //             fontSize: 25,
          //           ),
          //         ),),
          //     ],
          //   ),
          // ],

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/welcome.jpg',height: 300,width: 500,),
            Text("Your email is ${user?.email}",style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),)
          ],
        ),
      ),
    );
  }
}


AppBar Header(context, {bool isAppTitle=false, String titleText=''}){

  return AppBar(
    title: Text(isAppTitle ? 'Adopt me' : titleText,style: TextStyle(
      color: Colors.white,
      fontSize: 50,
      fontWeight: FontWeight.bold,
    ),),
    centerTitle: true,
    backgroundColor: Colors.green,

  );
}

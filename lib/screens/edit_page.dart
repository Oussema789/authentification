
import 'package:authentification/screens/Data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';




class EditPage extends StatefulWidget {
  final User1 user;
  const EditPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool isloading=false;
  late User1 user;
  bool _nameValid=true;
  bool _bioValid=true;

  @override
  Column buildDisplayNameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text("Display Name",
            style: TextStyle(color: Colors.grey,
            ),
          ),

        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Update Display Name",
          ),
        )
      ],
    );
  }
  Column buildBioField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text("bio",
            style: TextStyle(color: Colors.grey,
            ),
          ),

        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Update bio",
          ),
        )
      ],
    );
  }
  Widget buildFieldContainer(){
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'currentUser.name',
            labelText: 'Edit your Name',
          ),
          onSaved: (String? value) {
          },
          validator: (String? value) {
            return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
          },
        )
      ],
    );
  }





  updateProfileData(){
    setState(() {
      nameController.text.trim().length <3 ||
          nameController.text.isEmpty ? _nameValid = false : _nameValid=true;
      bioController.text.trim().length > 100 ? _bioValid = false : _bioValid=true;
    });
    // if( _nameValid && _bioValid){
    //
    // }
  }







  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit",style: TextStyle(fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
          color: Colors.black,
        ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.done,
              color: Colors.green,
              size: 30.0,),),
        ],

      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 16.0,bottom: 8.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
                  ),),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      buildDisplayNameField(),
                      const SizedBox(height: 15.0,),
                      buildBioField(),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: updateProfileData,
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FlatButton.icon(
                    onPressed: ()=>{},
                    icon: Icon(Icons.cancel,color: Colors.red),
                    label: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



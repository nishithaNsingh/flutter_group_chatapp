import 'package:flutter/material.dart';
import 'package:flutter_group_chatapp/pages/group/group_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Chat App"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => showDialog(context: context,
              builder: (BuildContext context )=> AlertDialog(
                title: Text(" Please enter your name"),
                content: Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.length<3){
                        return "use proper name";
                      }
                      return null;
                    },
                    controller: nameController,
                  ),
                ),
                  actions:[
                    TextButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                        String name = nameController.text;
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GroupPage(name: name,),
                        ),
                        );
                      }
                      },
                        child: Text("Enter",
                        style: TextStyle(fontSize: 16,
                        color: Colors.black
                        ),
                        ),
                    ),
                    TextButton(onPressed: (){
                      nameController.clear();
                      Navigator.pop(context);
                    },
                      child: Text(
                        "Cancle",
                        style: TextStyle(fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ]

              ),

        ),
          child: Text(
            "Initiate Group chat",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
//import 'package:blocknote/creating.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocNote()
    );
  }
}

class BlocNote extends StatefulWidget {
  const BlocNote({super.key});

  @override
  State<BlocNote> createState() => _BlocNoteState();
}

class _BlocNoteState extends State<BlocNote> {
  
  List notesList = [
    "Ce ci est un Test"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Bloc Note", style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      
      body: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(
                           notesList[index], 
                           style: TextStyle(
                             fontSize: 24
                           ),
                         ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 61, 47)
                            ),
                          onPressed: () {
                            setState(() {
                              notesList.remove(notesList[index]);
                            });
                          }, 
                          child: Icon(Icons.delete),
                        )
            
                    ],
                  )
                ),
              );
            }
     ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => Creation(
                addNote: (String newNote){
                  setState(() {
                    notesList.add(newNote);
                  });
                }
              )
            )
          );
        },
        child: Icon(Icons.add),
        ),

    );
  }
 }


class Creation extends StatelessWidget {
  final Function(String) addNote;
  
  Creation({required this.addNote, super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrez votre nouvelle note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Nom de la Note"
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: (){
                if(_controller.text.isNotEmpty){
                  addNote(_controller.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Ajouter")
            ),
          ],
        ),
      ),
    );
  }
}
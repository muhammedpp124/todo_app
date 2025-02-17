import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

 //create a note and save it i supabase

 final textcontroller = TextEditingController();

  void addNewnote(){
    showDialog(
      context: context,
       builder: (context) => AlertDialog(
        content: TextField(
          controller: textcontroller,
        ),
        actions: [
          TextButton(onPressed: (){
            saveNote();
            Navigator.pop(context);
          }, child: Text("save")
          )
        ],
       ),);
  }


  void saveNote()async{
  await Supabase.instance.client
  .from('notes')
  .insert({ 'body':textcontroller.text});

}



final _notesStream=Supabase.instance.client.from('notes').stream(primaryKey: ['id']);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
        onPressed: addNewnote,
        child: const Icon(Icons.add),
       ),

       body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _notesStream,
        builder: (context, snapshot) {
          //loading
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }

          //loaded

          final notes= snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              //get individual note

              final note = notes[index];


              //get the column you want 
              final noteText = note['body'];

              return Text(noteText);
            },
            );
        },
       ),

    );
  }
}
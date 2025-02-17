import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/note_page.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url:   "https://fjacqengukftjmzwskdo.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqYWNxZW5ndWtmdGptendza2RvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk3ODEzNTMsImV4cCI6MjA1NTM1NzM1M30.W4kk1dtTyzM-D7WjsfYQrAuTaPnq6hlWmnJ2rbLsi-M",
      
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:NotesPage(),
    );
  }
}


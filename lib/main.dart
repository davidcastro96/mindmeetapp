import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi aplicación con rutas',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(), // Ruta de inicio de sesión
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _signInWithEmailAndPassword();
              },
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Registro nuevo usuario'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Aquí puedes realizar acciones adicionales después de iniciar sesión exitosamente
      print('Inicio de sesión exitoso: ${userCredential.user?.uid}');
    } catch (e) {
      // Manejo de errores
      print('Error en el inicio de sesión: $e');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Ocurrió un error en el inicio de sesión.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Set<String> _selectedInterests = Set<String>();
  List<String> _interests = ['Interés 1', 'Interés 2', 'Interés 3'];
  DateTime? _selectedDate; // Agrega el signo de interrogación (?) para permitir nulos
  String? _selectedInterest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            GestureDetector(
              onTap: () {
                _showDatePicker();
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? _selectedDate.toString().split(' ')[0]
                        : '',
                  ),
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            DropdownButton<String>(
              value: _selectedInterest,
              hint: Text('Selecciona un interés'),
              onChanged: (value) {
                setState(() {
                  _selectedInterest = value;
                });
              },
              items: _interests.map((interest) {
                return DropdownMenuItem(
                  value: interest,
                  child: Text(interest),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar los datos de registro
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900),
      maxTime: DateTime.now(),
      onChanged: (date) {},
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
        });
      },
    );
  }
}

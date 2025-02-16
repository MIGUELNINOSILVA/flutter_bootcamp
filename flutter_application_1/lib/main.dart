import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú Hamburguesa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable para controlar la página actual
  int _selectedIndex = 0;

  // Lista de widgets que representan las páginas
  final List<Widget> _pages = [
    HomePageContent(),
    ProfilePage(),
    CloseCashPage(),
  ];

  // Método para actualizar la página seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Aplicación"),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: SafeArea(
        child: SizedBox(
          width: 300, // Ancho del Drawer
          child: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Espacio para el nombre de la aplicación y versión
                Container(
                  width: double.infinity, // Ocupar el 100% del ancho del Drawer
                  padding: EdgeInsets.all(16.0),
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LENDWISE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Versión 1.0.0",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                // Opciones del menú
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Inicio"),
                        onTap: () {
                          _onItemTapped(0); // Navegar a la página de inicio
                          Navigator.pop(context); // Cerrar el Drawer
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Mi Perfil"),
                        onTap: () {
                          _onItemTapped(1); // Navegar a la página de perfil
                          Navigator.pop(context); // Cerrar el Drawer
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Cierre de Caja"),
                        onTap: () {
                          _onItemTapped(
                              2); // Navegar a la página de cierre de caja
                          Navigator.pop(context); // Cerrar el Drawer
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: _pages[
            _selectedIndex], // Mostrar la página seleccionada dentro de SafeArea
      ),
    );
  }
}

// Página de Inicio
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Esta es la página de Inicio"),
    );
  }
}

// Página de Mi Perfil
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Esta es la página de Mi Perfil"),
    );
  }
}

// Página de Cierre de Caja
class CloseCashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Esta es la página de Cierre de Caja"),
    );
  }
}

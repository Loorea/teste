import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Main(nome: "Dani");
  }
}

class Main extends StatefulWidget {
  final String nome;
  const Main({super.key, required this.nome});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/sentimentos');
        break;
      case 2:
        Navigator.pushNamed(context, '/jornada');
        break;
      case 3:
        Navigator.pushNamed(context, '/playlist');
        break;
      case 4:
        Navigator.pushNamed(context, '/thermometer');
        break;
      case 5:
        Navigator.pushNamed(context, '/contato');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String dataHoje = "terça feira, 26 de setembro";

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD54F),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "⭐ 120 XP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saudação
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Olá",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dataHoje,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Amigo emocional
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF69F0AE),
                      Color(0xFFB9F6CA),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(CupertinoIcons.paw,
                        color: Color(0xFF00011B), size: 28),
                    SizedBox(height: 12),
                    Text(
                      "Seu amigo emocional está aqui!",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Como está se sentindo hoje?",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Avatar e Level
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA3E0FF),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Avatar\nPersonalize",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA3E0FF),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Level\nNível 3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Registrar sentimentos
              Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF8B5FA),
                      Color(0xFFF8CEF9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Registrar Sentimentos",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Termômetro e Playlists
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bar_chart,
                                color: Color(0xFFA3E0FF), size: 28),
                            SizedBox(height: 6),
                            Text(
                              "Termômetro",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.music_note,
                                color: Color(0xFFF8B5FA), size: 28),
                            SizedBox(height: 6),
                            Text(
                              "Playlists",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Semana Atual
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF8B5FA),
                      Color(0xFFF8CEF9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Semana Atual",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text("Seg",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("😊", style: TextStyle(fontSize: 24))
                        ]),
                        Column(children: [
                          Text("Ter",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("🥳", style: TextStyle(fontSize: 24))
                        ]),
                        Column(children: [
                          Text("Qua",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("🥰", style: TextStyle(fontSize: 24))
                        ]),
                        Column(children: [
                          Text("Qui",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("😂", style: TextStyle(fontSize: 24))
                        ]),
                        Column(children: [
                          Text("Sex",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("😅", style: TextStyle(fontSize: 24))
                        ]),
                        Column(children: [
                          Text("Sab",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("😂", style: TextStyle(fontSize: 24))
                        ]),
                        Column(children: [
                          Text("Dom",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54)),
                          SizedBox(height: 8),
                          Text("🤢", style: TextStyle(fontSize: 24))
                        ]),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF8B5FA),
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Sentimentos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: "Jornada"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: "Playlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thermostat), label: "Termômetro"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Contato"),
        ],
      ),
    );
  }
}

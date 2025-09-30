import 'package:flutter/material.dart';

// 1. Removido o MaterialApp que estava aqui.
//    HomeScreen agora retorna diretamente o widget 'Main'.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // O nome do usuário pode ser passado aqui se viesse de outra tela,
    // por exemplo, da tela de login.
    return const Main(nome: "Dani");
  }
}

// 2. Convertido para StatefulWidget para gerenciar o estado da navegação.
class Main extends StatefulWidget {
  final String nome;
  const Main({super.key, required this.nome});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // 3. Adicionado o índice para controlar o item selecionado.
  int _selectedIndex = 0;

  // 4. Função para tratar o clique nos itens da barra de navegação.
  void _onItemTapped(int index) {
    // Evita reconstruir a tela se já estivermos nela
    if (index == _selectedIndex) return;
    
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Se a home não for a primeira na pilha, use Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Navegar para Sentimentos (exemplo)
        // Navigator.pushNamed(context, '/sentimentos');
        break;
      case 2:
        // Navegar para Jornada (exemplo)
        // Navigator.pushNamed(context, '/jornada');
        break;
      case 3:
        // Navegar para Playlist (exemplo)
        // Navigator.pushNamed(context, '/playlist');
        break;
      case 4:
        // 5. Ação de navegação para a tela do termômetro.
        Navigator.pushNamed(context, '/thermometer').then((_) {
          // Quando voltar da tela do termômetro, reseta o índice para 'Início'
          if (mounted) {
            setState(() {
              _selectedIndex = 0;
            });
          }
        });
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    String dataHoje = "terça feira, 26 de setembro";

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF70CFFF),
              Color(0xFFC48DEF),
              Color(0xFFDD88E7),
            ],
          ),
        ),
        // O resto do corpo do seu Scaffold permanece exatamente o mesmo...
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saudação + XP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Olá👋",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            dataHoje,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD54F),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          "⭐ 120 XP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Amigo emocional
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text("🐶✨", style: TextStyle(fontSize: 40)),
                        SizedBox(height: 8),
                        Text(
                          "Seu amigo emocional está aqui!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 233, 30, 179),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Como está se sentindo hoje?",
                          style: TextStyle(color: Colors.black87),
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
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(92, 203, 96, 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              "🐱 Avatar\nPersonalize",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9575CD),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              "🏆 Level\nNível 3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFAC54F0),
                          Color(0xFFCC4FC5),
                          Color(0xFFE848A0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "♥ Registrar Sentimentos",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
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
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bar_chart, color: Colors.blue),
                                SizedBox(height: 4),
                                Text("Termômetro",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.music_note, color: Color.fromRGBO(76, 175, 80, 1)),
                                SizedBox(height: 4),
                                Text("Playlists",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Contato de apoio
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(92, 203, 96, 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        "Contato de Apoio - NAE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Semana Atual
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(2, 2),
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
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [Text("Seg"), Text("😊")]),
                            Column(children: [Text("Ter"), Text("🥳")]),
                            Column(children: [Text("Qua"), Text("🥰")]),
                            Column(children: [Text("Qui"), Text("😂")]),
                            Column(children: [Text("Sex"), Text("😅")]),
                            Column(children: [Text("Sab"), Text("😂")]),
                            Column(children: [Text("Dom"), Text("🤢")]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // 6. Conectado o estado e a função à BottomNavigationBar.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
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
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:midleapp/screens/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _estudaTrabalhaController =
      TextEditingController();
  final TextEditingController _tipoUsuarioController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _qualidadeSonoController =
      TextEditingController();
  final TextEditingController _moraSozinhoController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF70CFFF), Color(0xFFC48DEF), Color(0xFFDD88E7)],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFF6D24FF), Color(0xFFFF00E1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      );
                    },
                    child: const Text(
                      "Termômetro de Emoções",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Monitore seu bem-estar emocional",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _nomeController,
                    decoration: inputDecoration("Nome", icon: Icons.person),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _emailController,
                    decoration: inputDecoration("Email", icon: Icons.email),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: inputDecoration("Senha", icon: Icons.lock),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration("Idade", icon: Icons.cake),
                  ),
                  const SizedBox(height: 12),
                  dropdownField(
                    context,
                    controller: _estudaTrabalhaController,
                    hint: 'Você trabalha ou estuda?',
                    icon: Icons.work,
                    options: ['Trabalha', 'Estuda', 'Ambos'],
                  ),
                  const SizedBox(height: 12),
                  dropdownField(
                    context,
                    controller: _tipoUsuarioController,
                    hint: 'Tipo de Usuário',
                    icon: Icons.person_pin,
                    options: ['Aluno', 'Colaborador'],
                  ),
                  const SizedBox(height: 12),
                  dropdownField(
                    context,
                    controller: _qualidadeSonoController,
                    hint: 'Qualidade do Sono',
                    icon: Icons.bedtime,
                    options: ['Boa', 'Média', 'Ruim'],
                  ),
                  const SizedBox(height: 12),
                  dropdownField(
                    context,
                    controller: _moraSozinhoController,
                    hint: 'Mora sozinho?',
                    icon: Icons.home,
                    options: ['Sim', 'Não'],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _hobbiesController,
                    decoration: inputDecoration(
                      "Hobbies",
                      icon: Icons.favorite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6D24FF), Color(0xFFFF00E1)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: () {
                        final idade = int.tryParse(_idadeController.text);
                        if (idade == null || idade < 0 || idade > 110) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Idade inválida. Digite entre 0 e 110.',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        authService
                            .cadastrarUsuario(
                              email: _emailController.text.trim(),
                              senha: _senhaController.text,
                              nome: _nomeController.text,
                              idade: _idadeController.text,
                              estudaTrabalha: _estudaTrabalhaController.text,
                              tipoUsuario: _tipoUsuarioController.text,
                              qualidadeSono: _qualidadeSonoController.text,
                              moraSozinho: _moraSozinhoController.text,
                              hobbies: _hobbiesController.text,
                            )
                            .then((String? erro) {
                              if (erro != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(erro),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                Navigator.pop(context); // Volta para login
                              }
                            });
                      },
                      child: const Text(
                        "Começar Jornada",
                        style: TextStyle(
                          fontSize: 16,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Já tem uma conta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                            color: Color(0xFF6D24FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint, {IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon != null ? Icon(icon, color: Color(0xFF6D24FF)) : null,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF6D24FF), width: 2),
      ),
    );
  }

  Widget dropdownField(
    BuildContext context, {
    required TextEditingController controller,
    required String hint,
    required List<String> options,
    IconData? icon,
  }) {
    return DropdownButtonFormField<String>(
      value: controller.text.isNotEmpty ? controller.text : null,
      items: options
          .map((option) => DropdownMenuItem(value: option, child: Text(option)))
          .toList(),
      onChanged: (value) {
        controller.text = value!;
      },
      decoration: inputDecoration(hint, icon: icon),
    );
  }
}

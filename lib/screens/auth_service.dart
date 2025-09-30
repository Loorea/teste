import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> entrarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return 'Senha incorreta';
        case 'user-not-found':
          return 'Usuário não encontrado';
        case 'invalid-email':
          return 'Email inválido';
        default:
          return 'Erro: ${e.message}';
      }
    }
    return null;
  }

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    required String nome,
    required String idade,
    required String estudaTrabalha,
    required String tipoUsuario,
    required String qualidadeSono,
    required String moraSozinho,
    required String hobbies,
  }) async {
    if (nome.trim().isEmpty) return 'Informe seu nome';
    if (email.trim().isEmpty) return 'Informe seu e-mail';
    if (!email.contains('@') || !email.contains('.')) return 'E-mail inválido';
    if (idade.trim().isEmpty) return 'Informe sua idade';

    final idadeInt = int.tryParse(idade);
    if (idadeInt == null || idadeInt < 0 || idadeInt > 110) {
      return 'Idade inválida. Digite entre 0 e 110';
    }

    if (estudaTrabalha.isEmpty) return 'Informe se você estuda ou trabalha';
    if (tipoUsuario.isEmpty) return 'Informe o tipo de usuário';
    if (senha.isEmpty) return 'Informe a senha';
    if (qualidadeSono.isEmpty) return 'Informe a qualidade do seu sono';
    if (moraSozinho.isEmpty) return 'Informe se você mora sozinho';
    if (hobbies.trim().isEmpty) return 'Informe seus hobbies';

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);

      await userCredential.user?.updateDisplayName(nome);

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(userCredential.user!.uid)
          .set({
            'uid': userCredential.user!.uid,
            'nome': nome,
            'email': email,
            'idade': idadeInt,
            'estudaTrabalha': estudaTrabalha,
            'tipoUsuario': tipoUsuario,
            'qualidadeSono': qualidadeSono,
            'moraSozinho': moraSozinho,
            'hobbies': hobbies,
            'dataCadastro': FieldValue.serverTimestamp(),
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email já está em uso';
      } else if (e.code == 'invalid-email') {
        return 'E-mail inválido';
      }
      return 'Erro: ${e.message ?? e.code}';
    } catch (e) {
      return 'Erro inesperado: $e';
    }

    return null;
  }

  Future<String?> deslogar() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }

  Future<String?> excluirConta({required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: _firebaseAuth.currentUser!.email!,
        password: senha,
      );
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }
}

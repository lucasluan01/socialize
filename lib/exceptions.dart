import 'package:firebase_auth/firebase_auth.dart';

final Map<String, String> firebaseExceptionMessages = {
  'account-exists-with-different-credential':
      'Já existe uma conta com este e-mail. Faça login com outro provedor.',
  'invalid-credential': 'Credencial inválida.',
  'operation-not-allowed':
      'Tipo de conta não habilitado. Por favor, entre em contato com o suporte.',
  'user-disabled':
      'Esta conta foi desativada. Por favor, entre em contato com o suporte.',
  'user-not-found': 'Não foi possível encontrar uma conta com este e-mail.',
  'wrong-password': 'Senha incorreta. Por favor, tente novamente.',
  'invalid-verification-code': 'Código de verificação inválido.',
  'invalid-verification-id': 'ID de verificação inválido.',
  'aborted': 'A operação foi abortada.',
  'already-exists': 'O documento já existe.',
  'cancelled': 'A operação foi cancelada.',
  'data-loss': 'Houve perda de dados.',
  'deadline-exceeded': 'O tempo limite da operação foi excedido.',
  'failed-precondition':
      'A operação falhou devido a uma pré-condição inválida.',
  'internal': 'O servidor encontrou um erro interno.',
  'invalid-argument': 'O argumento fornecido é inválido.',
  'not-found': 'O documento solicitado não foi encontrado.',
  'out-of-range': 'O valor especificado está fora do intervalo permitido.',
  'permission-denied':
      'O usuário não possui permissão para executar a operação.',
  'resource-exhausted': 'Os recursos do servidor foram esgotados.',
  'unauthenticated': 'O usuário não está autenticado.',
  'unavailable': 'O serviço está temporariamente indisponível.',
  'unimplemented':
      'A operação não foi implementada ou é incompatível com este serviço.',
  'unknown': 'Ocorreu um erro desconhecido.',
};

String getFirebaseExceptionMessage(dynamic exception) {
  if (exception is FirebaseException) {
    return firebaseExceptionMessages[exception.code] ??
        "Erro desconhecido, entre em contato com o suporte.";
  } else {
    return exception.toString();
  }
}

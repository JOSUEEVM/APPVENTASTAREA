import 'package:flutter_test/flutter_test.dart';
import 'package:appventas/main.dart';

void main() {
  testWidgets('La app inicia mostrando el login', (WidgetTester tester) async {
    // Carga la app
    await tester.pumpWidget(const SalesApp());

    // Verifica que estamos en login
    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}

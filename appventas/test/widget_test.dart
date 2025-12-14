import 'package:flutter_test/flutter_test.dart';
import 'package:appventas/main.dart';

void main() {
  testWidgets('La app de ventas carga correctamente', (WidgetTester tester) async {
    // Carga la app real
    await tester.pumpWidget(const SalesApp());

    // Verifica que exista la barra de navegación
    expect(find.text('Productos'), findsOneWidget);
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.text('Ventas'), findsOneWidget);
  });
}
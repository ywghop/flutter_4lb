import 'package:flutter_test/flutter_test.dart';
import 'package:lb4/main.dart';
import 'package:lb4/screens/login_screen.dart';

void main() {
  testWidgets('Renders LoginScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the LoginScreen is shown.
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}

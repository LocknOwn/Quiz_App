import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/main.dart';

void main() {
  testWidgets('Testing MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterQuizApp());
  });
}

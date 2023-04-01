import 'package:counter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const HomePage());
  });
}

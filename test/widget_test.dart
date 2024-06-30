import 'package:flutter_test/flutter_test.dart';

import 'package:counter/main.dart';

void main() {
  testWidgets('HomePage Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const HomePage());
  });
}

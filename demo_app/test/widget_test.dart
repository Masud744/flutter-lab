import 'package:flutter_test/flutter_test.dart';
import 'package:demo_app/main.dart';

void main() {
  testWidgets('Digital Wallet smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DigitalWalletApp());

    // Verify that app bar and account cards render
    expect(find.text('Digital Wallet System'), findsOneWidget);
    expect(find.text('Standard Account'), findsOneWidget);
    expect(find.text('Premium Account'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solidify/solidify.dart';
import 'package:solidify/core/routes/app_routes.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a GlobalKey for the navigator
    final navigatorKey = GlobalKey<NavigatorState>();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      SolidifyApp(
        appRoutes: AppRoutes(),
        initialRoute: '/',
        navigatorKey: navigatorKey, // Pass the navigatorKey
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
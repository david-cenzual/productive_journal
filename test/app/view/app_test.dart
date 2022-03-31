import 'package:flutter_test/flutter_test.dart';
import 'package:productivejournal/app/view/app.dart';
import 'package:productivejournal/app/view/pages/home/home_page.dart';
// import 'package:productivejournal/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders App and HomePage is displayed', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}

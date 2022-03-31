import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:productivejournal/app/view/pages/shared/widgets/loading_widget.dart';
import 'package:productivejournal/get_it_impl.dart';

void main() {
  setupGetIt();

  group('Widgets renders: ', () {
    testWidgets(
        'CircularProgressIndicator is rendered with no arguments '
        '✔💯', (tester) async {
      await tester.pumpWidget(const LoadingWidget());
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
        reason: '❌ A CircularProgressIndicator was not found after '
            'his initialization ❌',
      );
    });

    testWidgets(
      'LoadingWidget and a timer are deciding the Color of the LoadingWidget '
      '✔💯',
      (tester) async {
        FakeAsync().run((FakeAsync async) {
          runApp(
            const LoadingWidget(
              orderColorList: [Colors.red, Colors.blue],
            ),
          );
          expect(
            async.pendingTimers,
            isNotEmpty,
            reason: '❌ A there are no pending Timers initialized on '
                'Loading Widget ❌',
          );
          async.elapse(const Duration(milliseconds: 2000));
          expect(
            async.pendingTimers,
            isEmpty,
            reason: '❌ A there are still pending Timers initialized on '
                'Loading Widget ❌',
          );
        });
      },
    );
  });
}

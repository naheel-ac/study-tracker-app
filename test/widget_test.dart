// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_tracker/domain/usecases/getcurrentuser.dart';
import 'package:study_tracker/domain/usecases/sign_in.dart';
import 'package:study_tracker/domain/usecases/sign_out.dart';
import 'package:study_tracker/domain/usecases/sign_up.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:study_tracker/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:study_tracker/presentation/screens/auth_screen/Signin_screen/sign_in_screen.dart';

class MockGetCurrentUser extends Mock implements GetCurrentUser {}

class MockSignIn extends Mock implements SignIn {}

class MockSignUp extends Mock implements SignUp {}

class MockSignOut extends Mock implements SignOut {}

void main() {
  late MockGetCurrentUser mockGetCurrentUser;
  late MockSignIn mockSignIn;
  late MockSignUp mockSignUp;
  late MockSignOut mockSignOut;

  setUp(() {
    mockGetCurrentUser = MockGetCurrentUser();
    mockSignIn = MockSignIn();
    mockSignUp = MockSignUp();
    mockSignOut = MockSignOut();

    when(() => mockGetCurrentUser.call()).thenAnswer((_) async => null);
    when(() => mockSignIn.call(any(), any())).thenAnswer((_) async => null);
    when(
      () => mockSignUp.call(any(), any(), any()),
    ).thenAnswer((_) async => null);
    when(() => mockSignOut.call()).thenAnswer((_) async => {});
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => AuthBloc(
          getCurrentUserUseCase: mockGetCurrentUser,
          signInUseCase: mockSignIn,
          signUpUseCase: mockSignUp,
          signOutUseCase: mockSignOut,
        )..add(AuthCheckRequest()),
        child: const MaterialApp(home: SignInScreen()),
      ),
    );
    await tester.pump();
    expect(find.byType(SignInScreen), findsOneWidget);
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

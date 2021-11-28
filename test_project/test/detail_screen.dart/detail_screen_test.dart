import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/screens/detail_screen/detail_screen.dart';
import 'package:test_project/screens/user_screen/model/user_model.dart';

void main() {
  testWidgets('should find all widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailScreen()));

    expect(find.byType(AppBar), findsOneWidget);
    expect(
        find.descendant(of: find.byType(AppBar), matching: find.byType(Text)),
        findsOneWidget);

    // titles
    final titleFinder = find.text('name');
    final valueFinder = find.text('value');

    //subtitles
    final nameFinder = find.text('Name:');
    final userNameFinder = find.text('Username:');
    final emailFinder = find.text('Email:');
    final phoneFinder = find.text('Phone:');
    final cityFinder = find.text('City:');

    // mock
    final customNameFinder = find.text('Kurtis Weissnat');
    final customUserNameFinder = find.text('Elwyn.Skiles');
    final customEmailFinder = find.text('Telly.Hoeger@billy.biz');
    final customPhoneFinder = find.text('210.067.6132');
    final customCityFinder = find.text('Howemouth');

    final printButton = find.byKey(ValueKey('printCustomWord'));

    await tester.tap(printButton);
    await tester.pump();

    // titles
    expect(titleFinder, findsOneWidget);
    expect(valueFinder, findsOneWidget);

    //subtitles
    expect(nameFinder, findsOneWidget);
    expect(userNameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(phoneFinder, findsOneWidget);
    expect(cityFinder, findsOneWidget);

    // mock
    expect(customNameFinder, findsOneWidget);
    expect(customUserNameFinder, findsOneWidget);
    expect(customEmailFinder, findsOneWidget);
    expect(customPhoneFinder, findsOneWidget);
    expect(customCityFinder, findsOneWidget);
  });

  test('User test detail info', () {
    // UserModel user1 = UserModel(
    //     id: 12,
    //     name: 'miki',
    //     username: 'miki123',
    //     email: 'miki@mail.ru',
    //     phone: '123',
    //     address: Address(city: 'qwe'));
    final customNameFinder = find.text('miki');
    final customUserNameFinder = find.text('miki123');
    final customEmailFinder = find.text('miki@mail.ru');
    final customPhoneFinder = find.text('123');
    final customCityFinder = find.text('qwe');

    expect(customNameFinder, findsOneWidget);
    expect(customUserNameFinder, findsOneWidget);
    expect(customEmailFinder, findsOneWidget);
    expect(customPhoneFinder, findsOneWidget);
    expect(customCityFinder, findsOneWidget);
    // expect(user1, findsOneWidget);
  });
  test('User test model ', () {
    UserModel user1 = UserModel();
    UserModel user3 = UserModel();
    UserModel user2 = UserModel(
        id: 12,
        name: 'miki',
        username: 'miki123',
        email: 'miki@mail.ru',
        phone: '123',
        address: Address(city: 'qwe'));

    user3.name = 'Job';

    expect(
        user2,
        UserModel(
            id: 12,
            name: 'miki',
            username: 'miki123',
            email: 'miki@mail.ru',
            phone: '123',
            address: Address(city: 'qwe')));
  });
}

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:test_project/screens/detail_screen/detail_screen.dart';

// void main() {
//   testWidgets('should find widgets', (WidgetTester tester) async {
//     // final infoContainer = find.byKey(ValueKey('infoContainer'));
//     // final dataTable = find.byKey(ValueKey('DataTable'));
//     final titleFinder = find.text('name');
//     final messageFinder = find.text('value');
//     final printButton = find.byKey(ValueKey('printCustomWord'));

//     await tester.pumpWidget(MaterialApp(home: DetailScreen()));
//     await tester.tap(printButton);
//     await tester.pump();

//     expect(titleFinder, findsOneWidget);
//     expect(messageFinder, findsOneWidget);
//   });

//   group('DetailScreen', () {
//     testWidgets('should match the DetailScreen snapshot',
//         (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(home: DetailScreen()));

//       await tester.pumpAndSettle();

//       // await multiScreenGolden(tester, 'auth_page', devices: [
//       //   Device.phone,
//       // ]);
//     });

//     testWidgets('should find the DetailScreen widget',
//         (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(home: DetailScreen()));

//       await tester.pumpAndSettle();

//       expect(find.byType(DetailScreen), findsOneWidget);
//     });

//     // testWidgets('should find the HistoryForm widget',
//     //     (WidgetTester tester) async {
//     //   await tester.pumpWidget(MaterialApp(home: CustomScreen()));

//     //   await tester.pumpAndSettle();

//     //   expect(find.byType(CustomScreen), findsOneWidget);
//     // });

//   });
//   testWidgets('should find the Container widget', (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(home: DetailScreen()));

//     await tester.pumpAndSettle();

//     expect(find.byType(AppBar), findsOneWidget);
//     expect(
//         find.descendant(
//             of: find.byType(Container), matching: find.byType(Column)),
//         findsOneWidget);
//     // expect(
//     //     find.descendant(
//     //         of: find.byType(Column), matching: find.byType(SizedBox)),
//     //     findsOneWidget);
//     expect(
//         find.descendant(
//             of: find.byType(Column), matching: find.byType(Container)),
//         findsOneWidget);
//     expect(
//         find.descendant(
//             of: find.byType(Container), matching: find.byType(DataTable)),
//         findsOneWidget);

//     final titleFinder = find.text('Name:');
//     final messageFinder = find.text('Username:');

//     expect(titleFinder, findsOneWidget);
//     expect(messageFinder, findsOneWidget);
//   });
// }

// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const ROOT = _Paths.ROOT;

  static const EMPLYOEEMANAGEMENT = _Paths.ROOT + _Paths.EMPLYOEEMANAGEMENT;

  static const SELECTIONS = _Paths.ROOT + _Paths.SELECTIONS;

  static const SELECTIONCONTENT = _Paths.ROOT + _Paths.SELECTIONCONTENT;

  static const LOGIN = _Paths.LOGIN;

  Routes._();

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';

  static String SELECTION_DETAILS(String selectionId) =>
      '$SELECTIONS/$selectionId';
}

abstract class _Paths {
  static const ROOT = '/root';

  static const EMPLYOEEMANAGEMENT = "/emplyoee_management";

  static const SELECTIONS = '/selections';
  static const SELECTION_DETAILS = '/:selectionId';

  static const SELECTIONCONTENT = '/selectioncontent';

  static const LOGIN = '/login';
}

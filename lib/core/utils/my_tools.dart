import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class MyTools {
  static AwesomeDialog showAlert(
      {required BuildContext context,
      required String title,
      String? desc,
      type = DialogType.info,
      String? btnOk,
      String? btnCancel,
      required Function btnOkOnPress,
      required Function btnCancelOnPress}) {
    AwesomeDialog dialog = AwesomeDialog(
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      useRootNavigator: true,
      context: context,
      dialogType: type,
      animType: AnimType.scale,
      headerAnimationLoop: true,
      title: title,
      isDense: true,
      // dialogBackgroundColor: Colors.bl,
      desc: (desc == null || desc.isEmpty) ? "" : desc,
      btnOkText: (btnOk == null || btnOk.isEmpty) ? "تایید" : btnOk,
      btnCancelText: (btnCancel == null || btnCancel.isEmpty) ? "لغو" : btnCancel,
      btnOkOnPress: () => btnOkOnPress(),
      btnCancelOnPress: () => btnCancelOnPress(),
    ); //..show();

    return dialog;
  }
}

import 'package:flutter/widgets.dart';

import '../../../core/route_utils/route_names.dart';
import '../../../widgets/app_snackbar.dart';
import '../register_page/cubit.dart';

class RegisterStateHandler {
  static void manageRegisterState(RegisterState state, BuildContext context) {
    if (state is AuthErrorState) {
      appSnackBar(context, state.message, "ok", null);
    } else if (state is RegisterSuccess) {
      Navigator.pushNamed(context, RouteNames.nextregistermobile);
      appSnackBar(context, "Success", "ok", null);
    } else if (state is RegisterFailure) {
      appSnackBar(context, state.message, "ok", null);
    }
  }
}

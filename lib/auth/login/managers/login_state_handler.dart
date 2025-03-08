import 'package:flutter/widgets.dart';

import '../../../core/route_utils/route_names.dart';
import '../../../widgets/app_snackbar.dart';
import '../cubit.dart';

class LoginStateHandler {
  static void manageLoginState(LoginState state, BuildContext context) {
    if (state is LoginError) {
      appSnackBar(context, state.message);
    } else if (state is LoginSuccess) {
      Navigator.pushReplacementNamed(context, RouteNames.homeview);
      appSnackBar(context, state.message);
    } else if (state is SendVerification) {
      appSnackBar(context, state.message);
    } else if (state is LoginFailure) {
      appSnackBar(context, state.message);
    }
  }
}

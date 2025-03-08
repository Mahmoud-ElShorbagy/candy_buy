import 'package:flutter/widgets.dart';
import '../../../widgets/textfield_otp.dart';

class OtpView extends StatelessWidget {
  const OtpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TextFieldOTP(
            first: true,
            last: false,
          ),
          SizedBox(
            width: 8,
          ),
          TextFieldOTP(
            first: false,
            last: false,
          ),
          SizedBox(
            width: 8,
          ),
          TextFieldOTP(
            first: false,
            last: false,
          ),
          SizedBox(
            width: 8,
          ),
          TextFieldOTP(
            first: false,
            last: false,
          ),
          SizedBox(
            width: 8,
          ),
          TextFieldOTP(
            first: false,
            last: false,
          ),
          SizedBox(
            width: 8,
          ),
          TextFieldOTP(
            first: false,
            last: true,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}

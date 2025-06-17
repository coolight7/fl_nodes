import 'package:fl_nodes/src/constants.dart';
import 'package:fl_nodes/src/widgets/data.dart';

enum SnackbarType { success, error, warning, info }

void showNodeEditorSnackbar(String message, SnackbarType type) {
  if (kNodeEditorWidgetKey.currentContext != null) {
    FlData_c.showTip?.call(message, duration: const Duration(seconds: 3));
  }
}

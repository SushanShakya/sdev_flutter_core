import 'responsive_service.dart';

extension FontExtension on num {
  double get sp => ResponsiveService.setSp(this);
  double get h => ResponsiveService.setHeight(this);
  double get w => ResponsiveService.setWidth(this);
}

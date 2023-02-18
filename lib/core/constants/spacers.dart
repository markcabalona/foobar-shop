import 'package:flutter/material.dart';
import 'package:foobar_shop/core/constants/grid.dart';

/// Returns SizedBox with a width of:
///
/// const double x2Small = 2.0;
///
/// const double xSmall = 4.0;
///
/// const double small = 8.0;
///
/// const double medium = 16.0;
///
/// const double large = 24.0;
///
/// const double xLarge = 32.0;
///
/// const double x2Large = 40.0;
///
/// const double x3Large = 48.0;
///
/// const double x4Large = 56.0;
///
/// const double x5Large = 64.0;
///
/// const double x6Large = 72.0;
///
/// const double x7Large = 80.0;
///
/// const double x8Large = 200.0;
abstract class HorizontalSpacers {
  static const x2Small = SizedBox(width: CustomGrid.x2Small);
  static const xSmall = SizedBox(width: CustomGrid.xSmall);
  static const small = SizedBox(width: CustomGrid.small);
  static const medium = SizedBox(width: CustomGrid.medium);
  static const large = SizedBox(width: CustomGrid.large);
  static const xLarge = SizedBox(width: CustomGrid.xLarge);
  static const x2Large = SizedBox(width: CustomGrid.x2Large);
  static const x3Large = SizedBox(width: CustomGrid.x3Large);
  static const x4Large = SizedBox(width: CustomGrid.x4Large);
  static const x5Large = SizedBox(width: CustomGrid.x5Large);
  static const x6Large = SizedBox(width: CustomGrid.x6Large);
  static const x7Large = SizedBox(width: CustomGrid.x7Large);
  static const x8Large = SizedBox(width: CustomGrid.x8Large);

  /// returns a sizedbox with predefined width [value]
  static fromSize(double value) => SizedBox(width: value);
}

/// Returns SizedBox with a height of:
///
/// const double x2Small = 2.0;
///
/// const double xSmall = 4.0;
///
/// const double small = 8.0;
///
/// const double medium = 16.0;
///
/// const double large = 24.0;
///
/// const double xLarge = 32.0;
///
/// const double x2Large = 40.0;
///
/// const double x3Large = 48.0;
///
/// const double x4Large = 56.0;
///
/// const double x5Large = 64.0;
///
/// const double x6Large = 72.0;
///
/// const double x7Large = 80.0;
///
/// const double x8Large = 200.0;
abstract class VerticalSpacers {
  static const x2Small = SizedBox(height: CustomGrid.x2Small);
  static const xSmall = SizedBox(height: CustomGrid.xSmall);
  static const small = SizedBox(height: CustomGrid.small);
  static const medium = SizedBox(height: CustomGrid.medium);
  static const large = SizedBox(height: CustomGrid.large);
  static const xLarge = SizedBox(height: CustomGrid.xLarge);
  static const x2Large = SizedBox(height: CustomGrid.x2Large);
  static const x3Large = SizedBox(height: CustomGrid.x3Large);
  static const x4Large = SizedBox(height: CustomGrid.x4Large);
  static const x5Large = SizedBox(height: CustomGrid.x5Large);
  static const x6Large = SizedBox(height: CustomGrid.x6Large);
  static const x7Large = SizedBox(height: CustomGrid.x7Large);
  static const x8Large = SizedBox(height: CustomGrid.x8Large);

  /// returns a sizedbox with predefined height
  static SizedBox fromSize(double value) => SizedBox(height: value);
}

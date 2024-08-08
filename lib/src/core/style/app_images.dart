import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../generated/assets.dart";

final class AppImages{

  const AppImages._();


  // *** svg images

  static final monitoring = SvgPicture.asset(
    Assets.iconsDiscoverCompassIcon,
    height: 24.w,
    width: 24.w,
  );

  // *** png images

  static final sitting = Image.asset(
    Assets.imagesLogoRemovebgPreview,
    height: 216.w,
    width: 216.w,
  );
}
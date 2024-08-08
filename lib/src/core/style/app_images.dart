import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../generated/assets.dart";

final class AppImages{

  const AppImages._();


  // *** svg images for icons

  static final iconCompass  = SvgPicture.asset(
    Assets.iconsDiscoverCompassIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconEmail    = SvgPicture.asset(
    Assets.iconsEmailIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconFacebook = SvgPicture.asset(
    Assets.iconsFacebookIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconFavorite = SvgPicture.asset(
    Assets.iconsFavoriteIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconGoogle   = SvgPicture.asset(
    Assets.iconsGoogleIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconHelpFAQ  = SvgPicture.asset(
    Assets.iconsHelpIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconTopHome  = SvgPicture.asset(
    Assets.iconsHomeIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconRestaurant = SvgPicture.asset(
    Assets.iconsHomeRestaurantIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconLocation   = SvgPicture.asset(
    Assets.iconsLocationIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconLogOut     = SvgPicture.asset(
    Assets.iconsLogOutIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconOrderList  = SvgPicture.asset(
    Assets.iconsOrderListIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconProfile    = SvgPicture.asset(
    Assets.iconsProfileIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconSearch     = SvgPicture.asset(
    Assets.iconsSearchIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconSetting    = SvgPicture.asset(
    Assets.iconsSettingIcon,
    height: 24.w,
    width: 24.w,
  );
  static final iconWallet     = SvgPicture.asset(
    Assets.iconsWalletIcon,
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
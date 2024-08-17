import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../../core/style/text_style.dart";

class ProfileOption extends StatelessWidget {
  final String? iconPath;
  final Icon? icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOption({
    required this.label,
    required this.onTap,
    super.key,
    this.iconPath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.056,
          child: Row(
            children: [
              if (iconPath != null)
                SvgPicture.asset(
                  iconPath!,
                  height: MediaQuery.of(context).size.height * 0.040,
                  width: MediaQuery.of(context).size.width * 0.040,
                ),
              if (icon != null) icon!,
              const SizedBox(width: 12), // O'zgartirilgan bo'shliq miqdori
              Text(label, style: const AppTextStyle().forProfile),
            ],
          ),
        ),
      );
}

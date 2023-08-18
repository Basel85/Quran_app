import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/utils/app_assets.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isHome;
  final IconData? actionsIcon;
  const CustomAppBar(
      {super.key, required this.title, this.actionsIcon, this.isHome = true});

  @override
  Size get preferredSize => Size.fromHeight(92 * SizeConfig.verticalBlock);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      backgroundColor: AppThemes.color0xFFDAD0E1,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 32 * SizeConfig.horizontalBlock,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isHome
                    ? GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: SvgPicture.asset(AppAssets.menuIcon))
                    : GestureDetector(
                        onTap: ()=>Navigator.pop(context),
                        child: SvgPicture.asset(AppAssets.backIcon),
                      ),
                SizedBox(
                  width: 18 * SizeConfig.horizontalBlock,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: AppThemes.color0xFF300759FontSize24FontWeightW700,
                  ),
                ),
                if (actionsIcon != null) ...[Icon(actionsIcon,size: 16*SizeConfig.horizontalBlock,)]
              ]),
        ),
      ),
    );
  }
}

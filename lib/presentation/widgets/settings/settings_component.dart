import 'package:flutter/material.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class SettingsComponent extends StatelessWidget {
  final String settingsComponentName;
  const SettingsComponent({super.key, required this.settingsComponentName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20 * SizeConfig.horizontalBlock,
                        vertical: 20 * SizeConfig.verticalBlock),
                    margin: EdgeInsets.symmetric(
                        horizontal: 20 * SizeConfig.horizontalBlock,
                        vertical: 20 * SizeConfig.verticalBlock),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("About"),
                        SizedBox(
                          height: 30 * SizeConfig.verticalBlock,
                        ),
                        const Text(
                            "'Privacy Policy\nLast updated: January 11, 2022\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Template.\nInterpretation and Definitions\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\nDefinitions\nFor the purposes of this Privacy Policy:\nAccount means a unique account created for You to access our Service or parts of our Service.\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where control means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\nApplication means the software program provided by the Company downloaded by You on any electronic device, named Quran App\nCompany (referred to as either the Company, We, Us or Our in this Agreement) refers to Quran App.\nCountry refers to: Tamil Nadu, India',",textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 40 * SizeConfig.horizontalBlock,
            right: 40 * SizeConfig.horizontalBlock,
            bottom: 30 * SizeConfig.verticalBlock),
        padding: EdgeInsets.symmetric(
            horizontal: 20 * SizeConfig.horizontalBlock,
            vertical: 20 * SizeConfig.verticalBlock),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          settingsComponentName,
          textAlign: TextAlign.center,
          style: AppThemes.color0xFF300759FontSize18FontWeightW500,
        ),
      ),
    );
  }
}

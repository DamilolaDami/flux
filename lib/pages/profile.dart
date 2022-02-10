import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/models/settings.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.sfBgColor,
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.qr_code_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ],
            backgroundColor: AppColors.darkBlue,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Mrs Baker \n@baker_mrs',
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              background: Image.asset(
                memoji,
                fit: BoxFit.contain,
              ),
              titlePadding: const EdgeInsets.all(16),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                color: AppColors.sfBgColor,
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 390,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: settingsList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  settingsList[index].title ?? '',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  settingsList[index].subtitle ?? '',
                                  style: GoogleFonts.dosis(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.chevron_right_outlined),
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      settingsList[index].icon,
                                      size: 19,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              );
                            })
                      ]),
                ),
              ),
              Container(
                  height: 300,
                  width: double.infinity,
                  color: AppColors.sfBgColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 10, right: 16),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: AppColors.white,
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: settingBtmList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    settingBtmList[index].title ?? '',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    settingBtmList[index].subtitle ?? '',
                                    style: GoogleFonts.oswald(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  trailing:
                                      const Icon(Icons.keyboard_arrow_right),
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                      child: Icon(
                                        settingBtmList[index].icon,
                                        size: 19,
                                        color: Colors.white,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.darkBlue,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ))
            ],
          ))
        ]));
  }
}

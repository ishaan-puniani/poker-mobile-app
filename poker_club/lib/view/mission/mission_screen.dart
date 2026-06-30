import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/components/app_button.dart';
import 'package:poker_club/components/network_asset.dart';
import 'package:poker_club/model/mission.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/utils/custom_functions.dart';
import 'package:poker_club/view/home/components/home_header.dart';
import 'package:poker_club/viewmodel/mission_controller.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  final MissionController missionController = Get.find<MissionController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(AppImages.homebackground, fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: HomeHeader(
              showProfileInfo: false,
              showCloseButton: true,
              showHelpButton: true,
              title: "MISSIONS CHALLENGES",
              onClose: () => Get.back(),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (missionController.missionsNodes.isNotEmpty)
                  _buildNodeList(),
                if (missionController.selectedNode != null &&
                    missionController.selectedNode!.milestones.isNotEmpty)
                  _buildMilestoneList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMilestoneList() {
    return Obx(() {
      final milestones = missionController.selectedNode?.milestones ?? [];
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 18.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(milestones.length, (index) {
            final milestone = milestones[index];
            final reward = formatCoins(milestone.reward, true);
            final progressStatus = missionController.getMilestoneProgressStatus(
              milestone.id,
            );
            final buttonText = switch (progressStatus) {
              MissionStatus.locked => "Locked",
              MissionStatus.unlocked => "Get $reward",
              MissionStatus.rewardClaimed => "Claimed",
              _ => "Locked",
            };
            return SizedBox(
              width: 160.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(AppImages.missionCardBg, fit: BoxFit.fill),
                  Positioned.fill(
                    top: -4.h,
                    child: Padding(
                      padding: EdgeInsets.all(10).r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          NetworkAsset(
                            assetUrl: milestone.backgroundUrl ?? '',
                            defaultAsset: AppImages.casinoCardsCoins,
                            height: 40.h,
                          ),
                          SizedBox(height: 2.h),
                          Spacer(),
                          Text(
                            milestone.name,
                            style: GoogleFonts.cinzel(
                              color: Colors.yellow.shade600,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (milestone.description != null &&
                                  milestone.description!.isNotEmpty ||
                              true) ...[
                            SizedBox(height: 2.h),
                            Text(
                              milestone.description ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ],
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 2.h),
                            child: SvgPicture.asset(AppImages.namePopupDivider),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 0, 6.w, 0),
                            child: AppButton(
                              label: buttonText,
                              labelFontSize: 12,
                              onTap: () {
                                // Handle button tap based on progressStatus
                              },
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _buildNodeList() {
    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 48.w,
          children: List.generate(missionController.missionsNodes.length, (
            index,
          ) {
            final mission = missionController.missionsNodes[index];
            final isSelected =
                missionController.selectedNodeIndex.value == index;
            return GestureDetector(
              onTap: () => missionController.selectNode(index),
              child: Column(
                children: [
                  if (mission.nodeIconUrl != null &&
                      mission.nodeIconUrl!.isNotEmpty)
                    SvgPicture.network(
                      mission.nodeIconUrl!,
                      // width: 100.r,
                      height: isSelected ? 90.r : 70.r,
                    ),
                  Text(
                    mission.name,
                    style: GoogleFonts.cinzel(
                      color: Colors.white,
                      fontSize: isSelected ? 15.sp : 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

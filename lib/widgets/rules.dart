import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindmatcher/consts/theme.dart';
import 'package:mindmatcher/widgets/my_divider.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        Text(
          "Rules",
          style: FontStyles.bodyWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          """MindMatcher is a game for two teams. There is a table of 25 words. Some of these are secretly assigned to the Purple Team and some to the Orange Team. One player from each team is a Narrator, and only the Narrators can see which word belongs to which team. The Narrators take turns giving clues to their teammates (Predictors), trying to lead them to guess their team's words. The first team to guess all the words wins the game.""",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        const MyDivider(),
        SizedBox(height: 16.h),
        Text(
          "Dividing into Teams",
          style: FontStyles.bodyWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "Divide all players into two teams, purple and orange. Then everyone in the room clicks on the box with their name at the top right of the screen;",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "One player from each team should click on Join as Narrator. He/she will then see the colors of the cards.",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "Everyone else should click on Join as Predictor. They do not see the colors of the cards.",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Image.asset("assets/images/roleSelect.png"),
        SizedBox(height: 16.h),
        const MyDivider(),
        SizedBox(height: 16.h),
        Text(
          "Giving Clues",
          style: FontStyles.bodyWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "When it is the narrators' turn to play, it is enough to specify the clue and number they want to give in the section below and press the send button. Watch out for the black card – it’s an Assassin! Avoid clues that would lead to the assassin or to the other team's words.",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Image.asset("assets/images/clue.png"),
        SizedBox(height: 16.h),
        const MyDivider(),
        SizedBox(height: 16.h),
        Text(
          "Guessing",
          style: FontStyles.bodyWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "Predictors guess the words based on the Narrator’s clue",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        const MyDivider(),
        SizedBox(height: 16.h),
        Text(
          "End of Turn",
          style: FontStyles.bodyWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "Guessing a word of the opponent's color or neutral color.",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        const MyDivider(),
        SizedBox(height: 16.h),
        Text(
          "Winning and Losing",
          style: FontStyles.bodyWhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Text(
          "Teams alternate turns. A team wins once all their words have been guessed. They lose if they guess the Assassin!",
          style: FontStyles.smallButtonwhite,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

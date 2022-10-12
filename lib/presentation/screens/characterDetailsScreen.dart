
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../data/model/character.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailsScreen({required this.character, Key? key})
      : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  Widget buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: myGrey,
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          widget.character.nickName,
          style: const TextStyle(color: myWhite),
        ),
        background: Hero(
          tag: widget.character.charId,
          child: Image.network(
            widget.character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String titel, String val) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
      TextSpan(
          text: titel,
          style: const TextStyle(
            color: myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
          TextSpan(
          text: val,
          style: const TextStyle(
            color: myWhite,

            fontSize: 13,
          )),
    ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: myYellow,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            buildSliverAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', widget.character.jobs.join(' / ')),
                      buildDivider(315),
                      characterInfo(
                          'Appeared in : ', widget.character.categoryForTwoSeries),
                      buildDivider(250),
                      characterInfo('Seasons : ',
                          widget.character.appearanceOfSeasons.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ', widget.character.statusIfDeadOrAlive),
                      buildDivider(300),
                      widget.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Seasons : ',
                          widget.character.betterCallSaulAppearance.join(" / ")),
                      widget.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', widget.character.acotrName),
                      buildDivider(235),
                  const SizedBox(height: 500,)
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

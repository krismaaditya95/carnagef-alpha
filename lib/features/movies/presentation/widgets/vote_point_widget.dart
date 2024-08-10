import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:flutter/material.dart';

class VotePointWidget extends StatelessWidget {

  final String? votePoint;
  final String? voteCount;

  const VotePointWidget({
    super.key, this.votePoint = "-", this.voteCount = "-"
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppThemes.cE2E2B6,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: const Text("IMDB Rating",
              style: const TextStyle(color: AppThemes.c021526, fontSize: 8, fontWeight: FontWeight.bold)
            ),
          ),
          Text(votePoint.toString(),
              style: const TextStyle(color: AppThemes.c021526, fontSize: 28, fontWeight: FontWeight.bold)
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text('$voteCount votes',
                style: const TextStyle(color: AppThemes.c03346E, fontSize: 8, fontWeight: FontWeight.bold)
            ),
          ),
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';

class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  int vote1 = 70;
  int vote2 = 30;
  bool hasVoted = false;

  // increment
  void increaseVoteOne() {
    setState(() {
      vote1++;
      hasVoted = true;
    });
  }

  void increaseVoteTwo() {
    setState(() {
      vote2++;
      hasVoted = true;
    });
  }

  // percentage
  double percentage(int vote, int total) {
    if (total == 0) return 0;
    return vote / total;
  }

  @override
  Widget build(BuildContext context) {
    int total = vote1 + vote2;
    double yPer = percentage(vote1, total);
    double xPer = percentage(vote2, total);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VoteWidget(
                option: 'Yes',
                votePer: yPer,
                bgColor: Colors.green,
                callback: increaseVoteOne,
                hasVoted: hasVoted,
              ),
              const SizedBox(
                height: 10,
              ),
              VoteWidget(
                option: 'No',
                votePer: xPer,
                bgColor: Colors.grey,
                callback: increaseVoteTwo,
                hasVoted: hasVoted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VoteWidget extends StatelessWidget {
  final String option;
  final double votePer;
  final Color bgColor;
  final VoidCallback callback;
  final bool hasVoted;

  const VoteWidget({
    super.key,
    required this.option,
    required this.votePer,
    required this.bgColor,
    required this.callback,
    required this.hasVoted,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: hasVoted
          ? () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    "Can't vote twice",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.amber.withOpacity(0.4),
                ),
              );
            }
          : callback,
      child: Container(
        width: 250,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: LinearProgressIndicator(
          color: bgColor,
          backgroundColor: bgColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          minHeight: double.infinity,
          value: votePer,
        ),
      ),
    );
  }
}

// trying with animatedContainer
// class VotePoll extends StatelessWidget {
//   final String option;
//   final double votePer;
//   final Color bgColor;
//   final VoidCallback callback;
//
//   const VotePoll({
//     super.key,
//     required this.option,
//     required this.votePer,
//     required this.bgColor,
//     required this.callback,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: callback,
//       child: Container(
//         width: 250,
//         height: 30,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//             color: Colors.white,
//             width: 1.5,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: AnimatedContainer(
//           duration: const Duration(
//             milliseconds: 500,
//           ),
//           width: 20,
//           decoration: BoxDecoration(
//             color: bgColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }

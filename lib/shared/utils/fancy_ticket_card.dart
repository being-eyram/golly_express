import 'package:flutter/material.dart';
import 'package:golly_express/shared/extensions/context_extension.dart';

class FancyTicketCard extends StatelessWidget {
  const FancyTicketCard({
    super.key,
    this.topHalfColor = const Color(0xFF526799),
    this.bottomHalfColor = const Color.fromARGB(255, 183, 78, 60),
    this.destinationFrom = "tsito",
    this.destinationTo = "ho",
    this.duration = "0H 30M",
    this.departureDate = "25 JAN",
    this.departureTime = "12:30 PM",
    this.seatNumber = "69",
  });

  final Color topHalfColor;
  // final Color bottomHalfColor = const Color(0xfff37b67);
  final Color bottomHalfColor;
  final String destinationFrom;
  final String destinationTo;
  final String duration;
  final String departureDate;
  final String departureTime;
  final String seatNumber;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.only(right: 20),
      width: context.width * .75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: context.height * .12,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: topHalfColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      destinationFrom.length > 3
                          ? destinationFrom.substring(0, 3).toUpperCase()
                          : destinationFrom.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    const SmallCircle(),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final space = constraints.maxWidth;
                              const dashWidth = 4.0;
                              debugPrint("$space");
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  (space / (dashWidth + 3)).floor(),
                                  (index) => Container(
                                    color: Colors.white,
                                    height: 1,
                                    width: dashWidth,
                                  ),
                                ),
                              );
                            },
                          ),
                          Transform.rotate(
                            angle: 1.6,
                            child: const Icon(
                              Icons.airplanemode_active,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SmallCircle(),
                    const Spacer(),
                    Text(
                      destinationTo.length > 3
                          ? destinationTo.substring(0, 3).toUpperCase()
                          : destinationTo.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      destinationFrom.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      destinationTo.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: context.height * .14,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: bottomHalfColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final bigSpace = constraints.maxWidth;
                          const bigWidth = 6.0;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              (bigSpace / (bigWidth + 8)).floor(),
                              (index) => Container(
                                height: 1,
                                width: bigWidth,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0)
                      .copyWith(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            departureDate,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "DATE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            departureTime,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "DEPARTURE TIME",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            seatNumber,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "NUMBER",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallCircle extends StatelessWidget {
  const SmallCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          width: 3,
          color: Colors.white,
        ),
      ),
    );
  }
}

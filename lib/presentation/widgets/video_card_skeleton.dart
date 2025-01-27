import 'package:flutter/material.dart';

class VideoCardSkeleton extends StatelessWidget {
  const VideoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade300,
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(75, 36, 114, 1),
                  Color.fromRGBO(124, 124, 124, 1)
                ],
                stops: [0.0, 0.9],
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 55,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.05),
                          Color.fromRGBO(255, 255, 255, 0.3),
                          Color.fromRGBO(255, 255, 255, 1),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Container(
                    width: 107,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.05),
                          Color.fromRGBO(255, 255, 255, 0.3),
                          Color.fromRGBO(255, 255, 255, 1),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    children: List.generate(
                      5,
                      (i) => Column(
                        children: [
                          Container(
                            width: 271,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(255, 255, 255, 0.05),
                                  Color.fromRGBO(255, 255, 255, 0.3),
                                  Color.fromRGBO(255, 255, 255, 1),
                                ],
                                stops: [0.0, 0.5, 1.0],
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 31),
                  Row(
                    children: [
                      Container(
                        width: 66,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.05),
                              Color.fromRGBO(255, 255, 255, 0.3),
                              Color.fromRGBO(255, 255, 255, 1),
                            ],
                            stops: [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 31,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.05),
                              Color.fromRGBO(255, 255, 255, 0.3),
                              Color.fromRGBO(255, 255, 255, 1),
                            ],
                            stops: [0.0, 0.5, 1.0],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.05),
                              Color.fromRGBO(255, 255, 255, 0.3),
                              Color.fromRGBO(255, 255, 255, 1),
                            ],
                            stops: [0.0, 0.5, 1.0],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 247,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.05),
                              Color.fromRGBO(255, 255, 255, 0.3),
                              Color.fromRGBO(255, 255, 255, 1),
                            ],
                            stops: [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 29),
                  Image.asset('assets/imgs/skeleton-button.png'),
                  const SizedBox(height: 30),
                  Divider(color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.05),
                                      Color.fromRGBO(255, 255, 255, 0.3),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 23,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.05),
                                      Color.fromRGBO(255, 255, 255, 0.3),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(width: 27),
                            Column(children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.05),
                                      Color.fromRGBO(255, 255, 255, 0.3),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 86,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.05),
                                      Color.fromRGBO(255, 255, 255, 0.3),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 86,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.05),
                                      Color.fromRGBO(255, 255, 255, 0.3),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Container(
                                width: 74,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromRGBO(255, 255, 255, 0.05),
                                      Color.fromRGBO(255, 255, 255, 0.3),
                                      Color.fromRGBO(255, 255, 255, 1),
                                    ],
                                    stops: [0.0, 0.5, 1.0],
                                  ),
                                ),
                              )
                            ])
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

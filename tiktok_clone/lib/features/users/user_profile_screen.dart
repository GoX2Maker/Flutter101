import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: widget.tab == "likes" ? 1 : 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                    )
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      const CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                            "https://lh3.googleusercontent.com/a/ACg8ocKRHgAxKmTthn1x5zca1EuZol3h6UbR_2nh1O7tXCcF9H8=s288-c-no"),
                        child: Text("니꼬"),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "@${widget.username}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.h5,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            size: Sizes.size16,
                            color: Colors.blue.shade500,
                          )
                        ],
                      ),
                      Gaps.v24,
                      SizedBox(
                        height: Sizes.size48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "97",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.v1,
                                Text("Following",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ))
                              ],
                            ),
                            VerticalDivider(
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              color: Colors.grey.shade400,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "10M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.v1,
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            ),
                            VerticalDivider(
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              color: Colors.grey.shade400,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            Column(
                              children: [
                                const Text(
                                  "194.3M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.v1,
                                Text(
                                  "Likes",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Gaps.v14,
                      FractionallySizedBox(
                        widthFactor: 0.33,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Sizes.size4),
                            ),
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size32,
                        ),
                        child: Text(
                          "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gaps.v14,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size12,
                          ),
                          Gaps.h4,
                          Text(
                            "https://nomadcoders.co",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 14,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/cat0.jpg",
                          image:
                              "https://eadn-wc01-6453665.nxedge.io/cdn/wp-content/uploads/2020/10/building-with-trees-on-every-balcony-what-is-green-building-1024x682.jpg",
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Page two'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class UserProfileScreen extends StatefulWidget {
//   final String username;
//   final String tab;

//   const UserProfileScreen({
//     super.key,
//     required this.username,
//     required this.tab,
//   });

//   @override
//   State<UserProfileScreen> createState() => _UserProfileScreenState();
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   void _onGearPressed() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const SettingsScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//       body: SafeArea(
//         child: DefaultTabController(
//           initialIndex: widget.tab == "likes" ? 1 : 0,
//           length: 2,
//           child: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return [
//                 SliverAppBar(
//                   title: Text(widget.username),
//                   actions: [
//                     IconButton(
//                       onPressed: _onGearPressed,
//                       icon: const FaIcon(
//                         FontAwesomeIcons.gear,
//                         size: Sizes.size20,
//                       ),
//                     )
//                   ],
//                 ),
//                 SliverToBoxAdapter(
//                   child: Column(
//                     children: [
//                       Gaps.v20,
//                       const CircleAvatar(
//                         radius: 50,
//                         foregroundImage: NetworkImage(
//                             "https://lh3.googleusercontent.com/a/ACg8ocKRHgAxKmTthn1x5zca1EuZol3h6UbR_2nh1O7tXCcF9H8=s288-c-no"),
//                         child: Text("gox2"),
//                       ),
//                       Gaps.v20,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "@${widget.username}",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: Sizes.size18,
//                             ),
//                           ),
//                           Gaps.h5,
//                           FaIcon(
//                             FontAwesomeIcons.solidCircleCheck,
//                             size: Sizes.size16,
//                             color: Colors.blue.shade500,
//                           )
//                         ],
//                       ),
//                       Gaps.v24,
//                       SizedBox(
//                         height: Sizes.size48,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 const Text(
//                                   "97",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: Sizes.size18,
//                                   ),
//                                 ),
//                                 Gaps.v1,
//                                 Text("Following",
//                                     style: TextStyle(
//                                       color: Colors.grey.shade500,
//                                     ))
//                               ],
//                             ),
//                             VerticalDivider(
//                               width: Sizes.size32,
//                               thickness: Sizes.size1,
//                               color: Colors.grey.shade400,
//                               indent: Sizes.size14,
//                               endIndent: Sizes.size14,
//                             ),
//                             Column(
//                               children: [
//                                 const Text(
//                                   "10M",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: Sizes.size18,
//                                   ),
//                                 ),
//                                 Gaps.v1,
//                                 Text(
//                                   "Followers",
//                                   style: TextStyle(
//                                     color: Colors.grey.shade500,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             VerticalDivider(
//                               width: Sizes.size32,
//                               thickness: Sizes.size1,
//                               color: Colors.grey.shade400,
//                               indent: Sizes.size14,
//                               endIndent: Sizes.size14,
//                             ),
//                             Column(
//                               children: [
//                                 const Text(
//                                   "194.3M",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: Sizes.size18,
//                                   ),
//                                 ),
//                                 Gaps.v1,
//                                 Text(
//                                   "Likes",
//                                   style: TextStyle(
//                                     color: Colors.grey.shade500,
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Gaps.v14,
//                       FractionallySizedBox(
//                         widthFactor: 0.33,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: Sizes.size12,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).primaryColor,
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(Sizes.size4),
//                             ),
//                           ),
//                           child: const Text(
//                             'Follow',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Gaps.v14,
//                       const Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: Sizes.size32,
//                         ),
//                         child: Text(
//                           "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       Gaps.v14,
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           FaIcon(
//                             FontAwesomeIcons.link,
//                             size: Sizes.size12,
//                           ),
//                           Gaps.h4,
//                           Text(
//                             "https://nomadcoders.co",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Gaps.v20,
//                     ],
//                   ),
//                 ),
//                 SliverPersistentHeader(
//                   delegate: PersistentTabBar(),
//                   pinned: true,
//                 ),
//               ];
//             },
//             body: TabBarView(
//               children: [
//                 GridView.builder(
//                   itemCount: 20,
//                   padding: EdgeInsets.zero,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: Sizes.size2,
//                     mainAxisSpacing: Sizes.size2,
//                     childAspectRatio: 9 / 14,
//                   ),
//                   itemBuilder: (context, index) => Column(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 9 / 14,
//                         child: FadeInImage.assetNetwork(
//                           fit: BoxFit.cover,
//                           placeholder: "assets/images/cat1.jpg",
//                           image:
//                               "https://eadn-wc01-6453665.nxedge.io/cdn/wp-content/uploads/2020/10/building-with-trees-on-every-balcony-what-is-green-building-1024x682.jpg",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Center(
//                   child: Text('Page two'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   void _onGearPressed() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const SettingsScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: DefaultTabController(
//         initialIndex: widget.tab == "likes" ? 1 : 0,
//         length: 2,
//         child: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 centerTitle: true,
//                 title: Text(widget.username),
//                 actions: [
//                   IconButton(
//                     icon: const FaIcon(
//                       FontAwesomeIcons.gear,
//                       size: Sizes.size20,
//                     ),
//                     onPressed: _onGearPressed,
//                   )
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     Gaps.v20,
//                     const CircleAvatar(
//                       radius: 50,
//                       foregroundImage: NetworkImage(
//                           "https://lh3.googleusercontent.com/a/ACg8ocKRHgAxKmTthn1x5zca1EuZol3h6UbR_2nh1O7tXCcF9H8=s288-c-no"),
//                       child: Text("Gox2"),
//                     ),
//                     Gaps.v20,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "@${widget.username}",
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: Sizes.size18,
//                           ),
//                         ),
//                         Gaps.h5,
//                         FaIcon(
//                           FontAwesomeIcons.solidCircleCheck,
//                           size: Sizes.size16,
//                           color: Colors.blue.shade500,
//                         )
//                       ],
//                     ),
//                     Gaps.v24,
//                     SizedBox(
//                       height: Sizes.size48,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "97",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: Sizes.size18,
//                                 ),
//                               ),
//                               Gaps.h10,
//                               Text(
//                                 "Following",
//                                 style: TextStyle(
//                                   color: Colors.grey.shade500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           VerticalDivider(
//                             width: 30,
//                             thickness: 1,
//                             color: Colors.grey.shade500,
//                             indent: 14,
//                             endIndent: 14,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "10.7M",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: Sizes.size18,
//                                 ),
//                               ),
//                               Gaps.v1,
//                               Text(
//                                 "Followers",
//                                 style: TextStyle(
//                                   color: Colors.grey.shade500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           VerticalDivider(
//                             width: 30,
//                             thickness: 1,
//                             color: Colors.grey.shade500,
//                             indent: 14,
//                             endIndent: 14,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "149.3M",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: Sizes.size18,
//                                 ),
//                               ),
//                               Gaps.v1,
//                               Text(
//                                 "Likes",
//                                 style: TextStyle(
//                                   color: Colors.grey.shade500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Gaps.v14,
//                     FractionallySizedBox(
//                       widthFactor: 0.33,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: Sizes.size12,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).primaryColor,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(
//                               4,
//                             ),
//                           ),
//                         ),
//                         child: const Text(
//                           "Follow",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     Gaps.v14,
//                     const Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 32,
//                       ),
//                       child: Text(
//                         "Just Go!",
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Gaps.v20,
//                   ],
//                 ),
//               ),
//               SliverPersistentHeader(
//                 delegate: PersistentTabBar(),
//                 pinned: true,
//               ),
//             ];
//           },
//           physics: const BouncingScrollPhysics(),
//           body: TabBarView(
//             children: [
//               GridView.builder(
//                 padding: EdgeInsets.zero,
//                 keyboardDismissBehavior:
//                     ScrollViewKeyboardDismissBehavior.onDrag,
//                 itemCount: 20,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: Sizes.size2,
//                   mainAxisSpacing: Sizes.size2,
//                   childAspectRatio: 9 / 14,
//                 ),
//                 itemBuilder: (context, index) => Column(
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 9 / 14,
//                       child: FadeInImage.assetNetwork(
//                         fit: BoxFit.cover,
//                         placeholder: "assets/images/cat1.jpg",
//                         image:
//                             "https://eadn-wc01-6453665.nxedge.io/cdn/wp-content/uploads/2020/10/building-with-trees-on-every-balcony-what-is-green-building-1024x682.jpg",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Center(
//                 child: Text("2"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

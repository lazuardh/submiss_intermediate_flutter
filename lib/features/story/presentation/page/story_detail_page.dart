import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../lib.dart';

class StoryDetailPage extends StatefulWidget {
  final String id;

  const StoryDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _StoryDetailPageState createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.red,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new,
      //       color: AppColors.white,
      //     ),
      //   ),
      //   title: Text(
      //     "Detail Story",
      //     style: AppTextStyle.bold.copyWith(
      //       color: AppColors.white,
      //       fontSize: AppFontSize.large,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.book,
      //         color: AppColors.white,
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: ChangeNotifierProvider<DetailStoryProvider>(
          create: (context) => DetailStoryProvider(
            StoryRepository(
              StoryRemoteDataSource(),
              AuthRepository(AuthRemoteDataSource()),
            ),
            id: widget.id,
          ),
          child: Consumer<DetailStoryProvider>(
            builder: (ctx, provider, _) {
              if (provider.state == StoryState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (provider.state == StoryState.error) {
                return Center(
                  child: Text(provider.message),
                );
              } else if (provider.state == StoryState.hasData) {
                return _StoryDetailWrapper(story: provider.detailStory);
              } else {
                return Center(child: Text(provider.message));
              }
            },
          ),
        ),
      ),
    );
  }
}

class _StoryDetailWrapper extends StatelessWidget {
  final DetailStory _story;

  const _StoryDetailWrapper({
    super.key,
    required DetailStory story,
  }) : _story = story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageWrapper(
          image: _story.photoUrl,
          width: double.infinity,
          height: ResponsiveUtils(context).getMediaQueryHeight() * 0.4,
          borderRadius: 0,
          fit: BoxFit.cover,
          isNetworkImage: true,
        ),
        Container(
          color: const Color.fromARGB(36, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color.fromARGB(162, 242, 120, 107),
                ),
              ),
              Text(
                "Detail Story",
                style: AppTextStyle.bold.copyWith(
                  color: const Color.fromARGB(162, 242, 120, 107),
                  fontSize: AppFontSize.large,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark,
                  color: Color.fromARGB(162, 242, 120, 107),
                ),
              ),
            ],
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.8,
          minChildSize: 0.7,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(228, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyLighter,
                      offset: Offset(0, 0.5),
                      spreadRadius: 0.5,
                    )
                  ]),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _story.name,
                      style: AppTextStyle.black.copyWith(
                        fontSize: AppFontSize.big,
                      ),
                    ),
                    Text(
                      "Create At: ${_story.createdAt}",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.greyPrimary,
                        fontSize: AppFontSize.small,
                      ),
                    ),
                    const Gap(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(55, 242, 120, 107),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: RowPadding(
                        padding: const EdgeInsets.all(12),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Lantitude",
                                style: AppTextStyle.black.copyWith(
                                  fontSize: AppFontSize.normal,
                                ),
                              ),
                              Text(
                                _story.lat != null
                                    ? _story.lat.toString()
                                    : "-",
                                style: AppTextStyle.regular.copyWith(
                                  fontSize: AppFontSize.small,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                          Container(
                            color: AppColors.blackPrimary,
                            width: 2,
                            height: 40,
                          ),
                          Column(
                            children: [
                              Text(
                                "Lontitude",
                                style: AppTextStyle.black.copyWith(
                                  fontSize: AppFontSize.normal,
                                ),
                              ),
                              Text(
                                _story.lon != null
                                    ? _story.lat.toString()
                                    : "-",
                                style: AppTextStyle.regular.copyWith(
                                  fontSize: AppFontSize.small,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(height: 10),
                    Text(
                      "Description :",
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.greyPrimary,
                      ),
                    ),
                    Text(
                      _story.description,
                      style: AppTextStyle.regular.copyWith(
                        color: AppColors.blackPrimary,
                        fontSize: AppFontSize.medium,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

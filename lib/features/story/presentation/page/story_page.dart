import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../lib.dart';

class StoryPage extends StatefulWidget {
  final Function() onLogout;
  final Function(String) onTapped;
  final Function() onAddStory;

  const StoryPage({
    super.key,
    required this.onLogout,
    required this.onTapped,
    required this.onAddStory,
  });

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final apiProvider = context.read<StoryProvider>();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (apiProvider.pageItems != null) {
          apiProvider.fetchStories();
        }
      }
    });

    Future.microtask(() async => apiProvider.fetchStories());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshStories() async {
    final apiProvider = context.read<StoryProvider>();
    await apiProvider.refreshStories();
  }

  @override
  Widget build(BuildContext context) {
    final authWatch = context.watch<AuthProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.red,
        shape: const CircleBorder(),
        onPressed: () async {
          final authRead = context.read<AuthProvider>();
          final result = await authRead.logout();
          if (result) widget.onLogout();
        },
        tooltip: "Logout",
        child: authWatch.isLoadingLogout
            ? const CircularProgressIndicator(
                color: AppColors.white,
              )
            : const Icon(
                Icons.logout,
                color: AppColors.white,
              ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshStories,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              centerTitle: true,
              pinned: true,
              backgroundColor: AppColors.red,
              title: Text(
                "Story",
                style: AppTextStyle.semiBold.copyWith(
                  color: AppColors.white,
                  fontSize: AppFontSize.large,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => widget.onAddStory(),
                  icon: const Icon(
                    Icons.add_a_photo,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Consumer<StoryProvider>(
              builder: (context, provider, _) {
                final state = provider.state;
                return state.map(
                  loading: (value) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  loaded: (value) {
                    final story = value.data;
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount:
                            story.length + (provider.pageItems != null ? 1 : 0),
                        (context, index) {
                          if (index == story.length &&
                              provider.pageItems != null) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          return GestureDetector(
                            onTap: () => widget.onTapped(story[index].id),
                            child: _cardStory(context, story[index]),
                          );
                        },
                      ),
                    );
                  },
                  error: (value) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          value.message,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                  initial: (_) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text('No Data'),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Container _cardStory(BuildContext context, Story story) {
    DateTime timestamp = DateTime.parse(story.createdAt.toString());
    String formattedDate = DateFormat('dd MMMM yyyy').format(timestamp);
    String formattedJam = DateFormat('HH:mm:ss').format(timestamp);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [
            Color(0xffF2796B),
            Color(0xffFFA500),
            Color(0xffB484F6),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 0.3),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: RowPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.all(12),
        children: [
          CustomImageWrapper(
            image: story.photoUrl,
            width: (ResponsiveUtils(context).getMediaQueryHeight() * 0.3 / 2) +
                AppFontSize.normal * 2,
            fit: BoxFit.cover,
            height: (ResponsiveUtils(context).getMediaQueryHeight() * 0.3 / 2) +
                AppFontSize.normal * 2,
            isNetworkImage: true,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.book,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  story.description,
                  style: AppTextStyle.semiBold.copyWith(
                    color: Colors.white,
                    fontSize: AppFontSize.extraLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'By ${story.name}',
                  style: AppTextStyle.regular.copyWith(
                    color: Colors.white,
                    fontSize: AppFontSize.small,
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Uploaded $formattedDate',
                  style: AppTextStyle.regular.copyWith(
                    color: Colors.white,
                    fontSize: AppFontSize.small,
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Jam $formattedJam',
                  style: AppTextStyle.regular.copyWith(
                    color: Colors.white,
                    fontSize: AppFontSize.small,
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

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Bondhu',
      'text':
          'Bondhu-তে সবাইকে স্বাগতম! 🎉\nএটি আমাদের নতুন সামাজিক যোগাযোগের অ্যাপ।',
      'likes': 12,
      'comments': 3,
      'shares': 1,
    },
    {
      'name': 'Bondhu Team',
      'text':
          'আপনার বন্ধুদের সাথে যুক্ত থাকুন, পোস্ট করুন এবং সুন্দর মুহূর্তগুলো শেয়ার করুন। ❤️',
      'likes': 25,
      'comments': 7,
      'shares': 4,
    },
  ];

  void showCreatePost() {
    final TextEditingController controller =
        TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                    20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'নতুন পোস্ট',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              TextField(
                controller: controller,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'আপনি কী ভাবছেন?',
                  alignLabelWithHint: true,
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    final text =
                        controller.text.trim();

                    if (text.isEmpty) {
                      return;
                    }

                    setState(() {
                      posts.insert(
                        0,
                        {
                          'name': 'আপনি',
                          'text': text,
                          'likes': 0,
                          'comments': 0,
                          'shares': 0,
                        },
                      );
                    });

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'পোস্ট করুন',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(
      controller.dispose,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF0F2F5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Bondhu',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black87,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.black87,
            ),
          ),
        ],
      ),

      body: _buildBody(),

      floatingActionButton:
          currentIndex == 0
              ? FloatingActionButton.extended(
                  onPressed: showCreatePost,
                  icon: const Icon(Icons.add),
                  label: const Text('পোস্ট'),
                )
              : null,

      bottomNavigationBar:
          NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon: Icon(
              Icons.home,
            ),
            label: 'হোম',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.people_outline,
            ),
            selectedIcon: Icon(
              Icons.people,
            ),
            label: 'বন্ধু',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.notifications_outlined,
            ),
            selectedIcon: Icon(
              Icons.notifications,
            ),
            label: 'নোটিফিকেশন',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
            ),
            selectedIcon: Icon(
              Icons.person,
            ),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (currentIndex == 0) {
      return _buildHomeFeed();
    }

    if (currentIndex == 1) {
      return _buildPlaceholder(
        Icons.people,
        'বন্ধু',
        'বন্ধুদের তালিকা এখানে দেখা যাবে।',
      );
    }

    if (currentIndex == 2) {
      return _buildPlaceholder(
        Icons.notifications,
        'নোটিফিকেশন',
        'আপনার নোটিফিকেশন এখানে দেখা যাবে।',
      );
    }

    return _buildPlaceholder(
      Icons.person,
      'প্রোফাইল',
      'আপনার প্রোফাইল এখানে দেখা যাবে।',
    );
  }

  Widget _buildHomeFeed() {
    return ListView(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 100,
      ),
      children: [
        _buildCreatePostBox(),

        const SizedBox(height: 10),

        for (final post in posts)
          _PostCard(
            name: post['name'] as String,
            text: post['text'] as String,
            initialLikes:
                post['likes'] as int,
            comments:
                post['comments'] as int,
            shares:
                post['shares'] as int,
          ),
      ],
    );
  }

  Widget _buildCreatePostBox() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor:
                  Color(0xFF1877F2),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(25),
                onTap: showCreatePost,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration:
                      BoxDecoration(
                    color:
                        const Color(0xFFF0F2F5),
                    borderRadius:
                        BorderRadius.circular(25),
                  ),
                  child: const Text(
                    'আপনি কী ভাবছেন?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(
    IconData icon,
    String title,
    String description,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: const Color(
                0xFF1877F2,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatefulWidget {
  final String name;
  final String text;
  final int initialLikes;
  final int comments;
  final int shares;

  const _PostCard({
    required this.name,
    required this.text,
    required this.initialLikes,
    required this.comments,
    required this.shares,
  });

  @override
  State<_PostCard> createState() =>
      _PostCardState();
}

class _PostCardState
    extends State<_PostCard> {
  late int likes;
  bool liked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
  }

  void toggleLike() {
    setState(() {
      liked = !liked;

      if (liked) {
        likes++;
      } else {
        likes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      elevation: 0,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor:
                      Color(0xFF1877F2),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  size: 17,
                  color:
                      Color(0xFF1877F2),
                ),

                const SizedBox(width: 5),

                Text('$likes'),

                const Spacer(),

                Text(
                  '${widget.comments} মন্তব্য',
                ),

                const SizedBox(width: 10),

                Text(
                  '${widget.shares} শেয়ার',
                ),
              ],
            ),

            const Divider(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed:
                        toggleLike,
                    icon: Icon(
                      liked
                          ? Icons.thumb_up
                          : Icons
                              .thumb_up_outlined,
                      color: liked
                          ? const Color(
                              0xFF1877F2,
                            )
                          : Colors.grey,
                    ),
                    label: Text(
                      'লাইক',
                      style: TextStyle(
                        color: liked
                            ? const Color(
                                0xFF1877F2,
                              )
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons
                          .comment_outlined,
                    ),
                    label:
                        const Text('মন্তব্য'),
                  ),
                ),

                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                    ),
                    label:
                        const Text('শেয়ার'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

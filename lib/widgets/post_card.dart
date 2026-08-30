import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String name;
  final String text;
  final int likes;
  final int comments;
  final int shares;

  const PostCard({
    super.key,
    required this.name,
    required this.text,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int likeCount;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.likes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFF1877F2),
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

            const SizedBox(height: 8),

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
                  color: Color(0xFF1877F2),
                ),
                const SizedBox(width: 5),
                Text('$likeCount'),
                const Spacer(),
                Text('${widget.comments} মন্তব্য'),
                const SizedBox(width: 10),
                Text('${widget.shares} শেয়ার'),
              ],
            ),

            const Divider(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: toggleLike,
                    icon: Icon(
                      isLiked
                          ? Icons.thumb_up
                          : Icons.thumb_up_outlined,
                      color: isLiked
                          ? const Color(0xFF1877F2)
                          : Colors.grey,
                    ),
                    label: Text(
                      'লাইক',
                      style: TextStyle(
                        color: isLiked
                            ? const Color(0xFF1877F2)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                    label: const Text('মন্তব্য'),
                  ),
                ),

                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                    ),
                    label: const Text('শেয়ার'),
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

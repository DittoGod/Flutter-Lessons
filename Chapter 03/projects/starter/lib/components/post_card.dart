import 'package:flutter/material.dart';
import 'package:yummy/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(post.profileImageUrl),
            ),
            const SizedBox(
              width: 16.0,
            ),
            // Expanded widget makes the child occupy all available space.
            Expanded(
              // Column widget vertically stacks children. MainAxisSize.min
              // aligns them to occupy minimum space. CrossAxisAlignment.start
              // horizontally aligns the child widgets to the left side.
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display two Text widgets, the post contents followed by the
                  // post's timestamp.
                  Text(
                    post.comment,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    '${post.timestamp} mins ago',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

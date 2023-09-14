import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
  // FriendPostListView requires a list of Posts.
  final List<Post> friendPosts;
  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  @override
  Widget build(BuildContext context) {
    // Apply a left and right padding widget of 16 points.
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      // Create a Column to position the Text followed by the posts in a
      // vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Create the Text widget header.
          Text(
            'Social Chefs !',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          // Apply a spacing of 16 points vertically.
          const SizedBox(height: 16),
          // Create ListView.separated with two IndexWidgetBuilder callbacks.
          ListView.separated(
            // Since you’re nesting two list views, it’s a good idea to set
            // primary to false. That lets Flutter know that this isn’t the
            // primary scroll view.
            primary: false,
            // Set the scrolling physics to NeverScrollableScrollPhysics. Even
            // though you set primary to false, it’s also a good idea to disable
            // the scrolling for this list view. That will propagate up to the
            // parent list view.
            physics: const NeverScrollableScrollPhysics(),
            // Set shrinkWrap to true to create a fixed-length scrollable list
            // of items. This gives it a fixed height. If this were false, you’d
            // get an unbounded height error.
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              // For every item in the list, create a FriendPostTile.
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              // For every item, also create a SizedBox to space each item by
              // 16 points.
              return const SizedBox(height: 16);
            },
          ),
          // Leave some padding at the end of the list.
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

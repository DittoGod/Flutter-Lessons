import 'package:flutter/material.dart';
import 'package:yummy/components/post_card.dart';
import 'package:yummy/models/post.dart';

// PostSection is a StatelessWidget and requires a list of Posts.
class PostSection extends StatelessWidget {
  final List<Post> posts;

  const PostSection({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    // Apply overall padding of 8.0 pixels.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // Create a Column to position the Text followed by the Posts in a
      // vertical layout.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            // Create the Text widget header.
            child: Text(
              'Friend\'s Activity',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Create ListView.separated with two IndexWidgetBuilder callbacks.
          ListView.separated(
            // Set the primary to false to let flutter know that it's not the
            // primary scroll view.
            primary: false,
            // Set shrinkWrap to true to create a fixed-length scrollable list
            // of items. This gives a fixed height. If this was false it would
            // give an unbounded height error.
            shrinkWrap: true,
            // Make this ListView vertically scrollable.
            scrollDirection: Axis.vertical,
            // Set the scrolling physics to NeverScrollableScrollPhysics. Even
            // though it's set to primary false, it's also a good idea to
            // disable the scrolling for this ListView. That will propagate up
            // to the parent ListView.
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            // For every item in the list create a PostCard widget
            itemBuilder: (context, index) {
              return PostCard(post: posts[index]);
            },
            separatorBuilder: (context, index) {
              // For every item, also create a SizedBox to space each item by 16
              // pixels.
              return const SizedBox(height: 10);
            },
          )
        ],
      ),
    );
  }
}

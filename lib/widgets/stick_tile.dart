import 'package:flutter/material.dart';

import 'package:sticker_map/models/stick.dart';
import 'package:sticker_map/custom_theme.dart';

class StickTile extends StatefulWidget {
  final Stick stick;
  const StickTile({super.key, required this.stick});

  @override
  State<StickTile> createState() => _StickTileState();
}

class _StickTileState extends State<StickTile> {
  final theme = CustomTheme();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  color: theme.secondaryColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.stick.notes, // TODO: Should be title
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.person_outline),
                        SizedBox(width: 5),
                        Text(
                          "creator here",
                          // widget.recipe.author == username ? "You" : widget.recipe.author,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: theme.accentColor,
                  border: Border.all(color: theme.secondaryColor, width: 2),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Text("Sticker name"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

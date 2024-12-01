import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  bool isFavorite;
  FavoriteButton({super.key, this.isFavorite = false});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.isFavorite = !widget.isFavorite;
        setState(() {});
      },
      child: Stack(
        children: [
          Image.asset(widget.isFavorite
              ? 'assets/images/Icon-bookmark-gold.png'
              : 'assets/images/Icon-bookmark.png'),
          PositionedDirectional(
            top: 3,
            start: 2,
            child: Icon(
              widget.isFavorite ? Icons.done : Icons.add,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

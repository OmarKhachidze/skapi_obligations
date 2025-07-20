import 'package:flutter/material.dart';
import 'expandable_header.dart';

class SkapiExpandable extends StatefulWidget {
  const SkapiExpandable({
    super.key,
    required this.child,
    required this.iconPath,
    required this.label,
    required this.subLabel,
    required this.days,
    required this.amount,
    this.initiallyExpanded = false,
  });

  final Widget child;
  final String iconPath;
  final String label;
  final String subLabel;
  final String days;
  final double amount;
  final bool initiallyExpanded;

  @override
  State<SkapiExpandable> createState() => _SkapiExpandableState();
}

class _SkapiExpandableState extends State<SkapiExpandable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.05), // starts slightly above
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (_isExpanded) {
      _controller.value = 1;
    }
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpanded,
          child: ExpandableHeader(
            expanded: _isExpanded,
            iconPath: widget.iconPath,
            label: widget.label,
            subLabel: widget.subLabel,
            days: widget.days,
            amount: widget.amount,
          ),
        ),
        SizeTransition(
          sizeFactor: _controller,
          axisAlignment: 1.0, // collapses upwards when hiding
          child: SlideTransition(
            position: _slideAnimation,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

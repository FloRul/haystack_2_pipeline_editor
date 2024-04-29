import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    required this.onDestinationSelected,
  });

  final void Function(int) onDestinationSelected;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      groupAlignment: -1,
      onDestinationSelected: (int index) {
        widget.onDestinationSelected(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.data_object),
          selectedIcon: Icon(Icons.data_object),
          label: Text('Pipelines'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
    );
  }
}

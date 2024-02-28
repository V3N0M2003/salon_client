import 'package:flutter/material.dart';
import 'package:salon_client/common/service_detail.dart';

enum PageType { Men, Women, Unisex, Child }

class Beard extends StatefulWidget {
  const Beard({super.key});

  @override
  State<Beard> createState() => _BeardState();
}

class _BeardState extends State<Beard> {
  PageType _selectedPage = PageType.Men;

  void _navigateToPage(PageType pageType) {
    setState(() {
      _selectedPage = pageType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beard"),
        backgroundColor: Colors.black,
        actions: [
          DropdownButton(
            style: TextStyle(fontSize: 15, color: Colors.blue),
            value: _selectedPage,
            onChanged: (value) {
              _navigateToPage(value as PageType);
            },
            items: const [
              DropdownMenuItem(
                value: PageType.Men,
                child: Text('Men'),
              ),
              DropdownMenuItem(
                value: PageType.Women,
                child: Text('Women'),
              ),
              DropdownMenuItem(
                value: PageType.Unisex,
                child: Text('Unisex'),
              ),
              DropdownMenuItem(
                value: PageType.Child,
                child: Text('Child'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        child: _buildPageContent(),
      ),
    );
  }

  Widget _buildPageContent() {
    switch (_selectedPage) {
      case PageType.Men:
        return const ServiceList('Beard', 'Men');
      case PageType.Women:
        return const ServiceList('Beard', 'Women');
      case PageType.Unisex:
        return const ServiceList('Beard', 'Unisex');
      case PageType.Child:
        return const ServiceList('Beard', 'Child');
    }
  }
}

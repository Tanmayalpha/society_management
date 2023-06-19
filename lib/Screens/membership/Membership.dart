import 'package:flutter/material.dart';
import 'package:society_management/utils/Color.dart';

class MembershipView extends StatefulWidget {
  const MembershipView({super.key});

  @override
  _MembershipViewState createState() => _MembershipViewState();
}

class _MembershipViewState extends State<MembershipView>
    with SingleTickerProviderStateMixin {
late  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: Text('Membership App'),
        bottom: TabBar(
          indicatorColor: colors.primary,
          controller: _tabController,
          tabs: [
            Tab(text: 'Take Membership'),
            Tab(text: 'Membership Status'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TakeMembershipTab(),
          MembershipStatusTab(),
        ],
      ),
    );
  }
}

class TakeMembershipTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/sub.png', // Replace with your own image path
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          'Membership Plan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle the buy now button action
          },
          child: Text('Buy Now'),
        ),
      ],
    );
  }
}

class MembershipStatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Membership Application Status'),
    );
  }
}
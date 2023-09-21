import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Card(
                child: Column(
                  children: [
                    Text('John'),
                    Text('Unlimited usage'),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text('Jack'),
                    Text('Unlimited usage'),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Card(
            child: Column(
              children: [
                Text('Jimmy'),
                Text('20 hour use'),
                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

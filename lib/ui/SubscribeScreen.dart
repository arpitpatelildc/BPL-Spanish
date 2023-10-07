import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isOneMonthSelected = false;
  bool isSixMonthsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a Subscription Plan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubscriptionBox(
                  duration: '1 Month',
                  price: '\$9.99',
                  isSelected: isOneMonthSelected,
                  onTap: () {
                    setState(() {
                      isOneMonthSelected = true;
                      isSixMonthsSelected = false;
                    });
                  },
                ),
                SizedBox(width: 20),
                SubscriptionBox(
                  duration: '6 Months',
                  price: '\$49.99',
                  isSelected: isSixMonthsSelected,
                  onTap: () {
                    setState(() {
                      isOneMonthSelected = false;
                      isSixMonthsSelected = true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            if (isOneMonthSelected || isSixMonthsSelected)
              Column(
                children: [
                  Text(
                    'Unlock premium features:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Exclusive content, unlimited access, and more!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Add your subscription handling logic here
                    },
                    child: Text('Subscribe Now'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionBox extends StatelessWidget {
  final String duration;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionBox({super.key,
    required this.duration,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.green.withOpacity(0.5) : Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              duration,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
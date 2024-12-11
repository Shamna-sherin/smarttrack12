import 'package:flutter/material.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({Key? key}) : super(key: key);

  @override
  _TransportationScreenState createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
  String selectedField = 'Fees Due'; // Default selected field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transportation"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student profile section
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with student image
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Name: John Doe",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Admn. No: 12345",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Navigation fields (Fees Due, Payment History, Fine)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOption("Fees Due"),
                _buildOption("Payment History"),
                _buildOption("Fine"),
              ],
            ),
            const SizedBox(height: 20),

            // Dynamic content based on selected field
            Expanded(
              child: SingleChildScrollView(
                child: selectedField == 'Fees Due'
                    ? _buildFeesDueContent()
                    : selectedField == 'Payment History'
                        ? _buildPaymentHistoryContent()
                        : _buildFineContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build an option button
  Widget _buildOption(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedField = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedField == title ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedField == title ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Content for Fees Due
  Widget _buildFeesDueContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Due Date: 25-Dec-2024",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        const Text(
          "Due Amount: \$200",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle make payment action
            },
            child: const Text("Make Payment"),
          ),
        ),
      ],
    );
  }

  // Content for Payment History
  Widget _buildPaymentHistoryContent() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Sl No", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Mode", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Amount", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Challan No", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const Divider(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5, // Example data
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${index + 1}"),
                const Text("01-Dec-2024"),
                const Text("Online"),
                const Text("\$100"),
                const Text("CH12345"),
              ],
            );
          },
        ),
      ],
    );
  }

  // Content for Fine
  Widget _buildFineContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reason: Late Submission",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        const Text(
          "Amount: \$50",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle make payment action
            },
            child: const Text("Make Payment"),
          ),
        ),
      ],
    );
  }
}

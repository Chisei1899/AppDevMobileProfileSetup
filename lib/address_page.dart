import 'package:flutter/material.dart';
import 'business_detail.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final FocusNode _regionFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();
  final FocusNode _suburbFocus = FocusNode();
  final FocusNode _streetNameFocus = FocusNode();

  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _suburbController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _streetNoController = TextEditingController();
  final TextEditingController _unitNoController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();

  @override
  void dispose() {
    _regionFocus.dispose();
    _cityFocus.dispose();
    _suburbFocus.dispose();
    _streetNameFocus.dispose();
    _regionController.dispose();
    _cityController.dispose();
    _suburbController.dispose();
    _streetNameController.dispose();
    _streetNoController.dispose();
    _unitNoController.dispose();
    _postCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight / 2.7,
              child: Image.asset(
                'assets/background_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/back_arrow.png',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Registration",
                        style: TextStyle(fontSize: 19, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: LinearProgressIndicator(
                        value: 2 / 5,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
                        minHeight: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Step 2 of 5", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 0),
                  const Text("Fill your information",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  const Text("Provide your personal details to get started.",
                      style: TextStyle(fontSize: 16.5, color: Colors.grey)),
                  const SizedBox(height: 16),

                  // Region
                  TextField(
                    controller: _regionController,
                    focusNode: _regionFocus,
                    decoration: _buildInputDecoration('Region'),
                  ),
                  const SizedBox(height: 16),

                  // City/Town
                  TextField(
                    controller: _cityController,
                    focusNode: _cityFocus,
                    decoration: _buildInputDecoration('City/Town'),
                  ),
                  const SizedBox(height: 16),

                  // Suburb
                  TextField(
                    controller: _suburbController,
                    focusNode: _suburbFocus,
                    decoration: _buildInputDecoration('Suburb'),
                  ),
                  const SizedBox(height: 16),

                  // Street Name
                  TextField(
                    controller: _streetNameController,
                    focusNode: _streetNameFocus,
                    decoration: _buildInputDecoration('Street Name'),
                  ),
                  const SizedBox(height: 16),

                  // Street No & Unit No
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _streetNoController,
                          decoration: _buildInputDecoration('Street No.'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: _unitNoController,
                          decoration: _buildInputDecoration('Unit No.'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Post Code
                  TextField(
                    controller: _postCodeController,
                    decoration: _buildInputDecoration('Post Code'),
                  ),
                  const SizedBox(height: 153),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BusinessDetailPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo.shade900,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black38),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black54),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black54, width: 2),
      ),
    );
  }
}
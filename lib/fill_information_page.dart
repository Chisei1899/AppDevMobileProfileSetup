import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool agreeToTerms = false;

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isFirstNameEmpty = true;
  bool _isLastNameEmpty = true;
  bool _isAddressEmpty = true;
  bool _isEmailEmpty = true;

  @override
  void initState() {
    super.initState();

    _firstNameController.addListener(() {
      setState(() {
        _isFirstNameEmpty = _firstNameController.text.isEmpty;
      });
    });

    _lastNameController.addListener(() {
      setState(() {
        _isLastNameEmpty = _lastNameController.text.isEmpty;
      });
    });

    _addressController.addListener(() {
      setState(() {
        _isAddressEmpty = _addressController.text.isEmpty;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _isEmailEmpty = _emailController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _addressFocusNode.dispose();
    _emailFocusNode.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
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
                  // First Row: Back Button + Registration Text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/back_arrow.png',
                          height: 24, // adjust size as needed
                          width: 24,
                        ),
                      ),
                      const SizedBox(width: 8), // a little space between the back arrow and text
                      const Text(
                        "Registration",
                        style: TextStyle(fontSize: 19, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50), // space after back & title row

                  // Second: Linear Progress Indicator
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: LinearProgressIndicator(
                        value: 1 / 5,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
                        minHeight: 4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Step 1 of 7",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    "Fill your information",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Provide your personal details to get started.",
                    style: TextStyle(fontSize: 16.5 , color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // First Name TextField
                  TextField(
                    controller: _firstNameController,
                    focusNode: _firstNameFocusNode,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isFirstNameEmpty && !_firstNameFocusNode.hasFocus
                          ? 'First Name'
                          : '',
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Last Name TextField
                  TextField(
                    controller: _lastNameController,
                    focusNode: _lastNameFocusNode,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isLastNameEmpty && !_lastNameFocusNode.hasFocus
                          ? 'Last Name'
                          : '',
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Address TextField
                  TextField(
                    controller: _addressController,
                    focusNode: _addressFocusNode,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isAddressEmpty && !_addressFocusNode.hasFocus
                          ? 'Address'
                          : '',
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Email TextField
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isEmailEmpty && !_emailFocusNode.hasFocus
                          ? 'Email Address'
                          : '',
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black54, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Checkbox(
                        value: agreeToTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            agreeToTerms = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Or continue with"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Google sign-in logic
                      },
                      icon: Image.asset('assets/google_icon.png', height: 24),
                      label: const Text('Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.black12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate to Login
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: 'Already have an Account? ',
                          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                              text: 'Login here',
                              style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 65),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to next step
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
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
}
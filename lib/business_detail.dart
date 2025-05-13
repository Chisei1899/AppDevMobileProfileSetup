import 'package:flutter/material.dart';
import 'photo_verification.dart';

class BusinessDetailPage extends StatefulWidget {
  const BusinessDetailPage({super.key});

  @override
  State<BusinessDetailPage> createState() => _BusinessDetailPage();
}

class _BusinessDetailPage extends State<BusinessDetailPage> {
  String? _selectedProfession;

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  bool _isFirstNameEmpty = true;
  bool _isLastNameEmpty = true;
  bool _isEmailEmpty = true;
  bool _isExperienceEmpty = true;

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

    _emailController.addListener(() {
      setState(() {
        _isEmailEmpty = _emailController.text.isEmpty;
      });
    });

    _experienceController.addListener(() {
      setState(() {
        _isExperienceEmpty = _experienceController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _experienceController.dispose();
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                        value: 3 / 5,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
                        minHeight: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Step 3 of 5", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 0),
                  const Text("Business Details", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  const Text("Tell us about your business.", style: TextStyle(fontSize: 16.5, color: Colors.grey)),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _firstNameController,
                    focusNode: _firstNameFocusNode,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isFirstNameEmpty && !_firstNameFocusNode.hasFocus
                          ? 'Business Type (Optional)'
                          : '',
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _lastNameController,
                    focusNode: _lastNameFocusNode,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isLastNameEmpty && !_lastNameFocusNode.hasFocus
                          ? 'Company Type (Optional)'
                          : '',
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    value: (_selectedProfession == null || _selectedProfession!.isEmpty) ? null : _selectedProfession,
                    hint: const Text(
                      'Job Category',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    items: [
                      'Antenna Installer',
                      'Appliance Technician',
                      'Arborist',
                      'Architect',
                      'Designer',
                      'Asbestos Remover/Inspector',
                      'Bricklayer',
                      'Builder',
                      'Cabinet Maker/Joiner',
                      'Carpenter',
                      'Carpet-layer',
                      'Cladding Specialist',
                      'Cleaner',
                      'Concrete Layer',
                      'Curtain and Blind Professional',
                      'Demolition Expert',
                      'Door Specialist',
                      'Ducted Vacuum Specialist',
                      'Electrician',
                      'Excavation Contractor',
                      'Exterior Cleaner',
                      'Fabricator',
                      'Fencing and Gate Professional',
                      'Fire Services Professional',
                      'Flooring Professional',
                      'Foundation Specialist',
                      'Furniture Repair Professional',
                      'Garage Door Specialist',
                      'Gardener',
                      'Gas-fitter',
                      'Gib Stopper',
                      'Glazier',
                      'Handyman',
                      'Heating Professional',
                      'Insulation Professional',
                      'Interior Designer',
                      'Irrigation Specialist',
                      'Landscaper',
                      'Lighting Specialist',
                      'Locksmith',
                      'Marine Specialist',
                      'Mover/Removalist',
                      'Painter/Decorator',
                      'Pest Control Expert',
                      'Plasterer',
                      'Plumber',
                      'Project Manager',
                      'Property Inspector/Valuer',
                      'Renovation Specialist',
                      'Resurfacing Specialist',
                      'Roofer',
                      'Scaffolder',
                      'Security Specialist',
                      'Shade Sail Installer',
                      'Shed Installer',
                      'Signwritter',
                      'Skylight Installer',
                      'Solar Specialist',
                      'Staircase Specialist',
                      'Stonemason',
                      'Surveyor',
                      'Engineer',
                    ].map((profession) {
                      return DropdownMenuItem(
                        value: profession,
                        child: Text(
                          profession,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedProfession = value;
                      });
                    },
                    icon: Image.asset(
                      'assets/arrow_down.png',
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: 'Job Category',
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isEmailEmpty && !_emailFocusNode.hasFocus
                          ? 'Your Role (Optional)'
                          : '',
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: _experienceController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintText: _isExperienceEmpty ? 'Job Experience (e.g. 5 years of Carpentry)' : '',
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
                    ),
                  ),
                  const SizedBox(height: 215),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PhotoVerificationPage()),
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
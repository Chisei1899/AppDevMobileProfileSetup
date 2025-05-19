import 'package:flutter/material.dart';
import 'upload_files.dart';

class PhotoVerificationPage extends StatefulWidget {
  const PhotoVerificationPage({super.key});

  @override
  State<PhotoVerificationPage> createState() => _PhotoVerificationPage();
}

class _PhotoVerificationPage extends State<PhotoVerificationPage> {
  String? _selectedIDType;

  // New flag to track if the ID type is empty and user tried to submit
  bool _isIDTypeEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2.7,
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
                        child: Image.asset('assets/back_arrow.png', height: 24, width: 24),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Registration",
                        style: TextStyle(fontSize: 19, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: LinearProgressIndicator(
                        value: 4 / 5,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
                        minHeight: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Step 4 of 5", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 4),
                  const Text("Verification", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Please take a photo of your ID", style: TextStyle(fontSize: 16.5, color: Colors.grey)),
                  const SizedBox(height: 16),

                  // Dropdown with dynamic error styling
                  DropdownButtonFormField<String>(
                    value: _selectedIDType,
                    hint: Text(
                      'Select ID Type',
                      style: TextStyle(
                        color: _isIDTypeEmpty ? Colors.red : Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    items: [
                      "Voter's ID",
                      "Driver's License",
                      "Passport ID",
                      "Tin ID",
                      "Alien/Immigrant CoR",
                      "Kiwi Access Card",
                    ].map((idType) => DropdownMenuItem(value: idType, child: Text(idType))).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedIDType = value;
                        _isIDTypeEmpty = false; // Clear error once user picks
                      });
                    },
                    icon: Image.asset('assets/arrow_down.png', width: 20, height: 20),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _isIDTypeEmpty ? Colors.red : Colors.black54,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _isIDTypeEmpty ? Colors.red : Colors.black12,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: _isIDTypeEmpty ? Colors.red : Colors.black54,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  // Show error message if dropdown is empty on submit
                  if (_isIDTypeEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 12),
                      child: Text(
                        'Please select an ID type',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),

                  const SizedBox(height: 16),

                  DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TabBar(
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 2.5, color: Colors.indigo),
                              insets: EdgeInsets.symmetric(horizontal: 105.0),
                            ),
                            labelColor: Colors.indigo,
                            unselectedLabelColor: Colors.grey,
                            tabs: const [
                              Tab(text: 'Front'),
                              Tab(text: 'Back'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 250,
                          child: CustomPaint(
                            painter: DashedBorderPainter(),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Icon(Icons.add, size: 40, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      "Please provide a photo of your ID",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Spacer(),

                  // On Next pressed, validate the dropdown
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedIDType == null || _selectedIDType!.isEmpty) {
                          setState(() {
                            _isIDTypeEmpty = true;
                          });
                          return; // prevent navigation if invalid
                        }

                        // Proceed if valid
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const UploadFilesPage()),
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 66),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dashed Border Painter remains unchanged
class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 6.0;
    const dashSpace = 5.0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(12),
    );

    final path = Path()..addRRect(rect);
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
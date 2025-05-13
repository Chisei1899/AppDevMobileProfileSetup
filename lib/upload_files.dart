import 'package:flutter/material.dart';
import 'registration_complete.dart';

class UploadFilesPage extends StatefulWidget {
  const UploadFilesPage({super.key});

  @override
  State<UploadFilesPage> createState() => _UploadFilesPage();
}

class _UploadFilesPage extends State<UploadFilesPage> {
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
                        child: Image.asset('assets/back_arrow.png', height: 24, width: 24),
                      ),
                      const SizedBox(width: 8),
                      const Text("Registration", style: TextStyle(fontSize: 19, color: Colors.black54)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: LinearProgressIndicator(
                        value: 1.0,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
                        minHeight: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Step 5 of 5", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 4),
                  const Text("Upload files", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Attach necessary documents for verification.",
                      style: TextStyle(fontSize: 16.5, color: Colors.grey)),
                  const SizedBox(height: 30),

                  // Certificates Section
                  const Text("Certificates", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text("Upload up to 5 photos (Max 5MB each)",
                      style: TextStyle(color: Colors.black54, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(child: DashedPlaceholder()),
                      const SizedBox(width: 40),
                      _buildUploadButton(),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Insurance Section
                  const Text("Insurance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const Text("Upload insurance (Max 5MB)",
                      style: TextStyle(color: Colors.black54, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(child: DashedPlaceholder()),
                      const SizedBox(width: 40),
                      _buildUploadButton(),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegistrationCompletePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo.shade900,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 67),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement upload logic here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        "Upload",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class DashedPlaceholder extends StatelessWidget {
  const DashedPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: const Center(
          child: Icon(Icons.add, size: 36, color: Colors.grey),
        ),
      ),
    );
  }
}

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
      const Radius.circular(8),
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
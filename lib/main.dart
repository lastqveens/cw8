import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const ImageLabelingApp());
}

class ImageLabelingApp extends StatelessWidget {
  const ImageLabelingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageLabelingScreen(),
    );
  }
}

class ImageLabelingScreen extends StatefulWidget {
  @override
  _ImageLabelingScreenState createState() => _ImageLabelingScreenState();
}

class _ImageLabelingScreenState extends State<ImageLabelingScreen> {
  File? _imageFile;
  List<ImageLabel>? _labels;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _labels = null; // Reset previous labels
      });
      await _processImage(File(pickedFile.path));
    }
  }

  Future<void> _processImage(File imageFile) async {
    // Configure on-device image labeling
    final options = ImageLabelerOptions(
      confidenceThreshold: 0.5, // Adjust confidence threshold as needed
    );
    final labeler = ImageLabeler(options: options);

    final inputImage = InputImage.fromFilePath(imageFile.path);

    try {
      final labels = await labeler.processImage(inputImage);
      setState(() {
        _labels = labels;
      });
    } catch (e) {
      debugPrint("Image labeling error: $e");
    } finally {
      await labeler.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Labeling'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Image display area
          _imageFile != null
              ? Image.file(
                  _imageFile!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text('No image selected'),
                  ),
                ),
          const SizedBox(height: 20),
          // Buttons for Camera and Gallery
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.camera),
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () => _pickImage(ImageSource.gallery),
                icon: const Icon(Icons.photo),
                label: const Text('Gallery'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Display detected labels
          _labels != null
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _labels!.length,
                    itemBuilder: (context, index) {
                      final label = _labels![index];
                      return ListTile(
                        title: Text(label.label),
                        subtitle: Text(
                          'Confidence: ${(label.confidence * 100).toStringAsFixed(2)}%',
                        ),
                      );
                    },
                  ),
                )
              : const Text('No labels detected yet.'),
        ],
      ),
    );
  }
}

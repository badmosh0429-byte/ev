import 'package:camera/camera.dart';

class CameraService {
  CameraController? _controller;
  List<CameraDescription>? _cameras;

  Future<void> initialize() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(_cameras![0], ResolutionPreset.medium);
      await _controller!.initialize();
    }
  }

  CameraController? get controller => _controller;

  // Ye wala function missing tha, ab add kar diya hai
  Future<String?> capturePhoto() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      await initialize();
    }
    if (_controller == null) return null;

    try {
      final XFile photo = await _controller!.takePicture();
      return photo.path;
    } catch (e) {
      print("Error capturing photo: $e");
      return null;
    }
  }

  void dispose() {
    _controller?.dispose();
  }
}
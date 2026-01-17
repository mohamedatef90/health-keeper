import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:talker/talker.dart';
import 'package:uuid/uuid.dart';

/// Service for camera and photo operations
abstract class PhotoService {
  /// Initialize camera
  Future<CameraController?> initializeCamera();

  /// Dispose camera controller
  Future<void> disposeCamera();

  /// Take a photo using camera
  Future<PhotoResult?> takePhoto();

  /// Pick a photo from gallery
  Future<PhotoResult?> pickFromGallery();

  /// Save a photo to local storage
  Future<String?> savePhoto(Uint8List bytes, PhotoType type);

  /// Delete a photo from local storage
  Future<bool> deletePhoto(String path);

  /// Get photo bytes from path
  Future<Uint8List?> getPhotoBytes(String path);

  /// Compress photo for AI analysis
  Future<Uint8List?> compressForAnalysis(Uint8List bytes);
}

class PhotoServiceImpl implements PhotoService {
  final Talker _talker;
  final ImagePicker _picker = ImagePicker();
  final Uuid _uuid = const Uuid();

  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  PhotoServiceImpl({required Talker talker}) : _talker = talker;

  @override
  Future<CameraController?> initializeCamera() async {
    try {
      _cameras ??= await availableCameras();

      if (_cameras == null || _cameras!.isEmpty) {
        _talker.warning('No cameras available');
        return null;
      }

      // Use the back camera
      final backCamera = _cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras!.first,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _cameraController!.initialize();
      _talker.info('Camera initialized');

      return _cameraController;
    } catch (e, st) {
      _talker.error('Failed to initialize camera', e, st);
      return null;
    }
  }

  @override
  Future<void> disposeCamera() async {
    await _cameraController?.dispose();
    _cameraController = null;
    _talker.info('Camera disposed');
  }

  @override
  Future<PhotoResult?> takePhoto() async {
    try {
      if (_cameraController == null || !_cameraController!.value.isInitialized) {
        _talker.warning('Camera not initialized');
        return null;
      }

      final file = await _cameraController!.takePicture();
      final bytes = await File(file.path).readAsBytes();

      return PhotoResult(
        path: file.path,
        bytes: bytes,
        source: PhotoSource.camera,
      );
    } catch (e, st) {
      _talker.error('Failed to take photo', e, st);
      return null;
    }
  }

  @override
  Future<PhotoResult?> pickFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFile == null) return null;

      final bytes = await File(pickedFile.path).readAsBytes();

      return PhotoResult(
        path: pickedFile.path,
        bytes: bytes,
        source: PhotoSource.gallery,
      );
    } catch (e, st) {
      _talker.error('Failed to pick from gallery', e, st);
      return null;
    }
  }

  @override
  Future<String?> savePhoto(Uint8List bytes, PhotoType type) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final subfolder = type == PhotoType.meal ? 'meals' : 'progress';
      final photoDir = Directory(p.join(directory.path, 'photos', subfolder));

      if (!await photoDir.exists()) {
        await photoDir.create(recursive: true);
      }

      final fileName = '${_uuid.v4()}.jpg';
      final filePath = p.join(photoDir.path, fileName);
      final file = File(filePath);

      await file.writeAsBytes(bytes);
      _talker.info('Photo saved to $filePath');

      return filePath;
    } catch (e, st) {
      _talker.error('Failed to save photo', e, st);
      return null;
    }
  }

  @override
  Future<bool> deletePhoto(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
        _talker.info('Photo deleted: $path');
        return true;
      }
      return false;
    } catch (e, st) {
      _talker.error('Failed to delete photo', e, st);
      return false;
    }
  }

  @override
  Future<Uint8List?> getPhotoBytes(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        return await file.readAsBytes();
      }
      return null;
    } catch (e, st) {
      _talker.error('Failed to read photo bytes', e, st);
      return null;
    }
  }

  @override
  Future<Uint8List?> compressForAnalysis(Uint8List bytes) async {
    try {
      // For now, just return the bytes
      // In production, use image compression library
      // to reduce size for faster AI processing

      // If bytes are already under 1MB, return as-is
      if (bytes.length < 1024 * 1024) {
        return bytes;
      }

      // TODO: Implement actual compression
      // Could use flutter_image_compress package
      _talker.info('Photo compression: ${bytes.length} bytes');
      return bytes;
    } catch (e, st) {
      _talker.error('Failed to compress photo', e, st);
      return null;
    }
  }
}

/// Result from photo capture/selection
class PhotoResult {
  final String path;
  final Uint8List bytes;
  final PhotoSource source;

  PhotoResult({
    required this.path,
    required this.bytes,
    required this.source,
  });
}

enum PhotoSource {
  camera,
  gallery,
}

enum PhotoType {
  meal,
  progress,
}

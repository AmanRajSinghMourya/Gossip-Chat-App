import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final ImagePicker picker = ImagePicker();

  Future<String> pickImage() async {
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    // Capture a photo.
    // final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print(image.path);
    } else {
      print("Error image not found");
      return "";
    }
    // Pick a video.
    // final XFile? galleryVideo =
    //     await picker.pickVideo(source: ImageSource.gallery);
    // // Capture a video.
    // final XFile? cameraVideo =
    //     await picker.pickVideo(source: ImageSource.camera);
    // // Pick multiple images.
    // final List<XFile> images = await picker.pickMultiImage();
    // // Pick singe image or video.
    // final XFile? media = await picker.pickMedia();
    // // Pick multiple images and videos.
    // final List<XFile> medias = await picker.pickMultipleMedia();
    return image.path;
  }
}

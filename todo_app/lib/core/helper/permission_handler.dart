import 'package:permission_handler/permission_handler.dart';

class AppPermissionHelper {
  Future<bool> checkPermission(Permission permission) async {
    var status = await permission.status;

    if (status.isGranted) return true;

    if (status.isDenied) {
      status = await permission.request();
      return status.isGranted;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      status = await permission.status;
      return status.isGranted;
    }

    return false;
  }
}

Future<bool> checkCameraPermission() async =>
    await AppPermissionHelper().checkPermission(Permission.camera);

Future<bool> checkStoragePermission() async =>
    await AppPermissionHelper().checkPermission(Permission.storage);

Future<bool> checkPhotosPermission() async =>
    await AppPermissionHelper().checkPermission(Permission.photos);

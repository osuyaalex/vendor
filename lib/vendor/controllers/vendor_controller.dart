
import 'package:image_picker/image_picker.dart';

class VendorController{
  final ImagePicker _picker = ImagePicker();
  pockStoreImage(ImageSource source)async{
    XFile? _xfile = await _picker.pickImage(source: source);
    if(_xfile != null){
      return await _xfile.readAsBytes();
    }else{}
  }
}
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_only/vendor/controllers/vendor_controller.dart';

class VendorRegisterScreen extends StatefulWidget {
  const VendorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<VendorRegisterScreen> createState() => _VendorRegisterScreenState();
}

class _VendorRegisterScreenState extends State<VendorRegisterScreen> {
  late String countryValue;
  late String stateValue;
  late String cityValue;
  final VendorController _controller = VendorController();
  Uint8List? _image;
  final List<String> _taskOptions = ['Yes', 'No'];
  late String taskStatus;

  pickImageFromGallery()async{
    Uint8List _im = await _controller.pockStoreImage(ImageSource.camera);
    setState(() {
      _image = _im;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 200,
            flexibleSpace: LayoutBuilder(
                builder: (context, constraints){
                  return FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black,
                          Colors.red
                        ])
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _image != null ? Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: MemoryImage(_image!),fit: BoxFit.fill),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                  onPressed: (){
                                    pickImageFromGallery();
                                  },
                                  icon: const Icon(CupertinoIcons.camera)
                              ),
                            ): Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                  onPressed: (){
                                    pickImageFromGallery();
                                  },
                                  icon: const Icon(CupertinoIcons.photo)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Business Name',

                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',

                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Phone no',

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectState(
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged:(value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged:(value) {
                        setState(() {
                          cityValue = value;
                        });
                      },

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      const Text('Task Registered ?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 100,
                        child: DropdownButtonFormField(
                          hint: const Text('Select'),
                          items: _taskOptions.map<DropdownMenuItem<dynamic>>((e){
                            return DropdownMenuItem(
                                value: e,
                                child: Text(e)
                            );
                          }
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              taskStatus = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  taskStatus == 'Yes' ?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Tax Number'
                      ),
                    ),
                  ):Container(),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.red
                          ]
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

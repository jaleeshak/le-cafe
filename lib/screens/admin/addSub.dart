import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecafe/model/modalclass.dart';
import 'package:lecafe/providers/mainprovider.dart';
import 'package:provider/provider.dart';

class addProduct extends StatelessWidget {
  String id;
  String from;

  addProduct({super.key, required this.id, required this.from});
  var cakCat = [
    'Cake Flavours',
    ' Theme Cake ',
    ' Cup Cake ',
    ' Pastries ',
    ' Jar Cake ',
    ' Macarones ',
  ];
  String dropdownvalue = 'Cake Flavours';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E7E0),
      appBar: AppBar(
        backgroundColor: const Color(0xffE9E7E0),
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 50),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Center(
                  child: Text("Add Product",
                      style: TextStyle(color: Color(0xffE9E7E0), fontSize: 20)),
                ),
              ),
              Divider(
                  indent: 20,
                  endIndent: 0,
                  color: Color(0xff504A4A),
                  thickness: 3),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40, right: 10),
            child: Icon(Icons.search_outlined,
                size: 30, color: Colors.black.withOpacity(0.71)),
          )
        ],

        flexibleSpace: Container(
          height: 200,
          child: Image.asset(
            "assets/Ellipse 1 (3).png",
            fit: BoxFit.fill,
          ),
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.elliptical(400,80),)),
        // flexibleSpace: Container(
        //   height: 200,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.vertical(bottom:Radius.circular(80))),
        // ),
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(builder: (context, val, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 230, top: 10),
                child: Text("Product Name"),
              ),
              Container(
                margin: const EdgeInsets.only(left: 0, top: 10),
                height: 60,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffD9D9D9),
                ),
                child: TextField(
                  controller: val.productsNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xa385723a)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xa385723a)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xa385723a)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 120, top: 10),
                        child: Text("Price"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 0, top: 10),
                        height: 60,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9D9D9),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          controller: val.productsPriceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xa385723a)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xa385723a)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xa385723a)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 100, top: 10),
                        child: Text("Quantity"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 0, top: 10),
                        height: 60,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffD9D9D9),
                        ),
                        child: TextField(
                          controller: val.productsQuantityController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xa385723a)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xa385723a)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xa385723a)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(right: 60,top: 10),
                  //       child: Text("Price"),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.only(left: 0,top: 10),
                  //       height: 60,
                  //       width: 100,
                  //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffD9D9D9),),
                  //       child: TextField(
                  //
                  //         decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  //         ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xa385723a)),
                  //
                  //         ),
                  //           errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xa385723a)),
                  //
                  //
                  //           ),
                  //           enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color(0xa385723a)),
                  //
                  //           ),
                  //
                  //
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 250, top: 10),
                child: Text("Description"),
              ),
              Container(
                margin: const EdgeInsets.only(left: 0, top: 10),
                height: 60,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffD9D9D9),
                ),
                child: TextField(
                  controller: val.productsDescriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xa385723a)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xa385723a)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xa385723a)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 280, top: 10),
                child: Text("Image"),
              ),
              Consumer<MainProvider>(builder: (context, val, child) {
                return InkWell(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  child: val.productsfileimg != null
                      ? Container(
                          margin: const EdgeInsets.only(left: 0, top: 10),
                          width: 330,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xa385723a)),
                          ),
                          child: Image.file(
                            val.productsfileimg!,
                            scale: 6,
                            fit: BoxFit.fill,
                          ))
                      : val.productimage != ''
                          ? Container(
                              margin: const EdgeInsets.only(left: 0, top: 10),
                              width: 330,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0xa385723a)),
                              ),
                              child: Image.network(
                                val.productimage,
                                scale: 6,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(left: 0, top: 10),
                              width: 330,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0xa385723a)),
                              ),
                              child: Image.asset(
                                "assets/image.png",
                                scale: 6,
                              ),
                            ),
                );
              }),
              const Padding(
                padding: EdgeInsets.only(right: 220, top: 10),
                child: Text("Category Name"),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xa385723a)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Consumer<MainProvider>(
                            builder: (context, value, child) {
                          return Autocomplete<cust>(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return value.categoryitems
                                  .where((cust item) => item.Name.toLowerCase()
                                      .contains(
                                          textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (cust option) =>
                                option.Name,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                fieldTextEditingController.text =
                                    value.prdctcategoryController.text;
                              });

                              return SizedBox(
                                child: TextFormField(
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 14),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: const UnderlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.red),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        // borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)),
                                    enabledBorder: const UnderlineInputBorder(
                                        // borderRadius: BorderRadius.circular(30),

                                        ),
                                    hintText: "Select a category",
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onChanged: (txt) {},
                                  controller: fieldTextEditingController,
                                  focusNode: fieldFocusNode,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    } else {}
                                  },
                                ),
                              );
                            },
                            onSelected: (cust selection) {
                              value.prdctcategoryController.text =
                                  selection.Name;
                             value.productSelectedCategoryID = selection.id;
                              print(selection.id + "asdfg");
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<cust> onSelected,
                                Iterable<cust> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    width: 200,
                                    height: 300,
                                    color: Colors.white,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(10.0),
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final cust option =
                                            options.elementAt(index);

                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: Container(
                                            color: Colors.white,
                                            height: 50,
                                            width: 200,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(option.Name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  const SizedBox(height: 10)
                                                ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                    //   DropdownButton(
                    // // underline: Colors.white,
                    //
                    //     // Initial Value
                    //     value: dropdownvalue,
                    //
                    //     // Down Arrow Icon
                    //     icon:  Padding(
                    //       padding: const EdgeInsets.only(left: 150),
                    //       child: Icon(Icons.keyboard_arrow_down),
                    //     ),
                    //
                    //     // Array list of items
                    //     items: val.subcategory.map((subcat items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     // After selecting the desired option,it will
                    //     // change button value to selected value
                    //     onChanged: (String? newValue) {
                    //         dropdownvalue = newValue!;
                    //     },
                    //
                    //   ),
                  )),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (from == "NEW") {
                    val.addprodct(context, '', from);
                  } else {
                    val.addprodct(context, id, from);
                  }
                },
                child: Center(
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                        color: const Color(0xff85723A),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700))),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    MainProvider bakegramProvider =
        Provider.of<MainProvider>(context, listen: false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () => {
                        bakegramProvider.getsubImagecamera(),
                        Navigator.pop(context)
                      }),
              ListTile(
                  leading: const Icon(Icons.photo, color: Colors.black),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () => {
                        bakegramProvider.getsubImagegallery(),
                        Navigator.pop(context)
                      }),
            ],
          );
        });
    // ImageSource
  }
}

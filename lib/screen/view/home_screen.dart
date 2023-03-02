import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list/screen/modal/modal.dart';
import 'package:student_list/screen/provider/home_provider.dart';
import 'package:student_list/utils/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController dtxtname = TextEditingController();
  TextEditingController dtxtstd = TextEditingController();
  TextEditingController dtxtid = TextEditingController();
  HomeProvider? homeprovider;

  @override
  Widget build(BuildContext context) {
    homeprovider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text("Student Data"),
          backgroundColor: Colors.grey.shade900,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              text(txtid, 'Student Id'),
              SizedBox(
                height: 10,
              ),
              text(txtname, 'Student Name'),
              SizedBox(
                height: 10,
              ),
              text(txtstd, 'Student Std'),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Stdmodal s1 = Stdmodal(
                      name: txtname.text, id: txtid.text, std: txtstd.text);
                  homeprovider!.add(s1);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  child: Text("Add",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              Expanded(
                child: Consumer<HomeProvider>(
                  builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeprovider!.Std.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text("${homeprovider!.Std[index].name}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          subtitle: Text("${homeprovider!.Std[index].std}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                          leading: Text("${homeprovider!.Std[index].id}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    homeprovider!.remove(index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    dtxtname = TextEditingController(
                                        text: homeprovider!.Std[index].name);
                                    dtxtstd = TextEditingController(
                                        text: homeprovider!.Std[index].std);
                                    dtxtid = TextEditingController(
                                        text: homeprovider!.Std[index].id);
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Colors.grey.shade900,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Update data",style: TextStyle(color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            text(dtxtid, 'stduent Id'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            text(dtxtname, 'stduent Name'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            text(dtxtstd, 'stduent Std'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Stdmodal s1 = Stdmodal(
                                                    name: dtxtname.text, id: dtxtid.text, std: dtxtstd.text);
                                                homeprovider!.update(index, s1);
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(10),),
                                                alignment: Alignment.center,
                                                child: Text("Update",style: TextStyle(color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

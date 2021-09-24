import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DataModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Flutter app",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Post Request'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<DataModel?> submitData(String name, String job) async {
  var response = await http.post(Uri.http('reqres.in', 'api/users'),
      body: {"name": name, 'job': job});

  var data = response.body;
  print(data);

  if(response.statusCode == 201){
    String responseString = response.body;
    dataModelFromJson(responseString);
  }else{
    return null;
  }

}

class _MyHomePageState extends State<MyHomePage> {

  DataModel? _dataModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter name here"),
                controller: nameController,
              ),
              const SizedBox(
                height: 14,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter job title here"),
                controller: jobController,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () async {
                String name = nameController.text;
                String job = jobController.text;
                
                DataModel? data = await submitData(name, job);
                setState(() {
                  _dataModel = data;
                });
              }, child: const Text("Submit Data")),
            ],
          ),
        ),
      ),
    );
  }
}

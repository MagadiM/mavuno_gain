import 'package:flutter/material.dart';
import 'dart:io'; // For File
import 'package:image_picker/image_picker.dart'; // For selecting images
import 'package:http/http.dart' as http; // For making HTTP requests
import 'dart:convert'; // For encoding data

class ECommerceLandingPage extends StatefulWidget {
  @override
  _ECommerceLandingPageState createState() => _ECommerceLandingPageState();
}

class _ECommerceLandingPageState extends State<ECommerceLandingPage> {
  List<dynamic> items = [];
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final url = 'https://your-backend-api.com/items'; // Replace with your backend URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          items = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print('Error fetching items: $e');
    }
  }

  Future<void> uploadItem(String name, String description) async {
    final url = 'https://your-backend-api.com/upload'; // Replace with your upload endpoint
    try {
      if (_image == null) return;
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['name'] = name;
      request.fields['description'] = description;
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        print('Item uploaded successfully!');
        fetchItems(); // Refresh items
      } else {
        print('Failed to upload item');
      }
    } catch (e) {
      print('Error uploading item: $e');
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void showUploadDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Upload Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Item Description'),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: pickImage,
                icon: Icon(Icons.image),
                label: Text('Pick Image'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                uploadItem(nameController.text, descriptionController.text);
                Navigator.pop(context);
              },
              child: Text('Upload'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce Landing Page'),
      ),
      body: items.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  child: ListTile(
                    leading: item['image'] != null
                        ? Image.network(item['image'], width: 50, height: 50)
                        : Icon(Icons.image, size: 50),
                    title: Text(item['name']),
                    subtitle: Text(item['description']),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showUploadDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

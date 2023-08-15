import 'package:admin/allNews.dart';
import 'package:flutter/material.dart';

class NewsArticle {
  final String title;
  final String article;
  final String image;
  final String author;
  final DateTime publishDate;

  NewsArticle({
    required this.title,
    required this.article,
    required this.image,
    required this.author,
    required this.publishDate,
  });
}

class NewsAdminPage extends StatefulWidget {
  @override
  _NewsAdminPageState createState() => _NewsAdminPageState();
}

class _NewsAdminPageState extends State<NewsAdminPage> {
  List<NewsArticle> newsList = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _articleController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addNews() {
    setState(() {
      String title = _titleController.text;
      String article  = _articleController.text;
      String image = _imageController.text;
      String author = _authorController.text;

      NewsArticle newsArticle = NewsArticle(
        title: title,
        article: article,
        image: image,
        author: author,
        publishDate: _selectedDate,
      );

      newsList.add(newsArticle);

      _titleController.clear();
      _articleController.clear();
      _imageController.clear();
      _authorController.clear();
      _selectedDate = DateTime.now();
    });
    // In NewsAdminPage _addNews() method after adding the article:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => AllNewsDisplayPage(allNews: newsList),
  ),
);

  }
  

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin News Interface'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Enter title'),
            ),
            TextFormField(
              controller: _articleController,
              decoration: InputDecoration(labelText: 'Enter news article'),
            ),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Enter image URL'),
            ),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Enter author name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text('Select Publish Date'),
            ),
            Text('Publish Date: ${_selectedDate.toLocal().toString()}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addNews,
              child: Text('Add News'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  NewsArticle article = newsList[index];
                  return Card(
                    child: ListTile(
                      title: Text(article.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title: ${article.title}'),
                          Text('Article: ${article.article}'),
                          Image.network(article.image),
                          Text('Author: ${article.author}'),
                          Text('Published on: ${article.publishDate.toLocal().toString()}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

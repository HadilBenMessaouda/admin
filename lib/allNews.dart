import 'package:flutter/material.dart';
import 'news.dart';
import 'package:intl/intl.dart'; // Import the intl package


class AllNewsDisplayPage extends StatefulWidget {
  final List<NewsArticle> allNews;

  AllNewsDisplayPage({required this.allNews});

  @override
  _AllNewsDisplayPageState createState() => _AllNewsDisplayPageState();
}

class _AllNewsDisplayPageState extends State<AllNewsDisplayPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _articleController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
    String _formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime.toLocal());
  }


  void _addNews() {
    setState(() {
      String title = _titleController.text;
      String article = _articleController.text;
      String image = _imageController.text;
      String author = _authorController.text;

      NewsArticle newsArticle = NewsArticle(
        title: title,
        article: article,
        image: image,
        author: author,
        publishDate: _selectedDate,
      );

      widget.allNews.add(newsArticle);

      _titleController.clear();
      _articleController.clear();
      _imageController.clear();
      _authorController.clear();
      _selectedDate = DateTime.now();
    });
  }

  void _editNews(int index) async {
    NewsArticle article = widget.allNews[index];
    TextEditingController titleController = TextEditingController(text: article.title);
    TextEditingController articleController = TextEditingController(text: article.article);
    TextEditingController imageController = TextEditingController(text: article.image);
    TextEditingController authorController = TextEditingController(text: article.author);

    DateTime selectedDate = article.publishDate;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit News Article'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: articleController,
                decoration: InputDecoration(labelText: 'News Article'),
              ),
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextFormField(
                controller: authorController,
                decoration: InputDecoration(labelText: 'Author name'),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20),),

              //SizedBox(height: 16),
      // Inside the AlertDialog builder for editing news articles
ElevatedButton(
  onPressed: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  },
  child: Text('Select Publish Date'),
),
Text('Publish Date: ${_formatDateTime(selectedDate)}'), // Display date and time

            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving changes
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the changes and update the article in the list
                setState(() {
                  NewsArticle editedArticle = NewsArticle(
                    title: titleController.text,
                    article: articleController.text,
                    image: imageController.text,
                    author: authorController.text,
                    publishDate: selectedDate,
                  );
                  widget.allNews[index] = editedArticle;
                });
                Navigator.of(context).pop(); // Close the dialog after saving changes
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteNews(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete News Article'),
          content: Text('Are you sure you want to delete this news article?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without deleting
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.allNews.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog after deleting the article
              },
              child: Text('Delete'),
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
        title: Text('All News'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add News Article'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextFormField(
                          controller: _articleController,
                          decoration: InputDecoration(labelText: 'News Article'),
                        ),
                        TextFormField(
                          controller: _imageController,
                          decoration: InputDecoration(labelText: 'Image URL'),
                        ),
                        TextFormField(
                          controller: _authorController,
                          decoration: InputDecoration(labelText: 'Author name'),
                        ),
                                    Padding(padding: EdgeInsets.symmetric(vertical: 20),),

                        // SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime(2020, 1, 1),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            }
                          },
                          child: Text('Select Publish Date'),
                        ),
                        Text('Publish Date: ${_selectedDate.toLocal().toString()}'),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog without adding
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addNews();
                          Navigator.of(context).pop(); // Close the dialog after adding
                        },
                        child: Text('Publish'),
                      ),
                    ],
                  );
                },
              );
            },
             style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust the padding
                        ),
              
            
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20),),

          // SizedBox(width: 5, height: 10,),
          
        ],
      ),
      body: ListView.builder(
        itemCount: widget.allNews.length,
        itemBuilder: (context, index) {
          NewsArticle article = widget.allNews[index];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _editNews(index);
                        },
                         style: ElevatedButton.styleFrom(
                          primary: Colors.green, // Set the button color to green
                        ),
                        child: Text('Edit'),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 20),),

                      // SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          _deleteNews(index);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Set the button color to red
                        ),
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
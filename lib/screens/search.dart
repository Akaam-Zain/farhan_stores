import 'package:farhan_stores/screens/note.dart';
import 'package:farhan_stores/widgets/search_categories.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Note> _notes = <Note>[];
  List<Note> _notesForDisplay = <Note>[];

  Future<List<Note>> fetchNotes() async {
    var url =
        'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
    var response = await http.get(Uri.parse(url));

    var notes = <Note>[];

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            _searchBar(),
            Flexible(
              child: GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(20, (index) {
                    return Card(child: Text("Item 2"));
                  })),
            ),
          ],
        ),
      ),
    );
    // index == 0 ? _searchBar() : _listItem(index - 1);
  }

  _searchBar() {
    return Container(
        margin: EdgeInsets.only(top: 50, left: 15, right: 15),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          border: Border.all(color: Colors.transparent), // set border width
          borderRadius: BorderRadius.all(
              Radius.circular(30.0)), // set rounded corner radius
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
            onChanged: (text) {
              text = text.toLowerCase();
              setState(() {
                _notesForDisplay = _notes.where((note) {
                  var noteTitle = note.title.toLowerCase();
                  return noteTitle.contains(text);
                }).toList();
              });
            },
          ),
        ));
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _notesForDisplay[index].title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _notesForDisplay[index].text,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

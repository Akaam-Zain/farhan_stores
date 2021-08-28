class Note {
  String title = '';
  String text = '';

  Note(this.title, this.text);

  Note.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    title = json['title'];
  }
}


enum WordPkgRowDataType {
    title,
    content
}

class WordPkgRowData {
    WordPkgRowData({this.type, this.title, this.count, this.source, this.target, this.editable});

    WordPkgRowDataType type;
    String title;
    int count;
    String source;
    String target;
    bool editable;
}



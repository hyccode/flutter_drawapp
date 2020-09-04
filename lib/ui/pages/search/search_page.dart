import 'package:flutter/material.dart';
import 'package:yubeiapp/ui/pages/search/search_result/page.dart';
import 'package:yubeiapp/utils/shared_preferences.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  List<String> items = List();

  bool isFirst = false;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isNotEmpty && !items.contains(query)) {
      items.add(query);
      addHistory(items);
    }
    return SearchResultPage().buildPage(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (isFirst) {
      return SearchContentView(
        items: items,
        callBack: (key) {
          query = key;
          showResults(context);
        },
        changeCallBack: (key) {
          query = "";
          items = key;
          addHistory(items);
        },
      );
    } else {
      isFirst = true;
      _initData(context);
      return Container();
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context);
  }

  void addHistory(List<String> trim) async {
    var spUtil = await SpUtil.getInstance();
    spUtil.putStringList("history", trim);
  }

  void _initData(BuildContext context) async {
    var spUtil = await SpUtil.getInstance();
    items = spUtil.getStringList("history") ?? List();
    showSuggestions(context);
  }
}

/**
 * 历史记录
 */
class SearchContentView extends StatefulWidget {
  final List<String> items;
  final callBack;
  final changeCallBack;

  SearchContentView({
    this.items,
    this.callBack,
    this.changeCallBack,
  });

  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState extends State<SearchContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '历史记录',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: SearchItemView(
                items: widget.items,
                callBack: widget.callBack,
                changeCallBack: widget.changeCallBack),
          )
        ],
      ),
    );
  }
}

class SearchItemView extends StatefulWidget {
  final List<String> items;
  final callBack;
  final changeCallBack;

  SearchItemView({
    this.items,
    this.callBack,
    this.changeCallBack,
  });

  @override
  _SearchItemViewState createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  @override
  Widget build(BuildContext context) {
    if (widget.items == null) {
      return Container();
    } else {
      return SingleChildScrollView(
        child: Container(
          child: Wrap(
            spacing: 10,
            // runSpacing: 0,
            children: widget.items.map((item) {
              return SearchItem(
                  callBack: widget.callBack,
                  title: item,
                  deleteCallBack: (key) {
                    widget.items.remove(key);
                    widget.changeCallBack(widget.items);
                    setState(() {});
                  });
            }).toList(),
          ),
        ),
      );
    }
  }
}

class SearchItem extends StatefulWidget {
  @required
  final String title;

  final callBack;
  final deleteCallBack;

  const SearchItem({
    Key key,
    this.title,
    this.callBack,
    this.deleteCallBack,
  }) : super(key: key);

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          deleteIcon: Icon(Icons.close),
          onDeleted: () {
            widget.deleteCallBack(widget.title);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
          widget.callBack(widget.title);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class SelectProfessionPage extends StatefulWidget {
  @override
  _SelectProfessionPageState createState() => _SelectProfessionPageState();
}

class _SelectProfessionPageState extends State<SelectProfessionPage> {
  final _controller = TextEditingController();

  final List<String> selected = [];

  static final strings = ["carpenter", "water carrier", "artist", "artesan"];

  Map<String, int> professions = {
    strings[0] : 0,
    strings[1] : 0,
    strings[2] : 0,
    strings[3] : 0,
  };

  String currentText = "";

  final GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _buildAutoCompleteTF(), backgroundColor: Colors.white, elevation: 0.0,),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
        color: Colors.white,
        child: ListView.builder(
            itemCount: selected.length,
            itemBuilder: (context, index) {
              return Dismissible(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(selected[index], style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
                        _buildExpModifier(selected[index]),
                      ],
                    ),
                    Divider(color: Colors.grey)
                  ],
                ),
                key: Key(selected[index]),
                onDismissed: (DismissDirection dd) {
                  setState(() {
                    selected.removeAt(index);
                  });

                },
              );
            }),
      ),
    );
  }

  Widget _buildExpModifier(String key){
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove, color: Colors.redAccent),
            onPressed: () {
              setState(() {
                if (professions[key] > 0){
                  professions[key]--;
                }else {
                  professions[key] = 0;
                }
                print(professions);
              });
            },
          ),
          Text(professions[key].toString()),
          IconButton(
            icon: Icon(Icons.add, color: Colors.blueAccent),
            onPressed: () {
              setState(() {
                professions[key]++;
                print(professions);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAutoCompleteTF() {
    return ListTile(
        title: AutoCompleteTextField<String>(
          decoration: InputDecoration(
            hintText: "Select a profession",
            suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if (currentText.isNotEmpty) {
                      selected.add(currentText);
                      key.currentState.clear();
                    }
                  });
                }),
          ),
          textChanged: (value) {
            currentText = value;
          },
          key: key,
          itemBuilder: (BuildContext context, suggestion) {
            return Padding(
                padding: EdgeInsets.all(8.0), child: new Text(suggestion));
          },
          itemFilter: (suggestion, String query) {
            return suggestion.toLowerCase().startsWith(query);
          },
          itemSorter: (a, b) {
            return a.compareTo(b);
          },
          suggestions: strings,

          submitOnSuggestionTap: false,

        )
    );

  }
}

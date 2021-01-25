import 'package:flutter/material.dart';
import 'package:quizzler/constants.dart';

class CreateSurvey extends StatefulWidget {
  static String id = 'CreateSurvey';
  @override
  _CreateSurveyState createState() => _CreateSurveyState();
}

class _CreateSurveyState extends State<CreateSurvey> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => BottomSheet(),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Create Survey'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    decoration: KTextField.copyWith(
                        labelText: 'Survey Name',
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                ),
                Container(
                  height: 50,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Set time to whole Survey',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: TextField(
                              decoration: KTextField.copyWith(
                            contentPadding: EdgeInsets.only(left: 5),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                          )),
                        ),
                        Text(
                          'Mintues',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Set Number of time to Survey',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: TextField(
                              decoration: KTextField.copyWith(
                            contentPadding: EdgeInsets.only(left: 5),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Set option to answer of Question',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 110),
                          child: DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text('Radio Button'),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                    child: Text('Text Button'), value: 2),
                                DropdownMenuItem(
                                    child: Text('CheckBox Button'), value: 3),
                                DropdownMenuItem(
                                    child: Text('DropDown Button'), value: 4),
                              ],
                              value: _value,
                              onChanged: (int i) {
                                setState(() {
                                  _value = i;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            FlatButton(
              onPressed: () {},
              child: Text('Submit'),
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Text(
                'Add Question',
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  decoration: KTextField.copyWith(
                      hintText: 'Write Question',
                      labelText: 'Question',
                      contentPadding: EdgeInsets.only(left: 10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  children: [
                    Text(
                      '1. ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Option 1'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  children: [
                    Text(
                      '2. ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Option 2'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  children: [
                    Text(
                      '3. ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Option 3'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  children: [
                    Text(
                      '4. ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Option 4'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('ADD'),
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

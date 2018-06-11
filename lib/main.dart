import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'reducers.dart';
import 'actions.dart';
import 'states.dart';

void main() {
  final Store<CounterState> store = new Store<CounterState>(counterReducer, initialState: CounterState.empty);
  runApp(new MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CounterState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<CounterState>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new StoreConnector<CounterState, String>(
              converter: (store) => store.state.count.toString(),
              builder: (context, viewModel) {
                return new Text(
                  viewModel,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<CounterState, OnCounterChanged>( // () -> Unit
        converter: (store) {
          return (count) => store.dispatch(IncrementAction(count));
        },
        builder: (context, callback) {
          return new FloatingActionButton(
            onPressed: () => callback(2),
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ),
    );
  }
}

typedef OnCounterChanged = Function(int count);
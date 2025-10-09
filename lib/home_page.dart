import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _listaTarefa = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Align(
          child: Text(
            'To-Do-List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            child: Form(
              key: _formKey,

              child: TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe uma Tarefa';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Adicionar uma Tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _listaTarefa.add(_controller.text);
                  _controller.clear();
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.green),
                child: Center(
                  child: Text(
                    'Enviar Tarefa',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefa.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_listaTarefa[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}

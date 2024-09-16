import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'aktivitas.dart'; // Import halaman aktivitas

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  List<Map<String, dynamic>> todoList = [];

  void _showAddTodoDialog() {
    String activityName = '';
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    bool isCompleted = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Activity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  activityName = value;
                },
                decoration: InputDecoration(labelText: 'Activity Name'),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}",
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Time: ${selectedTime.format(context)}",
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Completed:'),
                  Checkbox(
                    value: isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        isCompleted = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  todoList.add({
                    "activityName": activityName,
                    "date": selectedDate,
                    "time": selectedTime,
                    "isCompleted": isCompleted
                  });
                });
                Navigator.of(context).pop();
              },
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
        title: Text("Index"),
        backgroundColor: Colors.white,
      ),
      body: todoList.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 100, color: Colors.purple),
            SizedBox(height: 20),
            Text(
              'What do you want to do today?',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Tap + to add your tasks',
              style: TextStyle(fontSize: 16, color: Colors.white60),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];
          return ListTile(
            leading: Checkbox(
              value: todo["isCompleted"],
              onChanged: (bool? value) {
                setState(() {
                  todoList[index]["isCompleted"] = value ?? false;
                });
              },
            ),
            title: Text(
              todo["activityName"],
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "${DateFormat('yyyy-MM-dd').format(todo["date"])} at ${todo["time"].format(context)}",
              style: TextStyle(color: Colors.white60),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                setState(() {
                  todoList.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.purple,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Index'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.timer_outlined), label: 'Focus'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

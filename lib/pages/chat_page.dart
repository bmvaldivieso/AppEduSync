import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/asistenciapage');
      }
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/tareaspage');
      }
      if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/avisospage');
      }
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/homepage');
      }
      if (_selectedIndex == 4) {
        Navigator.pushNamed(context, '/calendariopage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = const Color(0xFF6750A4);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nicholas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: customColor),
            onPressed: () {
              // Acción de más opciones
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildMessagesList(),
          _buildMessageInput(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded, color: Colors.black),
            label: 'Asistencia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Colors.black),
            label: 'Tareas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            label: 'Calendario',
          ),
        ],
        currentIndex: 0,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMessagesList() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          _buildMessageBubble('Hola nicolas buenas noches 😊', '10:45', true),
          _buildMessageBubble(
              '¿Cómo fue tu curso de diseño UI/UX? 😊', '12:45', true),
          _buildMessageBubble(
              'Hola, buenos días también Ronald.', '15:29', false),
          _buildMessageBubble('', '15:29', false, isImage: true),
          _buildMessageBubble(
              'Hola, también acabo de terminar Sketch Basic. ⭐⭐⭐⭐⭐',
              '15:52',
              false),
          _buildMessageBubble('Dios mío, esto es increíble...', '13:59', true),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, String time, bool isSentByMe,
      {bool isImage = false}) {
    Color customColor = const Color(0xFF6750A4);

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            constraints: const BoxConstraints(maxWidth: 200),
            decoration: BoxDecoration(
              color: isSentByMe ? customColor : Colors.blue[50],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: isImage
                ? Row(
                    children: [
                      Container(width: 50, height: 50, color: Colors.black),
                      const SizedBox(width: 8),
                      Container(width: 50, height: 50, color: Colors.black),
                    ],
                  )
                : Text(
                    message,
                    style: TextStyle(
                        color: isSentByMe ? Colors.white : Colors.black),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    Color customColor = const Color(0xFF6750A4);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 25,
            backgroundColor: customColor,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                // Acción para enviar el mensaje
              },
            ),
          ),
        ],
      ),
    );
  }
}

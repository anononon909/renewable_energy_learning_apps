import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renewable_energy_apps/virtual_mentor/consts.dart';

class VirtualMentor extends StatefulWidget {
  const VirtualMentor({Key? key});

  @override
  State<VirtualMentor> createState() => _ChatPageState();
}

class _ChatPageState extends State<VirtualMentor> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(
        seconds: 5,
      ),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'User');

  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'Vector');

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF78D9F1),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/virtual_mentor/vmen.png'),
              radius: 16,
            ),
            SizedBox(width: 8),
            Text(
              'Vector',
              style: GoogleFonts.publicSans(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: DashChat(
          currentUser: _currentUser,
          typingUsers: _typingUsers,
          messageOptions: const MessageOptions(
            currentUserContainerColor: Colors.black,
            avatarBuilder: yourAvatarBuilder,
            containerColor: Color.fromRGBO(
              0,
              166,
              126,
              1,
            ),
            textColor: Colors.white,
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages,
        ),
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    List<Messages> _messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: _messagesHistory,
      maxToken: 200,
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
        });
      }
    }
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}

Widget yourAvatarBuilder(
    ChatUser user, Function? onAvatarTap, Function? onAvatarLongPress) {
  return GestureDetector(
    onTap: onAvatarTap as void Function()?,
    onLongPress: onAvatarLongPress as void Function()?,
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(
        'images/virtual_mentor/vmen.png',
      ),
    ),
  );
}

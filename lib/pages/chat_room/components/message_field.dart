import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/stores/chat_rooms_store.dart';

class MessageField extends StatefulWidget {
  const MessageField({super.key});

  @override
  State<MessageField> createState() => _MessageFieldCustomState();
}

class _MessageFieldCustomState extends State<MessageField> {
  final _chatRoomsStore = GetIt.instance<ChatRoomsStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Observer(builder: (_) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextFormField(
                controller: _chatRoomsStore.messageController,
                decoration: InputDecoration(
                  hintText: "Mensagem",
                  filled: true,
                  fillColor: Colors.black12,
                  contentPadding: const EdgeInsets.all(12),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) => _chatRoomsStore.setMessage(value),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 8,
              ),
            ),
            if (_chatRoomsStore.message.isNotEmpty) ...[
              const SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    _chatRoomsStore.pressedSendMessage();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
            const SizedBox(),
          ],
        );
      }),
    );
  }
}

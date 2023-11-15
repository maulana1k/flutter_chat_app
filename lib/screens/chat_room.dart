import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(FluentIcons.chevron_left_16_filled)),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://bit.ly/dan-abramov'),
            ),
            SizedBox(width: 10),
            Text('Erick Ganteng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FluentIcons.more_vertical_16_filled))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
          ),
          const Spacer(),
          const MessageTextField()
        ],
      ),
    );
  }
}

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    super.key,
  });

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  late bool _isEmojiOpen;
  final _messageTextController = TextEditingController();
  final _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    setState(() {
      _isEmojiOpen = false;
    });
  }

  void toggleEmojiPicker() {
    _isEmojiOpen
        ? SystemChannels.textInput.invokeMethod('TextInput.show')
        : SystemChannels.textInput.invokeMethod('TextInput.hide');
    setState(() {
      _isEmojiOpen = !_isEmojiOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, left: 12, right: 4),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100, borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: toggleEmojiPicker,
                          icon: Icon(
                              _isEmojiOpen
                                  ? FluentIcons.keyboard_16_filled
                                  : FluentIcons.emoji_16_filled,
                              color: Colors.grey)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            controller: _messageTextController,
                            focusNode: _focusNode,
                            minLines: 1,
                            maxLines: 10,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                isDense: true,
                                hintText: 'Message',
                                border: OutlineInputBorder(borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                  padding: const EdgeInsets.all(12),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)),
                  onPressed: () {},
                  icon: const Icon(FluentIcons.send_16_filled, color: Colors.white, size: 22))
            ],
          ),
          if (_isEmojiOpen)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {},
                onBackspacePressed: () {
                  // Do something when the user taps the backspace button (optional)
                  // Set it to null to hide the Backspace-Button
                },
                textEditingController: _messageTextController,
                config: const Config(
                  columns: 7,
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  emojiSizeMax: 26,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.RECENT,
                  bgColor: Colors.white,
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  backspaceColor: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  recentTabBehavior: RecentTabBehavior.RECENT,
                  recentsLimit: 28,
                  noRecents: Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ), // Needs to be const Widget
                  loadingIndicator: SizedBox.shrink(), // Needs to be const Widget
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/circle_avatar_custom.dart';
import 'package:socialize/stores/user_store.dart';

class CircleAvatarCustom extends StatefulWidget {
  const CircleAvatarCustom({super.key});

  @override
  State<CircleAvatarCustom> createState() => _CircleAvatarCustomState();
}

class _CircleAvatarCustomState extends State<CircleAvatarCustom> {
  final userStore = GetIt.instance<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => pressedAvatar(),
        child: Observer(builder: (_) {
          return Stack(
            children: [
              avatar(context: context, photo: userStore.photoUrlField, radius: 60),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void pressedAvatar() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 216,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Câmera'),
                  onPressed: () {
                    userStore.selectImage('camera');
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text('Galeria'),
                  onPressed: () {
                    userStore.selectImage('gallery');
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    userStore.selectImage('remove');
                    Navigator.pop(context);
                  },
                  child: const Text('Remover foto'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

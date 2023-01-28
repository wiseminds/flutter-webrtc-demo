import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/room_provider.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CupertinoNavigationBar(middle: Text('New Call')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70, width: double.infinity),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Enter Room name'),
                onChanged: (text) => context.read<RoomProvider>().value = text,
              ),
              const SizedBox(height: 20),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     hintText: 'Enter Room name'
              //   ),
              // ),
              const Spacer(),
              SizedBox(
                  width: 400,
                  child: ElevatedButton(
                      onPressed: context.watch<RoomProvider>().value.length > 2
                          ? () {}
                          : null,
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text('Start'),
                      ))),
              const SizedBox(height: 70),
            ],
          ),
        ));
  }
}

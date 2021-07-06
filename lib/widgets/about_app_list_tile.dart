import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

import '../utils/custom_icons_icons.dart';

class AboutAppListTile extends StatelessWidget {
  Future<void> launchUrl(BuildContext context, String url) async {
    if (await urlLauncher.canLaunch(url)) {
      await urlLauncher.launch(url);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Could not open URL'),
            content: Text(url + ' could not be opened'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('GOT IT'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      icon: const Icon(Icons.info),
      child: const Text('About'),
      applicationIcon: Image.asset(
        'assets/icon/launcher_icon.png',
        height: 75,
        width: 75,
      ),
      applicationLegalese: 'Made by Anietimfon Effiong',
      applicationVersion: 'v0.7.2',
      aboutBoxChildren: <Widget>[
        const SizedBox(height: 12),
        const Text('A beautiful and informative budgeting helper app'),
        const SizedBox(height: 7),
        ListTile(
          leading: const Icon(CustomIcons.github),
          title: const Text('Contribute to the app'),
          onTap: () => launchUrl(
              context, 'https://github.com/titicodes'),
        ),
        ListTile(
          leading: const Icon(CustomIcons.linkedin),
          title: const Text('Hire me'),
          onTap: () =>
              launchUrl(context, 'https://web.facebook.com/anietimfon.effiong.35'),
        ),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('About me'),
          onTap: () => launchUrl(context, 'https://web.facebook.com/anietimfon.effiong.35'),
        ),
      ],
    );
  }
}

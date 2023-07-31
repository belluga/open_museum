import 'package:flutter/material.dart';
import 'package:open_museum/domain/external_links/external_link_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileExternalLinks extends StatelessWidget {
  final List<ExternalLinkModel> externalLinks;

  const ProfileExternalLinks({super.key, required this.externalLinks});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return IconButton(
              onPressed: () => _launchURL(destination: externalLinks[index].url),
              icon: Icon(externalLinks[index].iconData),
            );
          },
          itemCount: externalLinks.length),
    );
  }

  void _launchURL({required Uri destination}) async {
    if (await canLaunchUrl(destination)) {
      launchUrl(destination, mode: LaunchMode.externalApplication);
    }
  }
}

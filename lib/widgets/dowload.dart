

// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr/constants/ui_helper.dart';
import 'package:flutter_qr/models/url_create.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  //you can save other file formats too.
  @override
  Widget build(BuildContext context) {
    double? _progress;
    String _status = '';
    String gecici = ui_helper.data;
    String gecici2 = ui_helper.size;
    String fileurl = createUrl.createURL(gecici2, gecici);
    return IconButton(
      icon: const Icon(
        Icons.file_download_outlined,
        size: 50,
      ),
      color: Colors.black,
      selectedIcon: const Icon(Icons.file_download_done_outlined),
      onPressed: () async {
       String ad = "";
            for (int i = 0; i < 6; i++) {
              ad += gecici[i];
              if (gecici[i].length - 1 == i) {
                break;
              }
            }
            String savename = "$ad.png";
  
            FileDownloader.downloadFile(
                url: fileurl,
                name: savename,
                onProgress: (name, progress) {
                  setState(() {
                    _progress = progress;
                    _status = 'Progress: $progress%';
                  });
                },
                onDownloadCompleted: (path) {
                  EasyLoading.showToast("QR has been downloaded",
                    duration: const Duration(seconds: 2));
                  setState(() {
                    _progress = null;
                    _status = 'File downloaded to: $path';
                  });
                },
                onDownloadError: (error) {
                  setState(() {
                    _progress = null;
                    _status = 'Download error: $error';
                  });
                }).then((file) {
              debugPrint('file path: ${file?.path}');
            });
      },
    );
  }
}
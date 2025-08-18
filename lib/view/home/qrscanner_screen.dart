import 'dart:io';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class QRScanOrGalleryScreen extends StatefulWidget {
  const QRScanOrGalleryScreen({super.key});

  @override
  State<QRScanOrGalleryScreen> createState() => _QRScanOrGalleryScreenState();
}

class _QRScanOrGalleryScreenState extends State<QRScanOrGalleryScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isTorchOn = false;
  bool isCameraPaused = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.resumeCamera();

    qrController.scannedDataStream.listen((scanData) async {
      if (isCameraPaused) return;

      final code = scanData.code;
      if (code != null && code.startsWith("upi://")) {
        HapticFeedback.mediumImpact();
        setState(() {
          isCameraPaused = true;
        });
        controller?.pauseCamera();

        Navigator.pushNamed(context, RoutesName.orderdetailsscreen).then((_) {
          setState(() => isCameraPaused = false);
          controller?.resumeCamera();
        });
      } else {
        HapticFeedback.heavyImpact();
        setState(() {
          isCameraPaused = true;
        });
        controller?.pauseCamera();
        // _showInvalidQrBottomSheet();
        Navigator.pushNamed(context, RoutesName.orderdetailsscreen).then((_) {
          setState(() => isCameraPaused = false);
          controller?.resumeCamera();
        });
      }
    });
  }

  // void _showInvalidQrBottomSheet({String? message}) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (_) {
  //       return Container(
  //         padding: const EdgeInsets.all(20),
  //         decoration: BoxDecoration(
  //           color: Colors.red.shade50,
  //           borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Icon(Icons.error_outline, size: 60, color: Colors.red.shade400),
  //             const SizedBox(height: 16),
  //             Text(
  //               "Invalid QR Code",
  //               style: TextStyle(
  //                 color: Colors.red.shade400,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             Text(
  //               message ??
  //                   "This QR code is not a valid UPI code. Please scan a valid UPI QR.",
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(color: Colors.black54),
  //             ),
  //             const SizedBox(height: 20),
  //             ElevatedButton.icon(
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.red.shade400,
  //                 foregroundColor: Colors.white,
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 20,
  //                   vertical: 12,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //               ),
  //               onPressed: () {
  //                 setState(() => isCameraPaused = false);
  //                 controller?.resumeCamera();
  //                 Navigator.pop(context);
  //               },
  //               icon: const Icon(Icons.qr_code_scanner),
  //               label: const Text("Scan Again"),
  //             ),
  //             const SizedBox(height: 10),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.deepPurple,
                borderRadius: 10.r,
                borderLength: 30.r,
                borderWidth: 8.r,
                cutOutSize: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 16.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Scan Order QR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

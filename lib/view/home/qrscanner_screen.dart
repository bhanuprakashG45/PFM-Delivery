import 'dart:convert';
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

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isCameraPaused = ValueNotifier(false);

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    isLoading.dispose();
    isCameraPaused.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller = qrController;
    controller?.resumeCamera();

    qrController.scannedDataStream.listen((scanData) async {
      if (isCameraPaused.value || isLoading.value) return;

      final orderId = extractOrderId(scanData.code ?? '');

      if (orderId != null && orderId.isNotEmpty) {
        HapticFeedback.mediumImpact();
        isCameraPaused.value = true;
        isLoading.value = true;
        controller?.pauseCamera();

        if (!mounted) return;

        Navigator.pushNamed(
          context,
          RoutesName.orderdetailsscreen,
          arguments: orderId,
        ).then((_) {
          isCameraPaused.value = false;
          isLoading.value = false;
          controller?.resumeCamera();
        });
      } else {
        isCameraPaused.value = true;
        controller?.pauseCamera();

        HapticFeedback.heavyImpact();
        _showInvalidQrBottomSheet(
          message: "QR code is invalid or missing order ID.",
        );
      }
    });
  }

  String? extractOrderId(String qrData) {
    try {
      if (qrData.startsWith('http')) {
        final uri = Uri.parse(qrData);

        if (uri.pathSegments.contains('print-qr')) {
          final index = uri.pathSegments.indexOf('print-qr');
          if (index != -1 && uri.pathSegments.length > index + 1) {
            return uri.pathSegments[index + 1];
          }
        }
      } else if (qrData.startsWith('{') || qrData.startsWith('[')) {
        final data = json.decode(qrData);
        if (data is Map && data.containsKey('orderId')) {
          return data['orderId'];
        } else if (data is List &&
            data.isNotEmpty &&
            data.first['_id'] != null) {
          return data.first['_id'];
        }
      }
    } catch (e) {
      debugPrint("QR parsing error: $e");
    }
    return null;
  }

  void _showInvalidQrBottomSheet({String? message}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)).r,
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 60.sp, color: Colors.white),
                  SizedBox(height: 16.h),
                  Text(
                    "Invalid QR Code",
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    message ??
                        "This QR code is not valid. Please scan a correct QR.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30).r,
                      ),
                    ),
                    onPressed: () {
                      isCameraPaused.value = false;
                      controller?.resumeCamera();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text("Scan Again"),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                  Text(
                    "Scan Order QR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isLoading,
              builder: (context, loading, _) {
                if (!loading) return const SizedBox.shrink();
                return Container(
                  color: Colors.black.withOpacity(0.6),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

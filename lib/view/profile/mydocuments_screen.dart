import 'package:priya_freshmeats_delivery/utils/exports.dart';

class MydocumentsScreen extends StatelessWidget {
  const MydocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorscheme.surface,
      appBar: AppBar(
        title: Text(
          'My Documents',
          style: TextStyle(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorscheme.surface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16).r,
        children: [
          DocumentCard(
            title: 'Driving License',
            description: 'Government-issued driving license',
            icon: Icons.card_travel,
          ),
          SizedBox(height: 16.h),
          DocumentCard(
            title: 'Aadhaar Card',
            description: 'Unique Identification Authority of India',
            icon: Icons.perm_identity,
          ),
        ],
      ),
    );
  }
}

class DocumentCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const DocumentCard({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16).r,
        leading: Icon(icon, size: 40.sp, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
        onTap: () {
         
        },
      ),
    );
  }
}

import 'package:exam_feed/app/app.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/utils/toast_util.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/features/auth/provider/auth_provider.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  FilePickerResult? result;
  List<File> files = [];

  @override
  void initState() {
    _getDetails();
    super.initState();
  }

  void _getDetails() {
    _emailController.text =
        context.read<AuthenticationProvider>().loginResponse.userEmail ?? '';
    _nameController.text =
        context.read<AuthenticationProvider>().loginResponse.fullName ?? '';
    setState(() {});
  }

  Future<void> _profilePicUpload() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      files = result!.paths.map((path) => File(path!)).toList();
    }
  }

  Future<void> _updateProfile() async {
    context.loaderOverlay.show();
    context.read<AuthenticationProvider>().updateProfile(
          email: _emailController.text,
          name: _nameController.text,
          onSuccess: () {
             context.loaderOverlay.hide();
            context
              ..showSuccessMessage(message: 'Profile updated')
              ..pop();
          },
          onError: (error) {
             context.loaderOverlay.hide();
            context.showErrorMessage(message: error.message);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Change name and gmail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _profilePicUpload(),
              child: Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ColoredBox(
                          color: AppColors.skyWhite,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: ExtendedImage.network(
                                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                fit: BoxFit.cover,
                              ).image,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Image.asset(
                          Images.camera,
                          scale: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            YMargin(25),
            PrimaryInputField(
              context: context,
              label: 'Full Name',
              controller: _nameController,
              required: false,
            ),
            YMargin(16),
            PrimaryInputField(
              context: context,
              label: 'Email Address',
              required: false,
              controller: _emailController,
            ),
            YMargin(100),
            CustomElevatedButton(
              text: 'Save',
              onPressed: _updateProfile,
            )
          ],
        ),
      ),
    );
  }
}

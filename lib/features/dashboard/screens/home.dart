import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/widgets/buttons.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dash = context.watch<DashboardProvider>();
    return Scaffold(
      body: Center(
        child: CustomElevatedButton(
          text: 'click',
          onPressed: () {
            dash.orders();
          },
        ),
      ),
    );
  }
}

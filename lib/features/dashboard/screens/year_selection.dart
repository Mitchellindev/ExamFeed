import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';

class YearSelection extends StatefulWidget {
  const YearSelection({super.key});

  @override
  State<YearSelection> createState() => _YearSelectionState();
}

class _YearSelectionState extends State<YearSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomBackButton(
        name: 'Year Selection',
      ),
    );
  }
}
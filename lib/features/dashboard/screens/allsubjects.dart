import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';
import 'package:exam_feed/features/dashboard/screens/widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllSubjects extends StatefulWidget {
  const AllSubjects({super.key, required this.title});
  final String title;

  @override
  State<AllSubjects> createState() => _AllSubjectsState();
}

class _AllSubjectsState extends State<AllSubjects> {
  @override
  Widget build(BuildContext context) {
    final dash = context.watch<DashboardProvider>();
    return Scaffold(
      appBar: CustomBackButton(
        name: widget.title,
      ),
      body: Skeletonizer(
        enabled: dash.examBodyQuestionsModel == null,
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            itemBuilder: (_, index) {
              final val = dash.examBodyQuestionsModel?.subjects?[index];
              return SubjectWidget(
                image: 'https://picsum.photos/200/300',
                title: val?.title ?? '',
                subject: val?.description ?? '',
                rating: '3.5',
                time: '1hr 30mins',
                questions: '50 questions',
                isBookmarked: false,
                onTap: () {
                  context.pushNamed(AppPath.dashboard.subject.path,
                      queryParameters: {
                        'subjectId': val?.id ?? '',
                      });
                },
              );
            },
            separatorBuilder: (_, __) => const YMargin(10),
            itemCount: dash.examBodyQuestionsModel?.subjects?.length ?? 0),
      ),
    );
  }
}

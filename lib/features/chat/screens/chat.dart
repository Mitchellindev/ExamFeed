import 'package:exam_feed/app/router_paths.dart';
import 'package:exam_feed/core/utils/import.dart';
import 'package:exam_feed/core/utils/spacer.dart';
import 'package:exam_feed/core/widgets/animated_widgets.dart';
import 'package:exam_feed/core/widgets/custom_app_bar.dart';
import 'package:exam_feed/core/widgets/textfields.dart';
import 'package:exam_feed/features/chat/screens/widgets.dart';
import 'package:exam_feed/resources/colors.dart';
import 'package:exam_feed/resources/resources.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scrollController = ScrollController();
  int _currentPage = 0;
  void _changeTab(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashBoardAppBar(
        'Chats',
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: ShrinkableButton(
              onTap: () {},
              child: SvgPicture.asset(
                SvgIcons.rowVertical,
              ),
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: [
              PrimaryInputField(
                context: context,
                required: false,
                prefixIcon: SvgIcons.component9,
                hintText: 'Search Conversation',
              ),
              YMargin(20),
              SizedBox(
                height: 38,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => _changeTab(index),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.primaryColor
                                : AppColors.skyWhite,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 0.5,
                            )),
                        child: Text(
                          index == 0
                              ? 'All chats'
                              : index == 1
                                  ? 'Unread'
                                  : 'Groups',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _currentPage == index
                                ? AppColors.skyWhite
                                : AppColors.primaryColor,
                          ),
                        )),
                  ),
                ),
              ),
              YMargin(20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => ChatWidget(
                    count: index,
                    name: 'Happiness Joe',
                    message: 'Could you please send the text we are me...',
                    onTap: () {
                      context.pushNamed(AppPath.messaging.messages.path);
                    },
                    avarter:
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                    time: '7:03pm',
                  ),
                  separatorBuilder: (_, index) => Divider(
                    height: 2,
                    thickness: 0.5,
                  ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

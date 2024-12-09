import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
  static final splash = SplashPath();
  static final auth = AuthPath();
  static final dashboard = DashboardPath();
  static final profile = ProfilePath();
  static final messaging = MessagingPath();
  static final feed = FeedsPath();
  static final discover = DiscoverPath();
}

class SplashPath extends Path<SplashPath> {
  SplashPath() : super('/');

  Path get onboardingScreen => Path('onboarding-screen', parent: this);
  Path get welcomeScreen => Path('welcome-screen', parent: this);
}

class AuthPath extends Path<AuthPath> {
  AuthPath() : super('/auth');

  // Path get login => Path('login', parent: this);
  Path get signup => Path('signup', parent: this);
  Path get login => Path('login', parent: this);
  Path get otp => Path('otp', parent: this);
  Path get verificationSuccess => Path('verification-success', parent: this);
  Path get forgetPassword => Path('forget-password', parent: this);
  Path get resetPassword => Path('reset-password', parent: this);
}

class DashboardPath extends Path<DashboardPath> {
  DashboardPath() : super('/dashboard');

  Path get allSubject => Path('all-subject', parent: this);
  Path get examSummary => Path('exam-summary', parent: this);
  Path get practiceQuestion => Path('practice-question', parent: this);
  Path get studyQuestion => Path('study-question', parent: this);
  Path get subject => Path('subject', parent: this);
  Path get yearSelection => Path('year-selection', parent: this);
}

class ProfilePath extends Path<ProfilePath> {
  ProfilePath() : super('/profile');
  Path get editProfile => Path('edit-profile', parent: this);
  Path get resetPassword => Path('reset-password', parent: this);
  Path get bookmarked => Path('bookmarked', parent: this);
}

class MessagingPath extends Path<MessagingPath> {
  MessagingPath() : super('/messaging');

  Path get messages => Path('messages', parent: this);
}

class FeedsPath extends Path<FeedsPath> {
  FeedsPath() : super('/feeds');
  Path get openFeed => Path('open-feed', parent: this);
}

class DiscoverPath extends Path<DiscoverPath> {
  DiscoverPath() : super('/discover');
}

import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
  static final splash = SplashPath();
  static final auth = AuthPath();
  static final timeline = TimelinePath();
  static final profile = ProfilePath();
  static final messaging = MessagingPath();
  static final search = SearchPath();
  static final communities = CommunitiesPath();
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
 
}

class TimelinePath extends Path<TimelinePath> {
  TimelinePath() : super('/timeline');

  Path get createPost => Path('create-post', parent: this);
  Path get notifications => Path('notifications', parent: this);
  Path get postDetail => Path('post-detail', parent: this);
  Path get videoPreview => Path('video-preview', parent: this);
  Path get imagePreview => Path('image-preview', parent: this);
  Path get audioPreview => Path('audio-preview', parent: this);
}

class ProfilePath extends Path<ProfilePath> {
  ProfilePath() : super('/profile');
  Path get editProfile => Path('edit-profile', parent: this);
  Path get aboutYou => Path('about-you', parent: this);
  Path get basicInfo => Path('basic-info', parent: this);
  Path get contactInfo => Path('contact-info', parent: this);
  Path get profilePic => Path('profile-pic', parent: this);
  Path get settings => Path('settings', parent: this);
  Path get about => Path('about', parent: this);
  Path get privacySafety => Path('privacy-safety', parent: this);
  Path get changePassword => Path('change-password', parent: this);
  Path get deleteAccount => Path('delete-account', parent: this);
  Path get notificationChannel => Path('notification-channel', parent: this);
  Path get connectAccounts => Path('connect-accounts', parent: this);
  Path get twoStepVerification => Path('two-step-verification', parent: this);
  Path get publicProfile => Path('public-profile', parent: this);
  Path get publicAboutProfile => Path('public-about-profile', parent: this);

  Path get otherUserProfile => Path('other-user-profile', parent: this);
  Path get otherUserAbout => Path('other-user-about', parent: this);
}

class MessagingPath extends Path<MessagingPath> {
  MessagingPath() : super('/messaging');
}

class SearchPath extends Path<SearchPath> {
  SearchPath() : super('/search');

  Path get discoverPeople => Path('discover-people', parent: this);
  Path get discoverCommunities => Path('discover-communities', parent: this);
}

class CommunitiesPath extends Path<CommunitiesPath> {
  CommunitiesPath() : super('/communities');
}

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

  // Path get createPost => Path('create-post', parent: this);
  // Path get notifications => Path('notifications', parent: this);
  // Path get postDetail => Path('post-detail', parent: this);
  // Path get videoPreview => Path('video-preview', parent: this);
  // Path get imagePreview => Path('image-preview', parent: this);
  // Path get audioPreview => Path('audio-preview', parent: this);
}

class ProfilePath extends Path<ProfilePath> {
  ProfilePath() : super('/profile');

}

class MessagingPath extends Path<MessagingPath> {
  MessagingPath() : super('/messaging');
}

class FeedsPath extends Path<FeedsPath> {
  FeedsPath() : super('/feeds');

}

class DiscoverPath extends Path<DiscoverPath> {
  DiscoverPath() : super('/discover');
}

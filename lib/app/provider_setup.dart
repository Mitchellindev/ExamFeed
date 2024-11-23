
import 'package:exam_feed/features/auth/provider/auth_provider.dart';
import 'package:exam_feed/features/dashboard/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


// final locationProvider = ChangeNotifierProvider((ref) => LocationProvider());
// final authenticationProvider =
//     ChangeNotifierProvider((ref) => AuthenticationProvider());
// final propertyManagementProvider =
//     ChangeNotifierProvider((ref) => PropertyManagementProvider());

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
    ChangeNotifierProvider(create: (_) => DashboardProvider()),

  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

// Place All ChangeNotifierProvider's separated by a comma ","

List<SingleChildWidget> uiConsumableProviders = [];

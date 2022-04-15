import 'package:get_it/get_it.dart';
import 'package:kutuphanem/repository/user_repository.dart';
import 'package:kutuphanem/services/auth_base.dart';
import 'package:kutuphanem/services/fake_auth_service.dart';
import 'package:kutuphanem/services/firebase_auth_service.dart';



//GetIt locator = GetIt.instance;

    GetIt locator = GetIt.instance;

void setupLocator(){
    locator.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
    locator.registerLazySingleton<FakeAuthenticationService>(() => FakeAuthenticationService());
    locator.registerLazySingleton<UserRepository>(() => UserRepository());

}

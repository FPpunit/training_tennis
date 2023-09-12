import 'package:get_it/get_it.dart';
import 'package:new_pro/screens/admin/staff/provider/admin_staff_provider.dart';
import 'package:new_pro/screens/admin/staff/provider/provider.dart';
import 'package:new_pro/screens/admin/staff/repositary/admin_staff_repo.dart';

final locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton<AdminStaffProvider>(() => AdminStaffProvider());
  locator.registerLazySingleton<ProviderStaff>(() => ProviderStaff());

}
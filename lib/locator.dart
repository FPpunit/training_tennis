import 'package:get_it/get_it.dart';
import 'package:new_pro/screens/admin/staff/provider/admin_staff_provider.dart';


final locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton<AdminStaffProvider>(() => AdminStaffProvider());

}
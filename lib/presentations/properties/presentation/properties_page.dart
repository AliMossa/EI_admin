import 'package:admin_dashboard/presentations/properties/data/repository_sources/property_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/get_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/get_sold_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/re_get_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/re_get_sold_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/cubit/properties_types_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/properties/properties_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/middleware/properties_middlewar.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/property_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertiesPage extends StatelessWidget {
  final PropertiesMiddlewar _propertiesMiddlewar = PropertiesMiddlewar().get();
  PropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => PropertiesBloc(
                propertiesMiddlewar: _propertiesMiddlewar,
                getSoldPropertiesUseCase: GetSoldPropertiesUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
                reGetSoldPropertiesUseCase: ReGetSoldPropertiesUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
                reGetPropertiesUseCase: ReGetPropertiesUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
                getPropertiesUseCase: GetPropertiesUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
              )..add(GetCorrectPropertiesEvent()),
        ),
        BlocProvider(
          create:
              (context) => PropertiesTypesCubit(
                propertiesMiddlewar: _propertiesMiddlewar,
              ),
        ),
      ],
      child: const PropertyItem(),
    );
  }
}

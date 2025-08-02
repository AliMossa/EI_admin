import 'package:admin_dashboard/presentations/properties/data/repository_sources/property_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/new_property_study_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/set_property_sold_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/show_on_stage_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/view_property_use_case.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/middleware/properties_middlewar.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/view_property/view_property_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPropertyPage extends StatelessWidget {
  int id;
  final PropertiesMiddlewar _propertiesMiddlewar = PropertiesMiddlewar().get();
  ViewPropertyPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => ViewPropertyBloc(
                propertiesMiddlewar: _propertiesMiddlewar,
                showOnStageUseCase: ShowOnStageUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
                viewPropertyUseCase: ViewPropertyUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
                newPropertyStudyUseCase: NewPropertyStudyUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
                setPropertySoldUseCase: SetPropertySoldUseCase(
                  propertyRepository: PropertyRepositoryImpSource(),
                ),
              )..add(ViewPropertyInfoEvent(id: id)),
        ),
        BlocProvider(
          create:
              (context) =>
                  DesicionCubit(propertiesMiddlewar: _propertiesMiddlewar),
        ),
      ],
      child: ViewPropertyItem(id: id),
    );
  }
}

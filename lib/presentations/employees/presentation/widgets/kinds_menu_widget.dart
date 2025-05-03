import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class KindsMenuWidget extends StatelessWidget {
  List<String> kinds;
  KindsMenuWidget({required this.kinds, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KindsCubit, KindsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton(
            value:
                state is ChangeKindsState && state.kind.isNotEmpty
                    ? state.kind
                    : kinds.first,
            items:
                kinds
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
            onChanged: (value) => context.read<KindsCubit>().changeKind(value!),
          ),
        );
      },
    );
  }
}

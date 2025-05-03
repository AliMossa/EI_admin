import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddEmployeeCitiesWidget extends StatelessWidget {
  const AddEmployeeCitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // child: DropdownButton(
      //   value:
      //       state is ChangeKindsState && state.kind.isNotEmpty
      //           ? state.kind
      //           : kinds.first,
      //   items:
      //       kinds
      //           .map(
      //             (item) =>
      //                 DropdownMenuItem(value: item, child: Text(item)),
      //           )
      //           .toList(),
      //   onChanged: (value) => context.read<KindsCubit>().changeKind(value!),
      // ),
    );
  }
}

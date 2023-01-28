// import 'package:flutter/material.dart';
// import '../../../resources/resources.dart';

// class DropdownFilterWidget extends StatelessWidget {
//   const DropdownFilterWidget({
//     Key? key,
//     required this.filterValue,
//     required this.items,
//     required this.onChanged, 
//   }) : super(key: key);

//   final String filterValue;
//   final List<DropdownMenuItem<String>> items;
//   final Function(String?) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [dropShadow()],
//         borderRadius: BorderRadius.circular(12),
//         color: ColorPalette.white1,
//       ),
//       child: DropdownButtonFormField(
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.all(1.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(14),
//             borderSide: BorderSide.none
//           )
//         ),
//         value: filterValue,
//         style: MyTextTheme.semibold14.copyWith(color: ColorPalette.grey11),
//         icon: const Icon(Icons.keyboard_arrow_down),
//         items: items,
//         onChanged: onChanged,
//       ),
//     );
//   }
// }

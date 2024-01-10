// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//  import 'package:meals/provider/filter_provider.dart';
 


// class FilterScreen extends ConsumerWidget {
//   const FilterScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final activeFilter =ref.watch(filterProvider);
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('your filters'),
//       ),
//       // ignore: deprecated_member_use
//       body:Column(
//           children: [
//             SwitchListTile(
//               value: activeFilter[Filter.glutenfree],
//               onChanged: (isChecked){
//               ref.read(filterProvider.notifier).setFilter(Filter.glutenfree, isChecked)
//                 });
              
//               title: Text(
//                 'GLuten _free ',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text('Only include gluten free ',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       )),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//                 value: activeFilter[Filter.lactosefree],
//               onChanged: (isChecked){
//               ref.read(filterProvider.notifier).setFilter(Filter.lactosefree, isChecked)
//                 });
//               },
//               title: Text(
//                 'Lactose_free ',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text('Only include Lactose free ',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       )),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//                  value: activeFilter[Filter.vegetarian],
//               onChanged: (isChecked){
//               ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked)
//                 });
//               },
//               title: Text(
//                 'vegetarian_free ',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text('Only include vegetarian free ',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       )),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//                  value: activeFilter[Filter.vegan],
//               onChanged: (isChecked){
//               ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked)
//                 });
//               },
//               title: Text(
//                 'vegan_free ',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text('Only include vegan free ',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Theme.of(context).colorScheme.onBackground,
//                       )),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: EdgeInsets.only(left: 34, right: 22),
//             ),
            
//           ],
//         );
      
    
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.glutenfree] ?? false,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.glutenfree, isChecked);
            },
            title: Text(
              'GLuten _free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactosefree] ?? false,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.lactosefree, isChecked);
            },
            title: Text(
              'Lactose_free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegetarian] ?? false,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'vegetarian_free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan] ?? false,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'vegan_free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan free ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}

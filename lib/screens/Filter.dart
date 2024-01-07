import 'package:flutter/material.dart';
 

 enum Filter {
  glutenfree,lactosefree,vegetarian,vegan
 }
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

   final Map<Filter,bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
var _glutenFreeFilterSet=false;
var _lactoseFreeFilterSet=false;
var _vegetarianFreeFilterSet=false;
var _veganFilterSet=false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenfree]!;
      _lactoseFreeFilterSet = widget.currentFilters[Filter.lactosefree]!;
      _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
      _veganFilterSet = widget.currentFilters[Filter.vegan]!;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('your filters'),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: ()  async{
          Navigator.of(context).pop(
            {
              Filter.glutenfree:_glutenFreeFilterSet,
              Filter.lactosefree:_lactoseFreeFilterSet,
              Filter.vegetarian:_vegetarianFreeFilterSet,
              Filter.vegan:_veganFilterSet

            }
          );

          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'GLuten _free ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('Only include gluten free ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'Lactose_free ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('Only include Lactose free ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'vegetarian_free ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('Only include vegetarian free ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet=isChecked;
                });
              },
              title: Text(
                'vegan_free ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text('Only include vegan free ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            
          ],
        ),
      ),
    );
  }
}


# Screens
## ProductOverViewScreen.dart
    - Just showing productGrid view
## productDetailScreen.dart
    - product detail screen

# widgets
## productGridView.dart
    - Showing all the product list using porduct
## productItem
    - single product

# model
## product.dart
    - product model

# provider
## productProvider.dart
    - data provider for product

# provider
- (//#1) - provider initialize provider all the child widget can get provider data
- (//#2) - creating instance from a child (productGridView) , so that we can access provider
- (//#3) - filter product from provider using product id
- (//#4) - define a method on productProvider , which will filter product using  product id .
- (//#5) - in "of" method , set listen to false, we don want to rebuild the detail page

## Favorite Button
-  (//#6) Nested provider
   - used for favorite product feature
   - (//#6.1) extend product model with ChangeNotifier class
- (//#7) - creating nested provider inside the old product list provider
- (//#8) - product detail page creating object of that nested provider
- (//#9) - add function which will update favorite status

## using  ChangeNotifierProvider.value()
# 199
## different between .value and ctx ? 
### .value
- provider works if the data changes for the widgets
### 197 198 199 ->

# provider using amount 2
- (#provider_one) one - main.dart ( using builder method with ctx) 
- (#provider_two) two - productGridVeiw.dart (ChangeNotifierProvider.value)
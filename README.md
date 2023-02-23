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
#

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

## 199
# Using Consumer
- when use Provider.of() method
  - the whole build method will re-run when ever a single data changes
  - when we want to run some sub part of the widget , we need consumer
  - we just need to cover that particular sub part with the provider
## 199
## (#Consumer1.1)
- the consumer only used to only rebuild parts of the widget tree instead of the entire widget
- on productItem.dart we are using Provider.of<ProductModel>(context) to get products updates
- widget that are only interested to update
- consumer require builder
  - (#Consumer1.1) consumer is generic type so we have to mention what type of data we are consuming . that is pretty much smiler as Provider.of()
    - Consumer<ProductModel> it look for nearest provider of that type up in the widget tree
    - builder takes 3 argument builder: (context, value, child)
      - (value)= nearest instance of that type of data 
      - (child)= if we have some part of inside consumer widget we dont want to rebuild.

## 199
## #Consumer1.2 
  - using old Provider.of() and listener set to false
  - cover the particular sub widget that will change 

# #201
- setup popupmenu (:) which will show only favorite items
  - (#popupmenu_1.1)   

## 201 
## Global filter product
# if we want to filter product item globally
- if we had a another part of this app which also show our product
  - (#global_filter_1.1) - showFavoritesOnly will default set to false
  - (#global_filter_1.2) - filter on all product function
  - using these functions we will filter product from a widget 
    - (#global_filter_1.3) - showFavoritesOnly function will set the flag true
    - (#global_filter_1.4) - showAll set flag flag
  - (#global_filter_1.5) - set an instance from root provider .
  - (#global_filter_1.6) - calling the functions from provider and control flag

## 201
## filter product only for Single screen
- (#local_filter1.1) - define function globally for favorite product
- (#local_filter1.2) - define flag for filtering on widget
- (#local_filter1.3) - change flag on using setState 
- (#local_filter1.4) - sending flag on gridView widget as a argument
- (#local_filter1.5) - receive the argument 
- (#local_filter1.6) - showing data depending on argument

# 202
## chart Functionality
- (#chart1.1) - define cart single item model
- cart provider and model setup
- (#chart1.2) - define provider model for cart
  - (#chart1.3) - map every cart item to the id of the product it belongs to
  - (#chart1.4) - add item to cart  
  - (#chart1.5) - if the item already inside the cart we just increase the quantity
  - (#chart1.6) - if the cart dont have that item
  - 
- two provider case
  - currently we are just using product provider from root widget
  - we want to use cart information in different screen 
  - so we need to define cart provider from root label
  
- multiple provider setup
  - (#chart1.7) - setup multi provider
  - (#chart1.8) - define cart provider
- cart icon on product overview screen
  - 


# Dart language Functions
  - 201
  - Enum
  - (#enum_1.1) a away assigning labels to integer
  
  - containsKey()
  - https://www.educative.io/answers/what-is-the-mapcontainskey-method-in-dart 
  - 
  - putIfAbsent()
  - https://www.educative.io/answers/what-is-mapputifabsent-in-dart 
  - 

# Provider Feature
- notifyListeners() notify all the listeners which all are interested to rebuild
- 


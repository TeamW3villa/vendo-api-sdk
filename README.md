
# How to run

Using terminal go to vendo-api-sdk directory and Run

``` ruby main.rb```

in ``` main.rb ``` call sepecific methods 

# How to use

put the directory under aplications lib directory and inside ```application.rb``` eager load the lib directory

``` config.eager_load_paths << Rails.root.join('lib') ```


### To create a cart
``` Services::Cart.new.create ```

## TODO

### To add an item to a cart
``` Services::Cart.new.add_item ```
### To get a cart
``` Services::Cart.new.get ```
### To set the cart quantity
``` Services::Cart.new.set_quantity(quantity: 1) ```
### To Remove Item from a cart
``` Services::Cart.new.remove_item ```
### To create a cart
``` Services::Cart.new.create ```
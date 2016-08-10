##Takeaway Challenge

This is my solution to the second weekend challenge we were set at Makers Academy. We had to fulfil the following user stories:
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

##Usage

To run this project, perform the following steps:

1. Clone this repo
2. Run ```bundle```
3. Add the following environment variables to enable SMS delivery via Twilio API

```
TWILIO_NUMBER <- Your Twilio phone number
PHONE_NUMBER  <- Your phone number
ACCOUNT_SID   <- Your Twilio Account SID
AUTH_TOKEN    <- Your Twilio Auth Token
```

3. Create a new Menu object in REPL of your choice, e.g. ```irb```:

```
2.2.3 :001 > require './lib/menu'
 => true
2.2.3 :002 > menu_list = {
2.2.3 :003 >     "chicken" => 3.50,
2.2.3 :004 >     "beef" => 2.50,
2.2.3 :005 >     "vegetarian" => 1.50
2.2.3 :006?>   }
 => {"chicken"=>3.5, "beef"=>2.5, "vegetarian"=>1.5}
2.2.3 :007 > menu = Menu.new(menu_list)
 => #<Menu:0x007fda520f6750 @dishes={"chicken"=>3.5, "beef"=>2.5, "vegetarian"=>1.5}>
```

4. Create a config hash for SMS delivery that will be passed into the Takeaway class on initialization.

```
2.2.3 :008 > config = {
2.2.3 :009 >     account_sid: ENV["ACCOUNT_SID"],
2.2.3 :010 >     auth_token: ENV["AUTH_TOKEN"],
2.2.3 :011 >     from: ENV["TWILIO_NUMBER"],
2.2.3 :012 >     to: ENV["PHONE_NUMBER"],
2.2.3 :013 >     body: "Thank you! Your order will be delivered before %s"
2.2.3 :014?>   }
 => {:account_sid=>"ACe25f0b72ea6dff0b58c6566185f8142b", :auth_token=>"fa53e1d1d611d455a6f157ee94372579", :from=>"+16474926426", :to=>"+16479909551", :body=>"Thank you! Your order will be delivered before %s"}
```

5. Initialize Takeaway class with menu and config
```
2.2.3 :015 > require './lib/takeaway'
 => true
2.2.3 :016 > takeaway = Takeaway.new(menu: menu, config: config)
 => #<Takeaway:0x007f94f4ace410 @menu=#<Menu:0x007f94f4111f58 @dishes={"chicken"=>3.5, "beef"=>2.5, "vegetarian"=>1.5}>, @order=#<Order:0x007f94f4ace398 @dishes={}, @menu=#<Menu:0x007f94f4111f58 @dishes={"chicken"=>3.5, "beef"=>2.5, "vegetarian"=>1.5}>>, @sms=#<SMS:0x007f94f4ace320 @client=<Twilio::REST::Client @account_sid=ACe25f0b72ea6dff0b58c6566185f8142b>, @config={:account_sid=>"ACe25f0b72ea6dff0b58c6566185f8142b", :auth_token=>"fa53e1d1d611d455a6f157ee94372579", :from=>"+16474926426", :to=>"+16479909551", :body=>"Thank you! Your order will be delivered before %s"}>>
 ```

6. Check what's on the menu
```
2.2.3 :017 > takeaway.print_menu
 => "Chicken: £3.50, Beef: £2.50, Vegetarian: £1.50"
```

7. Initialize a new order object and add some dishes to your order
```
2.2.3 :018 > order = Order.new(menu)
 => #<Order:0x007f94f4a6eb28 @dishes={}, @menu=#<Menu:0x007f94f4111f58 @dishes={"chicken"=>3.5, "beef"=>2.5, "vegetarian"=>1.5}>>
 2.2.3 :019 > order.add("chicken",2)
 => "You have added 2 chicken dishes to your order"
2.2.3 :020 > order.add("beef",3)
 => "You have added 3 beef dishes to your order"
 ```

8. Confirm the value of the order
```
2.2.3 :021 > order.total
 => "Your order total is £14.50"
 ```

9. Place order, at which point you should receive an SMS confirming delivery time

```
2.2.3 :025 > takeaway.place_order(order.dishes)
```


More documentation on the behaviour of each class can be found by running ```rspec```

```
Menu
  #show_dishes
    prints a list of dishes with prices
  #has_dish?
    tells if a dish is on the menu
    tells if a dish is not on the menu
  #price
    returns a price of a dish

Order
  #add
    adds dishes from the menu to the order
    does not allow items to be added to order that are not on the menu
    prints dishes added to order
  #total
    prints the total for the order

SMS
  #deliver
    delivers SMS with the estimated time

Takeaway
  #print_menu
    shows the menu with dishes and prices
  #place_order
    can order some number of available dishes
    knows the order total
    sends an SMS when the order has been placed
```


[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

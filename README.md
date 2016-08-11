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

3. Create a menu hash and pass this as an initialization variable to the Menu class

```
menu_list =
  {
    "chicken" => 3.50,
    "beef" => 2.50,
    "vegetarian" => 1.50
  }

menu = Menu.new(menu_list)
```

4. Create a config hash for SMS delivery that will be passed into the Takeaway class on initialization.

```
config =
  {
    account_sid: ENV["ACCOUNT_SID"],
    auth_token: ENV["AUTH_TOKEN"],
    from: ENV["TWILIO_NUMBER"],
    to: ENV["PHONE_NUMBER"],
    body: "Thank you! Your order will be delivered before %s"
  }
```

5. Initialize Takeaway class with menu and config
```
takeaway = Takeaway.new(menu: menu, config: config)
 ```

6. Check what's on the menu
```
takeaway.print_menu
 => "Chicken: £3.50, Beef: £2.50, Vegetarian: £1.50"
```

7. Initialize a new order object and add some dishes to your order
```
order = Order.new(menu)

order.add("chicken",2)
 => "You have added 2 chicken dishes to your order"
order.add("beef",3)
 => "You have added 3 beef dishes to your order"
```

8. Confirm the value of the order
```
order.total
 => "Your order total is £14.50"
```

9. Place order, at which point you should receive an SMS confirming delivery time

```
takeaway.place_order(order.dishes)
```


More documentation on the behaviour of each class and their methods can be found by running ```rspec```

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
[![Coverage Status](https://coveralls.io/repos/github/ivan-sathianathan/takeaway-challenge/badge.svg?branch=master)](https://coveralls.io/github/ivan-sathianathan/takeaway-challenge?branch=master)

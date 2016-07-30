##Takeaway Challenge

This is my solution to the second weekend challenge we were set at Makers Academy. We had to fulfill the following user stories:
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

- Clone this repo
- Run ```bundle```
- Initialize a new order object:

```
2.2.3 :002 > order = Order.new
 => #<Order:0x007f7fbb416968 @basket={}, @menu=#<Menu:0x007f7fbb416918 @items={"Hamburger"=>1, "Cheeseburger"=>1, "Pizza"=>2, "Hot Dog"=>1}>>  
```
- Order some items

```
order.add_to_basket("Hamburger", 2)
2.2.3 :003 > order.add_to_basket("Hamburger",2)
 => "2 x Hamburger added to your basket"
```

- Check status of order

```
2.2.3 :004 > order.print_summary
 => "2 x Hamburger = £2: Total = £2"
```

- Place order


[![Build Status](https://travis-ci.org/makersacademy/takeaway-challenge.svg?branch=master)](https://travis-ci.org/makersacademy/takeaway-challenge)
[![Coverage Status](https://coveralls.io/repos/makersacademy/takeaway-challenge/badge.png)](https://coveralls.io/r/makersacademy/takeaway-challenge)

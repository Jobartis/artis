# README

This is a simple coding assesment app. After cloning the repo run `bundle install` and `rake db:seed`.  

# Task 1
Implement a simple orders and payments system. It's partially implemented already, but there are some database tables, models, relations and fields missing. 

* Order has many order items. 
* Order item has one service type and quantity.
* Order has one charge.
* After a successful payment the payment gateway sends a webhook with a charge id to confirm the payment.
* The payment information has to be stored. 

There's a spec that tests the whole flow and it should be self-explanatory.
If in doubt, do as you feel, change the existing code if necessary and choose the simples possible solution.


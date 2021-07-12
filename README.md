# README

Expected scenario:
* The barista takes order from customer.
* All items are listed divided into categories.
* All the items needed can be added using a numeric field.
  
* Offers Items are added in OfferItem table with discount rate defined for each product.
* If the item is included in any combo offer, the offer price is applied to each item defined in the offer.
* A confirm order page is shown with all applied offer, discount and tax rate.
* The barista can either confirm or delete the order.
* No user login is implemented as of now.

Tables:

* Categories
* Items
* Orders
* OrderItems
* Offers
* OfferItems

Database Design:

* Each Category has different Items.
* Each Order has many Items through OrderItems.
* OrderItem contains individual Item quantity and total amount.
* Offer is active between a specific time.
  
* Offer has a priority order.
* Offer has many offer items.
* The discount rate of each Item in an Offer is defined in OfferItem.

Setup:

* Tech stack - Ruby on Rails, MySql
* Gems used - jquery-rails, bootstrap, simplecov, minitest
* Update database.yml file
  
* Run rake db:migrate.
* Run rake db:seed for initial data setup. Please update seed.rb file to add your test data.

Code analysis:

* Used a Billing Service to manage the billing procedure of an Order.
* Individual classes which handles different functionalities are added in lib folder.

Test Cases:

* Due to limited time availability, only added unit test for 2 files. Please find it under test/unit folders.
* Further unit test cases and rspec can be added.

Further improvement:

Currently only the mentioned scenarios are implemented. Further we can add functionality for Add/Edit Items. Further the whole coffee shop management system can be implemented like adding offers, adding customer details and notifiction once order status is updated.


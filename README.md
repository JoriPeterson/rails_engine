# README
### Overview:

Rails Engine is a JSON API built to access Merchant, Invoices, Items, InvoiceItems, Transactions and Customers. There are endpoints for three categories: search/find, relationships, and business intelligence which required advanced ActiveRecord and SQL.

### Versions:

* Ruby Version 2.4.1
* Rails version 5.2.3
* Database: Postgresql

### Setup and Configuration:

* Clone this down to your local machine
* Run `bundle`
* Run `rake db:{drop,create,migrate}`

* To populate tables run `rake import:import_csv`

### Local Testing:

Within the Rails_Engine repo, Requests specs are being used to test API responses, along with model tests. Just run `rspec` from the command line.

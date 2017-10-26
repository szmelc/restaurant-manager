# Arbejder

## Restaurant Manager

Arbejder is my application, not based on any tutorial, which I have built while learning Ruby on Rails. It's a universal system for managing a small enterprise. It allows to manage bookkeeping and employees.


### Installation

To install the aplication, you need to clone the repo and then, while in the app directory:

`bundle install`

To start the application:

`rails s`, 
`localhost:3000` 

### Login Credentials

https://arbejder.herokuapp.com/

#### Admin account
login: admin@gmail.com
password: admin123

#### User Account
login: user@gmail.com
password: user123

### Features 

Możliwości aplikacji:
* admin can add, edit and modify users and dishes
* admin can add a pinned post which will stay visible on the wall for 24 hours
* admin can see all the statistics and charts regarding all employees and all orders (value of orders, number of orders, average value of orders)
* user can see only his own charts
* application calculates daily income for each employee
* application calculates daily income overall and average price of an order
* application shows the most popular dishes
* application compares performance of employees in terms of number of taken orders and their value

#### Gems:
* Devise
* Cocoon 
* CanCanCan
* Ransack
* Rubocop 
* Paperclip
* AWS-SDK

#### Possible features
* add discount feature
* tasks assigned by admin for each user
* generating CSV files with data from the application
* displaying weekly schedule - who will be working on a certain day
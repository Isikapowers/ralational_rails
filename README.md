###  Relational Rails
## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Learning Goals](#learning-goals)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Future Enhancements](#future-enhancements)
* [Contact](#contact)

## General info
This project is an app designed to highlight a one to many database relationship using the Rails framework. This project has two one to many relationships (Stores and Books, Teams and Players).

## Screenshots
![Schema](https://user-images.githubusercontent.com/82777170/131573615-f7c503fe-4787-4ee1-9213-0328d93616e0.png)

## Learning Goals
* Design a one to many relationship using a schema designer
* Write migrations to create tables with columns of varying data types and foreign keys.
* Use Rails to create web pages that allow users to CRUD resources
* Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
* Write model and feature tests that fully cover data logic and user behavior

## Technologies
Project is created with:
* Ruby version: 2.7.2
* HTML 5
* Rails 5.2.6
* PostgresQL 
* Intentionally write all routes (no use of resources syntax)

## Setup
To run this program, save a copy of this repository locally. In the MacOS
application 'Terminal,' navigate into the _relational_rails_ directory.
Then, run it (note: '$' is not typed).
1. Clone the repo using the web url:
   ```
   $ git clone https://github.com/Isikapowers/relational_rails
   ```
   or with a password-protected SSH key:
   ```
   $ git clone git@github.com:Isikapowers/relational_rails.git
   ```
2. Change into the directory:
   ```
   $ cd ../relational_rails
   ```
3. Install all gems in Gemfile:
   ```
   $ bundle install
   ```
4. Open up a server in your terminal: 
   ```
   $ rails server
   ```
5. Open up a web browser and type http://localhost:3000/

## Features
List of features
* Displays RESTful routes
* Allows user to navigate through app and discover stores, books, teams, and players
* User can see all data displayed
* Users can create new stores, books, teams, and players
* Users can update all data
* Users can delete all data
* Allows user to search by price for books and numbers for players
* Allows user to list all books and players alphabetically

## Future Enhancements:
* Make website more visually pleasing
* Sort Stores/Teams by Number of Books/Players
* Search by name (exact match)
* Search by name (partial match)

## Contact
Created by
* [@isikapowers](https://github.com/Isikapowers)
* [@kevinmugele](https://github.com/KevinMugele)

~ Feel free to contact us! ~
~ Enjoy! ~


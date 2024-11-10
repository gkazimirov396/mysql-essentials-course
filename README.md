# MySQL Hiking Trail Management System Database

### 💬 Project Description

This MySQL database is designed to manage a collection of different hiking trails, locations, users, reviews, and the relationships between them. It also includes stored procedures for common database operations, two views for reading trails popularity in Europe and North America, as well as a folder for connecting the database to a Node js application.

## 🧵 Project Structure

1. `pa1/` folder that contains three `.sql` files:\
   `pa1/schema.sql`: contains all the tables used in the whole project.
   `pa1/table_population.sql`: populates all the tables with data.
   `pa1/queries.sql`: contains all queries required for practical assignment 1.
2. `pa2/` folder that contains three `.sql` files:\
   `pa2/schema_updates.sql`: adds a new table, responsible for establishing many-to-many relationship between tables `trails` and `difficulties`, to our project.\
   `pa2/table_population.sql`: populates the new table with data.
   `pa2/queries.sql`: contains queries that use many-to-many relationships.
3. `pa3/` folder that contains one `.sql` file and `pa3_bonus` folder:\
   `pa3/subqueries.sql`: compares correlated and non-correlated subqueries, as well as contains four queries with: `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`.
   `pa3/pa3_bonus`: a folder that contains a Nodejs server that connects to our database. [Learn more](#bonus).
4. `pa4/` folder that contains two `.sql` files:\
   `pa4/procedures.sql`: creates three stored procedures, with simple database operations, and one transaction that updates the review table.
   `pa4/executions.sql`: calls all the stored procedures and transactions in `pa4/procedures.sql`.
5. `pa5/` folder that contains one `.sql` file:\
   `pa5/views.sql`: indexes `trails` and `reviews` tables, for optimization, and creates two views, that calculate the popularity of trails in Europe and North America.

<h2 id="bonus">🎁 Practical Assignment 3 Bonus</h2>

### Available Scripts

In the `pa3/pa3_bonus/` directory, you can run:

#### `npm start`:

Starts the app in watch mode in your default browser on http://localhost:5000.

### Project Setup

#### Prerequisites:

- Your own MySQL server
- Node js version 16+ installed on your machine

#### 1. Environment variables

Create a file named `.env` in `pa3/pa3_bonus/` to store your credentials, following the structure below:

```
USER_NAME = *Your MySQL User Name*
DB_PASS = *Your MySQL User Password*
```

#### 2. Installation

To install and run this project - install the dependencies using npm and then start your server:

1. Open the terminal on your machine
2. Navigate to `pa3/pa3_bonus/`
3. Run
```
$ npm install
```
4. Wait patiently for all the dependencies to install
5. Run
```
$ npm start
```

And the server will start in watch mode. You will also see access logs and any possible errors in your terminal window.

## 🛫 Deploy the Project

1. You have to install MySQL server on your machine.
2. Install any database administration tool for MySQL, for example, MySQL Workbench, DBeaver, e.t.c.
3. Copy the contents of `pa1/schema.sql` and `pa2/schema_updates.sql` and paste them in the IDE you installed, then run the code to create all the tables this project needs.
4. Copy the contents of `pa1/table_population.sql` and `pa2/table_population.sql` and paste them in the IDE you installed, then run the code to populate the tables with data.
5. If you want, you can also add stored procedures and transactions from `pa4/procedures.sql`, or the views from `pa5/views.sql`.
6. Finally, everything is ready, for you to take any query from any folder of your choice, and run it.

## 👨‍💻 A Few Words About The Author:

I'm a web developer<img src="https://media.giphy.com/media/WUlplcMpOCEmTGBtBW/giphy.gif" width="30px">. Programming has always been my passion. I first started learning it during my years in IT Step Academy, where I learned the basics of: Python, Javascript and C++. After finishing my studies, I chose to specialize in web development, and after passing a few courses, I managed to land my first job. I'm currently majoring in Software Enginnering And Business Analysis at [KSE](https://university.kse.ua/en).

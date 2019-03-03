Bookmark manager app
====================
Week 4's challenge is to build a web app that stores web bookmarks in a database. This is the list of specifications.

  - Show a list of bookmarks
  - Add new bookmarks
  - Delete bookmarks
  - Update bookmarks
  - Comment on bookmarks
  - Tag bookmarks into categories
  - Filter bookmarks by tag
  - Users manage their bookmarks

  Full details at https://github.com/makersacademy/course/blob/master/bookmark_manager/00_challenge_map.md#challenges

User Story 1
------------
```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks
```
![model-svg](https://www.plantuml.com/plantuml/svg/PP0z3i8m34Ptdo8N20TWG9NAoig2659gGQaRW-C8SNjCAfKgZFdyNlpJ90sYUIA0bWQCwlpEjHnLc0Z5RTqLrGi-CoOrvbSnxi0zaY6RGERFBultGKCN4bh5D7a3B8bVMO8fathkxdZHHQ_RdphcSGeofdFT_ZZWgoPAzlV9JSk2A_jBpFkMGHuSRJg01cDln_W0)
## How to use
### To set up the project
Clone this repository and then run:
```
bundle
```

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order, further to which:
- Connect to the database using the pqsl command \c bookmark_manager;
- Run the query you see in the file `01_create_bookmarks_table.sql`

### To run the Bookmark Manager app:

```
rackup -p 3000
```
This command runs the program and sets the output to port number 3000.  
To view it, open a browser and navigate to `localhost:3000/bookmarks`.

### To run tests:
```
rspec
```
### To run linting:
```
rubocop
```

### To set up the test database

Connect to `psql` and create the `bookmark_manager_test` database:

```
CREATE DATABASE bookmark_manager_test;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order, further to which:
- Connect to the database using the pqsl command \c bookmark_manager;
- Run the queries you see in the file `01_create_bookmarks_table.sql` - stop after the 3rd INSERT

User Story 2
------------
```
As a normal user
So that I can keep a URL for future use 
I would like to add a bookmark for it in the list
```
```
     ┌──────┐          ┌──────────┐          ┌─────┐          ┌────────┐          ┌────┐
     │Client│          │Controller│          │Model│          │Database│          │View│
     └──┬───┘          └────┬─────┘          └──┬──┘          └───┬────┘          └─┬──┘
        │    post-request   │                   │                 │                 │   
        │───────────────────>                   │                 │                 │   
        │                   │                   │                 │                 │   
        │                   │    .add(params)   │                 │                 │     params are title, url
        │                   │──────────────────>│                 │                 │   
        │                   │                   │                 │                 │   
        │                   │                   │  query(params)  │                 │   
        │                   │                   │────────────────>│                 │   
        │                   │                   │                 │                 │   
        │                   │                   │ result-object   │                 │   
        │                   │                   │<─ ─ ─ ─ ─ ─ ─ ─ │                 │   
        │                   │                   │                 │                 │   
        │                   │    [bookmarks]    │                 │                 │   
        │                   │<─ ─ ─ ─ ─ ─ ─ ─ ─ │                 │                 │   
        │                   │                   │                 │                 │   
        │                   │                   │  [bookmarks]    │                 │   
        │                   │───────────────────────────────────────────────────────>   
        │                   │                   │                 │                 │   
        │                   │                   │      html       │                 │   
        │                   │<─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ -   
        │                   │                   │                 │                 │   
        │      response     │                   │                 │                 │   
        │ <─ ─ ─ ─ ─ ─ ─ ─ ─                    │                 │                 │   
     ┌──┴───┐          ┌────┴─────┐          ┌──┴──┐          ┌───┴────┐          ┌─┴──┐
     │Client│          │Controller│          │Model│          │Database│          │View│
     └──────┘          └──────────┘          └─────┘          └────────┘          └────┘
```
User Story 3
------------
```
As a tidy user
So that I can keep my bookmarks neat and tidy 
I would like to delete a bookmark if I no longer need it
```
```
     ┌──────┐          ┌──────────┐          ┌─────┐          ┌────────┐          ┌────┐
     │Client│          │Controller│          │Model│          │Database│          │View│
     └──┬───┘          └────┬─────┘          └──┬──┘          └───┬────┘          └─┬──┘
        │   post-request    │                   │                 │                 │   
        │──────────────────>|                   │                 │                 │   
        │                   │                   │                 │                 │   
        │                   │    .delete(id)    │                 │                 │   
        │                   │──────────────────>│                 │                 │   
        │                   │                   │                 │                 │   
        │                   │                   │    query(id)    │                 │   
        │                   │                   │────────────────>│                 │   
        │                   │                   │                 │                 │   
        │                   │                   │ result-object   │                 │   
        │                   │                   │<─ ─ ─ ─ ─ ─ ─ ─ │                 │   
        │                   │                   │                 │                 │   
        │                   │    [bookmarks]    │                 │                 │   
        │                   │<─ ─ ─ ─ ─ ─ ─ ─ ─ │                 │                 │   
        │                   │                   │                 │                 │   
        │                   │                   │  [bookmarks]    │                 │   
        │                   │──────────────────────────────────────────────────────>   
        │                   │                   │                 │                 │   
        │                   │                   │      html       │                 │   
        │                   │<─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ -   
        │                   │                   │                 │                 │   
        │      response     │                   │                 │                 │   
        │ <─ ─ ─ ─ ─ ─ ─ ─ ─                    │                 │                 │   
     ┌──┴───┐          ┌────┴─────┐          ┌──┴──┐          ┌───┴────┐          ┌─┴──┐
     │Client│          │Controller│          │Model│          │Database│          │View│
     └──────┘          └──────────┘          └─────┘          └────────┘          └────┘
```
User Story 4
------------
```
As a normal user
So that I can keep my bookmarks up-to-date 
I would like to update a bookmark if it so needs
```
```
     ┌──────┐          ┌──────────┐          ┌─────┐          ┌────────┐          ┌────┐
     │Client│          │Controller│          │Model│          │Database│          │View│
     └──┬───┘          └────┬─────┘          └──┬──┘          └───┬────┘          └─┬──┘
        │   post-request    │                   │                 │                 │   
        │──────────────────>|                   │                 │                 │   
        │                   │                   │                 │                 │   
        │                   │    .update(id)    │                 │                 │   
        │                   │──────────────────>│                 │                 │   
        │                   │                   │                 │                 │   
        │                   │                   │    query(id)    │                 │   
        │                   │                   │────────────────>│                 │   
        │                   │                   │                 │                 │   
        │                   │                   │ result-object   │                 │   
        │                   │                   │<─ ─ ─ ─ ─ ─ ─ ─ │                 │   
        │                   │                   │                 │                 │   
        │                   │    [bookmarks]    │                 │                 │   
        │                   │<─ ─ ─ ─ ─ ─ ─ ─ ─ │                 │                 │   
        │                   │                   │                 │                 │   
        │                   │                   │  [bookmarks]    │                 │   
        │                   │───────────────────────────────────────────────────────>   
        │                   │                   │                 │                 │   
        │                   │                   │      html       │                 │   
        │                   │<─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ -   
        │                   │                   │                 │                 │   
        │      response     │                   │                 │                 │   
        │<─ ─ ─ ─ ─ ─ ─ ─ ─ -                   │                 │                 │   
     ┌──┴───┐          ┌────┴─────┐          ┌──┴──┐          ┌───┴────┐          ┌─┴──┐
     │Client│          │Controller│          │Model│          │Database│          │View│
     └──────┘          └──────────┘          └─────┘          └────────┘          └────┘
```
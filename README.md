Bookmark manager app
====================
Bookmark manager has this list of specifications.

  - Show a list of bookmarks
  - Add new bookmarks
  - Delete bookmarks
  - Update bookmarks
  - Comment on bookmarks
  - Tag bookmarks into categories
  - Filter bookmarks by tag
  - Users manage their bookmarks

Here is the first user story and diagram.
```
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks
```
```
  ┌──────┐          ┌──────────┐          ┌─────┐          ┌────┐
  │Client│          │Controller│          │Model│          │View│
  └──┬───┘          └────┬─────┘          └──┬──┘          └─┬──┘
     │    get-request    │                   │               │
     │ ──────────────────>                   │               │
     │                   │                   │               │
     │                   │       .all        │               │
     │                   │ ─────────────────>│               │
     │                   │                   │               │
     │                   │    [bookmarks]    │               │
     │                   │ <─────────────────│               │
     │                   │                   │               │
     │                   │            [bookmarks]            │
     │                   │ ──────────────────────────────────>
     │                   │                   │               │
     │                   │                html               │
     │                   │ <──────────────────────────────────
     │                   │                   │               │
     │      response     │                   │               │
     │ <──────────────────                   │               │
  ┌──┴───┐          ┌────┴─────┐          ┌──┴──┐          ┌─┴──┐
  │Client│          │Controller│          │Model│          │View│
  └──────┘          └──────────┘          └─────┘          └────┘
  ```
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

To view bookmarks, navigate to `localhost:3000/bookmarks`
To view bookmarks, navigate to `localhost:3000/bookmarks`.

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

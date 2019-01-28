
Bookmark manager has this list of specifications.

  Show a list of bookmarks
  Add new bookmarks
  Delete bookmarks
  Update bookmarks
  Comment on bookmarks
  Tag bookmarks into categories
  Filter bookmarks by tag
  Users manage their bookmarks

  Here is the first specification user story and diagram.

  As a time-pressed
  So that I can quickly go to web sites I regularly visit
  I would like to see a list of bookmarks

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

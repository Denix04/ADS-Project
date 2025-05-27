
# What is a Migration?

## 🔹 A **migration** is **not a table** or a **union of tables**.

Instead, a **migration is a Ruby script (a class) that describes changes to your database schema** — for example:

* Creating tables
* Adding or removing columns
* Changing column types
* Adding indexes
* Dropping tables
* Renaming columns or tables

---

## Why migrations?

* They **track and manage changes** to your database schema over time.
* They help **version control your database structure** alongside your code.
* They let multiple developers work on the same database schema **in a coordinated way**.
* They make it easy to **apply or rollback changes** consistently.

---

# What does a migration look like?

Here’s a simple example that creates a table:

```ruby
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
```

* This migration creates a table named `users` with columns `name`, `email`, and the automatic timestamps (`created_at`, `updated_at`).

---

# How migrations relate to tables?

* Each **migration can create or modify one or more tables**.
* But **a migration itself is just code** that tells ActiveRecord *how* to change the database.
* The **actual tables** live in the database.
* The **database schema** is the sum of all migrations applied up to a point.

---

## Summary

| Term          | What it is                                    |
| ------------- | --------------------------------------------- |
| **Migration** | Ruby code describing changes to the DB schema |
| **Table**     | Database structure holding rows and columns   |
| **Schema**    | The collection of tables and relationships    |

---

### So:

* A migration **creates/modifies tables** or other schema parts.
* It’s **not itself a table or union of tables**.
* Think of migrations as **version-controlled instructions** for building your database.

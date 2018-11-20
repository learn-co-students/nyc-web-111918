# One to Many Relationships

## SWBATs

* [ ] Organize code into different files
* [ ] Implement one object to many objects relationship
  * [ ] One object has many objects
  * [ ] One object belongs to another object
* [ ] Practice passing custom objects as arguments to methods
* [ ] Demonstrate single source of truth
* [ ] Infer type of method (class or instance) through naming conventions

## Outline

* Learn about object oriented relationships.
  * See the problem
  * Introduce new concepts to solve those problems
  * Convert those concepts to code  
* Practice them via _deliverables_!
  * Define terminology
  * Learn to test!

## Lecture Notes

### Define

* Model
* Domain
* Domain modeling
* Relationships
  * One to many relationship
  * Many to many relationship (for next lecture!)
  * belongs to
  * has many

_Why do we care so much about codifying and being really specific about the terminology of has-many/belongs-to?_ The terms are very powerful because we can use the same idea to describe relationships across many different types of domains. The relationship between artist and song, is the same as book and author, user and tweets, etc.

* Schema
* Single Source of Truth

### Deliverables

* Create a User class. The class should have these methods:
  * `#initialize` which takes a username and has a reader method for the username
  * `#tweets` that returns an array of Tweet instances
  * `#post_tweet` that takes a message, creates a new tweet, and adds it to the user's tweet collection
* Create a Tweet class. The class should have these methods:
  * `Tweet#message` that returns a string
  * `Tweet#user` that returns an instance of the user class
  * `Tweet.all` that returns all the Tweets created.
  * `Tweet#username` that returns the username of the tweet's user

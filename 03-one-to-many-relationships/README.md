# One to Many Relationships

## SWBATs

* [x] Organize code into different files
* [x] Implement one object to many objects relationship
  * [x] One object has many objects
  * [x] One object belongs to another object
* [x] Practice passing custom objects as arguments to methods
* [x] Demonstrate single source of truth
* [x] Infer type of method (class or instance) through naming conventions

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

* Model - is a blueprint = class
* Domain - what you're doing, it's the subject matter you're working with; Learn => learning, teaching; YouTube => wasting time
* Domain modeling - it's the blueprint of what you're doing;
                    it's the process of modeling your domain
* Relationships - they exist between models
  * One to many relationship
    * team `has_many` players
    * player `belongs_to` a team
  * Many to many relationship (for next lecture!)
  * belongs to
  * has many

_Why do we care so much about codifying and being really specific about the terminology of has-many/belongs-to?_ The terms are very powerful because we can use the same idea to describe relationships across many different types of domains. The relationship between artist and song, is the same as book and author, user and tweets, etc.

* Schema - a visual representation of your domain model
* Single Source of Truth

### Deliverables

* Create a User class. The class should have these methods:
  * ~~`#initialize` which takes a username and has a reader method for the username~~
  * ~~`#tweets` that returns an array of Tweet instances~~
  * ~~`#post_tweet` that takes a message, creates a new tweet, and adds it to the user's tweet collection~~
* Create a Tweet class. The class should have these methods:
  * ~~`Tweet#message` that returns a string~~
  * ~~`Tweet#user` that returns an instance of the user class~~
  * ~~`Tweet.all` that returns all the Tweets created.~~
  * ~~`Tweet#username` that returns the username of the tweet's user~~

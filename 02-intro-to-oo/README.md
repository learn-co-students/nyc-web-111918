Intro to Object Orientation
===========================

aka: Object Oriented Programming (OOP)

## SWBATs

* [x] Define `object` in programming domain
* [x] Explain the concept of sending messages
* [x] Create a class and instantiate an instance of the class
* [x] Explain the difference between a class and an instance
* [x] Pass arguments to `new` by defining an initialize method in class
* [x] Create instance methods
* [ ] Call methods on the implicit or explicit `self`
* [x] Define attribute readers and writers using `attr_` macros
* [ ] Get more practice with array compositions (`each`, `map`, `select`, `find`)
* [ ] Explain the need for variable scope and why it's important to not utilize global variables - NEVER USE THIS!!!!!

## Outline / Objectives

### Objects!

- real world (attributes, methods)
  - organizing information, abstraction
- in programming (type, value of objects)
- Everything is an object
- methods: how do they work?
    - messages, send, respond, do work
- unknown methods? what happens?

### Objects, Classes, and Instances, Oh My!

- programmers are lazy
- hashes to classes, encapsulation
- class, objects, and instances: how are they related?
- `object_id`

### Creating our own Objects

- getters and setters
- instance variables, instance methods, scoping
- `attr_` macros, initialize
- more instance methods
  - implicit `self`
- class methods, class variables
  - `@@all`, `self`
  - how do we write `Human.all`?

### Practice with Iterators

- using `Class.all`

## Deliverables

Here is a naive implementation of a bank account in Ruby using only a hash which stores key-value pairs.

```ruby
bank_account = {"user_id": 3, "balance": 100}
```

Write an implementation of a bank account that meets the following requirements:

* can print the balance of the account
* can deposit money into the account
* can withdraw money from the account
* keeps track of the account number
* keeps track of the customer id of the account

## Lecture Notes

### Intro

- Today we'll be talking about **Object-Oriented Programming**.
    - What they are. / What are they?
    - How to make them.
    - How to use them. / How do we use them? How are we using them?
    - Then use them!

### Objects!

- Objects. What are they?
- Before we talk about them in the context of programming, let's take a step back and define it in the real world.
    - So what are objects?
        - Things, animals, people, etc.
        - They exist - instances.
    - What makes objects interesting?
        - Attributes, properties.
        - Perform actions, functions, methods.
    - Also, they are similar yet unique.
    - We can also say that we are all objects.
        - What kind of object are we?
            - Humans, Students, Instructors, etc.
    - Object-Oriented Programming is a way of bringing this familiar real-world model and modeling our code, our data structures in a similar manner.
- So let's bring this all back to programming.
    - We are all objects!
    - Let's start making some objects that represent us.

```ruby
# what kind of properties/attributes do we have?
name = 'student name'
# what is the data type of name?
puts name.class
# what is the value of name?
puts name

# how about this?
# (in your heart, how old are you?)
age = 5
puts age.class
puts age

# so what is an object?
# which of these are objects?
```

> **In Ruby, everything is an object.**
>
> [Source: Ruby Docs](https://www.ruby-lang.org/en/about/): Seeing Everything as an Object

__Asides__

- [Is everything really an object in Ruby?](https://stackoverflow.com/questions/3429553/is-everything-an-object-in-ruby)
- [Is this the same in other languages like Python?](https://stackoverflow.com/questions/865911/is-everything-an-object-in-python-like-ruby)
    - Object can have slightly different meanings in different languages. Python’s is a looser definition than that of Ruby. However, in the end, the concept is the same even if the execution and implementation details exposing objects is different.

```ruby
# are these objects too?
puts 'student name'.class
puts 5.class

# what if we change it?
age = '5'
puts age.class

# and we can do interesting things with objects
# what happens when we run this code?
# what is split and where does it come from?
# how does name know what to do with split?
name.split
# everything is an object
# so what about just 'student name'? does it have split?
'student name'.split
# what's happening when we run this code?
puts 'student name'.split.class
# and we can get first name and last name
puts name.split[0]
puts name.split[1]
# but not always ;)
name = 'Ho Yin Cheng'
puts name.split[0]
```

> **Methods**, on a lower level, are known as **"messages" in object-oriented programming**. **Methods are called on objects** and **messages are sent to objects**. **Objects respond to messages by doing some work**. The exact **work** that it should do **is defined on the object's class**.

What words here are the same as normal English, but new in their definition in the context of programming?

- Method
- messages
- Object-oriented programming
- Called on
- Objects
- Sent to
- Respond to [messages]
- Doing some work
- Defined on
- Object’s class
- Class

```ruby
# what is split?
# so split is a method
# in object-oriented programming, we say that methods are called on objects
# and messages are sent to objects
# so what does that mean?
name.send(:split)
# have you seen :split? what is that colon?
# it's a symbol

# what is we do this?
message_name = :split
name.send(message_name)
# what does send do?

# say it's out birthday and we want to change our age
age = age + 1 # <= intentional error
# that didn't work because Strings don't have a + method
# if we change it back to a number, it works again
age = 5
age = age + 1
puts age
# so + is a method!
# can we do a send here instead?
age.send(:+)
# ArgumentError: wrong number of arguments (given 0, expected 1)
# we need to give it arguments
age.send(:+, 1)
# what does the argument to send specify?
# are these the same?
age.send(:+, 1) == age + 1
# what other arguments does send take?
# see the docs:
# https://ruby-doc.org/core-2.5.0/Object.html#method-i-send

# how deep can we go?
# can we do this?
plus_message = :+
age.send(plus_message, 1)

# how about arrays?
name.send(:split)[0]
# how would we do this with send?
name.send(:split).send(:[], 0)
# so what is []?
# it too is a method
# so how else can we do this?
name.send(:split).[](0)
# now that is some crazy cool stuff!
# ruby gives you a lot of syntactic sugar to make code read easier
# this is one example of that syntactic sugar
# keep it in mind as it will pop up again later

# but what do objects do when you try to use a method it doesn't understand?
age.split
age.respond_to_undefined_method
# objects complain when they don't know how to respond to messages
# objects complain when they don't know how to execute methods

# to check if an object responds to a message, use respond_to?
age.respond_to? :split
age.respond_to? :+
age.respond_to? plus_message
```

### Objects, Classes, and Instances, Oh My!

**Programmers are LAZY!**

> Remember, programming is about removing simple, repetitive decisions so that we can focus on harder, higher-order problems. Whenever you have to do something more than once, you should probably automate it.

```ruby
# all of that is a bit messy though
# we want to organize our information
alice = { name: 'alice a', age: 10 }

puts alice.class
puts alice[:name]
puts alice[:name].split

# look! more syntactic sugar but for hashes!
puts alice.send(:[], :name)

# and now we can make variables for all the humans in the class
# let's get some names!
bob = { name: 'bob b', age: 10 }
carol = { name: 'carol c', age: 10 }
```

But typing that out or copy pasting can be error prone.

Why is `{ }` inefficient?

- You might have typos, which breaks the schema.
- Changing properties on the hash requires accessing attributes using [] syntax.

**We're programmers, not typists.**

What's a better way of doing this? The answer is Classes.

> A **class** is a blueprint which you use to create **objects**. An **object** is an **instance** of a class. The **object** is a _concrete thing_ while **instance** indicates the relationship of an **object** _to_ its **class**.
>
> Source: [The difference between Classes, Objects, and Instances](https://stackoverflow.com/questions/1215881/the-difference-between-classes-objects-and-instances)

- Classes = blueprints
- Objects = things
- Instances = can you fill in the blank? what do they describe? what are they? why are they important?

```ruby
# typos suck
# can be do better?
# yes, with classes
# simplest class; not interesting at all
class Human
end

# a class is another type of object
puts Human.class

# you can do things with it like create them using the new method
alice = Human.new

puts alice.class
puts alice.class.class

# we can also do this with send
bob = Human.send(:new)
# now that's interesting
# what is that long line of text that we see and why are the two different?
# => #<Human:0x007f8a059e18d0>
# => #<Human:0x007ff59d953220>

# alice is an object
# bob is an object
# Human is an object
# Human is also a class
puts alice.class == bob.class
puts alice.class == Human
# they are all objects and of the same type
# so what is the relationship of alice to Human?
# in programming, we say that alice, an object, is an **instance** of Human, its class
# in other words, alice, an object, is a **copy** of Human, its class
# so when you make an instance of a class, you are making a new object that's a copy of it

### Important!
# what's the difference between an instance and a class?
# class is the blueprint
# instance is a copy of this blueprint (describes relationship)
# object is the actual thing

# are they the same?
puts alice == bob

# no, each is unique
# and we can actually see this through that long string of numbers and letters
puts alice
puts bob
# or to access the attribute directly, we can look at the object's id
puts alice.object_id
puts bob.object_id

### ASIDE ###
o = Object.new # <Object:0x007f870d02d550>
o.object_id # 70109007801000

# Where does object ID come from?
# https://stackoverflow.com/questions/2818602/in-ruby-why-does-inspect-print-out-some-kind-of-object-id-which-is-different
(o.object_id * 2).to_s(16) # 7f870d02d550
"%x" % (o.object_id << 1) # 7f870d02d550

### THIS IS A RABBIT HOLE!
### ENTER IF YOU DARE!
```

### Creating our own Objects

#### Simple Objects (like Hashes)

First lets:

- Create custom getters and setters for instance properties.
  - `@name` and `@age` are our instance variables
- Discuss how scoping works and _how_ instance variables live in the scope of the class.
- See what happens when you try accessing instance variables (and local ones) in another instance method.

```ruby
# empty classes are uninteresting
# we wanted to make things easier so let's make it so we can
# have properties to set and get data in our classes
class Human
  # setter
  def name=(name)
    # what is this @name?
    # instance variable
    @name = name
  end

  # getter
  def name
    @name
  end

  def age=(age)
    @age = age
  end

  def age
    @age
  end
end

# now let's start using our human object
alice = Human.new
alice.name = 'alice a'
alice.age = 20
puts alice.class
puts alice.name
puts alice.send(:name)
puts alice.age
puts alice.send(:age)
# if we do this, what happens?
puts alice.mame
# awesome! no more typos!

# Scope!
# here's a question, can you access @name outside of the class?
puts @name
puts name
# what if we put binding.pry inside the an instance method?
# then try to access other variables in there?

# what do you see?
# why is this (scope) important?
```

- Let's be lazier and use `attr_accessor` macro to add getters and setters to your instance variables, and `attr_reader` and `attr_writer` to be more specfic.

```ruby
# but that class looks long
# what if we want to add another instance variable like @loves_cats?
# can we be lazier?
class Human
  attr_writer :name, :age, :loves_cats
end

alice = Human.new
alice.name = 'alice a'
alice.age = 20
alice.loves_cats = true
puts alice.name
# breaks... well that's not good
# we need to be able to read those instance variables too

class Human
  attr_writer :name, :age, :loves_cats
  attr_reader :name, :age, :loves_cats
end

alice = Human.new
alice.name = 'alice a'
alice.age = 20
alice.loves_cats = true
puts alice.name
puts alice.age
puts alice.loves_cats

# awesome!
# reading and writing, that seems a bit redundant though
# can we be even laaaaazier?
class Human
  attr_accessor :name, :age, :loves_cats
end

alice = Human.new
alice.name = 'alice a'
alice.age = 20
alice.loves_cats = true
puts alice.name
puts alice.age
puts alice.loves_cats

# perfect!
```

- Now let's define all our data at once using `initialize` with `@name`, `@age`, and `@loves_cats` as instance variables.

```ruby
# but all that typing to setup a new human
# seems pretty annoying, doesn't it?
# especially if we start making more humans like before
# can we be even LAZIER?
class Human
  attr_accessor :name, :age, :loves_cats

  # some languages call this a constructor
  # when you call new, it calls initialize
  def initialize(name, age, loves_cats)
    @name = name
    @age = age
    @loves_cats = loves_cats
  end
end

# now we can create and assign values in a single line!
alice = Human.new('alice a', 65, true)
# => #<Human:0x007faa89184760 @age=65, @loves_cats=true, @name="alice a">
puts alice.name
puts alice.age
# yes! works the same!!

# how would we do this with send?
# remember, everything is an object so Human is an object too
bob = Human.send(:new, 'bob b', 30, false)
```

- Time to play around and add more instance methods that do things.
- Adding a method that interacts with one of the instance methods.
    - This showcases implicit self.
    - We can also see getters and setters being used inside of other methods.
- Also see: [Instance variable: self vs @](https://stackoverflow.com/questions/1693243/instance-variable-self-vs)

```ruby
# now let's say we want to change our age
# it's our birthday!!
# how can we do this?
alice.age = alice.age + 1
# and for bob too, but that could be error prone
bob.age = bob.age + 1
# we want to avoid error prone typos
# birthdays are consistent
# so what's another way to handle this?
class Human
  attr_accessor :name, :loves_cats
  # why make this read-only?
  # age is something we want to control
  # no faking IDs!
  attr_reader :age

  def initialize(name, age, loves_cats)
    @name = name
    @age = age
    @loves_cats = loves_cats
  end

  # instance method
  def birthday!
    # what is self here?
    # are these two statements the same?
    # are the two selfs the same?
    # self.age = self.age + 1
    @age = @age + 1
    # if you don't see it yet, we'll get back to it
    # just let it stew in the back of your mind
  end
end

alice = Human.new('alice awesome', 22, true)
alice.birthday!
puts alice.age
# instance methods are something an instance of a class can do
# the class itself, an object, cannot do this
Human.birthday!
```

**An Aside** - _Syntactic Sugar!_

```ruby
# lets look back at our old example and use getters and setters again
class Human
  attr_accessor :name, :loves_cats

  def initialize(name, age, loves_cats)
    @name = name
    @age = age
    @loves_cats = loves_cats
  end

  def birthday!
    @age = @age + 1
  end

  def self_birthday!
    self.age = self.age + 1
  end

  def age=(age)
    puts "setter"
    @age = age
  end

  def age
    puts "getter"
    @age
  end
end

alice = Human.new('alice awesome', 22, true)
alice.birthday!
alice.self_birthday!
# what do you see printed out?
# why?

# syntactic sugar!
alice.age += 1
alice.age = alice.age + 1
alice.age=(alice.age + 1)
alice.send(:age=, alice.age + 1)
alice.send(:age=, alice.send(:age) + 1)
```

_Back to playing with instance methods and looking at self & scope._

```ruby
# but just having a birthday is a bit boring
# we gotta celebrate!
class Human
  attr_accessor :name, :loves_cats
  attr_reader :age

  def initialize(name, age, loves_cats)
    @name = name
    @age = age
    @loves_cats = loves_cats
  end

  def birthday!
    @age = @age + 1
  end

  # another instance method
  def celebrate_birthday(place)
    # any difference here?
    # self.birthday!
    birthday!
    puts "#{@name} parties hard at #{place} and turns #{@age}!"
  end
end

alice = Human.new('alice awesome', 22, true)
alice.celebrate_birthday('Flatiron School')
```

#### Complex Objects

- Add `@@all` as a class variable that lives outside each instance.
    - This allows us to hold on to all of the created instances of this class in memory in a place that is separate from each of the instances themselves.
    - When adding new instances add `@@all << self` to `initialize`.
    - Why would we want to do this? What other class variables might we want to add?
- What is `self` in each context?
    - We can use `binding.pry` to show that `self` is the class outside of any method, and use that intuition to write `Human.all`.
    - You can show that `Human.new` is also a class method.
        - [BasicObject.new](https://ruby-doc.org/core-2.5.0/BasicObject.html#method-c-new)
        - It calls `initialize`.

```ruby
# but remember, we probably will want to have data for tons of humans
# how can we store them?
# arrays?
humans = []
humans << Human.new('alice a', 10, true)
humans << Human.new('bob b', 11, false)
humans << Human.new('carol c', 12, true)
# doable but remember, programmers are LAZY

# how can we do better?
class Human
  attr_accessor :name, :loves_cats
  attr_reader :age

  # this is a class variable
  # what are they?
  # how do they differ from instance variables?
  @@all = []

  def initialize(name, age, loves_cats)
    @name = name
    @age = age
    @loves_cats = loves_cats

    # what is self?
    @@all << self
  end

  def birthday!
    @age = @age + 1
  end

  def celebrate_birthday(place)
    birthday!
    puts "#{@name} parties hard at #{place} and turns #{@age}!"
  end

  # what is this self.all here? what is self.?
  # class method
  def self.all
    @@all
  end
end

# now we can do this
Human.new('alice a', 10, true)
Human.new('bob b', 11, false)
Human.new('carol c', 12, true)

# and get an array!
Human.all
puts Human.all

## How can we write these?
# let's say we want to get all human names
names = Human.all.map { |human| human.name }
# or let's say everyone had a birthday!!!
Human.all.each { |human| human.celebrate_birthday }
# how would we pick out only humans who are senior citizens?
# how can we get a list of all the people who like cats?
# try it out!
```

### Extra reading

- [History of Object-Oriented Programming](https://en.wikipedia.org/wiki/Object-oriented_programming#History)
- [Why is `object_id` different from what you see when you create a new instance of a class?](https://stackoverflow.com/questions/2818602/in-ruby-why-does-inspect-print-out-some-kind-of-object-id-which-is-different)

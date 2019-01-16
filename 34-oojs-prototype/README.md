# Inheritance and the prototype chain

## Outline

- Understand the benefits of sharing properties and behavior
- Answer (**Why?**)
  - Why is inheritance/sharing useful?
  - What are we sharing?
- **How it works?**
  - `JS`'s and `Ruby`'s inheritance model similarities and differences
  - Understand the `Prototype Chain`
  - Create objects using `new` and `Constructor` functions
  - `new` vs Object.create
- **How we will likely use it?**
  - Classes (syntactic sugar on the `prototype chain`)
  - Refactor constructor to adopt the class syntax

---

### Inheritance

- One Object gets access to the properties and methods of another object.

### Object Creation in JavaScript

- Let's imagine we have an application that needs to construct robot objects in JavaScript. Each robot should have a `name`, `weight`, and `specialty`. We could create several using the object literal syntax:

```javascript
const robot1 = { name: 'sparko', weight: 1000, specialty: 'making sparks' }
const robot2 = { name: 'the iron giant', weight: 9999999, specialty: 'being giant and made of iron' }
const robot3 = { name: 'bender', weight: 500, specialty: 'bending things' }
```

- While this approach works, it's extremely tedious **and error prone!!** This leaves us open to typos and other mistakes! We could instead choose to write a function that constructs objects for us (these are called [factory functions](https://en.wikipedia.org/wiki/Factory_(object-oriented_programming))):

```javascript
function robotFactory(name, weight, specialty) {
  const robot = { name, weight, specialty } //ES6 shorthand syntax
  // const robot = { name: name, weight: weight, specialty: specialty}
  return robot
}

const robot1 = robotFactory('sparko', 1000, 'making sparks')
const robot2 = robotFactory('the iron giant', 9999999, 'being giant and made of iron')
const robot3 = robotFactory('bender', 500, 'bending things')
```

- Quick note about the snippet above: in modern JavaScript, ES6 and later, we can create objects using a shorter syntax. If a key/value pair share the same name, we can abbreviate our statement like so: `{ name: name }` becomes `{ name }`. Both will create an object with a key of name pointing to whatever value is stored in the variable called `name`.

- Let's add some functionality to our robots. We _could_ create a function that takes in a particular robot object as an argument:

```javascript
function rechargeBatteries(robot) {
  console.log(`${robot.name} is recharging its batteries`)
}

rechargeBatteries(robot1) //'sparko is recharging its batteries'
rechargeBatteries(robot2) //'the iron giant is recharging its batteries'
rechargeBatteries(robot3) //'bender is recharging its batteries'
```

- Again, this approach works but it would be much easier to create a method on our robot objects to handle this functionality. We can also leverage the value of `this` in our method:

```javascript
function robotFactory(name, weight, specialty) {
  const robot = {
    name,
    weight,
    specialty,
    rechargeBatteries: function() {
      console.log(`${this.name} is recharging its batteries`)
    }
  }
  return robot
}

const robot1 = robotFactory('sparko', 1000, 'making sparks')
const robot2 = robotFactory('the iron giant', 9999999, 'being giant and made of iron')
const robot3 = robotFactory('bender', 500, 'bending things')

robot1.rechargeBatteries() //'sparko is recharging its batteries'
```

- Recall that a function (declared with the `function` keyword) will resolve `this` based on its **execution context**. If `rechargeBatteries` is called **on** robot1, `robot1.rechargeBatteries`, `this` will be `robot1`.

- Again, this is _getting better_ but there's still a flaw in our approach:

```javascript
robot1.rechargeBatteries === robot2.rechargeBatteries // false
```

![scream emoji](https://media.giphy.com/media/TK8bDNcLU1F16/giphy.gif)

- `robot1.rechargeBatteries` is a different function, occupying a different place in memory than `robot2.rechargeBatteries`. **We are wasting memory by constantly redeclaring `rechargeBatteries` every time we create a new robot**. This is _bad_. We don't want to be wasteful.

- In Ruby this problem was easily solved by using class based inheritance:

```ruby
class Robot
  attr_reader :name, :weight, :specialty

  def initialize(name, weight, specialty)
    @name = name
    @weight = weight
    @specialty = specialty
  end

  def recharge_batteries
    puts "#{self.name} is recharging its batteries"
  end

end

robot1 = Robot.new('sparko', 1000, 'making sparks')
robot1.recharge_batteries #=> sparko is recharging its batteries
```

---

#### Prototypal Inheritance

- JavaScript however, **does not have classes**. Ruby has these special things called _classes_ that allow us to create blueprints for our instances. JavaScript relies on prototypal inheritance. In essence, almost everything in JavaScript is an object: functions, object literals, even arrays. JavaScript objects have a chain of prototypes; other objects that define certain _shared functionality_. If a method is not defined on a particular object, JavaScript will look _up the chain of prototypes_ (which are plain old JavaScript objects) until it either finds the method or errors out
  - "When it comes to inheritance, JavaScript only has one construct: objects. Each object has a private property which holds a link to another object called its prototype. That prototype object has a prototype of its own, and so on until an object is reached with null as its prototype. By definition, null has no prototype, and acts as the final link in this prototype chain.
  Nearly all objects in JavaScript are instances of Object which sits on the top of a prototype chain." - [MDN Article on Inheritance and the Prototype Chain](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)

#### What is a Prototype in JavaScript

- "JavaScript is often described as a prototype-based language — to provide inheritance, objects can have a prototype object, which acts as a template object that it inherits methods and properties from. An object's prototype object may also have a prototype object, which it inherits methods and properties from, and so on. This is often referred to as a prototype chain, and explains why different objects have properties and methods defined on other objects available to them.

- Well, to be exact, the properties and methods are defined on the prototype property on the Objects' constructor functions, not the object instances themselves.

- In JavaScript, a link is made between the object instance and its prototype (its `__proto__` property, which is derived from the prototype property on the constructor), and the properties and methods are found by walking up the chain of prototypes." - [MDN Article on Object Prototypes](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object_prototypes)

---

```javascript
function robotFactory(name, weight, specialty) {
  const robot = {
    name,
    weight,
    specialty,

  }
  return robot
}

 function rechargeBatteries() {
  console.log(`${this.name} is recharging its batteries`)
}

const robot1 = robotFactory('sparko', 1000, 'making sparks')
const robot2 = robotFactory('the iron giant', 9999999, 'being giant and made of iron')

robot1.recharge = rechargeBatteries // SHARE the SAME function
robot2.recharge = rechargeBatteries // SHARE the SAME function

robot1.recharge === robot2.recharge // true

robot1.recharge() //'sparko is recharging its batteries'
```



- Let's refactor our code so we can leverage `Object.create` to make our robots:

- "The `Object.create` method creates a new object, using an existing object as the prototype of the newly created object" - [MDN `Object.create`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)



```js
const robotTemplate = {
  name: null,
  weight: null,
  specialty: null,
  rechargeBatteries: function() {
    console.log(`${this.name} is recharging its batteries`)
  }
}

const robot1 = Object.create(robotTemplate)
robot1.name = 'sparko'
robot1.weight = 1000,
robot1.specialty = 'making sparks'

robot1.__proto__ //robotTemplate

robot1.rechargeBatteries === robotTemplate.rechargeBatteries //true

robot1.rechargeBatteries() //sparko is recharging its batteries
```

- "`The Object.create()` method creates a new object, using an existing object to provide the newly created object's `__proto__` ." - [MDN Article on `Object.create`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)
  - `Object.create` in our example above allows us to create new objects with `robotTemplate` in their prototype chain. In other words, robot1 is **inheriting** the `rechargeBatteries` method from `robotTemplate`.

- Again, our approach is getting better but manually assigning a `name`, `weight`, and `speciality` to our robots is tedious.

---

- Let's update our `robotFactory` so that it is a [constructor function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor). A constructor function is a JavaScript function that creates object "instances." Like `Object.create`, it will return a new **object** and will serve as the prototype object for our newly constructed robot instances:

```javascript
function RobotFactory(name, weight, specialty) {
  // `this` in the context of a constructor function will be the newly created object {}
  this.name = name
  this.weight = weight
  this.specialty = specialty
}

// any function can be called as a constructor with the `new` operator (see notes below for more info on the `new` operator)
const robot1 = new RobotFactory('sparko', 1000, 'making sparks')
const robot2 = new RobotFactory('the iron giant', 9999999, 'being giant and made of iron')
const robot3 = new RobotFactory('bender', 500, 'bending things')
```

- A few notes on the `new` operator:

>  When the code `new Foo(...)` is executed, the following things happen:
>
  > 1.  A new object is created, inheriting from `Foo.prototype`.
>
  > 2. The constructor function `Foo` is called with the specified arguments, and with `this` bound to the newly created object. `new Foo` is equivalent to `new Foo()`, i.e. if no argument list is specified, Foo is called without arguments.
>
  > 3. The object returned by the constructor function becomes the result of the whole `new` expression. If the constructor function doesn't explicitly return an object, the object created in step 1 is used instead. (Normally constructors don't return a value, but they can choose to do so if they want to override the normal object creation process.)
>
> You can add a shared property to a previously defined object type by using the `Function.prototype` property. This defines a property that is shared by all objects created with that function, rather than by just one instance of the object type. - [MDN `new` operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new)


- As it relates to our example, when a function is called with the `new` operator––`new robotFactory('sparko', 1000, 'making sparks')`––`this` will point to the **newly created object**. Writing this constructor function also _adds_ an object that points to `robotFactory` in the newly created object's ("instance") prototype chain:

```javascript
robotFactory.prototype
// the prototype is an object with a KEY of constructor that points to our robotFactory function:
// {
  // constructor: ƒ robotFactory(name, weight, specialty)
// }
```

- This object is in turn added as the `__proto__` for all robots created from our constructor:

```js
const r = new robotFactory('rob', 3, 'JavaScript')
r.__proto__ === robotFactory.prototype // true
```

---

- Let's leverage our new understanding of the prototype chain to avoid duplicating `rechargeBatteries`:

```js
function robotFactory(name, weight, specialty) {
  this.name = name
  this.weight = weight
  this.specialty = specialty
}

robotFactory.prototype.rechargeBatteries = function() {
  console.log(`${this.name} is recharging its batteries`)
}

const robot1 = new robotFactory('sparko', 1000, 'making sparks')
const robot2 = new robotFactory('the iron giant', 9999999, 'being giant and made of iron')
const robot3 = new robotFactory('bender', 500, 'bending things')

robot1.rechargeBatteries() //'sparko is recharging its batteries'
robot2.rechargeBatteries() //'the iron giant is recharging its batteries'
robot3.rechargeBatteries() //'bender is recharging its batteries'
```

- We're no longer duplicating `rechargeBatteries`:

```javascript
robot1.rechargeBatteries === robot2.rechargeBatteries // true
```

- Also note that we're adding methods to `robotFactory.prototype`, not directly to `robotFactory` itself. Recall:

```js
robotFactory.prototype
{
  rechargeBatteries: ƒ (),
  constructor: ƒ robotFactory(name, weight, specialty)
}
```

- `robotFactory`'s prototype is ANOTHER OBJECT with a key of `constructor` that points to the `robotFactory` function itself and another key that points to `rechargeBatteries`
- any objects created from robotFactory can look up this chain of ancestors to find the `rechargeBatteries` method

---

#### "Classes" in JavaScript

- "JavaScript classes, introduced in ECMAScript 2015, are primarily syntactical sugar over JavaScript's existing prototype-based inheritance. **The class syntax does not introduce a new object-oriented inheritance model to JavaScript.**" - [MDN Article on the `class` keyword](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)

- Although we can use the `class` keyword in modern JavaScript, the language **does not support true object orientation**. JS still relies on a prototypal inheritance model and "classes" are in fact **_functions_** (which are technically objects). Let's see an example of the `class` keyword in use:

```javascript
class Robot {
  constructor(name, weight, specialty) {
    this.name = name
    this.weight = weight
    this.specialty = specialty
  }

  rechargeBatteries() {
    console.log(`${this.name} is recharging its batteries`)
  }
}

const robot1 = new Robot('sparko', 1000, 'making sparks')
const robot2 = new Robot('the iron giant', 9999999, 'being giant and made of iron')
const robot3 = new Robot('bender', 500, 'bending things')

robot1.rechargeBatteries() //'sparko is recharging its batteries'
robot2.rechargeBatteries() //'the iron giant is recharging its batteries'
robot3.rechargeBatteries() //'bender is recharging its batteries'
```

- Some notes on the snippet above:
  - "The `constructor` method is a special method for creating and initializing an object created with a `class`. There can only be one special method with the name "constructor" in a class. A SyntaxError will be thrown if the class contains more than one occurrence of a `constructor` method." - [MDN Article on `class`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
  - When using the `new` operator on a `class`, JavaScript will look for and invoke this special `constructor` function. You can think of this as being _similar_ to Ruby's `initialize` method. It is, however, not the same because JavaScript is not actually object oriented. The `class` syntax is just syntactic sugar over our previous example that manually added methods to the objects in our robot's prototype chain.

#### Leveraging Closures to Create Private Pieces of State

- In Ruby, making something `private` is as easy as this:

```ruby
class Donut
  attr_reader :flavor
  def initialize(flavor)
    @flavor = flavor
  end

  private

  def super_private
    puts "wow, so secret!"
  end
end
```

- JavaScript **does not have a `private` keyword** so we'll need to take advantage of lexical scope and closures in order to hide data and/or functionality.

- Let's imagine that we need to keep track of the total number of robots produced by our factory and assign an auto-incremeting id to each one. First, let's close over our `Robot` class by wrapping it in an [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE):

```javascript
const Robot = (() => {
  return class Robot {
    constructor(name, weight, specialty) {
      this.name = name
      this.weight = weight
      this.specialty = specialty
    }

    rechargeBatteries() {
      console.log(`${this.name} is recharging its batteries`)
    }
  }
})()
```

- Recall that Immediately Invoked Function Expressions (IIFEs) as the name implies, are **invoked** as soon as they're defined. Look closely at the snippet above and ask yourself what `const Robot` will evaluate to.
  - `const Robot` will be **assigned** to whatever value the expression to the right of the `=` evaluates to. Notice that we have an IIFE that **returns** our Robot class.
  - `const Robot` will evaluate to `Robot`, the key difference being that our `Robot` class is now enclosed in an IIFE.

```javascript
console.log(Robot) // Robot class
```

- We can now encapsulate some private variables within the closure, allowing us to create "private" variables:

```javascript
const Robot = (() => {
  let totalRobotsMade = 1

  return class Robot {
    constructor(name, weight, specialty) {
      this.name = name
      this.weight = weight
      this.specialty = specialty
      this.id = totalRobotsMade++
    }

    rechargeBatteries() {
      console.log(`${this.name} is recharging its batteries`)
    }
  }
})()
const robot1 = new Robot('sparko', 1000, 'making sparks')
const robot2 = new Robot('the iron giant', 9999999, 'being giant and made of iron')
const robot3 = new Robot('bender', 500, 'bending things')

console.log(robot1.id) //1
console.log(robot2.id) //2
console.log(robot3.id) //3

console.log(totalRobotsMade) //reference error: totalRobotsMade is not defined
```

- We're now able to wrap our `Robot` class in a closure in order to create private variables.

---

### External Resources
- [Factory Functions](https://en.wikipedia.org/wiki/Factory_(object-oriented_programming))
- [MDN Creating Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
- [MDN Article on Inheritance and the Prototype Chain](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
- [MDN Article on `Object.create`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create)
- [MDN Constructor Function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor)
- [MDN `new` Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new)
- [MDN Article on the `class` keyword](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
- [Master the JS Interview: Difference Between Prototypal and Class Inheritance](https://medium.com/javascript-scene/master-the-javascript-interview-what-s-the-difference-between-class-prototypal-inheritance-e4cd0a7562e9)
- [MDN Article on Object Prototypes](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object_prototypes)
- [MDN Article on IIFEs](https://developer.mozilla.org/en-US/docs/Glossary/IIFE)

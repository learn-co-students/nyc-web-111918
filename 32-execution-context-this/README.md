# This in JavaScript

![](https://media.giphy.com/media/3o7buirYcmV5nSwIRW/giphy.gif)

## Objectives

- Answer Dan Abramov's [question](https://twitter.com/dan_abramov/status/790858537513656320)
- Leverage Ruby's `self` to frame our JS `this` conversation (will get us 40% of the way)
- Recognize and value the differences
- Understand how we might be able to leverage `this` in JavaScript
- When is the value of `this` set? When is it **NOT** set?

---

### Review of `self` in Ruby

- There are _some_ similarities between `this` in JavaScript and `self` in Ruby. Looking at the similarities will get us _closer_ to understanding JavaScript's `this`. **Please do not think of them as being the same thing, however**.

```ruby
class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def self.say_something
    puts "I am a class method defined on the #{self} class."
  end
end

Person.say_something # => self will be Person class
# self in ruby is the receiver of a method

andy = Person.new('andy')
andy.name # => self will be the instance
# andy (instance) is receiving the method call
```

- `self` in Ruby will always be the receiver of a method call; whatever appears to the left of the `.`

---

### `self` is NOT `this`

- The `this` keyword in JavaScript, much like the English word "this", is context dependent. If I'm eating a bowl of soup and say, "I don't like this", "this" will refer to the soup I'm eating. If I'm taking the L train and say "I hate this", "this" will refer to the L. "This" is determined by the context in which it is used (at least in English).

- `this` in JavaScript works much in the same way, but there are several _specific rules_ that determine the context that `this` points to.

---

![](https://media.giphy.com/media/l46CbZ7KWEhN1oci4/giphy.gif)

---

### The 4 JS environment rules that govern `this`

1.  `this` within a constructor function called with the keyword `new` in front will point to the newly created object:

```javascript
function Person(name, favColor) {
  this.name = name
  this.favColor = favColor
}

const andy = new Person('andy', 'red')
andy //Person { name: 'andy', favColor: 'red' }
typeof andy // "object"
```

  - Note that **we cannot use the `new` keyword for arrow functions**.
  - Read this [MDN Article on the `new` operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new) if you need a refresher on how `new` works.

---

2. `this` within a function called with `apply/call/bind` will be the object passed as the first parameter:

```javascript
const personOne = { name: 'andy' }
const personTwo = { name: 'jon' }
const personThree = { name: 'garry' }

function sayName(location, time) {
  return `${this.name} says hello from ${location} at ${time}!`
}

// call will invoke AND bind the function; args to the function must be comma separated

console.log(sayName.call(personOne, 'Morocco', '3:00PM'))
// andy says hello from Morocco at 3:00PM!

// apply will invoke AND bind the function; args to the function must be in an array
console.log(sayName.apply(personTwo, ['New York', '5:00PM']))
// jon says hello from New York at 5:00PM!

// bind will set the value of this but DOES NOT INVOKE THE FUNCTION
const boundPersonThree = sayName.bind(personThree)
console.log(boundPersonThree('Los Angeles', '1:00PM'))
//garry says hello from Los Angeles at 1:00PM!

console.log(sayName())
//browser window says hello from undefined at undefined!
```

---

3.  `this` within a `function` called within a particular context (i.e. `Object.method()`) will be the context/object (**assuming that function was declared with the `function` keyword**):

```javascript
  const dog = {
    name: 'winfield',
    whatIsThis: function() {
      return this
    }
  }

dog.whatIsThis() //dog
```

---

4.  `this` for a simple function call `fn()` will be the window object (browser) or the global object (Node). If we are in [strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode) `this` will be `undefined`. (**There are different rules for arrow functions that will be discussed later**)

```javascript
function sayThis() {
  return this
}
sayThis() //window
```

---


- Arrow functions will maintain their enclosing execution context when evaluating `this`. In other words, `this` will be **whatever it was in the functions enclosing execution environment**. `this` in arrow functions will be resolved at the point of execution.

- Unlike functions declared with the `function` keyword, arrow functions are much more predictable because arrow functions do not create their own `this` during execution. Instead, they 'absorb' or 'remember' whatever `this` was in their enclosing environment.

- "An arrow function does not have its own `this`; the `this` value of the enclosing _lexical context_ is used i.e. Arrow functions follow the normal variable lookup rules. So while searching for `this` which is not present in current scope they end up finding `this` from its enclosing scope" - [MDN Article on Arrow Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)

```javascript
const thisArrow = {
  sayThis: () => {
    return this
  }
}

thisArrow.sayThis() //window

// remember, no block {} means an implicit return
const sampleArrow = () => this
sampleArrow() //window

```

- Please note that we cannot, and should not, use `bind`, `call`, and `apply` on an arrow function. The purpose of these functions is to **fix** the value of `this` to a particular object. Arrow functions will already have `this` fixed to their enclosing lexical scope.

- This makes arrow functions unsuitable for methods defined on an object:

```javascript
const angryChef = {
  chefName: 'Chef Gordon Ramsay',
  cookFood: (foodItem) => {
    return `${this.chefName} is cooking ${foodItem}`
  }
}

angryChef.cookFood('toast') //undefined is cooking toast
```

---

- We can however leverage the lexical scoping of `this` if our object methods are higher order functions (return other functions):

```javascript
const dog = {
  name: 'winfield',
  favSnacks: ['cabbage', 'carrots', 'bones'],
  eatSnacks: function() {
    this.favSnacks.forEach(snack => {
      console.log(`${this.name} is eating ${snack}`)
    })
  }
}

dog.eatSnacks()
// winfield is eating cabbage
// winfield is eating carrots
// winfield is eating bones
```

![dog eating cabbage](https://media.giphy.com/media/WLbtNNR5TKJBS/giphy.gif)

---

## External Resources

- [Strict Mode in JS](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- [MDN `this` article](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this)
- [MDN `new` Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new)
- [MPJ JS This Keyword](https://www.youtube.com/watch?v=GhbhD1HR5vk)
- [MDN Arrow Function Article](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
- [MDN On Why Arrow Functions Help Us leverage `this`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions#No_separate_this)

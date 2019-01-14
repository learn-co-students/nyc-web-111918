# Introduction to Functional programming

## Objectives
- Understand functional programming principles
- Define pure functions
- Understand composition over inheritance
- Identify functions as objects. In particular:
  - Assign functions to variables
  - Pass functions as arguments to functions
  - Return functions inside functions
  - Write functions in both the traditional and arrow syntaxes

---

- Recall that JavaScript is a _multiparadigm_ language; we can solve problems using functional programming and/or object oriented programming principles.
  - The key difference between the two paradigms is that Object-Oriented programming focuses on **what our objects are**. Perhaps we have an `Animal` class and a `Dog` class that inherits from `Animal`. Our classes our concerned with shared functionality and data. For example, each _instance_ of a dog has its own name; all dogs know how to bark.
  - Functional programming on the other hand is primarily concerned with **the behavior of our code**––what should this app do, what is the functionality we need? Instead of creating classes with shared state and functionality, we might instead rely on a series of functions that can be _composed_ together to solve a particular problem. We've already seen this in ES6: `.map`, `.reduce`, `.filter`, `.forEach` for example. These ES6 functions do not know or care about the callback they will be passed as an argument:

```js
[1, 2, 3].forEach(function() {
  console.log('I WANT 2 EAT PANCAKES ALL DAY LONG')
})

// 'I WANT 2 EAT PANCAKES ALL DAY LONG' logged 3 times
```

---

### Functions As First Class Objects

- Functions are **first class objects in JavaScript:**
  - "A programming language is said to have First-class functions when **functions in that language are treated like _any other variable_.** For example, in such a language, a function can be passed as an argument to other functions, can be returned by another function and can be assigned as a value to a variable." - [MDN Article on First Class Functions](https://developer.mozilla.org/en-US/docs/Glossary/First-class_Function)
  - Functions can be assigned to variables:

```javascript
const eatDoughnut = function() {
  console.log('I love to eat doughnuts!')
}
```

- Functions can be passed to other functions as arguments:

```javascript
function isCallBackTrue(callbackFn) {
  if (callbackFn()) {
    return 'TRUE!'
  } else {
    return 'FALSE!'
  }
}
```

- Functions can also return other functions:

```javascript
const outerFn = function() {
  const innerVar = 'I am not a global variable'
  return function() {
    console.log(innerVar)
  }
}

outerFn() //returns a function definition

outerFn()() // 'I am not a global variable'
```

- Notice the `()()` in the example above. Invoking `outerFn` returns a function. In order to execute the return value of `outerFn` I have to use `()` again.

---

## Drawing Ruby Parallels: `Proc`

- In Ruby, I can define a block of code and pass it to another method:

```ruby
p = Proc.new { |var| puts var }

[1, 2, 3].each(&p)

# as opposed to:

[1, 2, 3].each { |num| puts num }
```

- A `Proc` however is **not** a method. Instead, it is a _block of code_ that I can reuse. JavaScript however, allows me to pass functions around as arguments:

```js
function logVar(variable) {
  console.log(variable)
}

[1, 2, 3].forEach(logVar)
```

- `logVar` is a **function** that I can pass to `forEach` as an argument.

---

### Arrow Functions

- Arrow functions were introduced by [ES6/ ES2015](https://developer.mozilla.org/en-US/docs/Web/JavaScript/New_in_JavaScript/ECMAScript_2015_support_in_Mozilla). They provide a new syntax for declaring functions.

- Instead of using the `function` keyword, [arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) can be declared with a different syntax:

```javascript
const arrowFn = () => {
  return 'I am an arrow function!'
}

arrowFn() //'I am an arrow function!'
```

- Notice that arrow functions expect a block `{}` to follow the `=>`
- If a block `{}` follows the `=>`, we will need to **explicitly return** from the function:

```javascript
const forgotToReturn = () => {
  'Whoops! Forgot to return'
}

forgotToReturn() //undefined
```

- However, if we omit the block `{}`, **and the body of the function contains a single expression** arrow functions will _implicitly return_:

```javascript
const implicitReturn = () => 'I am returned!'

implicitReturn() //'I am returned!'
```

- If the body of the function cannot be evaluated as a single expression, an implicit return will not work:

```javascript
const cannotReturn = () => (
  console.log('one expression')
  return 'another expression'
)
// Uncaught SyntaxError: Unexpected token return
```

- Multiline arrow functions require a block `{}`:

```javascript
const multiLineArrow = () => {
  console.log('one statement')
  return 'another expression'
}
```

---

### IIFE (Immediately Invoked Function Expressions):

- Functions in JavaScript can also be invoked as soon as they're defined. Note that I will not be able to reference my function:

```javascript
const iifeVal = (function myIIFE() {
  console.log('immediately invoked!')
  return 'hi'
})() //'immediately invoked!'

//myIIFE //Uncaught ReferenceError: myIIFE is not defined
```

---

### Functional Programming Principles

- "**Functional programming** (often abbreviated FP) is the process of building software by composing **pure functions**, avoiding **shared state**, **mutable data**, and **side-effects**. Functional programming is **declarative** rather than **imperative**, and application state flows through pure functions. Contrast with object oriented programming, where application state is usually shared and colocated with methods in objects." - [Master the JS Interview: What is Functional Programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)
   - Imperative programming has more to do with **how** to do things; a series of tasks/operations for the computer to perform. It is typically contrasted with declarative programming
   - Declarative programming has more to do with **what** a program needs to accomplish without specifying how a task should be completed

- `map`, for instance will transform an array based on a callback, but we do not need to focus on **how** that task is accomplished:

```js
['winfield', 'charlotte'].map((name) => name.toUpperCase())
```

---

#### Pure Functions

- **Pure Functions** should:
  - Return a value
  - Have no side effects
  - Given the same input, return the same output:

```javascript
const instructorNames = [
  'andrew',
  'evans',
  'mike',
  'jason',
  'jon',
  'garry',
  'vicky',
  'elbin',
  'dick',
  'laura',
  'brooke'
]

const capitalizeNames = (namesArray) => {
  const capitalized = []

  for (let i = 0; i < namesArray.length; i++) {
    capitalized.push(namesArray[i].toUpperCase())
  }

  return capitalized
}
```

- The function above is pure because it returns a **copy** instead of mutating the argument passed in. Given the same input, it will always return the same output.
  - We can also use the ES6 [`map` function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map), which is also a pure function:

```javascript
const instructorNames = [
  'andrew',
  'evans',
  'mike',
  'jason',
  'jon',
  'garry',
  'vicky',
  'elbin',
  'dick',
  'laura',
  'brooke'
]

// remember arrow fn without curlies will implicitly return

instructorNames.map((name) => name.toUpperCase())
// the original array remains unchanged
```

- Think of pure functions like black boxes that perform the same predictable operation whenever they are used

- We can write a pure array filter function:

```js
const cereals = ['frosted flakes', 'lucky charms', 'reeces puffs']

function pureFilter(arr, callback) {
  const filteredResults = []
  for (let i = 0; i < arr.length; i++) {
    if (callback(arr[i])) filteredResults.push(arr[i])
  }
  return filteredResults
}

pureFilter(cereals, function(cereal) {
  return cereal === 'lucky charms'
}) //['lucky charms']
```

---

#### Avoiding Shared State

- "**Shared state** is any variable, object, or memory space that exists in a shared scope, or as the property of an object being passed between scopes. A shared scope can include global scope or closure scopes. Often, in object oriented programming, objects are shared between scopes by adding properties to other objects." - [Master the JS Interview: What is Functional Programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)

- In essence, this means we should rely on **immutable data structures** and pure functions. This is very different from Object Oriented programming which relies heavily on shared state. Think of `attr_accessors` in Ruby. The purpose of these methods is to edit and read the _same piece of data_:

```ruby
class Person

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
```
---

#### Mutable Data

- "An immutable object is an object that can’t be modified after it’s created. Conversely, a mutable object is any object which can be modified after it’s created." - [Master the JS Interview: What is Functional Programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)

```javascript
const nums = [1, 2, 3]

const destructivelyMutate = (numArr) => {
  for (let i = 0; i < numArr.length; i++) {
    numArr[i]++
  }
  return numArr
}
```

- The above example violates this principle. We should instead return a _copy_ of the transformed array using `.map`:

```javascript

const nums = [1, 2, 3]

nums.map((n) => n++) // [2, 3, 4]

nums //[1, 2, 3]
```

- `Array.prototype.map` will return a _copy_ of the array on which it is called, thereby avoiding mutating state.

- Alternatively, we can use [`Object.freeze`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze) to avoid mutating state:

```js
const frozenPizza = Object.freeze({  restaurant: 'Piza Hut' })
// will now throw an error, but it does not change the object
frozenPizza.restaurant = 'Sbarros Authentic New York Pizza™'


console.log(frozenPizza) //{  restaurant: 'Piza Hut' }
```

---

### Side Effects

- "A side effect is any application state change that is observable outside the called function other than its return value. Side effects include:

  - Modifying any external variable or object property (e.g., a global variable, or a variable in the parent function scope chain)
  - Logging to the console
  - Writing to the screen
  - Writing to a file
  - Writing to the network
  - Triggering any external process
  - Calling any other functions with side-effects
  - Side effects are mostly avoided in functional programming, which makes the effects of a program much easier to understand, and much easier to test." - [Master the JS Interview: What is Functional Programming](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)

---

### Composition

- Combine two or more functions to perform some computation:

```js
f(g(x))
```

- Combine two or more functions to produce a new function:
```js
f(g)(x) === f(g(x))
```

```js
// forEach passing function definition
let arr = [1, 2, 3, 4, 5];
arr.forEach(num => console.log(num);)
// => 1
// => 2
// => 3
// => 4
// => 5

// forEach passing function by reference
arr.forEach(console.log);
// => 1 0 (5) [1, 2, 3, 4, 5]
// => 2 1 (5) [1, 2, 3, 4, 5]
// => 3 2 (5) [1, 2, 3, 4, 5]
// => 4 3 (5) [1, 2, 3, 4, 5]
// => 5 4 (5) [1, 2, 3, 4, 5]

// map passing function definition
let numsTimesThree = arr.map(num => num * 3);
numsTimesThree; // => [3, 6, 9, 12, 15]

// filter passing function definition
let numsLessThanTen = numsTimesThree.filter(num => num < 10);
numsLessThanTen; // => [3, 6, 9]

// reduce passing function definition
let sum = numsLessThanTen.reduce((acc, val, ind) => acc + val);
sum; // => 18

// All of the above chained together
arr.map(num => num * 3)
.filter(num => num < 10)
.reduce((acc, val, ind) => acc + val)
// => 18
```
- [Article on composition in JavaScript](http://blog.ricardofilipe.com/post/javascript-composition-for-dummies)

## [Functional Programming Exercises](https://gist.github.com/alexgriff/97cd3cc946f3047828c1196afd66ac61)

---

### External Resources

- [MDN Article on First Class Functions](https://developer.mozilla.org/en-US/docs/Glossary/First-class_Function)
- [MDN Reference on New JS Featured Introduced by ES6](https://developer.mozilla.org/en-US/docs/Web/JavaScript/New_in_JavaScript/ECMAScript_2015_support_in_Mozilla)
- [MDN Article on Arrow Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
- [Master the JS Interview: What is Functional Programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)
- [`Object.freeze`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze)
- [Array.prototype.map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map)
- [MPJ Video Series on Functional Programming](https://www.youtube.com/playlist?list=PL0zVEGEvSaeEd9hlmCXrk5yUyqUag-n84)
- [A Gentle Introduction to Composition in JavaScript](http://blog.ricardofilipe.com/post/javascript-composition-for-dummies)

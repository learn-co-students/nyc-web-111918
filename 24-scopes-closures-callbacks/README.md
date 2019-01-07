# Scope and closures

![](https://media.giphy.com/media/sOGgevbtBDYKQ/giphy.gif)

## Objectives

### Variables scope

- Variable scope in Ruby:

```ruby
name = 'andrew'

def say_name
  puts name
end

say_name # what will happen 🤔

#=> undefined local variable or method `name` for main:Object (NameError)
```

- However, if we make the variable global, or pass it in as an argument the code above will work:

```ruby
# WORKS!
$name = 'andrew' #global vars in ruby are declared w/ $

def say_name
  puts $name
end

say_name # what will happen 🤔
#=> 'andrew'
```

```ruby
# WORKS!
name = 'andrew'

def say_name(name_arg)
  puts name_arg
end

say_name(name) # what will happen 🤔
#=> 'andrew'
```

---
- Variable Scope in JavaScript: Lexical scope means that scope is defined by author-time decisions of where functions are declared. [From You Don't Know JS](https://github.com/getify/You-Dont-Know-JS)

- From the [MDN Article on Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures): "The word 'lexical' refers to the fact that lexical scoping uses the location where a variable is declared within the source code to determine where that variable is available. Nested functions have access to variables declared in their outer scope."

- In other words, scope in JavaScript is determined by _where_ variables are defined in our code. There can also be a variety of scopes in our code, ranging from very local to global.

- Each scope is like its own 'bucket' in JavaScript––our variables live within a space and can reach out to an outer scope. Think of scope as moving in one direction––functions can reach "up" to variables in their outer scope, but not the other way around:

```javascript
var name = 'jon'

function sayName() {
  console.log(name)
}

sayName() // 'jon'
```

- Within the function `sayName`, there is no variable called `name`. However, this variable is declared _outside_ the function. `sayName` will still have access to variables outside its own scope. We can think of scope as being one way; a function can reach outside it's local scope, but not the other way around:

```javascript
function sayName() {
  var name = 'garry'
  console.log(name)
}

sayName() // 'garry'

console.log(name) // name is not defined; name is scoped within the sayName fn
```

- Furthermore, JavaScript will look at (resolve) the most local scope before looking up:

```javascript
var name = 'andrew' //global var

function sayName() {
  var name = 'garry' // local to sayName
  console.log(name)
}

sayName() // 'garry'
```

- Because the `name` variable is declared within `sayName`, the output of the function will be 'garry'.

---

### JS Scopes: `Global`, `Function`, `Block`:

- There are three main types of scopes in JS:
  - `Global`: a variable declared in the global scope; outside a function, outside a block, outside an object. These variables are _globally accessible_ meaning they can be read _anywhere_ in your code.

```javascript
var name = 'my global name'
```

- `Function` scope: variables are confined to the functions in which they were declared. These variables are _not accessible_ in the global scope. They can only be accessed within the function or any scope that is 'lower' on the scope chain, or more local (more on that later)

```javascript
function fnScope() {
  var name = 'a local name'
}
```

- `Block` scope: much like a function, variables defined within a block are only accessible within that block or in more local scopes [unless you use the `var` keyword](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/block):

```javascript
{
  let blockVar = 'local to this block'
}
console.log(blockVar) //Uncaught ReferenceError: blockVar is not defined

// another example:

const pigs = { canFly: true }
if (pigs.canFly) {
  const hogName = 'tiny'
}

console.log(hogName) //Uncaught ReferenceError: hogName is not defined

```

  - Important side note about the code above: depending on the context, `{}` (curlyboys™️) can be a function body, block, or an object literal `{ pizza: 'hut', key: 'value' }`

  ---

### JS Variables–– `var`, `let`, `const`

- In JavaScript, there are three keywords we can use to declare variables: `var`, `let`, and `const`. (We can also omit the keyword, which will make a variable **global**):

```javascript
function forgotVar() {
  donutFlavor = 'glazed' //without var/let/const, donutFlavor will be GLOBAL
}

console.log(donutFlavor) // glazed
```

- Variables declared with `var` can be reassigned and **declared** as many times as we'd like (they will also be hoisted, but we'll discuss that later):

```javascript
var donutFlavor = 'jelly' //declares var

donutFlavor = 'sprinkles' //reassigns var

var donutFlavor = 'chocolate' //redeclares var

console.log(donutFlavor) // 'chocolate'

 // var is  NOT BLOCK SCOPED
```

- Variables declared with `let` can be **reassigned** as many times as we'd like but cannot be **redeclared**:

```javascript
let animal = 'dog' //declare animal variable

animal = 'ferret' //reassign animal to another value

let animal = 'giraffe' //attempt to redeclare animal
// Uncaught SyntaxError: Identifier 'animal' has already been declared
```

- Variables declared with `const` can neither be reassigned nor redeclared, they are **constants**:

```javascript
const person = 'carl' //declare and assign a new variable

person = 'Carl' //Uncaught TypeError: Assignment to constant variable.

const person = 'CARL' //Uncaught SyntaxError: Identifier 'carl' has already been declared

```

- As a rule of thumb, if you're writing modern JavaScript ([ES6](https://developer.mozilla.org/en-US/docs/Web/JavaScript/New_in_JavaScript/ECMAScript_2015_support_in_Mozilla)), I would avoid using `var` because it can be redeclared and reassigned at any time, which can cause some unexpected and confusing bugs. Stick to `let` and `const`.

### Hoisting

- "Because variable declarations (and declarations in general) are processed before any code is executed, declaring a variable anywhere in the code is equivalent to declaring it at the top. This also means that a variable can appear to be used before it's declared. This behavior is called 'hoisting', as it appears that the variable declaration is moved to the top of the function or global code." - [MDN Article on `var`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var#var_hoisting)
  - While JavaScript is being compiled, functions declared with the `function` keyword and variables declared with the `var` keyword are "hoisted" to the top of whatever scope they are in. **Declarations are not phyisically moved to the top of whatever scope they're in**. Instead, they are processed first (allocated memory) _then_ assigned a value.

```javascript
bark() // 'woof'

function bark() {
  console.log('woof')
}
```

- Notice that we are able to invoke the `bark` function before it is declared. This is because javascript will allocate memory to this function prior to executing the code in the file. Contrast this with ruby:

```ruby
not_hoisted #attempt to invoke the method before it is declared

def not_hoisted
  puts "Will this method execute 🤔"
end


#=>  undefined local variable or method `not_hoisted` for main:Object (NameError)
```

- Let's see how javascript handles variable hoisting:

```javascript
console.log(dog)

var dog = 'penny' //undefined

```

- From the [MDN Article on Hosting](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting): JavaScript only hoists declarations, not initializations. If a variable is declared and initialized after using it, the value will be undefined.

- We can _**imagine**_ that javascript is 'hoisting' or 'lifting' our variables up, even though this is not what is technically happening:

```javascript
var dog; //declare dog but do not assign it (value will be undefined)

console.log(dog) // undefined

dog = 'penny' //assign a value to dog
```

- While it may be helpful to imagine that the above is happening, **javascript does not actually move variables around in your code**.

- From the [MDN Article on Hoisting](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting): "Conceptually, for example, a strict definition of hoisting suggests that variable and function declarations are physically moved to the top of your code, but this is not in fact what happens. Instead, the variable and function declarations are put into memory during the compile phase, but stay exactly where you typed them in your code."

- However, if you declare the variable after it is used, but initialize it beforehand, it will return the value:

```javascript
num = 6
console.log(num) // 6
var num
```

- Notice that we are **assigning** the variable _then_ using it. By the time our `console.log` is executed, `num` will have been assigned.

- This is no the case for variables declared with `let` and `const`, however:

```javascript
console.log(bears)//Uncaught ReferenceError: bears is not defined

let bears = 'big and scary and dangerous'
```

```javascript
console.log(donut) //Uncaught ReferenceError: donut is not defined

const donut = 'maple bacon'
```

- Variable scope rules are _mostly_ unchanged for `let` and `const`:

```javascript
let fruit = 'banana'
function snack() {
  console.log(fruit)
}

snack() //banana
```

```javascript
let pizza = 'outer pizza is global pizza'
function eatPizza() {
  let pizza = 'inner pizza is pizza hut stuffed crust™️'
  console.log(pizza)
}

eatPizza() //inner pizza is pizza hut stuffed crust™️
```

### First Class Functions and Closures

- From the [MDN Article on First Class Functions](https://developer.mozilla.org/en-US/docs/Glossary/First-class_Function): "A programming language is said to have First-class functions when functions in that language are treated like any other variable. For example, in such a language, a function can be passed as an argument to other functions, can be returned by another function and can be assigned as a value to a variable."

- Assigning functions to variables:

```javascript
var eatFood = function(food) {
  console.log(`Eating ${food}`)
}

eatFood('pizza') //Eating pizza
eatFood('donuts') //Eating donuts
eatFood('salad') //Eating salad
```

- Also note that functions declared with the `function` keyword and/or with `var` can be reassigned and redeclared at any time:

```javascript
function sayHi() {
  console.log('Hello!!!!')
}

function sayHi() {
  console.log('Goodbye!')
}

var sayHi = function() {
  console.log('Something totally unexpected is being returned by this function')
}

sayHi() //Something totally unexpected is being returned by this function
```

- Be cautious of this as you may accidentally reassign a function. Instead, we can rely on the `const` keyword to declare functions:

```javascript
const worksAsExpected = function() {
  console.log('An expected response!')
}

worksAsExpected() //'An expected response!'

function worksAsExpected() {
  console.log('UH OH SPAGHETTI-O')
} //Uncaught SyntaxError: Identifier 'worksAsExpected' has already been declared

const worksAsExpected = function() {
  console.log('ALSO NOT MY ORIGINAL FUNCTION')
} //Uncaught SyntaxError: Identifier 'worksAsExpected' has already been declared

worksAsExpected = function() {
  console.log('lol whoops')
} //Uncaught TypeError: Assignment to constant variable.
```

- Remember that functions are _just like any other object_ in JavaScript. I can assign a `String`, `Object`, `Array`, `Number`, etc to a variable. I can do the same thing with a `Function`

---

- Functions can also be passed to other functions as arguments (this is because functions are first class objects). These are referred to as **callbacks**

- From the [MDN Article on Callbacks](https://developer.mozilla.org/en-US/docs/Glossary/Callback_function): "A callback function is a function passed into another function as an argument, which is then invoked inside the outer function to complete some kind of routine or action."

```javascript
function returnThinker() {
  return '¿🤔?'
}

function logCallBack(callbackFn) {
  console.log(callbackFn())
}


logCallBack(returnThinker) //'¿🤔?'
```

- `logCallBack` is a function that is expecting **another function as an argument**. When `logCallBack` is invoked, it will simply `console.log` the return value of the callback passed in as an argument, which happens to be `returnThinker` in the example above.


![🤔](https://media.giphy.com/media/3o7buirYcmV5nSwIRW/giphy.gif)

---

#### Functions that _return other functions_ 🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔

- "In mathematics and computer science, a higher-order function is a function that does at least one of the following:
  - takes one or more functions as arguments (i.e. procedural parameters),
  - returns a function as its result." - [Higher Order Functions](https://en.wikipedia.org/wiki/Higher-order_function)


```javascript
function outerFn() {
  return function innerFn() {
    console.log('haha i am an inner function lol')
  }
}
outerFn()() //haha i am an inner function lol
```

- Notice that we have to invoke **twice**. Look at the code above. `outerFn` returns a function. Invoking `outerFn` will return a reference to a function, `innerFn`. In order to call `innerFn`, we need to invoke the return value of `outerFn`, hence the `outerFn()()` syntax

![](https://media.giphy.com/media/xT0xeJpnrWC4XWblEk/giphy.gif)

- Notice that the inner function has no name. This is referred to as an _anonymous function_ in JavaScript.


---

- The same way that a function can return a string, object, array, or integer, a function can also **_return another function_**. Again, this is because functions are first class objects in JavaScript just like _any other object_.

- According to the [MDN Article on Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures), a _closure_ is the combination of a function and the lexical environment within which that function was declared:

```javascript
function closure() {
  var cheese = 'cheddar'

  return function() {
    return `I like to eat ${cheese}`
  }
}

closure() //function

closure()() // "I like to eat cheddar"

console.log(cheese) //Uncaught ReferenceError: cheese is not defined
```

- Notice that the inner function above has access to the local variable `cheese`, which is not accessible outside the lexical scope of the `closure` function.

- From [The MDN Article on Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures): "The word 'lexical' refers to the fact that lexical scoping uses the location where a variable is declared within the source code to determine where that variable is available. Nested functions have access to variables declared in their outer scope."

- From [You Don't Know JS](https://github.com/getify/You-Dont-Know-JS/blob/31e1d4ff600d88cc2ce243903ab8a3a9d15cce15/scope%20%26%20closures/ch5.md), "a closure is when a function is able to remember and access its lexical scope even when that function is executing outside its lexical scope."

![x to the z xzibit on callbacks](https://kevhuang.com/content/images/2015/07/xzibit-loves-callbacks.png)

---

- This is one of the most powerful features of javascript and one of the reasons why the language is so amazing. We can write a function that can create _other functions_:

```javascript
function multiplyByN(outerNum) {
  return function(n) {
    return outerNum * n
  }
}

const multiplyByTen = multiplyByN(10)
const multiplyByFive = multiplyByN(5)
const multiplyByTwo = multiplyByN(2)

multiplyByTen(5) // 50
multiplyByTen(10) // 100

multiplyByFive(5) //25
multiplyByFive(10) //50

multiplyByTwo(2) //4
multiplyByTwo(10) //20
```

- We've created one function to rule them all. `multiplyByN` allows us to construct other multiplying functions.

- Remember that “a closure is when a function is able to remember and access its lexical scope even when that function is executing outside its lexical scope.”
  - In other words `multiplyByTwo` is **always going to 'remember' that `outerNum` is 2**



![science](https://media.giphy.com/media/fqIBaMWI7m7O8/giphy.gif)


---

### External Resources

- [MDN Article on Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)
- [MDN Article on Block Scope](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/block)
- [MDN Article on Hoisting](https://developer.mozilla.org/en-US/docs/Glossary/Hoisting)
- [MDN Article on `var`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var)
- [MDN Article on First Class Functions](https://developer.mozilla.org/en-US/docs/Glossary/First-class_Function)
- [MDN Article on Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)
- [MPJ Video on Closures](https://www.youtube.com/watch?v=CQqwU2Ixu-U)
- [You Don't Know JS](https://github.com/getify/You-Dont-Know-JS)
- [You Don't Know JS Scope and Closures](https://github.com/getify/You-Dont-Know-JS/tree/31e1d4ff600d88cc2ce243903ab8a3a9d15cce15/scope%20%26%20closures)
- [Temporal Dead Zone](https://wesbos.com/temporal-dead-zone/)
- [Air BnB JS StyleGuide](https://github.com/airbnb/javascript)
- [MDN Article on ES2015](https://developer.mozilla.org/en-US/docs/Web/JavaScript/New_in_JavaScript/ECMAScript_2015_support_in_Mozilla)
- [Stack Overflow Post on Chrome Debugger Variables Not Being in Scope](https://stackoverflow.com/questions/28388530/why-does-chrome-debugger-think-closed-local-variable-is-undefined)
- [Higher Order Functions](https://en.wikipedia.org/wiki/Higher-order_function)


![curly bois](https://i.imgur.com/ZwfLpVW.jpg)

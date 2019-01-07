# Introduction to JavaScript

### History of JavaScript
![Brendan Eich](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Brendan_Eich_Mozilla_Foundation_official_photo.jpg/1280px-Brendan_Eich_Mozilla_Foundation_official_photo.jpg)
* Early Days
  * Created by Brandon Eich at Netscape in 10 days in 1995
  * Was not a highly respected programming language for about 10 years
  * Based off of functional languages with some             object-oriented patterns; is a multi-paradigm language
  * Applications like Google Maps and Gmail were where JavaScript shone again
* Standards
  * The standard for JavaScript implementations is called ECMAScript
    * Given that there are several **competing** JavaScript engines, the [European Computer Manufacturers Association (ECMA)](https://en.wikipedia.org/wiki/Ecma_International) is responsible for standardizing JavaScript, referred to as [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript)
  * The standard is updated yearly and the standard for that year is called ECMAScript 20xx (or ES 20xx); ES2015 or ES6.
  * [Browser Wars](https://en.wikipedia.org/wiki/Browser_wars) still leave us with legacy JavaScript implementations (and weirdness)
  * We can use transpiling to write JavaScript according to the standard we want and convert it to code that can be used for the majority of JavaScript applications (more on this in mod4)

![Netscape Navigator](https://images.mentalfloss.com/sites/default/files/styles/mf_image_16x9/public/netscape-hero.jpg?itok=AdVWGuMc&resize=1100x1100)

### Review Request-Response Cycle

![HTTP request response cycle from : https://www.oreilly.com/library/view/using-google-app/9780596802462/ch01.html](https://www.oreilly.com/library/view/using-google-app/9780596802462/httpatomoreillycomsourceoreillyimages295368.png)

* Request-Response lifecycle
  * Some code makes a request to a server
  * We get a response back with data in binary, text, HTML, or JSON
  * We use that data in our application
* In the browser
  * A user enters an address in the address bar (or clicks a link)
  * A request is made to a server, which typically serves HTML
  * The user usually sees a loading indicator (like a spinning circle) near the address bar
  * Included in that HTML are links to images, fonts, stylesheets, and scripts
  * Each one of those links means another request by the browser but without refreshing the page
  * When all the external links have loaded, the page itself is finished loading
* Loaded JavaScript
  * JavaScript can be written directly in HTML through a `script` tag
  * It can also be loaded externally through a `script` tag with a `src` attribute
  * When the browser sees JavaScript, it attempts to run it immediately
* JavaScript implementations
  * Each browser has its own [JavaScript engine](http://en.wikipedia.org/wiki/JavaScript_engine) or implementation
  * The [Document Object Model](https://en.wikipedia.org/wiki/Document_Object_Model) is the interface between the loaded HTML and the JavaScript code we write (more on this later in the mod)
  * Most browsers are converging on agreeing on web standards, but browsers need ability to add proprietary features to CSS, JS, and DOM (I'm looking at you Internet Explorer 😡)

### JavaScript Data Types Overview
There are seven data types in JavaScript:
  1. Symbol
  2. Undefined
  3. Null
  4. Boolean
  5. Number
  6. String
  7. Object  

Many have constructor functions (like classes in Ruby) and many use the literal values. Different data types are pass by reference and pass by value.

### Constructors versus Literals
```js
let anotherNum = 1
let someNum = Number(1)
let someNewNum = new Number(1)
someNewNum === anotherNum // => false
someNum === anotherNum // => true
```

### Primitives
Pass-by-value - when you declare a variable and pass it to a function, a *copy* of the variable is passed, not the original object in memory.

* String
  * `'I'm a string in single quotes'`
  * `"I'm a string in double quotes"`
  * `` `I'm a string template with backticks and interpolation ${'Yay!'}` ``

* Number
  * Negative `-1`
  * Exponent `-1e2`
  * Float `-1.1e2`
  * NaN `'hello' * 3`
  * parseInt / parseFloat

      ```js
      parseInt('123')             // => 123
      parseInt('123.456')         // => 123
      parseFloat('123.456')       // => 123.456
      parseInt('one two three')   // => NaN
      ```

* Boolean
  * Falsey values
    * False: `false`
    * Zero: `0`
    * Empty string: `""`
    * Null: `null`
    * Undefined: `undefined`
    * Not a number: `NaN`
  * Truthy values (everything else)

* Undefined
  * A variable that is declared but not assigned a value

    ```js
    let someVar
    console.log(someVar) // => undefined
    ```

* Null
  * An assignment value that represents nothing, like `nil` in Ruby

    ```js
    let someVar = null
    console.log(someVar) // => null
    ```

* Symbol
  * Only used as somewhat private, unique identifiers for object properties, i.e. object keys. (Don't worry much about these.)

    ```js
    let sym = Symbol()
    console.log(sym) // => Symbol()
    ```

### Non-Primitives
**Pass-by-reference**: when you declare a variable and pass it to a function, the object in memory itself is passed, not a copy of the object.

* Object
  * A loaded word in JavaScript. Basically everything that's not a primitive is an object. Objects describe key-value pairs, like hashes in Ruby. They also describe arrays, functions, prototypes, and other complex data types.

  * Object literals
    * Also known as plain-old JavaScript objects (POJOs), these are really simple key-value pairs. The keys are strings (or Symbols), and the values are any data type, including other objects.

      ```js
      const fred = { name: 'Fred', age: 26 }
      const jone = { name: 'Jone' }
      const school = {
        students: [fred, jone]
      }
      ```
    * You access properties of objects in one of two ways: dot-notation or bracket-notation. With the brackets, the value that is passed in needs to evaluate to a String or a Symbol.

      ```js
      const nameKey = 'name'
      console.log(`${fred.name} is ${fred.age}`) // => "Fred is 26"
      console.log(`My friend's name is ${jone[nameKey]}`) // => "My friend's name is Jone"
      ```

* Function
  * Definition VS invocation. **THIS IS SUPER IMPORTANT**

```js
function iLikePancakes() {
  console.log('Pancake technology is truly incredible. What a time to be alive!')
}

iLikePancakes

// VS
iLikePancakes()
```

  * Another point to note is that _functions always return undefined unless explicitly returning otherwise_. **PLEASE BURN THIS INTO YOUR MEMORY**. There is only one case of implicit returns in JavaScript and that's with one-line arrow functions without braces (more on that later).

  * Functions are POJO's that can be executed/called! This means that you can add properties to functions just like you do POJO's:

```js
function functionsAreObjects() {
  return 'nice'
}

functionsAreObjects.name = 'a function object'
```

  * Function expression
    * This is like a function that can't live without being assigned to a variable, or a function that is defined right when it's used (as in as an argument to another function).

      ```js
      let arr = [1,2,3]
      let doSomething = function() { return true }
      let doSomethingElse = () => false
      arr.map(function namedExpression(n) { return n + 1 })
      ```

  * Function declaration
    * This is simply a variable assignment and a function expression mashed into one. It ALWAYS begins with the `function` keyword and needs a name.

      ```js
      function doSomething() {
        return true
      }

      console.log(doSomething) // f doSomething()
      ```

* Array
    * Arrays in JavaScript are similar to arrays in Ruby, but with different methods. Ruby has a robust enumerable library that can work on arrays and POJOs alike, but JavaScript is more DIY, so there are just enough enumerables to build what you need. Arrays can contain any data type.

    ```js
    let arr = [1, 2, 3, "a", "b", "c", { hello: 'world' }]
    arr.forEach(function(el) { console.log(el) }) // => prints 1, 2, 3, "a", "b", "c", { hello: 'world' }
    ```

### Type Checking
The original way of checking types, [`typeof`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof), is a little unreliable when looking at some objects like arrays, which return "object". This works best for primitive values. For example:

```js
parseInt('HOTDOG') //NaN

typeof parseInt('HOTDOG') //'number'

typeof NaN //'number'
```

![wut](https://media.giphy.com/media/IQ47VvDzlzx9S/giphy.gif)


### Doing Labs
Running the `learn` command in Terminal should open a new browser window where the tests will run. When a file is updated in the directory where `learn` was executed, the web page with the tests should update automatically. If you need to debug your code, figure out which test is failing and put a `debugger` there. This works like `binding.pry` in Ruby.

**Keep in mind that in order for `debugger` to be triggered in your browser, you must have your developer console open.**

If you need quicker and more simple debugging, `console.log` or `console.dir` is the way to go.

---

## Documentation

- **PLEASE ALSO BURN THIS INTO YOUR MEMORY**. Always start with [MDN](https://developer.mozilla.org/en-US/) when looking at JS documentation. W3 Schools is great for HTML and CSS, **NOT SO MUCH FOR JAVASCRIPT**.

(all hail Mozilla)

- **INDENTATION AND PROPER STYLE ARE ALSO SUPER IMPORTANT MOVING FORWARD**. Airbnb has an amazing [JavaScript Style Guide](https://github.com/airbnb/javascript) if you're unsure about how to format your JS code. Trust me, learn to indent properly now before you end up in a curly bracket hellscape.

![who would win, curly boi](https://i.imgur.com/ZwfLpVW.jpg)

---

![history of JS infographic](https://visual.ly/node/image/702641)

---

## External Resources
- [ECMA](https://en.wikipedia.org/wiki/Ecma_International)
- [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript)
- [Mozilla Developer Network](https://developer.mozilla.org/en-US/)
- [HTTP Request Response Cycle](https://www.oreilly.com/library/view/using-google-app/9780596802462/ch01.html)
- [Browser Wars](https://en.wikipedia.org/wiki/Browser_wars)
- [Brendan Eich](https://en.wikipedia.org/wiki/Brendan_Eich)
- [Netscape](https://en.wikipedia.org/wiki/Netscape)
- [How to use console.log and others](https://console.spec.whatwg.org/#dir)
- [Javascript Equality Table](https://dorey.github.io/JavaScript-Equality-Table/)

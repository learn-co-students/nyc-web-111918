# Helpful ES6 Syntax to Know for React and Beyond ⚛️

![](https://media.giphy.com/media/13twUEuUnCrEju/giphy.gif)

---

## The Following are Used heavily in Mod 4 for React (and are important to know if you're writing modern JavaScript):

#### destructuring

```js
const spaceship = {
  pilot: 'elon musk',
  guidance: 'marc zucc',
  chef: 'gordon ramsay'
}
/* from the object spaceship,
please pull out the VALUES stored at
pilot and chef */
const { pilot, chef } = spaceship

console.log(pilot) // 'elon musk'
console.log(chef) // 'gordon ramsay'

class Person {
  // props -> { name: 'winfield', favColor: 'red' }
  constructor(props) {
    this.name = props.name
    this.favColor = props.favColor
  }
}

//VS

class Person {
  // props -> { name: 'winfield', favColor: 'red' }
  constructor({ name, favColor }) {
    this.name = name
    this.favColor = favColor
  }
}

```

---

#### key value assignment shortcut

```javascript
const pizza = 'pepperoni'
const restaurant = 'sbarros authentic New York Pizza™️'

const pizzaObj = {
  pizza: pizza,
  restaurant: restaurant
}

// name of key is the same as the name of the variable we wish to assign to that key
const pizzaObj2 = { pizza, restaurant }
```

---

#### ES6 Spread Operator

- `slice()` or `Object.assign()`
- removing elements from an array

```js
const mud = {
  blood: 'it iz spooky season rn'
}

const mudCopy = { ...mud, parents: 'expectations' }
// first arg is target obj; the thing i want to add properties to
const mudCopy2 = Object.assign({}, mudCopy)
// take all the key/value pairs from mudCopy and merge them into this new TARGET OBJ, which happens to be blank

```

```js
const names = ['evans', 'murd3rf4ce']
const noEvans = names.slice(1)

const removedEvans = names.filter(name => name !== 'evans')
```

- DIY Filter

```js
Array.prototype.myFilter = function(callback) {
  const filtered = []

  for (let i = 0; i < this.length; i++) {
    const currentArrayElement = this[i]
    if (callback(currentArrayElement)) {
      filtered.push(currentArrayElement)
    }
  }
  return filtered
}


Array.prototype.monkeyPatch = '🙈'


[].filter

```

---

#### all the forms of arrow functions

```javascript

const implicitReturn = () => 'hi'
const explicitReturn = () => {
  return 'hi'
}

```

---

#### function binding vs arrow functions

```javascript
const dog = {
  name: 'winfield',
  favSnacks: ['cheese', 'peanut butter', 'carrots'],
  sayName: function() {
    return this.name
  },
  barkName: () => {
    return this.name + 'BARK!'
  },
  sayFavFoods: function() {
    // this is dog
    this.favSnacks.forEach(s => {
      console.log(`${this.name} likes ${s}`)
    })
  },
  sayFavFoodsNoArrow: function() {
    this.favSnacks.forEach(function(snack) {
      console.log(`${this.name} likes ${snack}`)
    })
  }
}
// this will be dog
dog.sayName() //'winfield'
// this will be the window
dog.barkName() //'undefined BARK!'
dog.sayFavFoods()
```

---

#### class instance properties and class syntax in general

```javascript

class Dog {
  constructor(name, age) {
    this.name = name
    this.age = age
  }

  bark() {
    return this.name
  }
}

```

---

#### passing functions around as arguments (callbacks) and ES6 Iterators (map, reduce, forEach, filter, find, etc)

```javascript
const names = ['dracular', 'voldemort', 'the hash slinging slasher']

names.map((name) => name.toUpperCase())

```

---

#### dynamic object keys

```javascript
function dynamicSetKeys(obj, key, val) {
  // obj -> {}
  // key -> 'topping'
  // val -> 'scallions'
  obj[key] = val
  // { toppings: 'scallions' }
  return obj
}

```

```js
const dog = {
  name: 'winfield',
  favSnacks: ['carrots', 'peanut butter'],
  listFavSnacks: function() {
    // var that = this
    this.favSnacks.forEach(function(snack) {
      // console.log(that.name, snack)
      // console.log(this.name, snack)
    }.bind(this))
  }
}
```

### External Resources

- [Modern JavaScript](http://www.reactnativeexpress.com/modern_javascript)
- [Wes Bos Simple Guide for Undertanding Destructuring in JS](https://wesbos.com/destructuring-objects/)
- [MDN Article on ES6 Object Shorthand Syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#New_notations_in_ECMAScript_2015)
- [MDN Article on ES6 Spread Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
- [MDN Article on Arrow Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
- [MDN Article on `Function.prototype.bind()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_objects/Function/bind)
- [MDN Article on ES6 Classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
- [MDN Article on Callbacks](https://developer.mozilla.org/en-US/docs/Glossary/Callback_function)
- [MDN Article on forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
- [MDN `Array.prototype.reduce()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)
- [MDN "Working with Objects"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects)

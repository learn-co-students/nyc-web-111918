this.name = 'window object'

document.body.addEventListener('click', function(event) {
  console.log('%c THIS IS ', 'color: goldenrod', this)
}.bind({ name: 'NOT THE DOCUMENT AT ALL' }))

document.body.addEventListener('click', () => console.log(this))
/************ Function Called with New Keyword ***********/
//inside a constructor fn, this will be the newly created object

const personConstructor = function(name) {
  // `this` within a constructor will be the newly created object
  // { name: name }
  this.name = name
}

const evans = new personConstructor('evans')


/********************************************************/

/************ Bind Call Apply ****************************/

const koala = {
  name: 'quicken loans™',
  favSnacks: ['bamboo', 'eucalyptus', 'human', 'assorted trash'],
  sayName: function () {
    return `My name is ${this.name}`
  },
  eatSnacks: function() {
    console.log('%c THIS IS ', 'color: purple', this)
    this.favSnacks.forEach(function logSnack(snack) {
      console.log(`${this.name} is eating ${snack}`)
    })
  },
  eatSnacksBound: function() {
    console.log('%c THIS IS ', 'color: purple', this)
    this.favSnacks.forEach(function logSnack(snack) {
      console.log(`${this.name} is eating ${snack}`)
    }.bind(this /*this is koala here*/))
    console.log('%c THIS IS ', 'color: teal', this)
  }
}

function myForEach(arr, callback) {
  for (let i = 0; i < arr.length; i++) {
    callback(arr[i])
  }
}

function eatNachos(friend1, friend2) {
  return `${this.name} loves 2 eat nachos with ${friend1} and ${friend2}`
}

// bind returns a COPY of our fn with `this` fixed to whatever obj was passed as an arg
const bound2 = eatNachos.bind({ name: 'kimye' })

const bradPitt = { name: 'bradley pittington' }
const friends = ['jennifer anniston', 'george clooney']

eatNachos.call({ name: 'lebron' }, 'dwayne wade', 'jr smith')
eatNachos.apply({ name: 'lebron' }, ['dwayne wade', 'jr smith'])

eatNachos.apply(bradPitt, friends)
/********************************************************/

/************ Function called on an Object ***************/

const person = {
  name: 'evans',
  sayName: function() {
    return (`I am ${this.name} nice 2 meet u!`)
  },
  whatIsThis: function() {
    return ('%c THIS IS ', 'color: red', this)
  }
}

//create another reference to the fn
const alsoSayName = person.sayName
const alsoWhatIsThis = person.whatIsThis

console.log(alsoSayName === person.sayName) //true
console.log(alsoWhatIsThis === person.whatIsThis) //true

// console.log(person.whatIsThis())
// console.log(alsoWhatIsThis())


/********************************************************/

/************ Simple Function Call ***********************/

function makeSando() {
  return `${this.name} likes 2 eat sandwiches`
}


/********************************************************/

/************ Arrow Functions ****************************/

const chuck = {
  name: 'Charles Entertainment Cheese',
  band: ['guitar', 'drums', 'another guitar', 'triangle', 'recorder'],
  playInstrumentsFnKeyword: function() {
    console.log('%c THIS IS ', 'color: green', this)
    this.band.forEach((instrument) => {
      console.log(`${this.name} likes to play the ${instrument}`)
    })
  },
  playInstrumentsArrow: () => {
    console.log('%c THIS IS ', 'color: green', this)
    this.band.forEach((instrument) => {
      console.log(`${this.name} likes to play the ${instrument}`)
    })
  }
}

/********************************************************/

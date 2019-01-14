const instructors = Object.freeze(['evans', 'dick ward', 'chris', 'charlie', 'steven balasta']) // Object.freeze creates an immutable object

// const capitalizeName = function(name) {
//   return name.toUpperCase()
// }

const capitalizeName = (name) => name.toUpperCase() //pure function

const allCapsInstructors = instructors.map(capitalizeName)

instructors === allCapsInstructors //false

function myMap(array, callback) { //pure function
  const mappedArray = [] //mutations are contained within the function; no OBSERVABLE side effects
  for (let i = 0; i < array.length; i++) {
    const mappedElement = callback(array[i])
    mappedArray.push(mappedElement)
  }
  return mappedArray
}

function impureMap(array, callback) { //has side effects; is impure
  for (let i = 0; i < array.length; i++) {
    array[i] = callback(array[i])
  }
  return array
}

instructors //['evans', 'dick ward', 'chris', 'charlie', 'steven balasta']

impureMap(instructors, capitalizeName) //mutates instructors array

function hof() { //higher order fns return functions and/or take fns as arguments
  return function inner() {
    console.log('HI')
  }
}


const arrow = (appleChrome, idx) => { //arrow w/ brackets needs EXPLICIT return
  return appleChrome + '!'
}

const implicit = () => 'sublte' //no brackets -> IMPLICIT return w/ arrow fns


console.log(arrow('Hello World', 5)) //'Hello World!'


const myIIFE = (function cars(passengers) {
  console.log(`There are ${passengers} in this car`)
  return 'flagellum'
})('dolphins')


myIIFE //flagellum


// 'PiZZa HuT' -> 'pizza_hut'
const lowerCaseString = (string) => string.toLowerCase()
const subUnderscore = (string) => string.replace(' ', '_')

const urlSlug = (string) => subUnderscore(lowerCaseString(string)) //composition

const pizzaUrl = urlSlug('PiZZa HuT')

pizzaUrl // 'pizza_hut'

const robotFactory = (() => {
  let totalNumRobotsCreated = 0 //mutations are contained w/in the closure scope
  return function(name, blinkingLights, microprocessor) {
    return {
      id: totalNumRobotsCreated++,
      name: name,
      blinkingLights: blinkingLights,
      microprocessor: microprocessor
    }
  }
})()

const t2000 = robotFactory('terminator', false, 'SUPER FAST')

t2000 //{id: 0, name: "terminator", blinkingLights: false, microprocessor: "SUPER FAST"}

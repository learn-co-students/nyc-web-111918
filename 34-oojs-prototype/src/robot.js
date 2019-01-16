// object literals

const robot1 = { name: 'michael', weight: '2 tons', speciality: 'painting'}
const robot2 = { name: 'bob ross', weight: '1 ton', speciality: 'better at painting'}

// factory function

// function robotFactory(name, weight, speciality){
//   // const robot = { name : name , weight:  weight, speciality : speciality}
//   const robot = { name , weight, speciality }
//   return robot
// }
//
// const robot3 = robotFactory('t-1000', '0', 'from australia')
// const robot4 = robotFactory('t-2000', '10', 'bad to the bone')

// Object.create

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


const robot3 = robotFactory('t-1000', '0', 'from australia')
const robot4 = robotFactory('t-2000', '10', 'also from australia')
robot3.recharge = rechargeBatteries
robot4.recharge = rechargeBatteries
robot3.recharge === robot4.recharge // true

robot3.recharge()


const robotTemplate = {
  name: null,
  weight: null,
  specialty: null,
}

function rechargeBatteries() {
  console.log(`${this.name} is recharging its batteries`)
}

const robot5 = Object.create(robotTemplate)
robot5.name = 'sparko'
robot5.weight = 1000,
robot5.specialty = 'making sparks'

robot5.__proto__ //robotTemplate

robot5.rechargeBatteries = rechargeBatteries

robot5.rechargeBatteries()

// constructor function
function ThisRobotFactory(name, weight, specialty) {
  // `this` in the context of a constructor function will be the newly created object {}
  this.name = name
  this.weight = weight
  this.specialty = specialty
}

ThisRobotFactory.prototype.ahem = function(){
  console.log('im being shared')
}

const robot6 = new ThisRobotFactory('megaman','100lbs', 'absorbs power')
const robot7 = new ThisRobotFactory('zero','110lbs', 'z saber')


// class syntax
const CharacterClass = (function() {
  let id = 0
  return class Character {
    constructor(name, ability) {
      console.log('WE R IN THE CONSTRCUTOR')
      this.name = name
      this.ability = ability
      this.id = id ++
    }

    walk() {
      return `${this.name} is walking`
    }

    // Character.classMethod()
    static classMethod(){
      console.log('classy')
    }
  }
})()

const terminator = new Character('T-2000', 'time travel')
terminator.walk()


const bowser = new Character('bowser', 'breathing fire')

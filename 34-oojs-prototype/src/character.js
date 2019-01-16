const main = document.body.querySelector('#main')
const characterElement = document.createElement('img')

let speed = 15
let movement
const characterAssets = 'assets/character'
characterElement.src = `${characterAssets}/static.gif`
characterElement.style.position = 'relative'
characterElement.style.left = '0px'
characterElement.style.top = '0px'
characterElement.style.width = '25px'

main.appendChild(characterElement)

function walkEast() {
  stop()
  movement = setInterval(function() {
    let currentPosition = parseInt(characterElement.style.left)
    characterElement.style.left = currentPosition + 1 + 'px'
  }, speed)
  characterElement.src = `${characterAssets}/walkright.gif`
}

function walkWest() {
  stop()
  movement = setInterval(function() {
    let currentPosition = parseInt(characterElement.style.left)
    characterElement.style.left = currentPosition - 1 + 'px'
  }, speed)
  characterElement.src = `${characterAssets}/walkleft.gif`
}

function walkNorth() {
  stop()
  movement = setInterval(function() {
    let currentPosition = parseInt(characterElement.style.top)
    characterElement.style.top = currentPosition - 1 + 'px'
  }, speed)
  characterElement.src = `${characterAssets}/walkup.gif`
}

function walkSouth() {
  stop()
  movement = setInterval(function() {
    let currentPosition = parseInt(characterElement.style.top)
    characterElement.style.top = currentPosition + 1 + 'px'
  }, speed)
  characterElement.src = `${characterAssets}/walkdown.gif`
}

function stop() {
  clearInterval(movement)
  characterElement.src = `${characterAssets}/static.gif`
}

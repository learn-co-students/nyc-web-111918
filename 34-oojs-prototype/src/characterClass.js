// // const main = document.body.querySelector('#main')
//
// class GameCharacter {
//   constructor(imgs) {
//     this.movement = null
//     this.speed = 15
//     this.imgs = imgs
//     this.imgTag = document.createElement('img')
//     this.imgTag.src = `${this.imgs}/static.gif`
//     this.imgTag.style.position = 'relative'
//     this.imgTag.style.left = '0px'
//     this.imgTag.style.top = '0px'
//     this.imgTag.style.width = '25px'
//     main.appendChild(this.imgTag)
//   }
//
//   walkEast() {
//     this.stop() //stop previous movement
//     // setInterval w/ arrow fn
//     this.movement = setInterval(() => { //move 1 px left every this.speed ms
//       let currentPosition = parseInt(this.imgTag.style.left)
//       // this.imgTag.style.left = currentPosition + 1 + 'px'
//       this.imgTag.style.left = `${currentPosition + 1}px`
//     }, this.speed)
//
//     // set interval w/ bind
//     // this.movement = setInterval(function() {
//     //   let currentPosition = parseInt(this.imgTag.style.left)
//     //   this.imgTag.style.left = currentPosition + 1 + 'px'
//     // }.bind(this), this.speed)
//
//     this.imgTag.src = `${this.imgs}/walkright.gif`
//   }
//
//   walkWest() {
//     this.stop()
//     this.movement = setInterval(() => {
//       let currentPosition = parseInt(this.imgTag.style.left)
//       this.imgTag.style.left = currentPosition - 1 + 'px'
//     }, this.speed)
//     this.imgTag.src = `${this.imgs}/walkleft.gif`
//   }
//
//   walkNorth() {
//     this.stop()
//     this.movement = setInterval(() => {
//       let currentPosition = parseInt(this.imgTag.style.top)
//       this.imgTag.style.top = currentPosition - 1 + 'px'
//     }, this.speed)
//     this.imgTag.src = `${this.imgs}/walkup.gif`
//   }
//
//   walkSouth() {
//     this.stop()
//     this.movement = setInterval(() => {
//       let currentPosition = parseInt(this.imgTag.style.top)
//       this.imgTag.style.top = currentPosition + 1 + 'px'
//     }, this.speed)
//     this.imgTag.src = `${this.imgs}/walkdown.gif`
//   }
//
//   stop() {
//     clearInterval(this.movement)
//     this.imgTag.src = `${this.imgs}/static.gif`
//   }
// }
//
// const link = new GameCharacter('assets/character')

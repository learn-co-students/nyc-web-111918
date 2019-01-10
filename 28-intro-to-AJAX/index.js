// nothing


function sleep(n) {
  let i = 0
  while(i < (12 ** 8) * n) {
    i++
  }
}
//
// 'http://ron-swanson-quotes.herokuapp.com/v2/quotes'
//
// 'https://dog.ceo/api/breeds/image/random'
// 'https://dog.ceo/api/breeds/image/random/4'

console.log('Starting the sleep function')
// sleep(10)
console.log('Wow that sleep function took forever to run. 1 Star 🌟')

document.getElementById('click-button').addEventListener('click', console.log)

const quotesContainer = document.querySelector('#quotes')
// how do we make requests in JS?



fetch('http://ron-swanson-quotes.herokuapp.com/v2/quotes', { method: "GET"} )
  .then(function(response){
    return response.json()
  })
  .then(function(ronQuote){
    quotesContainer.innerHTML += `
      <p> ${ronQuote}</p>
    `
    ronnie = ronQuote
  })

// console.log(' this is DEFINITELY AFTER THE FETCH')

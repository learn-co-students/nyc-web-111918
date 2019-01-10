document.addEventListener('DOMContentLoaded', () => {
  console.log('DOM has been fully loaded')
  console.log(document.querySelector('#gift-icon'))

  // first i'll find the html element i wish to append items to
  const ulForAppendingGifts = document.querySelector('.gift-list')
  const inputForFilteringGifts = document.querySelector('#filter-input')

  // iterate over the giftData array and append a single list item for each 🧐 element in that array
  ulForAppendingGifts.innerHTML = renderAllGifts(gifts) //helper fn
  // ulForAppendingGifts.innerHTML = gifts.map(function(gift) { //map
  //     return `<li>${gift.name}</li>`
  //   }).join('')
  // ulForAppendingGifts.innerHTML = gifts.map((gift) => `<li>${gift.name}</li>`).join('') //map w/ arrow

  inputForFilteringGifts.addEventListener('input', function(event) {
    // event.target will be the HTML element (node in our DOM tree) that fired the event
    // event.target will be the inputForFilteringGifts
    // input elements in HTML have an attribute called value that stores whatever the user input
    console.log('HELLO FROM THE INPUT ', event.target.value)
    const filteredGifts = gifts.filter(function(gift) { //function keyword
      return gift.name.includes(event.target.value)
    })
    // const filteredGifts = gifts.filter((gift) => gift.name.includes(event.target.value)) //arrow fn; implicit return
    console.log(filteredGifts)
    ulForAppendingGifts.innerHTML = renderAllGifts(filteredGifts)
  })

  ulForAppendingGifts.addEventListener('click', function(event) {
    console.log(event.target, event.target.dataset, event.target.dataset.id)
  })
})

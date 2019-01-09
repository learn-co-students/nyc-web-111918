// You can add your event handlers here!

function renderAllGifts(giftArray) {
  return giftArray.map(function(gift) {
    return `<li>${gift.name}</li>`
    // const newListItem = document.createElement('li')
    // newListItem.textContent = gift.name
    // ulForAppendingGifts.appendChild(newListItem)
  }).join('')
}

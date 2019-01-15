document.addEventListener('DOMContentLoaded', () => {
  /****************************** FIND DOM NODES ******************************/
  // find DOM nodes we care about: form, dog table, and the form inputs
  const dogDetailTable = document.querySelector('#table-body')
  const dogForm = document.querySelector('#dog-form')
  const dogNameInput = document.querySelector('#name-input')
  const dogBreedInput = document.querySelector('#breed-input')
  const dogGenderInput = document.querySelector('#gender-input')

  // initial `fetch` when page loads
  fetch('http://localhost:3000/dogs', { method: 'GET' })
    // .then(r => r.json()) // parse the JSON data and convert it into a js object
    .then(parseJSON) //use parse helper fn
    .then((dogData) => {
      const allDogHTML = renderAllDogs(dogData)
      dogDetailTable.innerHTML = allDogHTML //add dogs to the page setting innerHTML of the dog table
    })

  console.log('WOT WILL HAPPEN FIRST 🤔')

  /************************* EVENT LISTENERS **********************************/

  dogDetailTable.addEventListener('click', function handleEditClick(event) {
    fetch(`http://localhost:3000/dogs/${event.target.dataset.id}`, {method: 'GET'})
      .then(parseJSON)
      .then(dogData => {
        dogNameInput.value = dogData.name
        dogBreedInput.value = dogData.breed
        dogGenderInput.value = dogData.sex
      })
  })
})

/************************** HELPERS *******************************************/

// takes an array of dogs and produces A SINGLE STRING of HTML based on the dog objects found in the array
function renderAllDogs(dogArray) {
  return dogArray.map(dog => (
    `<tr>
      <td>${dog.name}</td>
      <td>${dog.breed}</td>
      <td>${dog.sex}</td>
      <td>
        <button data-id="${dog.id}" data-action="edit">
          Edit
        </button>
      </td>
    </tr>`
  )).join('')
}

// helper function to parse our response object when using `fetch`
function parseJSON(responseObject) {
  console.log('%c RESPONSE OBJECT: ', 'color: red', responseObject)
  return responseObject.json()
}

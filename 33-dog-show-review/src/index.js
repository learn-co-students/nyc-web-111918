document.addEventListener('DOMContentLoaded', () => {
  /****************************** API BASE URL ********************************/
  const API_ENDPOINT = 'http://localhost:3000/dogs'

  /****************************** FIND DOM NODES ******************************/
  // find DOM nodes we care about: form, dog table, and the form inputs
  const dogDetailTable = document.querySelector('#table-body') //table
  const dogForm = document.querySelector('#dog-form') //form
  const dogNameInput = document.querySelector('#name-input') //name input
  const dogBreedInput = document.querySelector('#breed-input') //breed input
  const dogGenderInput = document.querySelector('#gender-input') //gender input

  // initial `fetch` when page loads
  fetch(API_ENDPOINT, { method: 'GET' })
    // .then(r => r.json()) // parse the JSON data and convert it into a js object
    .then(parseJSON) //use parse helper fn
    .then((dogData) => {
      const allDogHTML = renderAllDogs(dogData)
      //add dogs to the page setting innerHTML of the dog table
      dogDetailTable.innerHTML = allDogHTML
    })

  console.log('WOT WILL HAPPEN FIRST 🤔')

  /************************* EVENT LISTENERS **********************************/

  dogDetailTable.addEventListener('click', function handleEditClick(event) {
    if (event.target.dataset.action === 'edit') {
      fetch(`${API_ENDPOINT}/${event.target.dataset.id}`, {method: 'GET'})
        .then(parseJSON)
        .then(dogData => {
          // store the id of the dog the user wishes to edit on the dogForm
          // we can use this id later in our SUBMIT HANDLER to PATCH to the server
          dogForm.dataset.id = dogData.id
          dogNameInput.value = dogData.name
          dogBreedInput.value = dogData.breed
          dogGenderInput.value = dogData.sex
          window.scrollTo(0, 0) // scroll to the top of the page
      })
    } else if (event.target.dataset.action === 'delete') {
      console.log(event.target)
      const dogIdToDelete = event.target.dataset.id
      // send HTTP DELETE request via fetch using the dog id
      fetch(`${API_ENDPOINT}/${event.target.dataset.id}`, { method: 'DELETE' })
      // (if applicable), update any global JS variables
      // update the DOM to remove the deleted dog
      document.querySelector(`#dog-${dogIdToDelete}`).remove()
    }
  })

  dogForm.addEventListener('submit', function handleEditSubmit(event) {
    // stop the HTML form from sending an HTTP POST request into the void™
    event.preventDefault()
    // the event's target in the case of a form SUBMIT will be the form itself
    // the form has a dataset.id of the dog the user wishes to edit
    const dogIdToUpdate = event.target.dataset.id
    // grab the updated values from the input fields
    const name = dogNameInput.value
    const breed = dogBreedInput.value
    const sex = dogGenderInput.value
    console.log('%c UPDATED DOG DETAILS: ', 'color: blue', name, breed, sex)
    // PATCH to the server
    // request should be sent to localhost:3000/dogs/:id
    fetch(`${API_ENDPOINT}/${dogIdToUpdate}`, {
      method: 'PATCH',
      // meta-data about our request; data about the request itself
      headers: { //could create single headers variable so we don't keep typing these
        // tell the server we are sending a MIME type of application/json
        'Content-Type': 'application/json',
        // tells our server which MIME type we'd like in the response
        'Accept': 'application/json'
      },
      // body is the data in the request; what we'd see in params in a rails controller
      body: JSON.stringify({ name, breed, sex })
    })
      .then(parseJSON)
      .then(updatedDog => {
        // update the DOM to reflect the changes we've made
        // give each table row a css id dog-{dog.id} //see the renderAllDogs fn for that
        const trToUpdate = document.querySelector(`#dog-${updatedDog.id}`)
        trToUpdate.innerHTML = renderSingleDogRow(updatedDog)
        // re-render a SINGLE tr based on the updated data from ye olde db
      })
    // update any state management variables if applicable
    // clear form inputs using reset
    event.target.reset()
  }) // end submit handler

}) //END DOMContentLoaded

/************************** HELPERS *******************************************/

// takes an array of dogs and produces A SINGLE STRING of HTML based on the dog objects found in the array
function renderAllDogs(dogArray) {
  return dogArray.map(dog => (
    `<tr id="dog-${dog.id}">
      ${renderSingleDogRow(dog)}
    </tr>`
  )).join('')
}
// create HTML for a single table row
function renderSingleDogRow(dog) {
  return (`
    <td>${dog.name}</td>
    <td>${dog.breed}</td>
    <td>${dog.sex}</td>
    <td>
      <button data-id="${dog.id}" data-action="edit">
        Edit
      </button>
    </td>
    <td>
      <button data-id="${dog.id}" data-action="delete">
        Delete
      </button>
    </td>
  `)
}

// helper function to parse our response object when using `fetch`
function parseJSON(responseObject) {
  console.log('%c RESPONSE OBJECT: ', 'color: red', responseObject)
  return responseObject.json()
}

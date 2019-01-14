const addBtn = document.querySelector('#new-toy-btn')
const formContainer = document.querySelector('.container')
const toyCollection = document.getElementById('toy-collection')
const addToyForm = document.querySelector('.add-toy-form')
const apiURL = "http://localhost:3000/toys"

let addToy = false



addBtn.addEventListener('click', () => {
  // hide & seek with the form
  addToy = !addToy
  if (addToy) {
    formContainer.style.display = 'block'
    // submit listener here
  } else {
    formContainer.style.display = 'none'
  }
})

function getRequest(){
  return fetch(apiURL)
    .then(res => res.json())
}

function connectAPI(method, body){
  return fetch(apiURL,
  {
    method: method,
    headers:
  {"Content-Type": "application/json",
    Accept: "application/json"
  },
    body:
  JSON.stringify(body)
}
)
}





  getRequest().then(toys => toys.forEach((toy) =>{
    toyCollection.innerHTML += `
    <div class="card">
    <h2>${toy.name}</h2>
    <img src=${toy.image} class="toy-avatar" />
    <p>${toy.likes} Likes </p>
    <button data-id=${toy.id} class="like-btn">Like <3</button>
  </div>
`
  }))

  addToyForm.addEventListener('submit', (e) =>{
    e.preventDefault()
    const inputName = addToyForm.querySelector('#inputName').value
    const inputURL = addToyForm.querySelector('#inputURL').value

    toyCollection.innerHTML += `
    <div class="card">
    <h2>${inputName}</h2>
    <img src=${inputURL} class="toy-avatar" />
    <p>0 Likes </p>
    <button class="like-btn">Like <3</button>
    </div>
    `
    connectAPI("POST", {
      "name": inputName,
      "image": inputURL,
      "likes": 0
    }).then(res => res.json()).then( console.log
    )
  })

  toyCollection.addEventListener('click', (e) => {
    if (e.target.classList.contains('like-btn')){
      const likes = e.target.previousElementSibling
      const likeAmt = parseInt(likes.innerText)
      const toyID = e.target.dataset.id
      likes.innerHTML = `${likeAmt + 1} Likes`
      fetch(`http://localhost:3000/toys/${toyID}`, {
        method: "PATCH",
        headers:
        {
          "Content-Type": "application/json",
          Accept: "application/json"
        },
        body: JSON.stringify({
          "likes": likeAmt + 1
        })
      }
      )
    }
  })

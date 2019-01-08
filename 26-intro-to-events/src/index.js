
console.log('%c Hello lol', 'color:goldenrod')

document.addEventListener("DOMContentLoaded", function(){

  // grab THAT FORM!
  const form = document.querySelector("#comment-form")
  console.log(form)
  const commentContainer = document.querySelector("#comments-container")

  // stop that instant full page slow data eating refresh
  form.addEventListener("submit", function(event){
      event.preventDefault()
      // grab the info from the form.. specifically the input
      // GRAB THE INPUT
      const inputTag = form.querySelector("#new-comment")
      // console.log(input, 'this is the input')
      // const userInput = inputTag.value
      // make THAT ELEMENT i want to HOLD my input
      const para = document.createElement('p')
      // add the text i want to the element I just made
      para.innerText = inputTag.value
      para.className = 'added-class'
      // append it somewhere on the page
      // GET THAT CONTAINER
      commentContainer.appendChild(para)
      // make a better user experience and reset the form
      form.reset()
  })

  const parentDiv = document.querySelector("#helicopter-parent")
  // console.log(parentDiv, 'helio')
  parentDiv.addEventListener('click', function(e){
    // console.log(e.target)

    if (e.target.dataset.name === "alert"){
      alert(' lolz yeets')
    } else if (e.target.dataset.name === "log"){
      console.log('clicked me')
    } else if (e.target.dataset.name === "error"){
      console.error(' BAD muy bad ')
    }

  })


  // const pTaggy = document.querySelector(".added-class")
  // pTaggy.addEventListener('click', function(){
  //    console.log('im the ebssst')
  //
  // })



})
//
//
// function doStuff(){
//   console.log('something')
// }

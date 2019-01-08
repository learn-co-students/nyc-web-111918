console.log('%c Hello, World!', 'color: orange')


// grab some stuff on the DOM
document.getElementById('outer-node')

// make a new element
const imgTag = document.createElement("img")
imgTag.src = "https://i.kym-cdn.com/entries/icons/mobile/000/026/489/crying.jpg"

// throw that bad boy onto the page
// document.body.appendChild(imgTag)


// throw some dank memes onto the page


//where am I attaching these dank memes?
const htmlBody = document.querySelector("body")
// iterate over dank memes array
dankMemes.forEach(function(memeURL){
  // create an img element for EACH item in array
    const memeImg = document.createElement("img")
    // assign the src to the img
    memeImg.src = memeURL
    // insert element into the DOM
    htmlBody.appendChild(memeImg)
})




// rugrats netflix adaptation
"https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/10676315_10203656694270611_6060927043296061113_n.jpg?_nc_cat=106&_nc_ht=scontent-lga3-1.xx&oh=c973e800cd0caf352a655aef6d180264&oe=5CC2BB63"


// go to FAv site.. <3 manipulate something

// Find reference to container
const container = document.getElementById("container");
console.log("The dynamic content will be placed here: ", container);

// Create a header
const header = document.createElement("H1");
header.innerText = "flatStaGram";
console.log("Application header dom obj: ", header);

// Add header to container
container.appendChild(header);

// Stop to inspect images
// debugger;

console.log(
  "Here are the images",
  images.forEach((iUrl, i) =>
    console.log(`Image id ${i}. Image path: ${iUrl}.`)
  )
);

// Stop before appending the images to the dom
// debugger;

// Add images to the DOM
images.forEach(function(imgSrc) {
  // Create an img element
  const img = document.createElement("img");

  // Update img src attribute
  img.src = imgSrc;
  console.log(img);
  //debugger;

  // Append img element to container
  container.appendChild(img);
  //debugger;
});

# Intro to the DOM 📜

### The Document Object Model Overview
- What is the DOM?
  - The DOM (Document Object Model) is a representation of an HTML document as a **tree** (more on this later) that can be manipulated with JavaScript
  - Javascript is a language created to manipulate the DOM
  - "[JavaScript] DOM methods allow programmatic access to the tree; with them you can change the document's structure, style or content." - [MDN DOM Reference](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model) (more on this later)


## The DOM is a Tree 🎄

- What is a tree in computer science? A data structure that represents some hierarchical structure; parent nodes (elements), child nodes, sibling nodes. Trees look like upside down trees:

![tree](https://webdocs.cs.ualberta.ca/~aixplore/learning/DecisionTrees/InterArticle/graphics/inverted-tree.gif)

- Here is another representation of a tree with a root node and several children or branches:

![tree data structure](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Binary_tree.svg/300px-Binary_tree.svg.png)

- Here is a representation of our HTML as a tree. This is the DOM:

![tree structure via tutorial republic](https://www.tutorialrepublic.com/lib/images/html-dom-tree.gif)

---

- DOM (Document Object Model)
  - The DOM is a tree structure with several child `nodes`. All of the elements in the tree are related to each other. Some elements may have children:

```html
<!-- document.body gives us the body node -->
<body>

    <div id="outer-node"><!-- div is a child of body -->
      <div><!-- this div is a child of outer-node -->
        <div>
          <h1>Internet Memes</h1>
        </div>
      </div>
    </div>
</body>
```

---

- This tree structure starts at the `document`, where `document` is the topmost **parent** of each individual `node` (HTML Element). Every single HTML element in the DOM is a `node`: `<p></p>`, `<h1></h1>`, `<img>`, etc. **If you are not comfortable with HTML syntax and/or HTML tags, go through the [intro to HTML section on W3Schools](https://www.w3schools.com/html/html_intro.asp)**
- JavaScript allows us to **traverse** this tree to find and _manipulate_ different `nodes` (we'll see how in a bit).
  - "The DOM model represents a document with a logical tree. Each branch of the tree ends in a node, and each node
    contains objects. DOM methods allow programmatic access to the tree; with them you can change the document's
    structure, style or content." -
    [MDN Article on the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)
- Elements (`nodes`) have properties that can be manipulated (`style`, `textContent`, `innerHTML`, etc). In this particular example, we'll be manipulating the `.src` attribute of some `img` tags.
- Element interfaces
  - Different elements (`table`, `p`, `image`) support different methods
    - `image.src`, for instance
    - `document.body.style.backgroundColor = 'red'`
  - Refer to the documentation for each element you wish to manipulate to find out which properties/attributes you can manipulate. - [MDN HTML Element Docs](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)

---

### Selecting DOM Nodes

- There are certain built in JavaScript functions that allow us to traverse the DOM and find specific elements in the tree:

- We can search for single elements:
  - `document.getElementById('element-id')` will find an HTML element with a particular id
  - `node.querySelector` is more open-ended and will find whatever you tell it to:
    - `node.querySelector('div')` will find the first `<div></div>` tag in the tree
    - `node.querySelector('.btn-small')` will find the first element with a **CSS Class of `btn-small`**
    - `node.querySelector('#search-input')` will find the element with a **CSS ID of `search-input`**
    - Note the distinction above. CSS classes are preceded by a `.`; CSS ids are preceded by a `#`
- We can also search for multiple elements:
  - `node.getElementsByTagName('p')` will return all instances of a particular tag; in the example above, all `<p></p>` tags.
  - `node.getElementsByClassName('btn-small')` will return all elements that have a particular CSS Class
  - `node.querySelectorAll('.btn-small')` will return **all** of the elements with a class of `btn-small`
- We can also combine selectors for more specificity:
  - We need a space between `#parent .child`
  - We can chain selectors `div.image.highlighted`
  - We can search for siblings with `~`

```html
<div id="outer-node">
  <div>
    <div>
      <h1>Internet Memes</h1>
    </div>
  </div>
</div>
```

```js
const nestedH1 = document.querySelectorAll('#outer-node h1')

```
- The snippet above will look for any `<h1></h1>` tags **inside** the element with a CSS ID of `outer-node`

- **IMPORTANT** you will get an _array-like_ object such as a `NodeList` back from some of the methods above. Refer to the chart at the bottom of this document for more info. If you need to call `Array` methods like `.map` or `.forEach`, you can convert your `NodeList` or `HTMLCollection` into an array like so:

```js
const nestedH1 = document.querySelectorAll('#outer-node h1') //NodeList

nestedH1.map //undefined

const nestedH1AsArray = Array.from(nestedH1) //array

nestedH1AsArray.map //function

```

- Refer to the [documentation if you are unfamiliar with `Array.from`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from)

---

### Modifying DOM Nodes
- We can assign a `node` to a variable: `const body = document.querySelector('body')`
- We can change the attributes of a `node`: `body.style.backgroundColor = red`
- `textContent`vs. `innerHTML`:
  - The `textContent` of a particular element is the text that appears in between the opening and closing tags: `<h1>HELLO WORLD</h1>` the `textContent` is the string `HELLO WORLD`
  - The `innerHTML` of a particular element is a **string representing all of the HTML and text of a particular node and its children***:

```html
<div id="outer-node">
  <div>
    <div>
      <h1>Internet Memes</h1>
    </div>
  </div>
</div>
```

```js
const outerNode = document.querySelector('#outer-node')

outerNode.textContent // 'Internet Memes'
outerNode.innerHTML
/*
"
          <div>
            <div>
              <h1>Internet Memes</h1>
            </div>
          </div>
        "
*/
```

---

### Removing Nodes
- `node.removeChild(childNode)` will remove a particular child
- `node.remove()` will remove the node on which it was called:

```html
<div id="outer-node">
  <div>
    <div>
      <h1>Internet Memes</h1>
    </div>
  </div>
</div>

<div id="container">
  <p>Add Images Here</p>
  <!-- <img src=""> -->
</div>
```

```js
const innerH1 = document.querySelector('#outer-node h1')

innerH1.remove() //removes the node from the page

//OR

const container = document.querySelector('#container')

const containerPTag = document.querySelector('#container p')

container.removeChild(containerPTag) //removes the child p tag
```

---

### Creating DOM Objects
- Creating new nodes `const myImg = document.createElement('img')`
- Adding attributes to elements `img.src = 'http://www.coooolimage.com'`
- Appending to node `document.body.appendChild(element)` will add that node to the `<body></body>`

---

### Activity
- With the person sitting next to you, navigate to your favorite website (NewYorkTimes or Twitter are good examples):
  - Select elements and save them to JavaScript variables
  - Remove at least 2 elements from the page
  - Modify elements (e.g., replace image url, change text, change CSS)
  - Create new elements and add them to the page
  - Change all instances of one word on the page
  - Replace all images on only a certain portion of the DOM
  - Change every other header
  - Bonus (Hard): replace all elements of one tag to another (e.g., `p` to `h1`)

---

### Adding Some Dank Memes to the Page

- If you look at the `index.html`, there are **two** JavaScript files being loaded: `index.js` and `dankMemes.js`. I want to use JavaScript to create image tags, set the urls based on the array of strings found in `dankMemes.js` and add those `<img></img>` tags to the page.
  - First I'll need to find the container to which I'll append the images:

```js
const imgContainer = document.querySelector('#container')
```

  - Then I'll iterate over the array of memes and create a new `<img></img>` tag **forEach** (haha lol) element in the array:

```js
dankMemes.forEach(function(memeUrlString) {
  const newImgTag = document.createElement('img') //create a new img tag
  newImgTag.src = memeUrlString //set the src for that img
  imgContainer.appendChild(newImgTag) //add the img tag to the DOM
})
```

  - A note about the choice to use `forEach` instead of `map`. Since we do not care about the return value of our iterator, `forEach` is fine here. If the return value––**mapped** or transformed array––mattered, then we could have chosen another iterator.

---

## Manipulating the DOM with JavaScript Chart

| Selector name                      | Return shape   | Return type    | Live? | Reference             | can i call forEach? |
| ---------------------------------- | -------------- | -------------- | ----- | --------------------- | -------- |
| `document.getElementById()`        | Single element | Element        | N/A   | https://goo.gl/8cHGoy | N/A      |
| `element.getElementsByClassName()` | Collection     | HTMLCollection | Yes   | https://goo.gl/qcAhcp | No       |
| `element.getElementsByTagName()`   | Collection     | HTMLCollection | Yes   | https://goo.gl/QHozSh | No       |
| `element.querySelector()`          | Single element | Element        | N/A   | https://goo.gl/6Pqbcc | N/A      |
| `element.querySelectorAll()`       | Collection     | NodeList       | No    | https://goo.gl/vTfXza | Yes      |

---

## External Resources:

- [MDN Article on the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)
- [MDN Element](https://developer.mozilla.org/en-US/docs/Web/API/Element)
- [MDN NodeList reference](https://developer.mozilla.org/en-US/docs/Web/API/NodeList)
- [MDN HTMLCollection reference](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection)
- [CSS Selectors Cheatsheet](https://guide.freecodecamp.org/css/tutorials/css-selectors-cheat-sheet/)
- [MDN Document.createElement()](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)
- [MDN Document.createElement()](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)
- [MDN Element.innerHTML](https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML)
- [When are Selected HTML Elements Live](https://stackoverflow.com/questions/28163033/when-is-nodelist-live-and-when-is-it-static)
- [Difference Between the DOM and the BOM](https://stackoverflow.com/questions/4416317/what-is-the-dom-and-bom-in-javascript)

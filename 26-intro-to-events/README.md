# Browser Events

## Outline

* Why events?
* What are events and event listeners
* When and why to use event listeners
* Event types
* Synthesize knowledge of forms with event listeners

---

## What are Web Events 🤔

- "In the case of the Web, events are fired inside the _browser window_, and tend to be attached to a specific item that resides in it — this might be a single HTML element, set of HTML elements, the HTML document loaded in the current tab, or the entire browser window. There are a lot of different types of events that can occur, for example:

  - The user clicking the mouse over a certain element or hovering the cursor over a certain element.
  - The user pressing a key on the keyboard.
  - The user resizing or closing the browser window.
  - A web page finishing loading.
  - **A form being submitted.**
  - A video being played, or paused, or finishing play.
  - An error occurring.
- You will gather from this (and from glancing at the [MDN Event reference](https://developer.mozilla.org/en-US/docs/Web/Events)) that there are a lot of events that can be responded to.

- Each available event has an **event handler**, which is a block of code (usually a user-defined **JavaScript function**) that will be run when the event fires. When such a block of code is defined to be run in response to an event firing, we say we are **registering an event handler**. Note that event handlers are sometimes called **event listeners** — they are pretty much interchangeable for our purposes, although strictly speaking, they work together. The listener **listens** out for the event happening, and the handler is the code that is run in response to it happening." - [MDN Introduction to Events](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events).
  - As it pertains to what we've seen so far, we can tell JavaScript to listen for certain events and invoke a **callback** function when that event occurs:

```js
const firstBtnOnPage = document.querySelector('button')

firstBtnOnPage.addEventListener('click', function() {
  console.log('BUTTON WAS CLICKED')
})
```

- We are telling `addEventListener` to invoke the **anonymous function** passed as the second argument **_when_** the event fires; we're waiting for something to happen then **responding** to this user event.

---
## Listening for Events

- JavaScript allows us to [traverse the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_object_model/Locating_DOM_elements_using_selectors) and find elements. Let's see how we can target a particular element and listen for events:

- Assuming our HTML looks like this:

```html
<div id="comments">
  <h3>Comments</h3>
  <form id='comment-form'>
    <div class="field">
      <input id='new-comment' type='text' placeholder='New Comment' />
      <input type='submit' class='btn' value="Submit" />
    </div>
  </form>
  <div id="commentsContainer">
  </div>
</div>
```

- We can grab the `comment-form` and eventually listen to events:

```javascript
const commentForm = document.getElementById('comment-form')
// OR querySelector
// const commentForm = document.querySelector('#comment-form')
```

- Something to look out for. If we are loading our js files in the `head` tag of our HTML, there is a chance that the JavaScript code we have written will start executing **before our HTML has been loaded and parsed by the browser**. This might cause some element selectors to return `null`. As a precaution, we can listen for the `DOMContentLoaded` event.
  - "The `DOMContentLoaded` event is fired when the initial HTML document has been completely loaded and parsed" - [MDN DOMContentLoaded Reference](https://developer.mozilla.org/en-US/docs/Web/Events/DOMContentLoaded). Let's add this to our code:

```javascript
document.addEventListener('DOMContentLoaded', function DOMContentLoadedEventHandler() {
  const commentForm = document.getElementById('comment-form')

})
```

- In the snippet above, we are adding an **event listener** to the document and listening for the `DOMContentLoaded` event. When that event is fired, the anonymous function passed to `addEventListener` will be invoked.
  - "`addEventListener()` sets up a function that will be called whenever the specified `event` is delivered to the target. Common targets are HTML `Element`, `Document`, and `Window`" - [MDN `addEventListener` Reference](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)

- Now that we're waiting for our DOM content to load, let's listen for a `submit` event on our form:
  - "The `submit` event is fired when a form is submitted.
  - Note that `submit` is fired **only** on the form element, not the button or submit input. (Forms are submitted, not buttons.)" - [MDN Article on the `submit` event](https://developer.mozilla.org/en-US/docs/Web/Events/submit)

```javascript
document.addEventListener('DOMContentLoaded', function DOMContentLoadedEventHandler() {
  const commentForm = document.getElementById('comment-form')
  commentForm.addEventListener('submit', function formSubmitEventHandler(event) {
    console.log(event)
  })

})
```

- If we try adding something to the form and clicking submit, we'll see our `console.log` for a second then it will disappear.

![](https://media.giphy.com/media/1L5YuA6wpKkNO/giphy.gif)

- Forms will attempt to make an HTTP `POST` request on **submission**. Recall from Mod2 that our forms would send a `POST` request that was then handled by our controller (remember HTTP and the request/response cycle?). If we give our `form` an `action` attribute, it will try to `POST` to the endpoint specified by the `action` attribute:

```html
<form id="comment-form" action="/hotdog">
  <div class="field">
    <input id='new-comment' type='text' placeholder='New Comment' />
    <input type='submit' class='btn' value="Submit" />
  </div>
</form>
```

- This form ⬆️ will try to send a `POST` request to `/hotdog`
- If our form **does not have an action attribute** it will attempt to `POST` to the URL we are currently on, making it **appear as though** our page is being refreshed. **Even though it looks like the page is being refreshed, that is not technically what is happening. The form is sending a POST request out into the void**

---

- Our current JS app is not currently sending data to a backend, so we'll need some way to **prevent** this **default** action of submitting the form 🤔

![spongebob and patrick contemplate HTML forms](https://media.giphy.com/media/TPl5N4Ci49ZQY/giphy.gif)

- Let's tell our **event handler**––our callback function––to `preventDefault`:

```js
document.addEventListener('DOMContentLoaded', function() {
  const commentForm = document.getElementById('comment-form')
  commentForm.addEventListener('submit', function formSubmitEventHandler(event) {
    event.preventDefault() //stop form from POSTING
    console.log(event.target) //form
  })
})
```

- Some key points about the `event` object that is passed to our `formSubmitEventHandler` function as a parameter:
  - "The Event interface represents any event which takes place in the DOM; some are user-generated (such as mouse or keyboard events), while others are generated by APIs (such as events that indicate an animation has finished running, a video has been paused, and so forth). There are many types of events, some of which use other interfaces based on the main Event interface. Event itself contains the properties and methods which are common to all events." - [MDN Article on `Event`](https://developer.mozilla.org/en-US/docs/Web/API/Event)
  - `event.target` refers to the **HTML Element** that dispatched the event. For example, if I tell my app to listen for `click` events and the user clicks on a `p` tag, `event.target` will be the `p` tag. If the user clicks on a `button` the `event.target` will be the button. In our case, the `form` is receiving the `submit` event.
  - This is something I'd _strongly recommend_ **burning into your memory**: HTML forms will attempt to send a POST request. Any **child** of an HTML form such as an `<input/>` or `<button></button>` will **cause the form to submit**. YOU DO NOT WANT TO LISTEN FOR A CLICK EVENT IN A FORM; YOU SHOULD BE LISTENING FOR THE `submit` EVENT!!! **super important lol**

![learn to use the internet](https://media.giphy.com/media/SPZFhfUJjsJO0/giphy.gif)

- We need to grab the user's input _from the form_. That information is stored in the `input` tag **inside the form**. If we refer back to our `form` we can see that `input` is a **child** of the `form` itself:

```html
<form id="comment-form" action="/hotdog">
  <div class="field">
    <input id='new-comment' type='text' placeholder='New Comment' />
    <input type='submit' class='btn' value="Submit" />
  </div>
</form>
```

- Since our `event.target` is the `comment-form` itself, we can grab the input using `querySelector`:

```javascript
document.addEventListener('DOMContentLoaded', function DOMContentLoadedEventHandler() {

  const commentForm = document.getElementById('comment-form')

  commentForm.addEventListener('submit', function formSubmitEventHandler(event) {
    event.preventDefault() //stop form from POSTING

    const userInputField = event.target.querySelector('#new-comment')

    const userInputString = userInputField.value
  })

})
```

- `userInputField` will give us the whole `input` element. Since we only care about the user's new comment, we can grab the `value` attribute which will be whatever comment the user typed into the field. Refer to the [MDN Docs for `input` tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input) if you're unfamiliar.

- Let's use the information the user typed into the form to add their comment to the page:

```js
document.addEventListener('DOMContentLoaded', function () {

  const commentsContainer = document.getElementById('commentsContainer')

  const commentForm = document.getElementById('comment-form')

  commentForm.addEventListener('submit', function formSubmitEventHandler(event) {
    event.preventDefault() //stop form from POSTING

    const userInputField = event.target.querySelector('#new-comment')

    const userInputString = userInputField.value

    const commentPTag = document.createElement('p')
    commentPTag.textContent = userInputString

    commentsContainer.appendChild(commentPTag)

  })

})
```
- "In an HTML document, the document.createElement() method creates the HTML element specified by tagName, or an HTMLUnknownElement if tagName isn't recognized." - [MDN Article on `createElement`](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)
  - Calling `document.createElement('p')` will create a `p` tag element.
  - This tag is an HTML object that we can _manipulate_ using JavaScript. We can change the style, or give it a particular `textContent` as a string.
- We can then `append` that `p` tag to the DOM by calling `commentsContainer.appendChild(commentPTag)`. Also note that `commentsContainer` is declared at the top of our function.

---

## Event Bubbling and Event Delegation

- Given a series of buttons deeply nested in some `<div></div>` tags on our page:

```html
<div id="helicopter-parent">
  <div>
    <br>
    <div>
      <br>
      <div>
        <p>HI</p>
        <div>
          <button data-name="alert">Alert ME</button>
          <button data-name="log">Console Log something</button>
          <button data-name="error">Console Error</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
```

- How might we listen for events on those buttons?
  - We **could** find all the buttons, loop over that collection and attach several event listeners for our buttons. This should feel messy and hacky. There must be a better way!™

### What about Event Delegation?

![event delegation diagram](https://javascript.info/article/bubbling-and-capturing/eventflow@2x.png)

- The diagram above outlines the flow of JS events from the target all the way up the DOM (tree) to the topmost node, the `Document`
  - In other words, **every HTML element will know about everything that happens to its children**

- Instead of iterating over the buttons and attaching duplicate event handlers, we can create **one** event handler to Rule Them All™:

```js
const helicopterNode = document.getElementById('helicopter-parent')

helicopterNode.addEventListener('click', function(event) {
  console.log(event.target) //event target will be whatever node was clicked
})
```

- Now we can introduce some control flow to our click handler and decide what to do based on which button was clicked:

```js
helicopterNode.addEventListener('click', function(event) {
  // i do not need to prevent the click default action
  //event.target is the node that was clicked
  // our buttons have a key of dataset -> { name: 'alert' }
  // i am checking the value of button.dataset.name and deciding what to do based on what i find

  if (event.target.dataset.name === 'alert') {
    window.alert('HI')
  } else if (event.target.dataset.name === 'log') {
    console.log('HI')
  } else if (event.target.dataset.name === 'error') {
    console.error('HI')
  }
})
```

- _nice_

![nice](https://media.giphy.com/media/3M9CR4S2KFNyOIqHGg/giphy.gif)

---

## External Resources:

- [MDN Introduction to Events](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events)
- [MDN Event reference](https://developer.mozilla.org/en-US/docs/Web/Events)
- [MDN DOMContentLoaded Reference](https://developer.mozilla.org/en-US/docs/Web/Events/DOMContentLoaded)
- [MDN `addEventListener` Reference](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)
- [MDN Article on `Event`](https://developer.mozilla.org/en-US/docs/Web/API/Event)
- [MDN Article on the `submit` event](https://developer.mozilla.org/en-US/docs/Web/Events/submit)
- [MDN Article on `input` tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input))
- [MDN Article on `createElement`](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)
- [MDN Article on `textContent`](https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent)
- [MDN Article on Dataset](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dataset)
- [JavaScript.info Article on Event Bubbling](https://javascript.info/bubbling-and-capturing)

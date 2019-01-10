# Ajax and Fetch

(Not this kind of AJAX)

![AJAX soap][ajax-soap-bottle-img]

---

## Objectives
- Distinguish between synchronous and asynchronous code
- Recognize code that uses `Promises`
- Use the `.then` method to add handlers for promise resolution
- Use the options to `fetch()` to configure HTTP requests

## What Does Synchronous/ Asynchronous Mean 🕰

- Javascript is _synchronous_
  - It executes statements **one at a time**
- But... sometimes things take a long time (such as making an HTTP Request)
  - We don't want these things to block UI rendering
  - If we are waiting for javascript to run some time-consuming function, the page is not responsive. Our users will get upset and leave us 1 Star 🌟 reviews. Our bosses will get mad and we will be sad 😔

```javascript
function sleep(n) {
  let i = 0
  while(i < (12 ** 8) * n) {
    i++
  }
}

console.log('Starting the sleep function')
sleep(10)
console.log('Wow that sleep function took forever to run. 1 Star 🌟')
```

- Instead of waiting for things to happen _synchronously_, we want to have some code run later so that our UI rendering isn't blocked.
- We've already seen some JS functions that help us with this:
  - Callback functions as handlers for event listeners
  - `setTimeout` and `setInterval`
- That code runs _asynchronously_

## Examples of Sync and Async code
- Let's take a look at some examples of synchronous and asynchronous code

Synchronous:
  - Most of ruby
  - `sleep`, `RestClient.get`

Asynchronous:
  - `setTimeout` and `setInterval`
  - event listeners
  - `fetch` requests (more on that soon)

---

- [`Promises`][mdn-promises] are another way of writing asynchronous code

## What is a Promise?

- "The Promise object represents the eventual completion (or failure) of an asynchronous operation, and its resulting value." - [mdn article on promises][mdn-promises]
- In other words, they represent the **promise** of a particular value that we do not yet have.
  - For example, part of your morning routine might involve making coffee. You _could_ start your coffee maker and sit while it heats up and brews coffee for you. **Or** you could start the machine knowing that it will _eventually_ give you some coffee. You can let the coffee machine run _asynchronously_ **then** drink the coffee once that operation is complete.
  - Promises just represent **some data** we will have at a later time. This is especially useful when making HTTP requests that take an arbitrary amount of time to complete.

---


## What Does AJAX Mean?

- "Asynchronous JavaScript + XML, while not a technology in itself, is a term coined in 2005 by Jesse James Garrett, that describes a 'new' approach to using a number of existing technologies together, including HTML or XHTML, Cascading Style Sheets, JavaScript, The Document Object Model, XML, XSLT, and most importantly the XMLHttpRequest object.
When these technologies are combined in the Ajax model, web applications are able to make quick, incremental updates to the user interface without reloading the entire browser page. This makes the application faster and more responsive to user actions.
Although X in Ajax stands for XML, JSON is used more than XML nowadays because of its many advantages such as being lighter and a part of JavaScript. Both JSON and XML are used for packaging information in Ajax model." -[MDN Article on AJAX][mdn-ajax]

- "What AJAX allows you to do is just update parts of the DOM of a HTML webpage instead of having to reload the entire page. AJAX also lets you work asynchronously, meaning your code continues to run while that part of your webpage is trying to reload (compared to synchronously which will block your code from running until that part of your webpage is done reloading)." - [MDN Glossary on AJAX][mdn-ajax-glossary]


- Recall the request/response cycle; we do not know ahead of time how long an HTTP request will take to complete:

![http request/response cycle](https://raw.github.com/site2site/site2site.github.io/master/images/lectures/client-server-model/client-server-2.gif)

---


### Example of Promises with Fetch
- Let's see some real-live promises!
- We're going to use `fetch`, which is a function for sending HTTP requests
(in the console:)

```javascript
const url = "https://dog.ceo/api/breeds/image/random"
const promise = fetch(url, { method: 'GET' })
console.log(promise)
```

- In the snippet above, we're sending an HTTP `GET` request to our url using `fetch`. Note that if we don't specify the HTTP verb (`GET`, `POST`, `PUT/PATCH`, `DELETE`) `fetch` will default to a `GET` request.

- See that the `promise` object doesn't have the _response_ but is instead a _box with the response inside_
  - Whenever we're dealing with promises, the data will always be contained **within the promise object itself**
- If only there were some way to send an _asynchronous_ HTTP request using `fetch` and **then** do something once our **promise** resolved.
- Promises include this functionality: `.then` - We can add a handler that runs when the response arrives (once our promise **resolves**)

```javascript
function afterResolved() {
  console.log('resolved')
}
promise.then(afterResolved)
```

* `.then` is like adding an event handler - it has code to run later
* But we can also still see the promise itself - we have the object!

```js
function otherFunction() {
  console.log('another thing!?!?')
}
promise.then(otherFunction)
```

---

### Promise Methods: `then` and `catch`

* `then` is a little bit different from event listener callbacks.
* `then` is Chainable:

```js
const promise = fetch(url)
console.log(promise)
.then(() => console.log('resolved'))
.then(() => console.log('after logging resolved'))
.then(() => console.log('after logging after resolved'))
```

_Common Bug_: evaluating a function instead of passing it to `then`

Q: When will the message be logged?
```js
const promise = fetch(url)
promise.then(console.log("message"))
```

A: Before the fetch resolves!

The fix is to use an anonymous function (with the `function` keyword or an arrow)
  - `.then` is expecting a **reference** to a function that it will invoke once the promise is resolved. Please please please please do not invoke your method directly within your `.then` as shown in the example above
  - Like event listeners, `.then` is expecting a function **definition** not **invocation**. It will run your function **once the promise has resolved**.

* Error Handling with `catch`
* If there's an error on the other end of the fetch, you can handle the error with `catch`

```js
fetch("https://www.google.com")
.then(res => console.log(res))
.catch(error => console.log("Here's the error:", error))
```

* The cool bonus that we get from `catch` - if there's an error somewhere in our `then` handler, we'll catch that too!

### An Intro to `fetch`
* Let's take a closer look at the `fetch` method.

```js
fetch("https://dog.ceo/api/breeds/list/all")
.then(res => console.log(res))
```

* We get back a Promise from `fetch`, which we can add handlers to with `then`
* The handler that we pass to `then` gets a `Response` object
* We can call the `.json` method on the `Response` to get a promise for the parsed json from the response

```js
fetch("https://dog.ceo/api/breeds/list/all")
.then(res => res.json())
.then(json => console.log(json))
```

* If the response is not formatted as JSON, we can use other methods such as `.text` to parse the response, depending on the _type_ of data sent back to us.

```js
fetch("https://dog.ceo/api/breeds/list/all")
.then(res => res.text())
.then(text => console.log(text))
```

## Challenge

- Take a look at the Dog CEO Challenge lab on Learn: `The Web -> Accessing Remote APIs with JavaScript -> Fetch Intro Dog CEO Challenge`
---

## External Resources

- [What the heck is the Event Loop **make sure you watch this video at least once**][loupe-site]
- [MDN Article on Promises][mdn-promises]
- [We have a Problem with Promises][problem-promises]


<!-- dank markdown variables -->

[loupe-site]: http://latentflip.com/loupe
[mdn-wep-apis]: https://developer.mozilla.org/en-US/docs/WebAPI
[mdn-promises]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
[problem-promises]: https://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html
[mdn-ajax]: https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX
[mdn-ajax-glossary]: https://developer.mozilla.org/en-US/docs/Glossary/AJAX
[ajax-soap-bottle-img]: https://lh3.googleusercontent.com/proxy/Vk9lqnU5DizCra628qXRwitYNWl40WLt2K_WeA5oZaMZf3dx8c_RA9wuPKj2_aY5pASPLPN3PKscfIaZ4Kkc8MeN2AfUk5ZAoOGao3RcIRNJXHCE8CpntjuCEx73s41MBoO5hYsk-vuWvQt7NCIf9xTZxGZWFaJ0DKRYM0M2jLAG7Z3XAClxcR9ZisVLuE2zF5qSVoYGASVQEiErLI8=s1600-pd-e365-rw-pc0xffffff

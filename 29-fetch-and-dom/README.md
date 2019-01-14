### Full CRUD with AJAX feat. Pokemon


Gotta Fetch'em All!
===================

![pikachu](https://media.giphy.com/media/W04QVzelTHsNW/giphy.gif)

## SWBATs

- [ ] Understand why we request data asynchronously
- [ ] Create `fetch` requests (including `GET`, `POST`, `PATCH`, `PUT`, `DELETE`)
- [ ] Manipulate the DOM in conjunction with `fetch` calls
- [ ] Understand optimistic vs pessimistic rendering

## Objectives

Building off of yesterday's application...

### Deliverables (User Stories)

Expand the functionality of the JS Pokemon Search Assignment!

- [ ] As a user, I should see all the Pokemon
- [ ] As a user, I should be able to delete a Pokemon on click of a button
- [ ] As a user, I should be able to create your own Pokemon
- [ ] As a user, I should be able to edit a clicked Pokemon

These changes should _persist_ in our database.

### Mocking your own API

- Our "server" is being faked with a package called [json-server](https://github.com/typicode/json-server). This package uses a local file, `db.json` to spin up a RESTful JSON API in about 30 seconds. To run your server:
  - `$ npm install -g json-server` this will install the node package (similar to a gem) globally `-g` on your machine
  - `$ json-server --watch db.json` this spins up the server, it will default to `localhost:3000`

### Sample Markdown

- We've also included a sample of the HTML that you can use to style your pokemon cards:

```html
<div class="pokemon-container">
  <div style="width:230px;margin:10px;background:#fecd2f;color:#2d72fc" class="pokemon-frame">
    <h1 class="center-text">ivysaur</h1>
    <div style="width:239px;margin:auto">
      <div style="width:96px;margin:auto">
        <img data-id="2" data-action="flip" class="toggle-sprite" src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png">
      </div>
    </div>
  </div>
</div>
```

---

## Lecture Notes

### Single Page Applications (SPA)

**Why** are we doing all of this with `fetch`? 🤷

* We want to make our User Experience (UX) feel smooth and responsive.
* No more refreshing!
* No more request <=> response for every action we want to perform.
* Instead, we will load (new) content onto the page and make changes with JavaScript.
  * Changes will be made with `fetch` and it will be asynchronous.
* For example, like Twitter
  * => No refreshing; things just happen!
  * Sometimes we have to wait, but we can have indicators to show us that stuff is happening rather than waiting for the page to refresh.

### From CRUD to FETCH

Persisting data/change? Well _crud_... how do we do that? 🤔

| CRUD              | FETCH         |
| ----------------- | ------------- |
| Create            | POST          |
| Read              | GET           |
| Update            | PATCH or PUT  |
| Delete / Destroy  | DELETE        |

[Documentation of using Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

`PUT` vs `PATCH`

The existing HTTP PUT method only allows a complete replacement of a document. This proposal adds a new HTTP method, PATCH, to modify an existing HTTP resource.

### JSON Server Routes

Minimal explanation of our API:

```
GET    /pokemon
GET    /pokemon/1
POST   /pokemon
PUT    /pokemon/1
PATCH  /pokemon/1
DELETE /pokemon/1
```

To `POST` a new Pokemon:

```
body: JSON.stringify({
  "height": 10,
  "weight": 130,
  "id": 2,
  "name": "ivysaur",
  "abilities": ["overgrow", "chlorophyll"],
  "moves": [],
  "stats": [
    {
      "value": 80,
      "name": "special-defense"
    },
    {
      "value": 80,
      "name": "special-attack"
    },
    {
      "value": 63,
      "name": "defense"
    },
    {
      "value": 62,
      "name": "attack"
    },
    {
      "value": 60,
      "name": "speed"
    },
    {
      "value": 60,
      "name": "hp"
    }
  ],
  "types": ["grass", "poison"],
  "sprites": {
    "front": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
    "back": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png"
  }
})
```

### Fetching ⚾️ <== 🐕

**About**

* `fetch` is a _Promise_ and it is promising to do something **if** it returns
  * There is **NO** guarantee of when it will come back!
  * There is **NO** guarantee if it even comes back at all!
  * Remember, the _Promise_ is a _lie_!!
* We **want** `fetch` to be **asynchronous _BECAUSE_**:
  * **If** `fetch` calls were **synchronous**, we would be stuck waiting for the call to finish before the code could proceed.
  * So **rather than _blocking_** any other JavaScript from running, we want `fetch` calls to be asynchronous and to execute when it comes back.

**Usage**

* `body` data **HAS** to be a string in a `POST`, `PUT`, or `PATCH` `fetch` call.
* You need `headers` in `POST`, `PUT`, or `PATCH` to tell the server what kind of content (`Content-Type`) you are sending to it. For example:
  * `'Content-Type': 'application/json'` is telling the server that you are sending a string of JSON in the `body` of your `fetch` request.

### Optimistic vs Pessimistic Rendering

#### Optimistic

* You can manipulate the DOM synchronously (outside the `.then()`).
* This is referred to as optimist rendering because you are **not waiting** for the async response to resolve.

**Pros**:
* Super responsive! User Experience++!

**Cons**:
* `fetch`es (aka: the "Promise") can lie!! If the `fetch` fails, data can become out of sync.
* `fetch`es are also **NOT** guaranteed to run in order.
  * What if we create a Pokemon and then update it relying all on optimistic rendering? The `PATCH` might reach the server _before_ your `POST`!!

Very interesting example of optimistic rendering that is handled _robustly_: **Reddit**

> When you vote, your vote isn’t instantly processed—instead, it’s placed into a queue.
>
> Source: [Caching at Reddit](https://redditblog.com/2017/1/17/caching-at-reddit/)

[Hacker News commenter's insight](https://news.ycombinator.com/item?id=13433793):

> I remember looking into this a while ago and was bewildered to find that when I upvoted or downvoted, there was no XHR call to the backend! There was no hidden iframe/image, no silent form post. Absolutely no network activity. Yet when I refreshed, my vote was shown correctly. I thought I was going crazy.
>
> This was long ago so I'm a bit fuzzy on the details but after a bit of digging, I found the most elegant data collection technique I've ever seen. Instead of sending network data when I voted, a local cookie was set with the link id and vote value. Then when I went to another page, my browser naturally sent the cookie to the server, where I believe it was processed, and then a fresh cookie was sent back to my browser. I could vote on 10 links, the local cookie would get large and then on the next page refresh, the backend would receive my batch of votes, process them, and send me a fresh cookie again.

#### Pessimistic

* You can manipulate the DOM asynchronously (inside the `.then()`) using the response from the server.
* Doing this is called pessimistic rendering because you **are waiting until** the async response has return to complete the action.
* This is to make sure the data on your page is consistent with the database.

**Pros**:
* What is reflected in the _client_ will always be in sync with the _server_.

**Cons**:
* If the `fetch` is slow, the UI will appear to not respond! (**hint** maybe good UX will signal to the user that something is happening)

Example of a feature you might want to always do pessimistically: **user signup**

* Think about registration forms on the web. What to do they normally all do?
  * Disable things once you submit?
  * Show a spinner?
  * Anything else?

### Updating the DOM

As the developer, _it is your job to decide to do either optimistic or pessimistic rendering_. You must then remember to update the data **everywhere** that it is kept. At a **minimum**, this means:

1. `fetch` for making changes to your database
2. DOM manipulation for updating what the user sees in the browser

_But wait, there's more!_

3. Did you store any data in global variables?
  * Update it!

These steps are you being aware of _how_ **your** application is built.

**Considerations** for #1, #2, #3, etc...:

1. Where should you put that `fetch`?
  * When do you want it to be sent? 🤔
  * Perhaps on some sort of `event`? 🤔🤔
  * Maybe I can _listen_ for a certain type of `event`? 🤔🤔🤔
  * I wonder where I can _add_ that _`event`_ _listener_? 🤔🤔🤔🤔
  * Maybe somewhere where we can _delegate_ that responsibility? 🤔🤔🤔🤔🤔
2. How can we update the DOM?
  * JavaScript has a **TON** of ways to accomplish the same task. Some are more hacky than others. Some are better than others. However, **always** remember: Red, Green, Refactor!
  * **Do what you know** to work before you try and make it better!
  * Some example strategies for manipulating the DOM:
    * Rerender is all! 🙌
    * `appendChild` 🤱 (just make sure to construct the whole node to append)
    * Add to `innerHTML` +=
    * `event.currentTarget` to find what the event listener is attached to (where everything bubbles up to) 👂
    * Climbing the tree 🧗‍🌲:
      * `event.target.parentElement` or `event.target.parentNode` for looking up the tree ([difference](https://stackoverflow.com/questions/8685739/difference-between-dom-parentnode-and-parentelement))
      * `event.target.children` for looking down the tree
    * `removeChild` 😵
    * Learn to use the MDN docs!
3. This is just pure JavaScript. Change your global data using things like `filter`, `push`, etc.
  * **HOWEVER!** Remember to take note of which methods are _Pure Functions_ and which are NOT!
  * If you don't remember, look it up! Google, StackOverflow, MDN, think of them as your "phone a friend". ☎️
  * For example: `filter` does not mutate while `push` does! Consistency? Naming conventions? What do you think we are, Ruby? 💎🤣

**Et cetera!**

As you are adding functionality (those things above), there will be times where you will need to add, remove, or change the base HTML in order to be able to accomplish the task. Remember that you are the developer. **You get to decide how the HTML looks!**

For example:

- new elements (`<button>`, `<form>`)
- more attributes (`data-id`, `data-action`)
- renaming attributes that make no sense (class: `pokemon-container` => `pokemon-card`)

```html
<div data-id="1" class="pokemon-card">
  <div style="width:230px;margin:10px;background:#fecd2f;color:#2d72fc" class="pokemon-frame">
    <h1 class="center-text">bulbasaur</h1>
    <div style="width:239px;margin:auto">
      <div style="width:96px;margin:auto">
        <img name="flip" data-id="1" data-action="flip" class="toggle-sprite" src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png">
      </div>
    </div>
    <button data-action="delete" class="pokebutton" style="width: 230px;margin:auto;">Delete</button>
  </div>
</div>
```

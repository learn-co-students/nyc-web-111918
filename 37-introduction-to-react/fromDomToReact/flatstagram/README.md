# Introduction to React

## Lesson agenda

- [ ] What is React? (three core paradigms)
- [ ] Preliminary understanding of how data flows in React applications. (Flux pattern)
- [ ] Convert a Vanilla JS element created with `document.createElement` into a React component
- [ ] See what a React Component actually is (a plan JS object)
- [ ] What is JSX
- [ ] Create React elements using JSX (including conditional rending and re-usable components)
- [ ] Understand how create-react-app
- [ ] See how props are to components as arguments are to functions

## Lessons notes

### What is React

React is a **a JavaScript library for building user interfaces**.

Let remember that React is simply JavaScript(ish).

React is:

- Declarative (Map state to UI / 'implicit' updates)
- Component-Based (encapsulation model)
- _Learn Once_, Write Anywhere (re-usable paradigm, React vs ReactDOM)

### React's data flow (influenced by Flux)

[Flux: the React.js Application Architecture — A Comprehensive Study](https://medium.com/@cabot_solutions/flux-the-react-js-application-architecture-a-comprehensive-study-fd2585d06483)

### Convert a Vanilla JS element created with `document.createElement` into a React component (using script tags)

Inspect the React component in the console

### What is JSX

JSX is a syntax extension to JavaScript.

> React embraces the fact that **rendering logic is inherently coupled with other UI logic: how events are handled, how the state changes over time, and how the data is prepared for display**.

> **Instead of artificially separating technologies by putting markup and logic in separate files, React separates concerns with loosely coupled units called “components” that contain both**. We will come back to components in a further section, but if you’re not yet comfortable putting markup in JS, this talk might convince you otherwise.

- It's **syntatic sugar** for `React.createElement`.
  - Note that JSX won't actually work in browser console!!
  - It's translated by Babel into regular JavaScript.
- rules, differences with HTML
  - Upper case = Component
  - Lower case = HTML to render to DOM
  - Attributes = camelCase
  - Attributes = serve double duty as `props`
  - Declarations in-between open & Close Tags = `children`
- HTML vs Components
  - Lower vs Upper case
  - What gets rendered? Let's inspect it!
- expressions = `{ }`
  - Expressions Evaluate
  - [Expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#Expressions): An expression is any valid unit of code that resolves to a value.

**JSX Attributes Example:**

- Attributes we'll see are also our `props` for Components.
- They need some value assigned to them which is either a string or whatever an expression, `{}`, evaluates to.

```javascript
import logo from "./logo.svg";

// ... somewhere in render

<img src={logo} alt="some image" />;
```

### JSX Extras / Gotchas

Commenting in JSX

- `{/* commented */}`

Any JavaScript reserved words have special names in JSX attributes:

- `class` => `className`
- `for` => `htmlFor`

Data and aria attributes are special. They keep kebab-casing:

- `data-attribute`
- `aria-attribute`

### A simple approach to Webpack (`create-react-app`)

```sh
npm install -g create-react-app
create-react-app app-name
```

- Anatomy of a `create-react-app`:
  - `public` => folder containing files served by our web server
  - `src` => all of our React code
    - `index.js` => entry point to the React app; this has `ReactDOM.render` which puts all of our code into the DOM element we tell it to put it into (in our case, `<div id="root">`)
    - `App.js` => our root React component; all apps will have it
    - `App.css`, `index.css` => css files
    - `App.test.js` => test file
    - `registerServiceWorker.js` => helper file for cache stuff
  - `.gitignore` => git ignore
  - `package.json` => your "Gemfile"
  - `README.md` => readme file
- Benefits to using it:
  - Hot Reloading
  - Easily add dependencies

### Simplest Component:

```javascript
import React, { Component } from "react";

class App extends Component {
  render() {
    return <h1>Hello World!</h1>;
  }
}

export default App;
```

- `React` import is needed in any file where you use JSX.
- `render()` method is required in a Component as that's what will be called to figure out what to eventually render in the browser.

### Styling components

p.s. Style declarations are not vender prefixed

- [Styled components](https://www.styled-components.com/docs/basics)
- [emotion](https://emotion.sh/)
- [glamorous](https://glamorous.rocks/)

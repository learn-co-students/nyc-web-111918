# React Higher Order Component (HOC)

## Objectives

- Why? Some background:
  - Factory Pattern
  - Composition vs Inheritance
- Higher Order Functions
- Higher Order Components
- withAuth
- withLoading
- withAd

## Resources

- [Composition over Inheritance (Fun Fun Function)](https://www.youtube.com/watch?v=wfMtDGfHWpA)
- [Composition vs Inheritance (React Docs)](https://reactjs.org/docs/composition-vs-inheritance.html)

## Lecture Notes

### withRouter (LogoutButton)

[`withRouter` documentation](https://reacttraining.com/react-router/web/api/withRouter)

```javascript
import React from "react";
import { withRouter } from "react-router";
import Adapter from "./Adapter";

const LogoutButton = ({ to = "/login", history }) => (
  <button
    className="logout-button"
    onClick={() => {
      Adapter.logout();
      history.push(to);
    }}
  >
    Logout
  </button>
);

export default withRouter(LogoutButton);
```

### withAuth

What this does:

- It protects our route from directly being accessed.
- If you try to access `/login` directly, it will redirect you correctly.

The below is functionally equivalent. It's what the previous class came up with.

```javascript
import React from "react";
import Adapter from "../components/Adapter";

function withAuth(WrappedComponent) {
  return class extends React.Component {
    // Functionality #1
    // ================
    // We want every component that uses withAuth
    //   (aka: requires_login if we're thinking
    //   about how we named it in Rails)
    // to kick the user back to / if they are already
    // logged in.
    // This is for our LoginForm and RegistrationForm.
    componentDidMount() {
      // This is what we wrote in class.
      if (Adapter.isLoggedIn()) {
        console.log("redirect me!");
        this.props.history.push("/");
      }
    }
    // Functionality #2
    // ================
    // Try this on your own!
    //
    // Imagine we want to have a HOC, this one or another,
    // that protects pages that require logins.
    // So when visiting those pages, instead of pushing "/",
    // we instead push them to "/login".
    // How would you go about designing this???
    // Would you want to rename this HOC?

    render() {
      return <WrappedComponent {...this.props} />;
    }
  };
}

export default withAuth;
```

### withLoading

```javascript
import React from "react";

// Explanation
// ===========
// Higher Order Components can take more than just another
// component as args/params.
// The common pattern we want to abstract in withLoading
// is the idea that we need to:
//     do a setState after a fetch in componentDidMount
// That's what we'll abstract away here and instead
// of rendering an empty array, we'll show a loading gif instead!

// To Test It
// ==========
// Throw a byebug in the controller actions for snacks and my snacks.
// While in byebug, we should see the loading GIF.
// If you then type `continue` in byebug to continue with the action,
// data should be sent back and we should see our loading component!

// dataLoader should be a Promise that we can run in componentDidMount.
// It's result is the data we will now pass down as props into
// our component. That way, the component can initialize state with
// data without ever having to render [] or do anything with componentDidMount.
function withLoading(WrappedComponent, dataLoader) {
  return class extends React.Component {
    state = {
      isLoading: true, // Until this is flipped, we show the GIF.
      data: null // Eventual data we get back from dataLoader
    };

    // What we've now abstracted.
    componentDidMount() {
      dataLoader().then(data => {
        // <-- Got our data back.
        this.setState({ data }, () => {
          // <-- Set our data.
          // In callback.
          // data is set, so let's flip the switch and render WrappedComponent
          this.isLoaded();
        });
      });
    }

    // Method to flip the switch.
    isLoaded = () => {
      this.setState({
        isLoading: false
      });
    };

    render() {
      // Show a GIF while not loaded.
      if (this.state.isLoading) {
        // return <p>Spinny GIF</p>
        // I found a spinny gif!
        return (
          <img
            alt="Spinny GIF"
            src="https://cdn-images-1.medium.com/max/1600/1*9EBHIOzhE1XfMYoKz1JcsQ.gif"
          />
        );
      } else {
        // If we get here, then this.state.data has something to pass down.
        // So we pass it down as a prop called initialData.
        // Every component that uses this HOC will get some initialData.
        return (
          <WrappedComponent {...this.props} initialData={this.state.data} />
        );
      }
    }
  };
}

export default withLoading;
```

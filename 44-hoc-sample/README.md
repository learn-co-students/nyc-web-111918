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

## Lecture Notes (foodini app)

Our eventual `App` component:

```javascript
export default withRouter(
  withAuth(
    withLoading(
      App,
      id => {
        return Adapter.getUserRecipes(id).then(res => {
          return res.map((r, idx) => {
            return { ...r, id: idx + 1 };
          });
        });
      },
      true
    )
  )
);
```

### withAuth

Our `withAuth` does the following:

- Redirects if no token exists.
- Validates a token if it exists.
- Passes along `userId` and `username` as props if token is valid.
- Redirects if the token is invalid.

This allows it to fully protect routes that require auth + more to make it robust.

```javascript
import React, { Component } from "react";
import Adapter from "../Adapter";

function withAuth(WrappedComponent, redirect = "/login") {
  return class extends Component {
    state = {
      userId: null,
      username: null,
      loading: true
    };

    componentDidMount() {
      if (!Adapter.getToken()) {
        this.setState({ loading: false });
        this.props.history.push(redirect);
      } else {
        this.validateToken();
      }
    }

    validateToken = () => {
      Adapter.getCurrentUser()
        .then(json => {
          this.setState({
            userId: json.id,
            username: json.username,
            loading: false
          });
        })
        .catch(err => {
          Adapter.deleteToken();
          this.setState(
            {
              loading: false
            },
            () => {
              this.props.history.push(redirect);
            }
          );
        });
    };

    render() {
      if (this.state.loading) {
        return (
          <img
            alt="Spinny GIF"
            src="https://cdn-images-1.medium.com/max/1600/1*9EBHIOzhE1XfMYoKz1JcsQ.gif"
          />
        );
      } else {
        return (
          <WrappedComponent
            {...this.props}
            userId={this.state.userId}
            username={this.state.username}
          />
        );
      }
    }
  };
}

export default withAuth;
```

### withLoading

Our `withLoading` can execute and run a loader to:

- Pass along `initialData` as a prop.
- Combo with `withAuth` and use an expected `userId` if the loader requires auth.

```javascript
import React, { Component } from "react";

function withLoading(WrappedComponent, dataLoader, requiresAuth = false) {
  return class extends Component {
    state = {
      initialData: null,
      isLoaded: false
    };

    componentDidMount() {
      if (!requiresAuth || (requiresAuth && this.props.userId)) {
        dataLoader(this.props.userId).then(result => {
          this.setState({
            initialData: result,
            isLoaded: true
          });
        });
      } else {
        this.setState({
          isLoaded: true
        });
      }
    }

    render() {
      if (this.state.isLoaded) {
        return (
          <WrappedComponent
            {...this.props}
            initialData={this.state.initialData}
          />
        );
      } else {
        return (
          <img
            alt="Spinny GIF"
            src="https://cdn-images-1.medium.com/max/1600/1*9EBHIOzhE1XfMYoKz1JcsQ.gif"
          />
        );
      }
    }
  };
}

export default withLoading;
```

### withAd

```javascript
import React, { Component } from "react";
import Ad from "../Ad";

function withAd(WrappedComponent, trackedElements = ["A", "BUTTON"]) {
  return class extends Component {
    constructor(props) {
      super(props);

      this.trackedElements = trackedElements;

      this.state = {
        clicks: 0,
        showAd: false
      };
    }

    toggleAd = () => {
      this.setState({
        showAd: !this.state.showAd
      });
    };

    adTracker = () => {
      this.setState({
        clicks: this.state.clicks + 1
      });
    };

    componentDidUpdate(prevProps, prevState, snapshot) {
      if (this.state.clicks === 3 && !this.state.showAd) {
        this.setState({
          clicks: 0,
          showAd: true
        });
      }
    }

    // onClick and onClickCapture both work; they just behave slightly differently
    // See:
    //   https://reactjs.org/docs/events.html#supported-events
    //   https://stackoverflow.com/questions/34522931/example-for-bubbling-and-capturing-in-react-js
    handleClickCapture = event => {
      // debugger;
      // console.log('tracking user actions', event.nativeEvent, event.target.tagName, event.target.nodeName, event.target.className);

      if (this.trackedElements.includes(event.target.nodeName)) {
        this.adTracker();
      }
    };

    render() {
      if (this.state.showAd) {
        return <Ad toggleAd={this.toggleAd} />;
      } else {
        return (
          <div onClickCapture={this.handleClickCapture}>
            <WrappedComponent {...this.props} adTracker={this.adTracker} />
          </div>
        );
      }
    }
  };
}

export default withAd;
```

## Lecture Notes (Generic)

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

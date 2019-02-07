import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";
import {
  BrowserRouter as Router,
  Route,
  Link,
  NavLink,
  Switch
} from "react-router-dom";
import Home from "./Home";
const AboutUs = props => <h1>About us</h1>;
const ChickenNuggest = props => <h1>Evans - Coach!</h1>;

const Nav = props => (
  <nav>
    <NavLink exact to="/" activeClassName="selected-link">
      Home
    </NavLink>
    <NavLink exact to="/chickennuggest" activeClassName="selected-link">
      Chicken Nuggest
    </NavLink>
    <Link to="/about">About us</Link>
  </nav>
);

const todos = [
  { id: 1, todo: "Learn react router" },
  { id: 2, todo: "Finish CSS" }
];

const Todos = props => {
  console.log(props.match.params);
  const todo = todos.find(
    toDoObj => toDoObj.id === parseInt(props.match.params.toDoId)
  );
  console.log("The todo obj will be :", todo);
  return <h1>{todo.todo}</h1>;
};

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <Nav />

          <Route path="/about" component={AboutUs} />
          <Route exact path="/" component={Home} />
          <Route exact path="/todos/:toDoId" component={Todos} />

          <Route exact path="/chickennuggest" component={ChickenNuggest} />
        </div>
      </Router>
    );
  }
}

export default App;

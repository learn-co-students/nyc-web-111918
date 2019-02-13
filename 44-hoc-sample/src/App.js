import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

let counter = 0;

function getDisplayName(WrappedComponent) {
  return WrappedComponent.displayName || WrappedComponent.name || "Component";
}

const Header = props => <h1>My todo list</h1>;

const withRelaxation = Component => {
  class WithRelaxation extends React.Component {
    state = { clickCounter: 0 };

    incrementCounter = () => {
      this.setState({ clickCounter: ++this.state.clickCounter });
    };

    render() {
      //const C = component;
      //debugger;
      console.log("In WithRelaxation. Props are :", this.props);
      console.log("This is action number ", ++counter);
      return (
        <div onClick={this.incrementCounter}>
          {this.state.clickCounter > 2 ? (
            <li>Relax. Time to fly to Miami</li>
          ) : (
            <Component {...this.props} />
          )}
        </div>
      );
    }
  }

  WithRelaxation.displayName = `WithRelaxation(${getDisplayName(Component)})`;

  return WithRelaxation;
};

const Todo = props => {
  //debugger;
  console.log("This is action number ", ++counter);
  return <li>{props.todo}</li>;
};

const ToDoWithRelaxation = withRelaxation(Todo);

const HeaderWithRelaxation = withRelaxation(Header);

class App extends Component {
  state = {
    todos: ["Set state", "HOC Lecture", "Lunch"]
  };

  render() {
    //debugger;
    console.log("This is action number ", ++counter);
    return (
      <div className="App">
        <HeaderWithRelaxation />
        {this.state.todos.map(t => (
          <ToDoWithRelaxation key={t} todo={t} />
        ))}
      </div>
    );
  }
}

export default App;

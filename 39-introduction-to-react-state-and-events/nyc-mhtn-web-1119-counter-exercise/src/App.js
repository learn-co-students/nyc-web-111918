import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  state = {
    number: 0
  };

  render() {
    return (
      <div className="App">
        <h1>The current number is {this.state.number}</h1>
        <h2>+</h2>
        <h2>-</h2>
      </div>
    );
  }
}

export default App;

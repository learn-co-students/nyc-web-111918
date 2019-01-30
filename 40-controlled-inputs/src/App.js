import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  state = {
    valueOne: "",
    valueTwo: ""
  };

  handleChange = event => {
    console.log("In handleChange. `this` is ", this);
    //debugger;
    console.log("In handle change. Event is :", event);
    this.setState({ [event.target.name]: event.target.value }, () => {
      console.log("Updated state is :", this.state);
    });
  };

  handleSubmit = e => {
    console.log("Event ", e);
    e.preventDefault();
    console.log(
      "The greeting is :",
      `${this.state.valueOne} ${this.state.valueTwo}`
    );
  };

  render() {
    console.log("In Render. Props are :", this.props);
    console.log("In Render. State is :", this.state);
    return (
      <form onSubmit={this.handleSubmit}>
        Greeting :
        <input
          name="valueOne"
          onChange={this.handleChange}
          type="text"
          value={this.state.valueOne}
        />
        Name:
        <input
          name="valueTwo"
          onChange={this.handleChange}
          type="text"
          value={this.state.valueTwo}
        />
        <button type="submit">Say greeting</button>
      </form>
    );
  }
}

export default App;

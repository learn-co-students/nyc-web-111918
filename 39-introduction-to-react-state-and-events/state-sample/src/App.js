import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  // state = {
  //   number: 4
  // };
  constructor(props) {
    super(props);
    this.state = {
      number: props.initialNumber
    };
    // bind this in constructor
    //this.handleIncrement = this.handleIncrement.bind(this);
  }
  // handleClick(event) {
  //   console.log("this is :", this);
  //   console.log("Inside event handler");
  //   console.log("The innerText is :", event.target.innerText);
  //   // console.log("Browser event :", event.nativeEvent);
  //   // console.log("React event :", event);
  //   // console.log("React event :", event);
  //   event.persist();
  //   setTimeout(() => {
  //     console.log("Inside the async fn");
  //     console.log("The innerText is :", event.target.innerText);
  //   }, 2000);
  // }

  // componentDidMount() {
  //   setInterval(() => {
  //     console.log("Before setState. State is  :", this.state.number);
  //     this.setState({ number: this.state.number + 1 }, () => {
  //       console.log("After setState. State is  :", this.state.number);
  //     });
  //   }, 1000);
  // }

  showBatchingHandleIncrement = e => {
    console.log("Inside handleIncrement. This is :", this);
    // console.log(e);
    // console.log(e.target);
    // //this.state.number = this.state.number + 1;

    for (let i = 0; i < 100; i++) {
      console.log("Inside set state");
      // 2nd way of running setState. Send an function (not a obj) that will receive the current state. and should return the next state.
      this.setState(
        prevState => {
          return {
            number: prevState.number + 1
          };
        },
        () => {
          console.log("Updated state is :", this.state.number);
          debugger;
        }
      );
    }
  };

  handleIncrement = e => {
    // 1st way of running setState. Send an obj that describes the new state
    this.setState({ number: this.state.number + 1 });
  };

  render() {
    console.log("In render. New state is :", this.state);
    return (
      <div className="App">
        <h1 onClick={this.handleClick}>Good morning</h1>
        <h1 onClick={this.handleIncrement}>
          The number is {this.state.number}
        </h1>
      </div>
    );
  }
}

export default App;

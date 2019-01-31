import React, { Component } from "react";
import Messages from "./Messages";
import "./App.css";

const apiBaseAddress =
  "http://fetch-message-in-the-bottle.herokuapp.com/api/v2/messages";

class App extends Component {
  state = {
    showMessages: true,
    messages: []
  };

  componentDidMount() {
    fetch(apiBaseAddress)
      .then(r => r.json())
      .then(messages => this.setState({ messages }));
    // setTimeout(() => {
    //   this.setState({ showMessages: false });
    // }, 2000);
  }

  render() {
    return (
      <div className="App">
        <h1>Very very very Cold!</h1>
        {this.state.showMessages && <Messages messages={this.state.messages} />}
      </div>
    );
  }
}

export default App;

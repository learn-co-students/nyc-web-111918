import React, { Component } from "react";

class Messages extends React.Component {
  constructor(props) {
    console.log("In constructor. Props are :", props);
    super(props);
    console.log("In constructor");
    this.state = {
      messages: this.props.messages,
      spammerId: null
    };
  }

  static getDerivedStateFromProps(newProps, state) {
    console.log("In getDerivedStateFromProps", state, newProps);
    return { messages: newProps.messages };
  }

  componentDidUpdate() {
    console.log("In componentDidUpdate");
  }

  componentWillUnmount() {
    clearInterval(this.state.spammerId);
    console.log("In componentWillUnmount. Goodbye");
  }

  shouldComponentUpdate() {
    console.log("In shouldComponentUpdate");
    return true;
  }

  componentDidMount() {
    console.log("In componentDidMount");

    let i = 0;
    const spammerId = setInterval(() => {
      console.log("Inside setInterval. ", ++i);
    }, 300);

    this.setState({ spammerId });
  }

  render() {
    console.log("In render");
    return this.state.messages.map(m => <p key={m.id}>{m.message}</p>);
  }
}

export default Messages;

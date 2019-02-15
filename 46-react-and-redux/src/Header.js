import React, { Component } from 'react'
import logo from './logo.svg'

// renderDescription = () => {
//   // const count = store.getState().count this will have to change
//   const remainder = count % 5;
//   const upToNext = 5 - remainder;
//   return `The current count is less than ${count + upToNext}`;
// };

class Header extends Component {
  render() {
    return (
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 className="App-title">{this.renderDescription()}</h1>
      </header>
    );
  }
}

export default Header

import React, { Component } from 'react';

import Header from './Header'
import Counter from './Counter'

class App extends Component {
  render() {
    return (
      <div className="App">
        <Header />
        <Counter />
      </div>
    );
  }
}

export default App

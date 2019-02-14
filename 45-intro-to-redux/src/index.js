import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import logo from './logo.svg';
import './App.css';

import { createStore } from 'redux'

// whatever this function returns will become the new state
// const reducer = (state = {isSnowing: false}, action) => {
//   console.log('the current state', state);
//   console.log('the current action', action);
//   switch(action.type) {
//     case 'START_SNOWING':
//       return {isSnowing: true}
//     case 'STOP_SNOWING':
//       return {isSnowing: false}
//     default:
//      return state
//   }
  // if (action.type === 'START_SNOWING') {
  //   return {isSnowing: true}
  // } else if (action.type === 'STOP_SNOWING') {
  //   return {isSnowing: false}
  // } else {
  //   return state
  // }
// }

// FROM LECTURE
// const reducer = (state = {count: 99}, action) => {
//   console.log('the current state', state);
//   console.log('the current action', action);
//   switch(action.type) {
//     case 'INCREMENT':
//       return {count: state.count + action.amount}
//     case 'DECREMENT':
//       return {count: state.count - 1}
//     default:
//       return state
//   }
//
// }

const reducer = (state = [{count: 0}, {count: 0},{count: 0},{count: 0},{count: 0}], action) => {
  console.log('the current state', state);
  console.log('the current action', action);

  // REDUCERS MUST BE PURE FUNCTIONS
  // ?? NOT DESTRUCTIVELY CHANGING THE OBJECT
  switch(action.type) {
    case 'INCREMENT':
      return {count: state.count + action.amount}
    case 'DECREMENT':
      return {count: state.count - 1}
    default:
      return state
  }

}

const store = createStore(reducer)

store.subscribe(() => {
  console.log('the new state is', store.getState())
  console.log('----------');
})


class App extends Component {
  render() {
    return (
      <div className="App">
        <Header />
        {store.getState().map((counter, index) => {
          return <Counter index={index} />
        })}
      </div>
    );
  }
}

class Header extends Component {
  render() {
    return (
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 className="App-title">Welcome to React</h1>
      </header>
    );
  }
}

class Counter extends Component {
  // state = { count: 0 };

  componentDidMount() {
    store.subscribe(() => {
      this.setState({})
    })
  }

  increment = (amount) => {
    store.dispatch({type: 'INCREMENT', amount: amount, otherThing: 'hi' })
    // this.setState(prevState => ({ count: prevState.count + 1 }));
  };

  decrement = () => {
    store.dispatch({type: 'DECREMENT'})
    // const dispatch = (action) => {
    //   return reducer(state, action)
    // }
    // this.setState(prevState => ({ count: prevState.count - 1 }));
  };

  // renderDescription = () => {
  //   const count = this.state.count
  //   const remainder = count % 5;
  //   const upToNext = 5 - remainder;
  //   return `The current count is less than ${count + upToNext}`;
  // };

  render() {
    return (
      <div className="Counter">
        <h1>{0}</h1>
        <button onClick={this.decrement}> - </button>
        <button onClick={() => this.increment(1)}> + </button>
        <button onClick={() => this.increment(2)}> +2 </button>
        <button onClick={() => this.increment(5)}> +5 </button>
      </div>
    );
  }
}
// <h1>{store.getState().count}</h1>

// should NOT make 2 new functions, addBy2, addBy5
// we also DO NOT want to call increment 5 times in a loop

// <h3>{this.renderDescription()}</h3>
ReactDOM.render(<App />, document.getElementById('root'));

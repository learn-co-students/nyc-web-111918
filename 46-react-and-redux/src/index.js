import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import './App.css';

import App from './App'

import { createStore } from 'redux'
import { Provider } from 'react-redux'

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

const reducer = (state = {count: 86}, action) => {
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




// <h1>{store.getState().count}</h1>

// should NOT make 2 new functions, addBy2, addBy5
// we also DO NOT want to call increment 5 times in a loop

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);

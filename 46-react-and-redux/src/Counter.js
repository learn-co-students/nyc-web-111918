import React, { Component } from 'react'
import { connect } from 'react-redux'

class Counter extends Component {


  // increment = (amount) => {
  //   // store.dispatch({type: 'INCREMENT', amount: amount, otherThing: 'hi' })
  //   // this.setState(prevState => ({ count: prevState.count + 1 }));
  // };

  // decrement = () => {
  //   // store.dispatch({type: 'DECREMENT'})
  //   // const dispatch = (action) => {
  //   //   return reducer(state, action)
  //   // }
  //   // this.setState(prevState => ({ count: prevState.count - 1 }));
  // };

  // renderDescription = () => {
  //   // const count = store.getState().count
  //   const remainder = count % 5;
  //   const upToNext = 5 - remainder;
  //   return `The current count is less than ${count + upToNext}`;
  // };

  render() {
    console.log('the COUNTER components props are', this.props);
    return (
      <div className="Counter">
        <h1>{this.props.number}</h1>
        <button onClick={() => this.props.decrement(1)}> - </button>
        <button onClick={() => this.props.increment(1)}> + </button>
        <button onClick={() => this.props.increment(2)}> +2 </button>
        <button onClick={() => this.props.increment(5)}> +5 </button>
      </div>
    );
  }
  // <h3>{this.renderDescription()}</h3>
}

// this function when its called is PASSED the state from the redux store

// mapStateToProps
const mapStateToProps = (state) => {
  return {number: state.count}
}

// const mapDispatchToProps = (dispatch) => {
//   // console.log('mystery argument is', mysteryArg);
//
//   return {
//     increment: () => { dispatch({type: 'INCREMENT', amount: 1}) },
//     decrement: () => { dispatch({type: 'DECREMENT', amount: 1}) }
//   }
// }

const mapDispatchToProps = {
  increment: (amount) => ({type: 'INCREMENT', amount}),
  decrement: (amount) => ({type: 'DECREMENT', amount})
}

export default connect(mapStateToProps, mapDispatchToProps)(Counter)

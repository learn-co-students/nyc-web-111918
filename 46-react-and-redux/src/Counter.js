import React, { Component } from 'react'

class Counter extends Component {

  componentDidMount(){
    store.subscribe(() => { this.setState({}) })
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

  renderDescription = () => {
    const count = store.getState().count
    const remainder = count % 5;
    const upToNext = 5 - remainder;
    return `The current count is less than ${count + upToNext}`;
  };

  render() {
    return (
      <div className="Counter">
        <h1>{store.getState().count}</h1>
        <button onClick={this.decrement}> - </button>
        <button onClick={() => this.increment(1)}> + </button>
        <button onClick={() => this.increment(2)}> +2 </button>
        <button onClick={() => this.increment(5)}> +5 </button>
        <h3>{this.renderDescription()}</h3>
      </div>
    );
  }
}

export default Counter

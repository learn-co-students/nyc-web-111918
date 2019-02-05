import React, { Component } from "react";
import SushiContainer from "./containers/SushiContainer";
import Table from "./containers/Table";

// Endpoint!
const API = "http://localhost:3000/sushis";

const addEatenKeyToSushi = o => ({ ...o, eaten: false });

class App extends Component {
  state = {
    sushi: [],
    sushiMenuIndex: 0,
    budget: 100
  };

  handleNextSushi = () => {
    //debugger;
    this.setState({ sushiMenuIndex: this.state.sushiMenuIndex + 4 });
  };

  eatenSushi = () => this.state.sushi.filter(s => s.eaten);

  handleEatSushi = (eatenSushiId, price) => {
    if (this.state.budget >= price) {
      const sushi = this.state.sushi.map(s => {
        if (s.id === eatenSushiId) {
          //return Object.assign({}, s, { eaten: true });
          return { ...s, eaten: true };
        } else {
          return s;
        }
      });
      this.setState({ sushi: sushi, budget: this.state.budget - price });
    } else {
      console.log("Sorry. You need to get hired as a developer to make $");
    }
  };

  componentDidMount() {
    console.log("In componentDidMount");
    fetch("http://localhost:3000/sushis")
      .then(r => r.json())
      .then(rawSushiData => {
        const sushi = rawSushiData.map(s => addEatenKeyToSushi(s));
        //const sushi = rawSushiData.map(addEatenKeyToSushi);
        this.setState(
          prevState => {
            return { sushi };
          },
          () => {
            console.log("The updated state is :", this.state);
          }
        );
      });
  }

  sushiToDisplay = () => {
    return this.state.sushi.slice(
      this.state.sushiMenuIndex,
      this.state.sushiMenuIndex + 4
    );
  };

  render() {
    return (
      <div className="app">
        <SushiContainer
          handleNextSushi={this.handleNextSushi}
          sushi={this.sushiToDisplay()}
          handleEatSushi={this.handleEatSushi}
        />
        <Table eatenSushi={this.eatenSushi()} budget={this.state.budget} />
      </div>
    );
  }
}

export default App;

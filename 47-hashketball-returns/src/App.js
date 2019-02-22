import React, { Component } from 'react';
import './App.css';
import TeamList from './components/TeamList'
import PlayerDetails from './components/PlayerDetails'
import NavHeader from './components/Header'
import 'semantic-ui-css/semantic.min.css';
import { connect } from 'react-redux'


class App extends Component {
  state = {
    // teams: gamesData.teams,
    // selectedPlayer: null
  }

  // handleSelectPlayer = (player) => {
  //  this.setState({
  //    selectedPlayer: player
  //  })
  // }

  render() {
    console.log("IN APP", this.props)
    return (
      <div className="App">
        <NavHeader />
        <TeamList />
        {!this.props.selectedPlayer ? <div> Click Player for Details </div> :
          <PlayerDetails selectedPlayer={this.props.selectedPlayer}/>}
      </div>
    );
  }
}

function msp(state){
  // console.log("MSP", state)
  return {
    selectedPlayer: state.selectedPlayer
  }
}

// function mdp(dispatch){
//  // console.log("MDP", dispatch)
//  return {
//    selectPlayer: (player) => {
//      dispatch({type: "CHANGE_PLAYER", payload: player})
//    }
//    // sortPlayer: () => {
//    //  dispatch({type: "SORT_PLAYERS"})
//    // }
//  }
// }

export default connect(msp)(App);

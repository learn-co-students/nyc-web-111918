import React from "react";
import BotCard from "../components/BotCard";
import { Dimmer, Loader, Modal } from 'semantic-ui-react'
import BotSpecs from "../components/BotSpecs"

class YourBotArmy extends React.Component {
  state = {
    user: null,
    currentViewedBot: null,
  }

  componentDidMount(){
    fetch(`http://localhost:3000/api/v1/users/${this.props.match.params.id}`, {
      headers: {
        "Authorization": localStorage.getItem("token")
      }}
    )
    .then(res => res.json())
    .then(response => {

      if (response.errors){
        alert(response.errors)
      } else {
        this.setState({
          user: response
        })
      }

    })
  }

  seeDetails = bot => {
    this.setState({
      currentViewedBot: bot,
    });
  }

  seeAll = () => {
    this.setState({
      currentViewedBot: null,
    });
  }

  remove = (bot) => {
    console.log("REMOVING: ", bot)

    this.setState({
      currentViewedBot: null,
    });
  }

  render(){
    
    if(!this.state.user){
      return (
        <Dimmer active>
          <Loader>Loading</Loader>
        </Dimmer>
      )
    } else {
      const { botCollection, yourBots, remove } = this.props
      const bots = this.state.user.bots.map((bot,index) => {
        return <BotCard key={index} bot={bot} executeAction={this.seeDetails}/>
      });
      
      return (
          <div>
            <h3>{this.state.user.username + "'s bots"}</h3>
            <div className='ui segment inverted olive bot-army'>
              <div className="ui five column grid">
                <div className="row bot-army-row">
                  {bots}
                </div>
              </div>
            </div>
            <Modal open={!!this.state.currentViewedBot}>
              <Modal.Content>
                <BotSpecs
                  bot={this.state.currentViewedBot}
                  seeAll={this.seeAll}
                  action={"Remove"}
                  enlist={this.remove}
                />
              </Modal.Content>
            </Modal>
          </div>
      )
    }
  }

};

export default YourBotArmy;

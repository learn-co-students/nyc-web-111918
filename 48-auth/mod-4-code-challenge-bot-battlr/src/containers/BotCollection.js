import React from "react";
import BotCard from "../components/BotCard";

class BotCollection extends React.Component {

  render(){

    const {botCollection, view} = this.props

    const bots = botCollection.map((bot,index) => {
      return <BotCard key={index} bot={bot} executeAction={view} />
    });

    return (
    <div className="ui four column grid">
      <div className='row'>
        {bots}
      </div>
    </div>
    )
  }
};

export default BotCollection;

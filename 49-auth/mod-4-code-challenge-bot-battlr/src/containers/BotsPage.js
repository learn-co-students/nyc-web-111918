import React from "react";
import BotCollection from "./BotCollection";
import BotSpecs from "../components/BotSpecs";
import { Modal } from "semantic-ui-react"

class BotsPage extends React.Component {
  state = {
    botCollection: [],
    currentViewedBot: null,
  };

  componentDidMount() {
    fetch("http://localhost:3000/api/v1/bots")
      .then(res => res.json())
      .then(botCollection => this.setState({ botCollection }));
  }

  seeDetails = bot => {
    this.setState({
      currentViewedBot: bot,
    });
  };

  seeAll = () => {
    this.setState({
      currentViewedBot: null,
    });
  };

  enlist = bot => {
    console.log("Enlisting", bot)

    this.setState({
      currentViewedBot: null,
    });
  };

  render() {
    console.log(this.props)
    return (
      <div>
        <BotCollection
          botCollection={this.state.botCollection}
          view={this.seeDetails}
        />
        <Modal open={!!this.state.currentViewedBot}>
          <Modal.Content>
            <BotSpecs
              bot={this.state.currentViewedBot}
              seeAll={this.seeAll}
              action={"Enlist"}
              enlist={this.enlist}
            />
          </Modal.Content>
        </Modal>
      </div>
    );
  }
}

export default BotsPage;

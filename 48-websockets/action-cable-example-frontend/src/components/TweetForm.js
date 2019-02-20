import React, { Component } from 'react';
import adapter from '../services/adapter';

class TweetForm extends Component {
  state = {
    value: ''
  };

  onChange = e => {
    this.setState({
      value: e.target.value
    });
  };

  handleSubmit = e => {
    e.preventDefault();
    adapter.createTweet({ content: this.state.value })
      .then(tweet => {
        this.props.addTweet(tweet)
      })

    this.setState({
      value: ''
    });
  };

  render() {
    return (
      <div className="ui secondary segment">
        <form onSubmit={this.handleSubmit} action="">
          <div className="ui fluid input">
            <input
              onChange={this.onChange}
              value={this.state.value}
              type="text"
            />
            <button className="ui basic blue button" type="submit">
              Add a Tweet
            </button>
          </div>
        </form>
      </div>
    );
  }
}

export default TweetForm;

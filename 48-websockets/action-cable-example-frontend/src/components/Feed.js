import React, { Component } from 'react';
import TweetForm from './TweetForm';
import TweetList from './TweetList';

import adapter from '../services/adapter';

class Feed extends Component {
  state = { displayedTweets: [], newTweets: [] };

  componentDidMount() {
    adapter.fetchFeed(1).then(res => {
      this.setState({ displayedTweets: res.tweets });
    });
  }

  addTweet = tweet => {
    this.setState(prevState => {
      return {
        newTweets: [...prevState.newTweets, tweet]
      };
    });
  };

  handleDisplayTweets = () => {
    this.setState(prevState => {
      return {
        displayedTweets: [
          ...prevState.displayedTweets,
          ...prevState.newTweets
        ],
        newTweets: []
      };
    });
  };

  render() {
    const { displayedTweets, newTweets } = this.state;

    return (
      <div className="Feed">
        <TweetForm addTweet={this.addTweet} />
        <TweetList
          handleDisplayTweets={this.handleDisplayTweets}
          newTweetCount={newTweets.length}
          tweets={displayedTweets}
        />
      </div>
    );
  }
}

export default Feed;

import React from 'react';

const Tweet = ({ tweet }) => {
  return (
    <div className="event">
      <div className="ui card">
        <div className="content">
          <div className="summary">{tweet.content}</div>
          <div className="meta">
            <a className="like">
              <i className="like icon" /> 4 Likes
            </a>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Tweet;

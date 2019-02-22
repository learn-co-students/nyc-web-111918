import React from "react";

const BotCard = props => {
  const { bot, executeAction } = props;
  let botType;

  switch (bot.bot_class) {
    case "Assault":
      botType = <i className="icon military" />;
      break;
    case "Defender":
      botType = <i className="icon shield" />;
      break;
    case "Support":
      botType = <i className="icon ambulance" />;
      break;
    default:
      botType = <div />;
  }

  const execute = (e) => {
    executeAction(bot)
  };

  return (
    <div className ="ui column">
      <div className="ui card" key={bot.id} onClick={execute}>
        <div className="image">
          <img alt="oh no!" src={bot.avatar_url} />
        </div>
        <div className="content">
          <div className="header">
            {bot.name} {botType}
          </div>

          <div className="meta wrap-text">
            <small>{bot.catchphrase}</small>
          </div>
        </div>
        <div className="extra content">
          <span>
            <i className="icon heartbeat"/>
              {bot.health}
          </span>

          <span>
            <i className="icon lightning" />
              {bot.damage}
          </span>
          <span>
            <i className="icon shield" />
              {bot.armor}
          </span>
        </div>

      </div>
    </div>
  );
};

export default BotCard;

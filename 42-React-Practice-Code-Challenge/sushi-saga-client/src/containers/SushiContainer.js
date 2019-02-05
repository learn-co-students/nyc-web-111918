import React, { Fragment } from "react";
import MoreButton from "../components/MoreButton";
import Sushi from "../components/Sushi";

const SushiContainer = props => {
  console.log("In SushiContainer. Props are :", props);
  return (
    <Fragment>
      <div className="belt">
        {props.sushi.map(s => (
          <Sushi
            handleEatSushi={props.handleEatSushi}
            key={s.id}
            sushiData={s}
          />
        ))}
        <MoreButton handleNextSushi={props.handleNextSushi} />
      </div>
    </Fragment>
  );
};

export default SushiContainer;

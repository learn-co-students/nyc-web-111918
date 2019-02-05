import React, { Fragment } from "react";

const Sushi = props => {
  //console.log("In Sushi ", props);
  return (
    <div
      onClick={() =>
        props.handleEatSushi(props.sushiData.id, props.sushiData.price)
      }
      className="sushi"
    >
      <div className="plate" onClick={/* Give me a callback! */ null}>
        {!props.sushiData.eaten && (
          <img src={props.sushiData.img_url} width="100%" />
        )}
      </div>

      <h4 className="sushi-details">
        {props.sushiData.name} - ${props.sushiData.price}
      </h4>
    </div>
  );
};

export default Sushi;

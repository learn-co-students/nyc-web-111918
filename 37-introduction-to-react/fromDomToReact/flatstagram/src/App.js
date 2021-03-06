import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

const imagesLink = [
  `https://scontent-lga3-1.cdninstagram.com/vp/f6ad2bc3ceb71c7e42e3691ae5b03739/5C8D6631/t51.2885-15/sh0.08/e35/c169.0.741.741a/s640x640/46767100_281426832514192_2991488118013558784_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com`,
  `https://scontent-lga3-1.cdninstagram.com/vp/bed5768bd632f79d90711287b29cb8eb/5C9E3B1D/t51.2885-15/sh0.08/e35/c178.0.723.723/s640x640/45395370_952851788438937_6910365168220241920_n.jpg`,
  `https://scontent-lga3-1.cdninstagram.com/vp/d9a165e7d3d4e6daf06c4641ca75e8e5/5CA64985/t51.2885-15/sh0.08/e35/c184.0.712.712a/s640x640/43636766_317527388840315_8724257718497443840_n.jpg`,
  `https://scontent-lga3-1.cdninstagram.com/vp/64ea909588b5616ca0cfee010da575ac/5CAE62CE/t51.2885-15/sh0.08/e35/c160.0.759.759/s640x640/45291093_634037403664972_4239186446897905664_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com`,
  `https://scontent-lga3-1.cdninstagram.com/vp/fdf71e674baefd7271a1d5f210fa0016/5C96F17A/t51.2885-15/sh0.08/e35/c190.0.700.700/s640x640/42651871_1551997461620839_6491807432560345088_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com`,
  `https://scontent-lga3-1.cdninstagram.com/vp/65ad0baa34b51bdfb8f2133e105aefec/5C9A2217/t51.2885-15/sh0.08/e35/c182.0.715.715/s640x640/44412292_2177439929187291_3753849971309281280_n.jpg`
];

const Header = props => {
  console.log("Props for Header :", props);
  return <h1>{props.message}</h1>;
};

const Images = props =>
  props.images.map(function(imageUrl) {
    return <img src={imageUrl} />;
  });

class App extends Component {
  render() {
    const re = <h1>Ciao</h1>;
    console.log("This is a React element :", re);

    return (
      <div>
        <Header message="flatStaGram!" foo="Foo" bar="Bar" cb={function() {}} />
        <Images images={imagesLink} />
      </div>
    );
  }
}

export default App;

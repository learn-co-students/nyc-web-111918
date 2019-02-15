import React, { Component } from 'react'
import logo from './logo.svg'
import { connect } from 'react-redux'


class Header extends Component {
  renderDescription = () => {
      const count = this.props.count
      const remainder = count % 5;
      const upToNext = 5 - remainder;
      return `The current count is less than ${count + upToNext}`;
    }
    
  render() {
    return (
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 className="App-title">{this.renderDescription()}</h1>
      </header>
    );
  }
}

const mapStateToProps = (state) => {
  return { count: state.count }
}

export default connect(mapStateToProps)(Header)

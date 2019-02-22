import React from "react";
import { Menu } from "semantic-ui-react"
import { Link } from "react-router-dom"
const Navigation = props => {



  return (
    <Menu>
        <Link to="/bots" className="item">
          Recruit
        </Link>
        { !props.currentUser ?
          <Menu.Menu position="right">
            <Link to="/signup" className="item">
              Sign Up
            </Link>
            <Link to="/login" className="item">
              Log In
            </Link>
          </Menu.Menu>
          :
          <Menu.Menu position="right">
            <Menu.Item>
              {`Welcome, ${props.currentUser.username}!`}
            </Menu.Item>
            <Menu.Item onClick={props.logout}>
              Log out
            </Menu.Item>
          </Menu.Menu>
      }
    </Menu>
  );
};

export default Navigation;

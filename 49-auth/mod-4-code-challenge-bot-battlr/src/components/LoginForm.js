import React from "react";
import { Form, Button } from "semantic-ui-react"

class LoginForm extends React.Component {

  state = {
    username: "",
    password: ""
  }

  handleChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value
    })
  }

  submitForm = () => {
    this.props.login(this.state.username, this.state.password)
  }

  render(){
    return (
      <Form onSubmit={this.submitForm}>
        <Form.Field>
           <label>Username</label>
           <input onChange={this.handleChange} name="username" placeholder='Username' />
        </Form.Field>
        <Form.Field>
           <label>Password</label>
           <input onChange={this.handleChange} type="password" name="password" placeholder='Password' />
        </Form.Field>
        <Button type="submit">Log In!</Button>
      </Form>
    );
  };
}
  

export default LoginForm;

import React from "react";
import { Form, Button } from "semantic-ui-react"

class SignupForm extends React.Component {

  state = {
    username: "",
    password: "",
    passwordConfirmation: "",
  }

  handleChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value
    })
  }

  submitForm = () => {
    this.props.signup(this.state.username, this.state.password, this.state.passwordConfirmation)
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
        <Form.Field>
           <label>Password</label>
           <input onChange={this.handleChange} type="password" name="passwordConfirmation" placeholder='Password Confirmation' />
        </Form.Field>
        <Button type="submit">Sign Up!</Button>
      </Form>
    );
  };
}
  

export default SignupForm;

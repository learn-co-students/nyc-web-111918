import React, { Component } from "react";
import BotsPage from "./containers/BotsPage";
import Navigation from "./components/Navigation";
import LoginForm from "./components/LoginForm";
import SignupForm from "./components/SignupForm";
import "./App.css";
import { Switch, Route, withRouter } from 'react-router-dom'
import YourBotArmy from "./containers/YourBotArmy";

class App extends Component {

	state = {
		currentUser: null
	}

	componentDidMount(){
		let token = localStorage.getItem("token")

		if(token){
			fetch(`http://localhost:3000/api/v1/current_user`, {
				headers: {
					"Authorization": token
				}
			})
			.then(res => res.json())
			.then((response) => {
				this.setState({
					currentUser: response
				})
			})
		}
	}

	logout = () => {
		// Set currentUser to null
		// Clear localStorage

		this.setState({
			currentUser: null
		})
		localStorage.removeItem("token")

		this.props.history.push("/login")
	}

	signup = (username, password, passwordConfirmation) => {
		if (password === passwordConfirmation){
			fetch("http://localhost:3000/api/v1/users", {
				method: "POST",
				headers: {
					'Content-Type': "application/json",
					'Accept': "application/json"
				},
				body: JSON.stringify({
					username: username,
					password: password
				})
			})
			.then(res => res.json())
			.then((response) => {
				if (response.errors){
					alert(response.errors)
				} else {  
					localStorage.setItem("token", response.token)
					this.setState({
						currentUser: response.user
					})
				}
			})
		} else {
			alert("Passwords do not match!!")
		}
	}

	login = (username, password) => {
		fetch("http://localhost:3000/api/v1/login", {
				method: "POST",
				headers: {
					'Content-Type': "application/json",
					'Accept': "application/json"
				},
				body: JSON.stringify({
					username: username,
					password: password
				})
			})
			.then(res => res.json())
			.then((response) => {
				if (response.errors){
					alert(response.errors)
				} else {  
					localStorage.setItem("token", response.token)
					this.setState({
						currentUser: response.user
					})
					this.props.history.push(`/users/${response.user.id}`)
				}
			})
	}
	render() {
		return (
			<div className="App">
				<Navigation currentUser={this.state.currentUser} logout={this.logout}/>
				<Switch>
				 <Route path="/bots" component={BotsPage}/>
				 <Route path="/users/:id" component={YourBotArmy}/>
				 <Route path="/login" render={(routerProps) => <LoginForm login={this.login} {...routerProps}/>}/>
				 <Route path="/signup" render={(routerProps) => <SignupForm signup={this.signup} {...routerProps}/>}/>
				</Switch>
			</div>
		);
	}
}

export default withRouter(App);

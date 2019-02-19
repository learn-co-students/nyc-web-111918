import React from 'react'
import { connect } from 'react-redux'

const Player = (props) => {
	console.log("INSIDE PLAYER", props)
	return (
		<div onClick={() => props.selectPlayer(props.player)}>
			<p>{props.player.name}</p>
		</div>
	)
}

// DON'T NEED TO READ IN THIS COMPONENT
// function msp(state){

// }

function mdp (dispatch){
	return {
		selectPlayer: (player) => {
			dispatch({type: "CHANGE_PLAYER", payload: player})
		}
	}
}


export default connect(null, mdp)(Player)

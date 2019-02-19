import gamesData from './gamesData'


const defaultState = {
		teams: gamesData.teams,
		selectedPlayer: null
	}

export default function reducer(state = defaultState, action){
	console.log("IN REDUCER", action)
	switch(action.type){
		case "CHANGE_PLAYER":
			return {...state, selectedPlayer: action.payload}
		default:
			return state
	}
}
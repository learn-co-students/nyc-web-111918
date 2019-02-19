import React from 'react'
import Player from './Player'

const Team = ({ team, selectPlayer }) => {

  const renderedPlayers = team.players.map(player => {
    return <Player key={player.id} player={player}/>
  })

  return (
    <div className='team'>
      <h3>{team.team_name}</h3>
      <h4> Colors: {team.colors[0]}, {team.colors[1]} </h4>
      {renderedPlayers}
    </div>
  )
}

export default Team

import React from 'react'
import Team from './Team'
import { connect } from "react-redux"

const TeamList = (props) => {
  console.log("TEAMLIST", props)
  const renderedTeams = props.teams.map(team => {
    return <Team key={team.id} team={team} />
  })

  return (
    <div className="team-list">
      {renderedTeams}
    </div>
  )
}

function mapStateToProps(state){
  return {
    teams: state.teams,
  }
}

export default connect(mapStateToProps)(TeamList)

import React from 'react'
import { Header } from 'semantic-ui-react'

const NavHeader = () => {
  return (
    <Header className='header' as='h5' block>
      Hashketball: The Dribbling
      <img className='App-logo' alt='basketball' src='https://images.vexels.com/media/users/3/135385/isolated/lists/212a5985af3fc8329ada7bc2a45bad82-basketball-circle-icon.png'></img>
    </Header>
  )
}

export default NavHeader

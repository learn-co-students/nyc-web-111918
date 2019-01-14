document.addEventListener('DOMContentLoaded', () => {
  /*****************************************************************************
   * All of our variables and data.
   ****************************************************************************/
  // "Globals"
  let allPokemonData = [];
  let selectedPokemon = null;
  // DOM nodes
  const pokemonContainerForRenderingCards = document.querySelector('#pokemon-container');
  const pokemonSearchInputField = document.querySelector('#pokemon-search-input');
  const pokemonPostForm = document.querySelector('#pokemon-post-form');
  const pokemonPostFormLabel = pokemonPostForm.querySelector("p")
  const createLabel = "Create Pokemon:";
  const editLabel = "Edit Pokemon:";
  const pokemonUrlInput = document.getElementById('sprite-input');
  const pokemonNameInput = document.getElementById('name-input');


  /*****************************************************************************
   * On load fetch actions
   ****************************************************************************/
  fetch('http://localhost:3000/pokemon'/*, { method: 'GET' }*/)
    .then((responseObject) => responseObject.json())
    .then((pokeJSONData) => {
      allPokemonData = pokeJSONData
      pokemonContainerForRenderingCards.innerHTML = renderAllPokemon(allPokemonData)
    }) //end of GET all Pokemon FETCH


  /*****************************************************************************
   * Event Listeners
   ****************************************************************************/
  pokemonSearchInputField.addEventListener('input', (event) => {
    const userSearchTerm = event.target.value
    const filteredPokemon = allPokemonData.filter((pokemonObject) => {
      return pokemonObject.name.includes(userSearchTerm.toLowerCase())
    })
    pokemonContainerForRenderingCards.innerHTML = renderAllPokemon(filteredPokemon)
  }) //end search input event listener

  pokemonContainerForRenderingCards.addEventListener('click', (event) => {
    if (event.target.name === 'flip') {
      /*** Handling sprite toggling ***/
      const clickedPokemon = allPokemonData.find((pokemonObject) => {
        return pokemonObject.id == event.target.dataset.id
      })
      event.target.src = (event.target.src === clickedPokemon.sprites.front ? clickedPokemon.sprites.back : clickedPokemon.sprites.front)
    } else if (event.target.dataset.action === "delete") {
      /*** Handling delete Pokemon action ***/

      /* To delete, we need to DELETE IT FROM EVERYWHERE YOU HAVE THE DATA!
          - Remove from the database
          - Remove from the DOM
          - Remove from allPokemonData
      */

      // Things we need to do the above three steps:
      // 1. The node to actually delete:
      const pokemonCard = event.target.parentElement.parentNode; // going up to find the card

      // 2. What to delete this node from:
      // gives you the element you attached this event listener to
      // const pokemonContainer = event.currentTarget;
      // For us, equivalent to: pokemonContainerForRenderingCards

      // 3. The id of what to delete from the database:
      const id = pokemonCard.dataset.id; // we put this data here!!

      /*** Choose your own adventure! Optimistic vs Pessimistic! ***/

      // Optimistic Rendering
      // - change the data on the client regardless of what response comes back from the server
      // - BUT if the fetch fails, then the client is out of sync with the server
      // optimisticallyDeletePokemon(id, pokemonCard);

      // Pessimistic Rendering
      // - change the data on the client AFTER you get an OK response
      // - keeps client and server data in sync
      // - better unless you want super fast responsive interface
      pessimisticallyDeletePokemon(id, pokemonCard);
    } else if (event.target.tagName === 'H1') { // we decide that clicking on the name is how we decide to edit
      /*** Handling update Pokemon action ***/

      /*
        Let's figure out how to interpret the update user story about clicking.
        Why?
        Because the submit button can either do: POST or PATCH!

        We shall make it so one click === selected,
        next click === unselected (set selectedPokemon back to null)
      */
      const pokemonContainer = event.target.parentElement.parentElement;
      const id = pokemonContainer.dataset.id;
      togglePokemon(id); // NOTE: this toggles the id and updates the DOM!
    }
  }) // end sprite toggle event listener

  pokemonPostForm.addEventListener('submit', (event) => {
    // submits will try to POST!!! so everything refreshes!
    event.preventDefault(); // prevent that default!

    // Form handles two things - POST and PATCH/PUT
    // We designed it to do it based on selectedPokemon.
    if (!!selectedPokemon) {
      // Optimistic Rendering
      // optimisticallyPatchPokemon(selectedPokemon pokemonNameInput.value, pokemonUrlInput.value);
      // Pessimistic Rendering
      pessimisticallyPatchPokemon(selectedPokemon, pokemonNameInput.value, pokemonUrlInput.value);
    } else {
      // Optimistic Rendering
      // optimisticallyPostPokemon(pokemonNameInput.value, pokemonUrlInput.value);
      // Pessimistic Rendering
      pessimisticallyPostPokemon(pokemonNameInput.value, pokemonUrlInput.value);
    }

  }) // end of submit event listener (posting, patching Pokemon)


  /*****************************************************************************
   * Helper functions (**NOT** PURE!)
   * Separated out because I'm lazy and I'm writing functions that mess with
   * our "global" variables which are only in scope within this callback for
   * DOMContentLoaded.
   ****************************************************************************/
  const optimisticallyDeletePokemon = (id, pokemonCard) => {
    allPokemonData = allPokemonData.filter(pokemon => pokemon.id != id) // update global data
    pokemonContainerForRenderingCards.removeChild(pokemonCard); // remove from DOM
    fetch(`http://localhost:3000/pokemon/${id}`, { method: 'DELETE' }) // remove from database
  }

  const pessimisticallyDeletePokemon = (id, pokemonCard) => {
    fetch(`http://localhost:3000/pokemon/${id}`, { method: 'DELETE' }) // remove from database
      .then(response => {
        if (response.ok) { // if we successfully removed it, then...
          allPokemonData = allPokemonData.filter(pokemon => pokemon.id != id) // update global data
          pokemonContainerForRenderingCards.removeChild(pokemonCard); // remove from DOM
        } /* else {
          throw CustomError()
        } */
      })
  }

  const togglePokemon = (id) => {
    /*
      Let's also make it so the form changes to tell the user that we are
      editing a Pokemon.
      Update that DOM for better UX!!
    */
    if (selectedPokemon === id) {
      selectedPokemon = null;
      pokemonPostFormLabel.innerText = createLabel;
      pokemonNameInput.value = "";
      pokemonUrlInput.value = "";
    } else {
      selectedPokemon = id;
      pokemonPostFormLabel.innerText = editLabel;
      const iChooseYou = allPokemonData.find(pokemon => pokemon.id == id)
      pokemonNameInput.value = iChooseYou.name;
      pokemonUrlInput.value = iChooseYou.sprites.front;
    }
  }

  const optimisticallyPostPokemon = (name, frontSpriteUrl) => {
    allPokemonData.push(json); // update global data
    /*
      Update the DOM - options:
        1. rerender it all!!!
        pokemonContainerForRenderingCards.innerHTML = renderAllPokemon(allPokemonData);
        2. appendChild
        construct the entire element
        const pokemonElement = document.createElement(``)
        pokemonContainerForRenderingCards.appendChild(pokemonElement)
        3. add to innerHTML
    */
    pokemonContainerForRenderingCards.innerHTML += pokemonCardHTML(json); // Update the DOM
    // POST to API and pray...
    fetch(`http://localhost:3000/pokemon`,
      {
        method: 'POST',
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        body: postBody(name, frontSpriteUrl),
      }
    );
  }

  const pessimisticallyPostPokemon = (name, frontSpriteUrl) => {
    fetch(`http://localhost:3000/pokemon`,
      {
        method: 'POST',
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        body: postBody(name, frontSpriteUrl),
      }
    )
      .then(response => response.json())
      .then(json => {
        allPokemonData.push(json); // update global data
        pokemonContainerForRenderingCards.innerHTML += pokemonCardHTML(json); // Update the DOM
      });
  }

  const optimisticallyPatchPokemon = (id, name, frontSpriteUrl) => {
    // update global data
    pokeIndex = allPokemonData.findIndex(pokemon => pokemon.id == id);
    allPokemonData[pokeIndex].name = name;
    allPokemonData[pokeIndex].sprites.front = frontSpriteUrl;
    /*
      Update the DOM - options:
        1. rerender it all!!!
        pokemonContainerForRenderingCards.innerHTML = renderAllPokemon(allPokemonData);
        2. find the thing to update and update it
    */
    // Update the DOM
    let patchedPokemonCard = pokemonContainerForRenderingCards.querySelector(`div[data-id="${id}"]`)
    patchedPokemonCard.querySelector("h1").innerText = name;
    patchedPokemonCard.querySelector("img").src = frontSpriteUrl;
    fetch(`http://localhost:3000/pokemon/${selectedPokemon}`,
      {
        method: 'PATCH',
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        body: JSON.stringify({
          "name": name,
          "sprites": {
            "front": frontSpriteUrl,
            "back": allPokemonData.find(pokemon => pokemon.id == id).sprites.back,
          }
        })
      }
    );
  }

  const pessimisticallyPatchPokemon = (id, name, frontSpriteUrl) => {
    fetch(`http://localhost:3000/pokemon/${selectedPokemon}`,
      {
        method: 'PATCH',
        headers: {
            "Content-Type": "application/json; charset=utf-8",
        },
        body: JSON.stringify({
          "name": name,
          "sprites": {
            "front": frontSpriteUrl,
            "back": allPokemonData.find(pokemon => pokemon.id == id).sprites.back,
          }
        })
      }
    )
      .then(response => response.json())
      .then(pokeJson => {
        // update global data
        pokeIndex = allPokemonData.findIndex(pokemon => pokemon.id == pokeJson.id);
        allPokemonData[pokeIndex].name = pokeJson.name;
        allPokemonData[pokeIndex].sprites.front = pokeJson.sprites.front;
        // Update the DOM
        let patchedPokemonCard = pokemonContainerForRenderingCards.querySelector(`div[data-id="${pokeJson.id}"]`)
        patchedPokemonCard.querySelector("h1").innerText = pokeJson.name;
        patchedPokemonCard.querySelector("img").src = pokeJson.sprites.front;
      })
  }
}); // end of DOMContentLoaded


/*******************************************************************************
 * Helper functions (PURE!)
 ******************************************************************************/
const renderAllPokemon = /*FUNCTION*/ (pokemonArray) => {
  return pokemonArray.map((pokemon) => pokemonCardHTML(pokemon)).join('')
}

const pokemonCardHTML = (pokemon) => {
  return `
    <div data-id="${pokemon.id}" class="pokemon-card">
      <div style="width:230px;margin:10px;background:#fecd2f;color:#2d72fc" class="pokemon-frame">
        <h1 class="center-text">${pokemon.name}</h1>
        <div style="width:239px;margin:auto">
          <div style="width:96px;margin:auto">
            <img name="flip" data-id="${pokemon.id}" data-action="flip" class="toggle-sprite" src="${pokemon.sprites.front}">
          </div>
        </div>
        <button data-action="delete" class="pokebutton idontknow" style="width: 230px;margin:auto;">Delete</button>
      </div>
    </div>
  `;
}

const postBody = (name, frontSpriteUrl) => {
  return JSON.stringify({
    "height": 10,
    "weight": 130,
    // "id": 2, // NOTE: NO id needed in POST body! Remember, that comes from the database!
    "name": name,
    "abilities": ["overgrow", "chlorophyll"],
    "moves": [],
    "stats": [
      {
        "value": 80,
        "name": "special-defense"
      },
      {
        "value": 80,
        "name": "special-attack"
      },
      {
        "value": 63,
        "name": "defense"
      },
      {
        "value": 62,
        "name": "attack"
      },
      {
        "value": 60,
        "name": "speed"
      },
      {
        "value": 60,
        "name": "hp"
      }
    ],
    "types": ["grass", "poison"],
    "sprites": {
      "front": frontSpriteUrl,
      "back": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png"
    }
  });
}



//
// editPokemonForm.addEventListener("submit", (e) => {
// 	e.preventDefault()
// 	const editPokeName = e.target.querySelector("#edit-poke-name").value
// 	const editPokeFrontImg = e.target.querySelector("#edit-poke-front-sprite").value
// 	const editPokeBackImg = e.target.querySelector("#edit-poke-back-sprite").value
// 	fetch(`http://localhost:3000/pokemon/${e.target.dataset.id}`, {
// 		method: "PATCH",
// 		headers: {
// 			"Content-Type": "application/json", //type of data being sent
// 			"Accept": "application/json" //type of data I (the client) want back
// 		},
// 		body: JSON.stringify({
// 			name: editPokeName,
// 			sprites: {
// 				front: editPokeFrontImg,
// 				back: editPokeBackImg
// 			}
// 		})
// 	})
// 	.then(r => r.json())
// 	.then(editedPoke => {
// 		// find the idx pos of the edited pokemon so we can update in the allPokemon array
// 		const editedPokeIdx = allPokemon.findIndex(p => p.id === editedPoke.id)
// 		allPokemon[editedPokeIdx] = editedPoke
// 		showAllPokemon(allPokemon)
// 		document.body.className = ""
// 		document.querySelector('#overlay').style.visibility = "hidden"
// 	})
// })
//
// newPokemonForm.addEventListener("submit", (e) => {
// 	e.preventDefault() //stop form from POSTing
// 	const newPokeName = e.target.querySelector("#new-poke-name").value
// 	const newPokeFrontImg = e.target.querySelector("#new-poke-front-sprite").value
// 	const newPokeBackImg = e.target.querySelector("#new-poke-back-sprite").value
//
// 	fetch("http://localhost:3000/pokemon", {
// 		method: "POST",
// 		headers: {
// 			"Content-Type": "application/json", //type of data being sent
// 			"Accept": "application/json" //type of data I (the client) want back
// 		},
// 		body: JSON.stringify({
// 			name: newPokeName,
// 			sprites: {
// 				front: newPokeFrontImg,
// 				back: newPokeBackImg
// 			}
// 		})
// 	})
// 	.then(/*function*/r => /*return*/ r.json())
// 	.then(newPoke => {
// 		allPokemon.push(newPoke)
// 		pokemonContainer.innerHTML += renderSinglePokemon(newPoke)
// 	})
//
//
// })

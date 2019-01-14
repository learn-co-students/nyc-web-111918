document.addEventListener('DOMContentLoaded', () => {
	let allPokemon = []
	const pokemonContainer = document.getElementById("pokemon-container")
	const searchBar = document.getElementById("pokemon-search-input")
	const createForm = document.querySelector("#new-pokemon-form")

	function fetchPokemon(){
		fetch("http://localhost:3000/pokemon", {method: "GET"})
		.then((response) => {
			return response.json()
		})
		.then((data) => {
			allPokemon = data

			showAllPokemon(data)
		})
	}

	createForm.addEventListener("submit", function(e){
		e.preventDefault()
		const newNameInput = createForm.querySelector("#new-poke-name").value
		const newFrontImg = createForm.querySelector("#new-poke-front-sprite").value
		const newBackImg = createForm.querySelector("#new-poke-back-sprite").value
		fetch("http://localhost:3000/pokemon",
		 {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        body: JSON.stringify({
					name: newNameInput,
					sprites: {
						front: newFrontImg,
						back: newBackImg
					}
				}) // body data type must match "Content-Type" header
    }).then( (r) => r.json())
		.then(function(pokemon){
			// pessimistic Rendering
			// Create a new pokemon with the data
			const newPokemon = renderSinglePokemon(pokemon)
			pokemonContainer.innerHTML += newPokemon
			allPokemon.push(pokemon)
		})
		// optimisic rendering

	})

	function showAllPokemon(pokemons){
		pokemonContainer.innerHTML = pokemons.map(renderSinglePokemon).join('')
	}
	const globalEditForm = document.querySelector("#edit-pokemon-form")
	globalEditForm.addEventListener("submit", function(){

	})

	pokemonContainer.addEventListener("click", (e) => {
		if (e.target.tagName === "IMG") {
			const foundPokemon = allPokemon.find(pokemon => {
				return pokemon.id === parseInt(e.target.dataset.id)
			})

			if (e.target.src === foundPokemon.sprites.front) {
				e.target.src = foundPokemon.sprites.back
			} else {
				e.target.src = foundPokemon.sprites.front
			}
		}

		if (e.target.dataset.action === "edit") {

			const pokemonData = allPokemon.find((pokemon) => {
				return pokemon.id == e.target.dataset.id
			})
			const indexOfPokemon = allPokemon.indexOf(pokemonData)
			console.log(indexOfPokemon, "index of POkemondata")
			e.target.parentElement.innerHTML += `
				<form class="form" id="edit-pokemon-form" action="index.html" method="post">
					<label for="name">Name: </label>
					<input required id="edit-poke-name" type="text" name="name" value="${pokemonData.name}">

					<label for="front-sprite">Front Image: </label>
					<input id="edit-poke-front-sprite" type="text" name="front-sprite" value="${pokemonData.sprites.front}">

					<label for="back-sprite">Back Sprite: </label>
					<input id="edit-poke-back-sprite" type="text" name="back-sprite" value="${pokemonData.sprites.back}"">

					<button type="submit" name="button">Edit That Pokemon!</button>
				</form>
			`
			const editForm = pokemonContainer.querySelector("#edit-pokemon-form")
			const nameEditinput = document.querySelector("#edit-poke-name")
			const frontEditinput = document.querySelector("#edit-poke-front-sprite")
			const backEditinput = document.querySelector("#edit-poke-back-sprite")
			// console.log(nameEditinput,frontEditinput,backEditinput, "color :purple")

			editForm.addEventListener("submit", function(e){
				e.preventDefault()
				fetch(`http://localhost:3000/pokemon/${pokemonData.id}`,{
						method: "PATCH",
						headers: {
							"Content-Type" : "application/json",
							"Accept" : "application/json"
						},
						body: JSON.stringify({
							name: nameEditinput.value,
							sprites: {
								front: frontEditinput.value,
								back: backEditinput.value
							}
						})
				}).then( r => r.json())
				.then((updatedPokemon) => {
						console.log(updatedPokemon, "updatedPokemon")
						// which one im going to edit by the index
						const pokemonOriginalIndex = allPokemon.indexOf(pokemonData)
						allPokemon[pokemonOriginalIndex] = updatedPokemon
						// update the DOM
						showAllPokemon(allPokemon)
						// replace the one to edit with the NEW pokemon
						// re render

				})
			})

		}
		if (e.target.dataset.action === "delete") {
			const pokemonData = allPokemon.find((pokemon) => {
				return pokemon.id == e.target.dataset.id
			})
			fetch(`http://localhost:3000/pokemon/${pokemonData.id}`, {
				method: "DELETE"
			}).then(function(){
				const pokemonOriginalIndex = allPokemon.indexOf(pokemonData)
				allPokemon.splice(pokemonOriginalIndex , 1)
				showAllPokemon(allPokemon)
			})
		}
	})

	searchBar.addEventListener("input", (e) => {
		const filteredPokemon = allPokemon.filter((pokemon) => {
			return pokemon.name.includes(e.target.value)
		})
		showAllPokemon(filteredPokemon)
	})

	function renderSinglePokemon(pokemon) {
		return `
			<div data-id="${pokemon.id}"class="pokemon-container">
				<div style="width:230px;margin:10px;background:#fecd2f;color:#2d72fc" class="pokemon-frame">
					<h1 class="center-text">${pokemon.name}</h1>
					<div style="width:239px;margin:auto">
						<div style="width:96px;margin:auto">
							<img data-id="${pokemon.id}" data-action="flip" class="toggle-sprite" src="${pokemon.sprites.front}">
						</div>
						<button data-id="${pokemon.id}" data-action="edit">edit</button>
						<button data-id="${pokemon.id}" data-action="delete">delete</button>
					</div>
				</div>
			</div>
		`
	}


	fetchPokemon()
})

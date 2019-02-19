
Comfy
Setting up actions and reducers folder
Creating the store/setting up the Provider


Non-comfy
When do I use redux?
File structure?
When to abstract actions
When to combine reducers
When can I get rid of React state?
How do I use connect/map functions?
EVERYTHING


Terminology:
Reducer: sets the state according the action
Action: function that calls dispatch
Dispatch: function that is called to change the state
Provider:
Connect: 


BASIC SETUP

1. Install packages (react and react-redux)
2. Create reducer
3. Take reducer and use it to createStore
4. Import Provider, wrap App in it, and pass the store as a prop to Provider

USING REDUX

Reading from state:
1. Connect your component using `connect`
2. Write a `mapStateToProps` function, and pass it as argument to `connect` 
3. Using the state object passed in by redux, return an object that will be added to your component's props


Writing to state:
1. Connect your component using `connect`
2. Write a `mapDispatchToProps` function and pass it as the *second* argument to `connect`
3. Write functions in `mapDispatchToProps` that will appear as props inside your component
4. Call the `dispatch` function  passed in by redux with a type and a payload to trigger your reducer 
5. Use the type to determine *how* to change your state
6. Use the payload to determine *what* to change your state with
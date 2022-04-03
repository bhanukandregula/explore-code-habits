// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Insert, Update and Read from array of structs
contract TodoList {

    struct Todo {
        string text; // Description
        bool completed; // Status
    }

    Todo[] public todos;

    // 1. to create a new todo, we will have text as an input
    function create(string calldata _text) external {
        // 2. Now we have to insert the new todo in the array of todos
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    // 01. To update the text, inside exiting Todo, we have two inputs. array idnex and text
    function updateTest(uint _index, string calldata _text) external {
        // 02. if we have just one value to update, this approcach is cheaper for gas
        // todos[_index].text = _text;

        // 02. if we have multiple value to update, this approcach is cheaper for gas
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // 01. To get the specific todo from an array of todos, we need the index of respective todo
    function get(uint _index) external returns (string memory, bool) {
        // storage saves more Gas than using memory here
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // competed - to - no completed
    // no completed - to - completed
    function toggelCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

    // Fetch all todos from todos struct array
    function getAllTodos() external returns (uint[] memory todos) {
        return todos;
    }
}
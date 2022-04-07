/**
 * Dictionaries: A dictionary is a data structure that stores data as key-value pairs.
 * The Java Script Object class is designed to operate as a dictionary/
 * 
 * Example: phone book stores its data as names and phone numbers.
 * 
 */

function Dictionary() {
    this.add = add;
    this.dataStore = [];
    // this.dataStore = new Array();
    this.find = find;
    this.remove = remove;
}

// this function is to add a specific key-value pair
function add(key, value){
    this.dataStore[key] = value;
}

// This is used to remove key or value
function remove(key){
    delete this.dataStore[key];
}

// this is used to find key or value from key/value pair
function find(key){
    return dataStore[key];
}

// Initialize the dictionary
var pbook = new Dictionary();
pbook.add("Mike", "1234509876");
pbook.add("Hike", "0987654321")
pbook.add("Spike", "1234567890")

console.log("", +pbook.find("Mike"));
console.log("", +pbook.find("Hike"));

pbook.remove("Mike");
console.log("", +pbook.find("Mike"));
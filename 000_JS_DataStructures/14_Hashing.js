/**
 * Hashing: It uses a data structure called hash table.
 * It is a common technique for sorting data in such a way that the data can be inserted and retrieved very quickly.
 * 
 * Hash table DS is designed around an array.
 * 
 * Note: Hashing consists of finding a value in a DS in the shorted time possible.
 */

// we need to create a class to represent a hash table

// This is Initialization of Hash Table
function HashTable(){
    this.table = new Array(137); // 137 was declared to abvoid any collisions
    this.simpleHash = simpleHash;
    this.showDistro = showDistro;
    this.put = put;
}

function simpleHash(data) {
    var total = 0;
    for(var i=0; i< data.length; i++){
        total += data.charCodeAt(i);
    }
    return total % this.table.length;
}

function put(data){
    var pos = this.simpleHash(data);
    this.table[pos] = data;
}

// to show the basic distrubution of hashing functioinality
// (key - value pairs)
function showDistro(){
    var n = 0;
    for(var i=0; i<this.table.length; i++){
        if(this.table[i] != undefined){
            console.log(i+ " : " + this.table[i]);
        }
    }
}

var  someNames = ["Bhanu", "Raghu", "Mike", "Hike", "Manu", "Hanu"];
console.log(someNames);

var hTable = new HashTable(); // Initialize hash table
for(var i=0; i<someNames.length; i++){
    hTable.put(someNames[i]);
}

hTable.showDistro();























































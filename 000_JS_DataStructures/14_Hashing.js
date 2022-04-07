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
    this.table = new Array(137); // pre defined array length
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

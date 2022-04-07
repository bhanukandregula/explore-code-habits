function HashTable(){
    this.table = new Array(137); // Prime number
    this.simpleHash = simpleHash;
    this.betterHash = betterHash;
    this.showDistro = showDistro;
    this.put = put;
}


function put(data){
    var pos = this.betterHash(data);
    this.table[pos] = data;
}

function simpleHash(data) {
    var total  = 0;
    for(var i=0; i< data.length; ++i){
        total += data.charCodeAt(i); // ASCII value
    }
    console.log("Hash value is: ", + data+ " ->" +total);
    return total % this.table.length;
}

function betterHash(string){
    const H = 37;
    var total = 0;
    for(var i=0; i<string.length; i++){
        total += H * total + string.charCodeAt(i);
    }

    total = total % this.table.length;

    if(total < 0){
        total += this.table.length - 1;
    }

    return parseInt(total);
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

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

function showDistro(){
    var n = 0;
    for(var i=0; i<this.table.length; i++){
        if(this.table[i] != undefined){
            console.log(i+ " : " + this.table[i]);
        }
    }
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

function getRandomInt(min, max){
    return Math.floor(Math.random() * (max - min + 1));
}

function genStuData(arr){
    for(var i=0; i< arr.length; i++){
        var num = "";
        for(var j=1; j<=9; ++j){
            num += Math.floor(Math.random() * 10);
        }

        num += getRandomInt(50, 100);
        arr[i] = num;
    }
}

var numStudents = 10;
var arrSize = 97;
var idLen = 9;
var students = new Array(numStudents);
genStuData(students);
console.log("Student data ...");

for(var i=0; i< students.length; i++){
    console.log(students[i].substring(0,8) + " " + students[i].substring(9));
}

console.log("Data Distribution")
var hTable = new HashTable();
for(var i=0; i< students.length; i++){
    hTable.put(students[i]);
}

hTable.showDistro();
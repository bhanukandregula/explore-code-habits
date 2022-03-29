function Queue(){
    this.dataStore = [];
    this.enqueue = enqueue;
    this.dequeue = dequeue;
    this.front = front;
    this.back = back;
    this.toString = toString;
    this.empty = empty;
}

function Patient(name, code){
    this.name = name;
    this.code = code;
}

function front(){

}

function back(){

}

function empty(){

}

function enqueue(element){
    this.dataStore.push(element);
}

function dequeue(){ 
   var priority = this.dataStore[0].code;
    for(var i=1; i<=dataStore.length; i++){ // dataStore is not defined error has to be recolved in this code snippet
        if(this.dataStore[i].code < priority){
            priority = i;
        }
   }
   return this.dataStore.splice(priority, 1);
}

function toString(){
    var retString = " ";
    for(var i=0; i<this.dataStore.length; i++){
        retString += this.dataStore[i] + " ";
    }
    return retString;
}

var p = new Patient('Bhanu', 5);
var ed = new Queue();
ed.enqueue(p);
p = new Patient("Victor", 4);
ed.enqueue(p);
p = new Patient("Bryan", 2);
ed.enqueue(p);
p = new Patient("Craig", 1);
ed.enqueue(p);

console.log(ed);
console.log("These are all my queues: ", ed.toString());

var seen =  ed.dequeue();
console.log("Patient been treated: ", seen[0].name);
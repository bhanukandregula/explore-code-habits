// Insertion operation - Enqueue
// Deletion operation - Dequeue

// Front - first element in the queue
// Rear - last element in the queue

function Queue(){
    this.dataStore = [];
    this.enqueue = enqueue;
    this.dequeue = dequeue;
    this.front = front;
    this.back = back;
    this.toString = toString;
    this.empty = empty;
}

// Inserting an element to Queue
// Automatically element should be there in last position when we push
function enqueue(element){
    this.dataStore.push(element);
}

// removing an element from the queue
// and we have to remove from front side on the queue
function dequeue(){
    return this.dataStore.shift();
}

function front(){
    return this.dataStore[0]; // This will give front value
}

function back(){
    return this.dataStore[this.dataStore.length - 1]
}

// This represents current dataStrore in toString format
function toString(){
    var retString = " ";
    for(var i=0; i<this.dataStore.length; i++){
        retString += this.dataStore[i] + " ";
    }
    return retString;
}

function empty(){
    if(this.dataStore.length == 0){
        return true;
    }else{
        return false;
    }
}

var q = new Queue();
q.enqueue('Bhanu');
q.enqueue('Prakash');
q.enqueue('Kandregula');
console.log("My Queue: ", q.toString());

q.dequeue();

console.log("My updated Queue: ", q.toString());
console.log("Front of Queue: ", q.front());
console.log("Back of the queue: ", q.back());
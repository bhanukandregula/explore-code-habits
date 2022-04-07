function Set() {
    this.dataStore = [];
    this.add = add;
    this.remove = remove;
    this.size = size;
    this.contains = this.contains;
    this.union = union;
    this.intersection = intersection;
    this.difference = difference;
    this.show = show;
}

function add(data) {
    if(this.dataStore.indexOf(data) < 0){
        this.dataStore.push(data);
        return true;
    }else{
        return false;
    }
}

function remove(data){
    var pos = this.dataStore.indexOf(data);
    if(pos > -1){
        this.dataStore.splice(pos, 1);
        return true;
    }else{
        return false;
    }
}

function show(set){
    return this.dataStore;
}

function size(set){
    return this.dataStore.length;
}

function contains(data) {
    if(this.dataStore.indexOf(data) > -1){
        return true;
    }else{
        return false;
    }
}

function union(set){
    var tempset = new Set();
    for (var i=0; i< this.dataStore.length; ++i){
        tempset.add(this.dataStore[i]);
    }

    for(var i=0; i< set.dataStore.length; ++i){
        if(!tempset.contains(set.dataStore[i])){
            tempset.dataStore.push(set.dataStore[i]);
        }
    }

    return tempset;
}

function intersection(set){
    var tempset =  new Set();
    
    for(var i=0; i< this.dataStore.length; ++i){
        if(set.contains(this.dataStore[i])){
            tempset.add(this.dataStore[i]);
        }
    }

    return tempset;
}

function difference(set){
    var tempset = new Set();
    for(var i=0; i< this.dataStore.length; ++i){
        if(!set.contains(this.dataStore[i])){
            tempset.add(this.dataStore[i]);
        }
    }

    return tempset;
}

// Union Results
var cis = new Set();
cis.add("Bhanu");
cis.add("Ragnu");
cis.add("Prakash");
cis.add("Kandregula");

var dmp = new Set();
dmp.add("Mike");
dmp.add("Hike");
dmp.add("Spike");
dmp.add("Bhanu");
dmp.add("Prakash");

var it = new Set();
it = cis.union(dmp);
console.log("Union Results: ", it.show());

var inter = cis.intersection(dmp);
console.log("Intersection: ", inter.show());

// Difference of two sets
var cis = new Set();
var it = new Set();

cis.add("Claton");
cis.add("Jennifer");
cis.add("Danny");

it.add("One");
it.add("Two");
it.add("Three");
it.add("Danny");
it.add("Jennifer");


var diff = new Set();
var intersect01 = new Set();
intersect01 = cis.intersect(it);
console.log("Intersect 01:", intersect01.show());

diff = cis.difference(it);
console.log("difference between sets: ", diff.show());
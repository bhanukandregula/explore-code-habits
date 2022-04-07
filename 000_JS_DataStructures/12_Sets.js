/**
 * A set is a collection of unique element.
 * Elements in a set are called members.
 * Is can be useful to create a data structure which comprises of unique elements.
 * 
 * Set is an un order collection of related members.
 * 
 * no members = empty set
 * 
 * set may has subset of another set, which may have common members.
 * 
 * Set operations: Union || Intersection || Difference
 * 
 * Union: combining the memebers of one set with the members of another set.
 * Intersection: Adding all the memebrs of one set what also exist in a second set.
 * Difference: adding all the members of one set except thise that also exist in a second set.
 * 
 */

function Set(){
    this.dataStore = [];
    this.add = add;
    this.remove = remove;
    this.show  = show;
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

function show(){
    return this.dataStore;
}


var names = new Set();
names.add("Bhanu");
names.add("Raghu");
names.add("Shanu");
names.add("Hanu");

console.log("All members in set: ", names.show());

if(names.add("Hanu")){
    console.log("Hanu is addedd in set list");
}else {
    console.log("Cant add Hanu, must already be in set");
}

console.log(names.show());

var removed = "Hanu";
if(names.remove(removed)){
    console.log(removed+ " is removed from the set");
}else{
    console.log(removed+ "is not removed from set");
}

names.add("Bhanu Prakash");
console.log(names.show());

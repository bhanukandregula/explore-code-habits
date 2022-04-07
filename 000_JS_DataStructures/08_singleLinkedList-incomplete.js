// Sequence of list, which are connected to each other - Linked List
// Data in each lick can be referred as - element
// Next - next item in the link
// Constructor
function LList(){
    this.head = new Node("head");
    this.find = find;
    this.insert = insert;
    this.remove = remove;
    this.display = display;
}

function Node(element){
    this.element = element;
    this.next = null;
}

function find(item){
    var currentNode = this.head;
    // element is not visible when compile, this issue has to be resolved.
    while(currentNode.element != item){ 
        currentNode = currentNode.next;
    }
    return currentNode;
}

function insert( newElement,item){
    var newNode = new Node(newElement);
    var current = this.find(item);
    newNode.next = current.next;
    currentNode = currentNode.next;
}

function remove(){

}

function display(){
    var currentNode = this.head;
    while(!(currentNode.next == null)){
        print(currentNode.next.element);
        currentNode = currentNode.next;
    }
}

var cities = new LList();
cities.insert("Delhi", "head");
cities.insert("Visakhapatnam", "Anakapalli");
cities.insert("Michigan", "Novi");
console.log(cities);
console.log("These are the cities in Linked List: ", JSON.stringify(cities));
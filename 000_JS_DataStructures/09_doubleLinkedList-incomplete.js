function DoubleLinkedList(){

    let Node = function(element){
        this.element = element;
        this.next = null;
        this.prev =  null; // New
    }

    let length = 0;
    let head = null;
    let tail = null; // NEW

    this.append = function(element){
        this.element = element;
        this.next =  next;
        this.previous = previous;

        let node = new Node(element),current;
        if(head == null){ // if my first node on list is pointing to null
            head = node;
            tail = node;
        }

        // attatch to the tail node
        tail.next = node;
        node.prev = tail;
        tail = node;

        length++; // update size of the list
    }

    this.insert = function(position, element){
        // check out of bounds limits
        if(position >= 0 && position <= length){
            let node = new Node(element),
            current = head,
            previous,
            index = 0;
        }

        if(position == 0){
            if(!head){
                head = node;
                tail =  node;
            }else{
                node.next = current;
                current.previous = node;
                head = node;
            }
        }else if(position == length){
            current = tail;
            current.next = node;
            current.previous = current;
            tail = node;
        }
    }

    this.removeAt = function(position){
        // check out of bounds value
        if(position > -1 && position < length){
            let current = head;
            previous;
            index = 0;

            // removing first item
            if(postion == 0){
                head = current.next;
                // if there is only one item, then we update all tails as well
                if(length == 1){
                    tail = null;
                }else{
                    head.previous =  null;
                }
            }else if(position == (length-1)){
                current = tail;
                tail = current.previous;
                tail.next = null;
            }else {
                while(index ++< position){
                    previous = current;
                    current = current.next;
                }
                previous.next = current.next;
                current.next.previous = previous;
            }

            length--;
        }
    }
}
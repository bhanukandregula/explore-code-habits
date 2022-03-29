var a = [1,1,1,1];
var count=0; 
var uniqueCount = 0;

for(var i=0; i<a.length;i++){
    for(var j=0; j<a.length;j++){
        if(a[i] == a[j]){
            count++;
        }else{
            uniqueCount++;
        }
    }
    if(count == 1){
        console.log(a[i]);
    }
    count = 0;

}

// numbers.forEach((element, index) => {
//     // console.log("Index is: ", + index + " Element is: " + element);
//     for(var i=0; i<numbers.length; i++){
//         if(element === numbers[i]){
//             count = 0;
//         }else{
//             count = 1;
//         }
//     }
    
//     if(count == 0){
//         console.log("Common elements", element);
//         // continue;
//     }
//     if(count == 1){
//          console.log("Unique element: ", element);
//     }

// });


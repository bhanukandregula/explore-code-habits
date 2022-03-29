var stringsArray = ["ab","ab","abc"];
var queriesArray = ["ab", "abc", "bc"];
var resultArray = [];
var count = 0;
for(var i=0; i<queriesArray.length;i++){
    for(var j=0;j<stringsArray.length; j++){
        if(queriesArray[i] == stringsArray[j]){
            count++;
        }
    }
    resultArray.push(count);
    count=0;
}
console.log("Result Array: ", resultArray);
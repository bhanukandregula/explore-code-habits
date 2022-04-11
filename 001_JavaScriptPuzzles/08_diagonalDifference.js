// 3 X 3 Matrix
var inputArray = [[11,2,4], [4,5,6], [10,8,-12]];
var absValue = 0;

function diagonalDifference(inputArray){
    let left = 0;
    let right = 0;
    for(let i = 0; i < inputArray[0].length; i++){
        console.log("Left Matrix element: ", inputArray[i][i]);
        left += inputArray[i][i];

        console.log("Right Matrix element: ", inputArray[i][(inputArray[i].length - 1) - i]);
        right += inputArray[i][(inputArray[i].length - 1) - i];
        
    }
    absValue = Math.abs(left - right);
    console.log("Absloutely value: ", absValue);
    return absValue;
}

diagonalDifference(inputArray);

/**
 * This is the difference between sum of both diagonal elements in a 3X3 Matrix.
 */
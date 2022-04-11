var n = 3;
var outputValue = 0;

function flippingBits(n){
    let val = Math.pow(2,32) - 1;
    console.log("2 to the power 32 value: ", val);
    outputValue =  val - n;
    console.log("Final Value: ", outputValue);
    return outputValue;
}

flippingBits(n);

/**
 * Take 1 for example, as unsigned 32-bits is 00000000000000000000000000000001 and 
 * doing the flipping we get 11111111111111111111111111111110 which in turn is 4294967294.
 */

function twoArrays(k, A, B){
    A.sort((a,b) => a - b);
    B.sort((a,b) => a - b).reverse();
    let val = 0;
    for(let i=0; i<A.length; i++){
        A[i] + B[i] >= k ? val++ : val;
    }
    return val == A.length ? 'YES' : 'NO';
}

function compare(a,b){
    return a;
}
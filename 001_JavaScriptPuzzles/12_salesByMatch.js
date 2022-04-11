var n = 9;
var ar = [10, 20, 20, 10, 10, 30, 50, 10, 20];

function sockMerchant(n, ar){
    let pair = 0;
    ar.sort();
    for(let i = 0; i<n; i++){
        if(ar[i] == ar[i+1]){
            i++;
        }else{
            pair++;
        }
    }
    console.log(pair);
    return pair;
}

sockMerchant(n, ar);
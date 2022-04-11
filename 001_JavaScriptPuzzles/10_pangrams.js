/**
 * A pangram is a string that contains every letter of the alphabet. 
 * Given a sentence determine whether it is a pangram in the English alphabet. 
 * Ignore case. Return either pangram or not pangram as appropriate.
 */

let sentence = "The quick brown fox jumps over the lazy dog";
// other example: We promptly judged antique ivory buckles for the next prize

function pangram(sentence){
    const alphabtes = "abcdefghijklmnopqrstuvwxyz";
    let pangram =  true;
    alphabtes.split('').forEach((v) => {
        if(sentence.toLowerCase().indexOf(v) == -1){
            pangram = false;
        }
    });
    console.log("", +pangram);
    return pangram ? 'pangram' : 'not pangram';
}

pangram(sentence);
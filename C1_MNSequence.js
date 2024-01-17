// Given a sequence of M and N, form smallest possible number under following condition -> M denotes the sequence is decreasing, N denotes the sequence is increasing.
// Constraints / Assumptions: 
//     1] Digits must not repeat.
//     2] Allowable digits are 1-9.
//     3] Maximum length of input sequence will be 8 characters.
//     4] No characters other than M & N will be there in the input.
// Example:
//     Input: M        Output: 21
//     Input: N        Output: 12
//     Input: MM       Output: 321
//     Input: NN       Output: 123
//     Input: MNMN     Output: 21435
//     Input: NNMMM    Output: 126543
//     Input: MMNMMNNM Output: 321654798


function mnSequence(input){
    var result = '';
    var list = [];
    var count = 1;

    for (var i = 0; i <= input.length; i++){
        list.push(count)
        count++

        if(input[i] === 'N' || i == input.length){
            while(list.length != 0){
                result += list.pop()
            }
        }
    }

    return result;
}

console.log(mnSequence('NN'))
console.log(mnSequence('MM'))
console.log(mnSequence('MNMN'))
console.log(mnSequence('NNMMM'))
console.log(mnSequence('MMNMMNNM'))
    


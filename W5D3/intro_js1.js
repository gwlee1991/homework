
function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()}`
}

function isSubstring (searchString, subString) {
  return searchString.includes(subString)
}

function fizzBuzz (array) {
  var result_array = [];

  for (var i = 0; i < array.length; i++) {
    var ele = array[i]
    if (ele % 3 === 0 && ele % 5 !== 0) {
      result_array.push(ele)
    } else if (ele % 5 === 0 && ele % 3 !== 0) {
      result_array.push(ele)
    };
  }

  return result_array;
}

function isPrime(num) {
  if (num < 2){
    return false;
  }

  if (num === 2) {
    return true;
  }

  for (var i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  var prime_array = [];
  var sum = 0;
  for (let i = 0; prime_array.length < n; i++){
    if (isPrime(i)) {
      prime_array.push(i);
    }
  }

  for (let i = 0; i < prime_array.length; i++) {
    sum += prime_array[i];
  }

  return sum;
}

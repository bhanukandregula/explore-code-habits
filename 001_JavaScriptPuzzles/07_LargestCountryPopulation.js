// Find the country with the largest population by
// combining the given data on foreign keys

// The output of largestCountry should be an object with a
// key 'name' representing the country name and a key 'population'
// representing the countries total population

// Example Input Data:

const countries = [
    { id: 3, name: 'Russia' },
    { id: 1, name: 'USA' },
  ];
  
  const cities = [
    { id: 3, country_id: 1, name: 'Los Angeles' },
    { id: 8, country_id: 3, name: 'Moscow' },
    { id: 2, country_id: 1, name: 'Seattle' },
  ];
  
  const populations = [
    { id: 3, city_id: 3, amount: 3960000 },
    { id: 8, city_id: 8, amount: 11920000 },
    { id: 2, city_id: 2, amount: 8240000 },
  ];
  
  // Example Output: { name: 'USA', population: 12200000 }
  
  const largestCountry = (countries, cities, populations) => {
    var newAmount = 0;
  
    var newCountries = [];
  
    var newCountryObject = {
      name: '',
      population: '',
    };
  
    for (var i = 0; i < countries.length; i++) {
      const newCities = cities.filter(
        (newCities) => newCities.country_id === countries[i].id
      );
  
      for (var k = 0; k < newCities.length; k++) {
        for (var j = 0; j < populations.length; j++) {
          if (populations[j].city_id === newCities[k].id) {
            newAmount += populations[j].amount;
  
            newCountryObject = {
              name: countries[i].name,
              population: newAmount,
            };
          }
        }
      }
      newCountries.push(newCountryObject);
      newAmount = 0;
    }
  
    const maxPopulation = Math.max.apply(
      Math,
      newCountries.map(function (o) {
        return o.population;
      })
    );
  
    for (var i = 0; i < newCountries.length; i++) {
      if (newCountries[i].population === maxPopulation) {
        newCountryObject = newCountries[i];
      }
    }
  
    //console.log(newCountryObject);
    return {
      name: newCountryObject.name,
      population: newCountryObject.population,
    };
  };
  
  module.exports = largestCountry;
  


// // Find the country with the largest population by
// // combining the given data on foreign keys

// // The output of largestCountry should be an object with a
// // key 'name' representing the country name and a key 'population'
// // representing the countries total population

// // Example Input Data:

// const countries = [
//     { id: 3, name: 'Russia' },
//     { id: 1, name: 'USA' },
// ];

// const cities = [
//     { id: 3, country_id: 1, name: 'Los Angeles' },
//     { id: 8, country_id: 3, name: 'Moscow' },
//     { id: 2, country_id: 1, name: 'Seattle' },
// ];

// const populations = [
//     { id: 3, city_id: 3, amount: 3960000 },
//     { id: 8, city_id: 8, amount: 11920000 },
//     { id: 2, city_id: 2, amount: 8240000 },
// ];

// function largestCountry(countries, cities, populations) {

//     var newAmount = 0;

//     var newCountries = [];

//     var newCountryObject = {
//         name:'',
//         population: ''
//     };

//     for (var i = 0; i < countries.length; i++) {
        
//         const newCities = cities.filter(
//             (newCities) => newCities.country_id === countries[i].id
//         );

//         for (var k = 0; k < newCities.length; k++) {
//             for (var j = 0; j < populations.length; j++) {
//                 if (populations[j].city_id === newCities[k].id) {
//                     newAmount += populations[j].amount;

//                     newCountryObject={
//                         name: countries[i].name,
//                         population: newAmount
//                     }
//                 }
//             }
//         }
//         newCountries.push(newCountryObject);
//         newAmount = 0;
//     }
    
//     const maxPopulation = Math.max.apply(Math, newCountries.map(function(o) { return o.population; }))

//     for(var i=0;i<newCountries.length;i++){
//         if(newCountries[i].population === maxPopulation){
//             newCountryObject = newCountries[i];
//         }
//     }

//     //console.log(newCountryObject);
//     return { name: newCountryObject.name , population: newCountryObject.population }


// };

// largestCountry(countries, cities, populations);









// // // Find the country with the largest population by
// // // combining the given data on foreign keys

// // // The output of largestCountry should be an object with a
// // // key 'name' representing the country name and a key 'population'
// // // representing the countries total population

// // // Example Input Data:

// // const countries = [
// //     { id: 3, name: 'Russia' },
// //     { id: 1, name: 'USA' },
// // ];

// // const cities = [
// //     { id: 3, country_id: 1, name: 'Los Angeles' },
// //     { id: 8, country_id: 3, name: 'Moscow' },
// //     { id: 2, country_id: 1, name: 'Seattle' },
// // ];

// // const populations = [
// //     { id: 3, city_id: 3, amount: 3960000 },
// //     { id: 8, city_id: 8, amount: 11920000 },
// //     { id: 2, city_id: 2, amount: 8240000 },
// // ];

// // function largestCountry(countries, cities, populations) {

// //     var newAmount = 0;
// //     var newCountryAmounts = [];

// //     for (var i = 0; i < countries.length; i++) {

// //         const newCities = cities.filter(
// //             (newCities) => newCities.country_id === countries[i].id
// //         );

// //         for (var k = 0; k < newCities.length; k++) {
// //             for (var j = 0; j < populations.length; j++) {
// //                 if (populations[j].city_id === newCities[k].id) {
// //                     newAmount += populations[j].amount;
// //                 }
// //             }
// //         }
// //         newCountryAmounts.push(newAmount);
// //         newAmount = 0;
// //     }
// //     console.log("New Amount: ", Math.max.apply(Math, newCountryAmounts));


// // };

// // largestCountry(countries, cities, populations);
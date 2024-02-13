// document.addEventListener('DOMContentLoaded', () => {
    let zipData; // Declare zipData in the outer scope

    // Load JSON data
    fetch('../Data/cleanSamplerecipes.json') // Change the file path to the generated JSON file
        .then(response => response.json())
        .then(jsonData => {
            // Set zipData to the loaded JSON data
            zipData = jsonData;
            // Add console logs to check the loaded JSON data
            console.log('JSON Data:', zipData);
            calculate();

            initialize();
        })
        .catch(error => {
            console.error('Error loading JSON data:', error);
        });  
    
    function initialize() {

        calculate();
        }

function calculate() {
    // Get the selected value from the dropdown
    const HealthKeyword = document.getElementById('diet').value;
    calculateData(HealthKeyword);
    console.log(HealthKeyword)
}

function calculateData(HealthKeyword) {
    // Find records matching the selected health keyword
    const matchingRecords = zipData.filter(entry => {
        // Use regular expression to match keywords within double quotes
        const keywordsArray = entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, ''));
        // Check if the selected HealthKeyword exists in the keywordsArray
        return keywordsArray.includes(HealthKeyword);
    });
    console.log(matchingRecords);
    // Sort matching records based on AggregatedRating (descending order)
    matchingRecords.sort((a, b) => b.AggregatedRating - a.AggregatedRating);

    // Take the top 5 records
    const top5Records = matchingRecords.slice(0, 5);
    console.log(top5Records);
    // Display the top 5 records
    displayTop5Records(top5Records, HealthKeyword);
}
function displayTop5Records(top5Records, HealthKeyword) {
    const resultElement = document.getElementById('result');

    // Clear any previous result
    resultElement.innerHTML = '';

    if (top5Records.length > 0) {
        // Create a div to contain the result
        const div = document.createElement('div');

        // Create a heading to indicate the result
        const heading = document.createElement('h3');
        heading.textContent = "Top 5 Matching Recipes for " + HealthKeyword + " are:";

        div.appendChild(heading);

        // Create an unordered list to display the records
        const ul = document.createElement('ul');

        // Iterate over the top 5 records and create list items for each record
        top5Records.forEach(record => {
            const li = document.createElement('li');
            li.textContent = `Name: ${record.Name}, Rating: ${record.AggregatedRating}, Description: ${record.Description}`;
            ul.appendChild(li);
        });

        // Append the unordered list to the result container
        div.appendChild(ul);

        // Append the result container to the resultElement
        resultElement.appendChild(div);
    } else {
        // If no records found, display a message
        resultElement.textContent = 'No records found for the selected keyword.';
    }
}

    function updateResult(calculatedValue) {
        const resultElement = document.getElementById('result');

        if (typeof calculatedValue === 'number' && !isNaN(calculatedValue)) {
            // Use toFixed only if calculatedValue is a valid number
            resultElement.textContent = `Based on your input, you will need ${calculatedValue} solar panels installed.`;
        } else {
            resultElement.textContent = 'Invalid calculation result. Please check your inputs.';
        }
    }
// })

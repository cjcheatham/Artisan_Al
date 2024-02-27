let triggerCalculate = false; // Define a global variable to trigger calculate

// Function to trigger calculate when button is clicked
function triggerCalculateFunction() {
    triggerCalculate = true; // Set triggerCalculate to true
    calculateIfTriggered(); // Call the calculate function immediately
}

// Function to calculate if the trigger is set
function calculateIfTriggered() {
    if (triggerCalculate) {
        calculate(); // Call calculate if triggerCalculate is true
    }
}

function calculate() {
    // Get the selected value from the dropdown
    const HealthKeyword = document.getElementById('diet').value;
    const CookTimeKeyword = document.getElementById('prep_time').value;
    const RegionKeyword = document.getElementById('cuisine').value;

    // Call calculateData with all three variables
    calculateData(HealthKeyword, CookTimeKeyword, RegionKeyword);
    console.log(HealthKeyword, CookTimeKeyword, RegionKeyword)
}

// function calculateData(HealthKeyword, CookTimeKeyword, RegionKeyword) {
//     // Find records matching the selected health keyword
//     const matchingRecords = zipData.filter(entry => {
//         // Use regular expression to match keywords within double quotes
//         const keywordsArray = entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, ''));
//         // Check if the selected HealthKeyword exists in the keywordsArray
//         return keywordsArray.includes(HealthKeyword) &&
//             keywordsArray.includes(CookTimeKeyword) &&
//             keywordsArray.includes(RegionKeyword);
//     });
//     console.log(matchingRecords);
//     // Sort matching records based on AggregatedRating (descending order)
//     matchingRecords.sort((a, b) => b.AggregatedRating - a.AggregatedRating);

//     // Initialize an array to store selected records
//     const selectedRecords = [];
    
//     // Take the top 5 records, avoiding duplicates
//     for (const record of matchingRecords) {
//         if (selectedRecords.length >= 5) {
//             break; // Break loop if 5 records have been selected
//         }
//         // Check if the record has already been selected
//         if (!selectedRecords.some(selectedRecord => selectedRecord.UniqueIdentifier === record.UniqueIdentifier)) {
//             selectedRecords.push(record); // Add record to selected records
//         }
//     }
    
//     console.log(selectedRecords);
//     // Display the selected records
//     displayTop5Records(selectedRecords, HealthKeyword);
// }

function calculateData(HealthKeyword, CookTimeKeyword, RegionKeyword) {
    // // Find records matching the selected health keyword
    // let matchingRecords = zipData;
    
    // if (HealthKeyword || CookTimeKeyword || RegionKeyword) {
    //     matchingRecords = matchingRecords.filter(entry => {
    //         // Use regular expression to match keywords within double quotes
    //         const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
    //         // Check if the selected HealthKeyword exists in the keywordsArray
    //         const healthMatch = !HealthKeyword || keywordsArray.includes(HealthKeyword);
    //         const cookTimeMatch = !CookTimeKeyword || keywordsArray.includes(CookTimeKeyword);
    //         const regionMatch = !RegionKeyword || keywordsArray.includes(RegionKeyword);
    //         return healthMatch && cookTimeMatch && regionMatch;
    //     });
    // }

    let matchingRecords;
    
    // Check for all possible combinations of missing keywords
    if (!HealthKeyword && !CookTimeKeyword && !RegionKeyword) {
        // If all keywords are missing, include all records
        matchingRecords = zipData;
    } else if (!HealthKeyword && !CookTimeKeyword) {
        // If HealthKeyword and CookTimeKeyword are missing
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            return keywordsArray.includes(RegionKeyword);
        });
    } else if (!HealthKeyword && !RegionKeyword) {
        // If HealthKeyword and RegionKeyword are missing
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            return keywordsArray.includes(CookTimeKeyword);
        });
    } else if (!CookTimeKeyword && !RegionKeyword) {
        // If CookTimeKeyword and RegionKeyword are missing
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            return keywordsArray.includes(HealthKeyword);
        });
    } else if (!HealthKeyword) {
        // If HealthKeyword is missing
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            const cookTimeMatch = keywordsArray.includes(CookTimeKeyword);
            const regionMatch = keywordsArray.includes(RegionKeyword);
            return cookTimeMatch && regionMatch;
        });
    } else if (!CookTimeKeyword) {
        // If CookTimeKeyword is missing
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            const healthMatch = keywordsArray.includes(HealthKeyword);
            const regionMatch = keywordsArray.includes(RegionKeyword);
            return healthMatch && regionMatch;
        });
    } else if (!RegionKeyword) {
        // If RegionKeyword is missing
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            const healthMatch = keywordsArray.includes(HealthKeyword);
            const cookTimeMatch = keywordsArray.includes(CookTimeKeyword);
            return healthMatch && cookTimeMatch;
        });
    } else {
        // If all keywords are provided, filter based on all three keywords
        matchingRecords = zipData.filter(entry => {
            const keywordsArray = entry.Keywords ? entry.Keywords.match(/"([^"]*)"/g).map(keyword => keyword.replace(/"/g, '')) : [];
            const healthMatch = keywordsArray.includes(HealthKeyword);
            const cookTimeMatch = keywordsArray.includes(CookTimeKeyword);
            const regionMatch = keywordsArray.includes(RegionKeyword);
            return healthMatch && cookTimeMatch && regionMatch;
        });
    }

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
    const resultElement = $('#result'); // Use jQuery to select the result element

    // Clear any previous result
    resultElement.empty();

    if (top5Records.length > 0) {
        // Create a div to contain the result and add FlexSlider classes
        const div = $('<div>').addClass('flexslider');

        // Create an unordered list to display the slides
        const ul = $('<ul>').addClass('slides');

        // Iterate over the top 5 records and create slides for each record
        top5Records.forEach(record => {
            // Create a li for each record
            const li = $('<li>');

            // Create spans for record details
            const nameSpan = $('<span>').text(`Recipe Name: ${record.Name}`).css({
                fontSize: '2em', // Set the font size here (for example, 1.2em)
                fontWeight: 'bold' // Make the text bold
            });

            // Append nameSpan to the li
            li.append(nameSpan);

            // Check if Images property exists and is a string
            if (typeof record.Images === 'string' && record.Images.trim() !== '') {
                // Get the first image URL from the record.Images string
                const imagesString = record.Images.trim().replace(/"/g, ''); // Remove quotation marks
                const firstImageUrl = imagesString.split(', ')[0]; // Get the first URL

                // Create an img element for the first image URL and append it to the list item
                const img = $('<img>').attr({
                    src: firstImageUrl,
                    alt: 'Recipe Image Unavailable'
                }).css({
                    display: 'block',
                    maxWidth: '40%'
                });

                // Append img to the li
                li.append(img);
            } else {
                console.log('Images property is not a non-empty string or does not exist:', record.Images);
            }

            // Create spans for other record details
            const ratingSpan = $('<span>').text(`Rating: ${record.AggregatedRating}`);
            const descriptionSpan = $('<span>').html(`<strong>Description:</strong> ${record.Description}`);
            const formattedInstructions = record.RecipeInstructions
            .replace(/"/g, '') 
            .replace(/(\.)(\s*)(,)/g, '$1')
            .split('. ')
            .map(sentence => `- ${sentence}`)
            .join('.<br>');
            const instructionSpan = $('<span>').html(`<strong>Instructions:</strong><br>${formattedInstructions}`);
            const urlSpan = $('<span>').html(`Food.com URL: <a href="${record.URL}" target="_blank">${record.URL}</a>`);

            // Append ratingSpan and descriptionSpan to the li
            li.append(ratingSpan, $('<br>'), $('<br>'),descriptionSpan, $('<br>'), $('<br>'),instructionSpan, $('<br>'), $('<br>'),urlSpan, $('<br>'));

            // Append the li to the ul
            ul.append(li);
        });

        // Append the ul to the div
        div.append(ul);

        // Append the div to the result container
        resultElement.append(div);

        // Initialize FlexSlider
        div.flexslider({
            animation: 'slide',
            controlNav: false
        });
    } else {
        // If no records found, display a message
        resultElement.text('No records found for the selected keyword.');
    }
}


let zipData; // Declare zipData in the outer scope

// Load JSON data
fetch('Data/clean/cleanMLrecipes.json') // Change the file path to the generated JSON file
    .then(response => response.json())
    .then(jsonData => {
        // Set zipData to the loaded JSON data
        zipData = jsonData;
        // Add console logs to check the loaded JSON data
        console.log('JSON Data:', zipData);
            
        if (triggerCalculate) { 
            calculate(); // Call calculate if triggerCalculate is true
        }

            initialize();
        })
        .catch(error => {
            console.error('Error loading JSON data:', error);
        });  
    
function initialize() {

    }

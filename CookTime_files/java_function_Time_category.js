// JS function that will be triggered once the user selects a time category

function getRecipes() {
    // Get the selected time category from the dropdown menu
    var selectedCategory = document.getElementById("timeCategory").value;
    
    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();
    
    // Define the request parameters (method, URL, asynchronous)
    xhr.open("POST", "/get_recipes", true);
    
    // Set the request header
    xhr.setRequestHeader("Content-Type", "application/json");
    
    // Define the callback function to handle the response from the server
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Handle the successful response from the server
                var recipes = JSON.parse(xhr.responseText);
                // Display the recipes on the webpage
                displayRecipes(recipes);
            } else {
                // Handle errors
                console.error("Error:", xhr.status);
            }
        }
    };
    
    // Send the selected category to the server
    xhr.send(JSON.stringify({ category: selectedCategory }));
}
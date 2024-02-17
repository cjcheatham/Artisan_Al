//js script to handle the user text input and send input to backend server

function searchRecipesByKeyword() {
    // Get the keyword entered by the user
    var keyword = document.getElementById("keywordInput").value.trim();
    
    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();
    
    // Define the request parameters (method, URL, asynchronous)
    xhr.open("POST", "/search_recipes_by_keyword", true);
    
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
    
    // Send the keyword to the server
    xhr.send(JSON.stringify({ keyword: keyword }));
}
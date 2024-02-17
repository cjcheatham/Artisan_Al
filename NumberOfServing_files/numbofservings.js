//js script to handle the user selection and send the selected number of servings to backend server
function getRecipesByServings() {
    // Get the selected number of servings from the dropdown menu
    var selectedServings = document.getElementById("numServings").value;
    
    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();
    
    // Define the request parameters (method, URL, asynchronous)
    xhr.open("POST", "/get_recipes_by_servings", true);
    
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
    
    // Send the selected number of servings to the server
    xhr.send(JSON.stringify({ servings: selectedServings }));
}
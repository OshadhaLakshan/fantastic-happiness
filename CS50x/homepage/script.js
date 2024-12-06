document.addEventListener("DOMContentLoaded", () => {
    console.log("Website loaded successfully!");
});

function showAlert() {
    alert('Welcome to my Home page!');
}

// Function to handle form submission
document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the default form submission

    emailjs.sendForm('service_zskp91o', 'template_glaqi5e', this)
        .then(function(response) {
            console.log('SUCCESS!', response.status, response.text);
            alert('Email successfully sent!');
        }, function(error) {
            console.log('FAILED...', error);
            alert('Failed to send email. Please try again.');
        });
});






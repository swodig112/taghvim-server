document.getElementById('locateForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const date = document.getElementById('date').value;
    const time = document.getElementById('time').value;
    // const latitude = parseFloat(document.getElementById('latitude').value);
    // const longitude = parseFloat(document.getElementById('longitude').value);
    const objectName = document.getElementById('objectName').value;

    const requestData = {
        date,
        time,
        // latitude,
        // longitude,
        objectName
    };

    fetch('http://taghvim.swodig.ir:8081', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestData)
    })
    .then(response => response.json())
    .then(data => {
        const resultDiv = document.getElementById('result');
        resultDiv.innerText = `Coordinates in the sky (degrees, AU, AU/day):\n     Right Ascension: ${data.rightAscension}\n     Declination: ${data.declination}\n     Position: ${data.position}\n     Velocity: ${data.velocity}`;
        resultDiv.style.background = "#e7f7e7";
        resultDiv.style.display = 'block';
    })
    .catch(error => {
        console.error('Error:', error);
        const resultDiv = document.getElementById('result');
        resultDiv.innerText = 'Error retrieving data.';
        resultDiv.style.background = "#f7e7e7";
        resultDiv.style.display = 'block';
    2});
});

(async function() {
    const { text } = await( await fetch(`/api/httptrigger1`)).json();
    document.querySelector('#name').textContent = text;
}())
function dashboard(){
    window.location.href = '/dashboard';
}

function logout(){
    var request = new XMLHttpRequest();
    request.open("POST", "/logout");
    request.send();
    window.location.href = '/login';
}
class Ajax {

    get(field, query, callback) {

        var prepend = "https://cors-anywhere.herokuapp.com/"    // hack to get around CORS
        var endpoint = "https://rails5-api-mode-mirv.c9users.io/users"  // API endpoint
        var params = "?match_target=" + query + "&by_field=" + field    // API paramters

        var httpRequest = new XMLHttpRequest();

        if (!httpRequest) {
        console.error('Giving up :( Cannot create an XMLHTTP instance');
        return false;
        }
        httpRequest.onreadystatechange = function() {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {
                // console.log(httpRequest.responseText);
                callback(httpRequest.responseText);
            } else {
                console.error('There was a problem with the request.');
            }
            }
        };

        httpRequest.open('GET', prepend + endpoint + params);
        httpRequest.send();
    }
}

// Users.withEducation("High School").get(callback);
class Users {

    constructor() {
        this.field = "";
        this.query = "";
    }

    with(field, query) {
        this.field = field;
        this.query = query;
        return this;
    }

    // actually makes requests
    get(callback) {
        let apiCall = new Ajax;
        apiCall.get(this.field, this.query, callback);
    }


}
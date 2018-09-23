class Ajax {

    get(params, callback) {

        var prepend = "https://cors-anywhere.herokuapp.com/"    // hack to get around CORS
        var endpoint = "https://rails5-api-mode-mirv.c9users.io/users"  // API endpoint

        var httpRequest = new XMLHttpRequest();

        if (!httpRequest) {
        // console.error('Giving up :( Cannot create an XMLHTTP instance');
        return false;
        }
        httpRequest.onreadystatechange = function() {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {
                // console.log(httpRequest.responseText);
                callback(httpRequest.responseText);
            } else {
                // console.error('There was a problem with the request.');
            }
            }
        };

        httpRequest.open('GET', prepend + endpoint + params);
        httpRequest.send();
    }
}

// Users.with("type", "seeker").with("education", "High School").get(callback);
class Users {

    constructor() {
        this.params = "?";
    }

    with(field, query) {
        if (field = "type") {
            this.params = this.params + "search_role=" + query + "&";
        
        } else {
            this.params = this.params + "by_field=" + field + "match_target&=" + query;
        }       
        
        return this;
    }

    
    // actually makes requests
    get(callback) {
        let apiCall = new Ajax;
        apiCall.get(this.params, callback);
    }


}

export default Users;
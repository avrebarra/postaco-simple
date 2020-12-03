# Imgur API {106945253110150000}

![image](https://i.imgur.com/n744BL9.png)

## API Status
Status for the API can be found at [status.imgur.com](http://status.imgur.com)!

## Getting Started
Imgur&#39;s API exposes the entire Imgur infrastructure via a standardized programmatic interface. Using Imgur&#39;s API, you can do just about anything you can do on imgur.com, while using your programming language of choice. The Imgur API is a RESTful API based on HTTP requests and JSON responses.

This version of the API, version 3, uses OAuth 2.0. This means that all requests will need to be encrypted and sent via HTTPS. It also means that you need to register your application, even if you aren&#39;t allowing users to login.

The easiest way to start using the Imgur API is by clicking the **Run in Postman** button above. [Postman](https://www.getpostman.com/) is a free tool which helps developers run and debug API requests, and is the source of truth for this documentation. Every endpoint you see documented here is readily available by running our Postman collection. 

## Example code
These examples serve as a starting point to help familiarize you with the basics of the Imgur API.
* [Official Python library](https://github.com/Imgur/imgurpython)
* [Android Upload Example](https://github.com/AKiniyalocts/imgur-android)
* [Older Example Android app](https://github.com/talklittle/ImgurAPIv3ExampleAndroid)
* [Example HTML5/JavaScript app](https://github.com/eirikb/gifie) - [Javascript OAuth](https://gist.github.com/eirikb/7404666)—[Live Demo](http://eirikb.github.io/gifie/) (uses your webcam)
* [Example Objective C library](https://github.com/geoffmacd/ImgurSession)

## Need help?
The Imgur engineers are always around answering questions. The quickest way to get help is by posting your question on StackOverflow with the [Imgur tag](https://stackoverflow.com/questions/tagged/imgur).

## Register an Application (IMPORTANT)
Each client must register their application and receive the `client_id` and `client_secret`.

For public read-only and anonymous resources, such as getting image info, looking up user comments, etc. all you need to do is send an authorization header with your client_id in your requests. This also works if you&#39;d like to upload images anonymously (without the image being tied to an account), or if you&#39;d like to create an anonymous album. This lets us know which application is accessing the API.

    Authorization: Client-ID &lt;YOUR_CLIENT_ID&gt;


### Registration Quickstart
If you are just getting started, an easy way to explore the endpoints is by creating an application using following instructions below.

1. Download [Postman](https://www.getpostman.com/) and click the **Run in Postman** button at the top of this page. This will load our collection of endpoints into Postman for easy debugging.
2. [Register your application](https://api.imgur.com/oauth2/addclient) using the postman callback URL: `https://www.getpostman.com/oauth2/callback` ![Image](https://i.imgur.com/Ied42En.png)
3. In Postman, under the main request builder panel, click the Authorization tab. Click the **Get New Access Token** button. Set **Auth URL** to `https://api.imgur.com/oauth2/authorize` and **Access Token URL** to `https://api.imgur.com/oauth2/token`. Add the **Client ID** and **Client Secret** you received from registering your application above, then click **Request Token** ![Image](https://i.imgur.com/iKHSGFD.png)
4. After logging in and granting access to your application, you should receive a refresh token. ![Image](https://i.imgur.com/0dN8cyJ.png) Copy this refresh token, then click the gear icon in the top right of Postman. Click **Manage Environments** then **Add**, and add the `refreshToken`, `clientId`, and `clientSecret` fields as shown below ![Image](https://i.imgur.com/DaFV5ux.png)
5. Inside the **Account** folder, run the **Generate Access Token** endpoint. The response you receive will give you an access token which will be valid for about a month. This token is automatically saved to your Postman environment via the JavaScript test for that endpoint as seen below. Whenever your token expires, just re-run this endpoint and a new token will be saved to your environment. ![Image](https://i.imgur.com/5Ed4RhP.png)
6. Run any endpoint within the collection. You have authorized your app and logged in with your username, so you are now making authenticated requests against the Imgur API. Happy hacking!  

## Commercial Usage
Your application is commercial if you&#39;re making any money with it (which includes in-app advertising), if you plan on making any money with it, or if it belongs to a commercial organization.

To use Imgur&#39;s API commercially, you must first [register your application](https://api.imgur.com/oauth2/addclient). Once that&#39;s done, you must [register with Mashape](https://market.mashape.com/imgur/imgur-9). Mashape allows you to choose a pricing plan that fits your needs. From then on, the API endpoint is `https://imgur-apiv3.p.mashape.com/` which must be used in place of `https://api.imgur.com/`. Additionally, you must set a `X-Mashape-Key` request header with the key obtained from Mashape.

## Free Usage
The Imgur API is free for non-commercial usage. Your application is probably free if you don&#39;t plan on making any money with it, or if it&#39;s open source.

## Endpoints
The API is accessed by making HTTP requests to a specific version endpoint URL, in which GET or POST variables contain information about what you wish to access. Every endpoint is accessed via an SSL-enabled HTTPS (port 443), this is because everything is using OAuth 2.0.

Everything (methods, parameters, etc.) is fixed to a version number, and every call must contain one. Different Versions are available at different endpoint URLs. The latest version is Version 3.

The stable HTTP endpoint for the latest version is:
`https://api.imgur.com/3/`

## Responses
Each response is wrapped in a data tag. This means if you have a response, it will always be within the data field. We also include a status code and success flag in the response. For more information and examples go to the [data models](https://api.imgur.com/models) page.

Responses are either JSON (the default), JSONP, or XML. Response formats are specified by supplying an extension to the API call. For example, if you want to access the gallery information with JSON:

    https://api.imgur.com/3/gallery.json
    
JSONP responses are made by adding the callback parameter via either GET or POST to the request. For example:

    https://api.imgur.com/3/gallery.json?callback=function_name
    
and to specify an XML response, the URL is:

    https://api.imgur.com/3/gallery.xml
    
## Paging Results
For the most part, if the API action is plural, you can page it via a query string parameter.

NOTE: /gallery endpoints do not support the perPage query string, and /album/{id}/images is not paged.

| Query String Parameter | Required | Description                                                   |
|------------------------|----------|---------------------------------------------------------------|
| page                   | optional | Page number of the result set (default: 0)                    |
| perPage                | optional | Limit the number of results per page. (default: 50, max: 100) |

Example:

    https://api.imgur.com/3/account/imgur/images/0.json?perPage=42&amp;page=6
    
## Authentication
The API requires each client to use OAuth 2 authentication. This means you&#39;ll have to [register your application](https://api.imgur.com/oauth2/addclient), and generate an access_code if you&#39;d like to log in as a user.
For public read-only and anonymous resources, such as getting image info, looking up user comments, etc. all you need to do is send an authorization header with your client_id in your requests. This also works if you&#39;d like to upload images anonymously (without the image being tied to an account), or if you&#39;d like to create an anonymous album. This lets us know which application is accessing the API.

    Authorization: Client-ID &lt;YOUR_CLIENT_ID&gt;

For accessing a user&#39;s account, please visit the OAuth2 section of the docs.
OAuth Endpoints
To access OAuth, the following endpoints must be used:

    https://api.imgur.com/oauth2/addclient
    https://api.imgur.com/oauth2/authorize
    https://api.imgur.com/oauth2/token
    
You can also verify your OAuth 2.0 tokens by setting your header and visiting the page 

    https://api.imgur.com/oauth2/secret
    
## Rate Limits
The Imgur API uses a credit allocation system to ensure fair distribution of capacity. Each application can allow *approximately 1,250 uploads per day or approximately 12,500 requests per day*. If the daily limit is hit five times in a month, then the app will be blocked for the rest of the month. The remaining credit limit will be shown with each requests response in the `X-RateLimit-ClientRemaining` HTTP header.

We also limit each user (via their IP Address) for each application, this is to ensure that no single user is able to spam an application. This limit will simply stop the user from requesting more data for an hour. We recommend that each application takes precautions against spamming by implementing rate limiting on their own applications. Each response will also include the remaining credits for each user in the `X-RateLimit-UserLimit` HTTP header.

Each request contains rate limit information in the HTTP response headers.

| HTTP Header                 | Description                                                       |
|-----------------------------|-------------------------------------------------------------------|
| X-RateLimit-UserLimit       | Total credits that can be allocated.                              |
| X-RateLimit-UserRemaining   | Total credits available.                                          |
| X-RateLimit-UserReset       | Timestamp (unix epoch) for when the credits will be reset.        |
| X-RateLimit-ClientLimit     | Total credits that can be allocated for the application in a day. |
| X-RateLimit-ClientRemaining | Total credits remaining for the application in a day.             |

Unless otherwise noted, an API call deducts 1 credit from your allocation. However, uploads have a significantly higher computational cost on our back-end, and deduct 10 credits per call. All OAuth calls, such as refreshing tokens or authorizing users, do not deduct any credits.
You can also check the current rate limit status on your application by sending a GET request to 

    https://api.imgur.com/3/credits

Your use of the Imgur API is also limited by the number of POST requests your IP can make across all endpoints. This limit is *1,250 POST requests per hour*. [Commercial Usage](http://api.imgur.com/#commercial) is not impacted by this limit. Each POST request will contain the following headers.

| HTTP Header                 | Description                                        |
|-----------------------------|----------------------------------------------------|
| X-Post-Rate-Limit-Limit     | Total POST credits that are allocated.             |
| X-Post-Rate-Limit-Remaining | Total POST credits available.                      |
| X-Post-Rate-Limit-Reset     | Time in seconds until your POST ratelimit is reset |

# Authorization and OAuth

## OAuth 2.0 Overview
The Imgur API uses OAuth 2.0 for authentication. OAuth 2.0 has four steps: registration, authorization, making the request, and getting new access_tokens after the initial one expired.

* [Registration](https://api.imgur.com/oauth2/addclient) gives you your `client_id` and `client_secret`, which is then used to authorize the user to your app.
* Authorization is the process of the user saying &quot;I would like YourSuperAwesomeImgurApp to access my data&quot;. YourSuperAwesomeImgurApp cannot access the user&#39;s account without them agreeing to it. After they agree, you will get refresh and access tokens.
    * `access_token`: is your secret key used to access the user&#39;s data. It can be thought of the user&#39;s password and username combined into one, and is used to access the user&#39;s account. It expires after 1 month.
    * `refresh_token`: is used to request new access_tokens. Since access_tokens expire after 1 month, we need a way to request new ones without going through the entire authorization step again. It does not expire.
    * `authorization_code`: is used for obtaining the the access and refresh tokens. It&#39;s purpose is to be immediately exchanged for an access_token and refresh_token.
    * Finally, after obtaining your access_token, you make your API requests by sending the Authorization header as such: 
    ```Authorization: Bearer YOUR_ACCESS_TOKEN```
    
* Registration

Each client must register their application and receive the client_id and client_secret.

For public read-only and anonymous resources, such as getting image info, looking up user comments, etc. all you need to do is send an authorization header with your client_id in your requests. This also works if you&#39;d like to upload images anonymously (without the image being tied to an account), or if you&#39;d like to create an anonymous album. This lets us know which application is accessing the API.

    Authorization: Client-ID YOUR_CLIENT_ID

## Authorization

&gt; _NOTE:_ If your app is not only requesting public read-only information, then you may skip this step.

To access a user&#39;s account, the user must first authorize your application so that you can get an access token. Requesting an access token is fairly straightforward: point a browser (pop-up, or full page redirect if needed) to a URL and include a set of query string parameters.

    https://api.imgur.com/oauth2/authorize?client_id=YOUR_CLIENT_ID&amp;response_type=REQUESTED_RESPONSE_TYPE&amp;state=APPLICATION_STATE
    
The user will now be able to enter their password and accept that they&#39;d like to use your application. Once this happens, they will be redirected to your redirect URL (that you entered during registration) with the access token. You can now send the access token in the headers to access their account information.

#### Forming the authorization URL

Authorization Endpoint: `https://api.imgur.com/oauth2/authorize`

| Parameter     | Values                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|---------------|----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| response_type | `token`, `code`, or `pin`                    | _Only `token` should be used, as the other methods have been deprecated._ Determines if Imgur returns an access_token, authorization_code (_deprecated_), or a PIN code(_deprecated_). When using `token`, the `access_token` and `refresh_token` will be given to you in the form of query string parameters attached to your redirect URL, which the user may be able to read.                                                                                                                                          |
| client_id     | the Client ID you recieved from registration | Indicates the client that is making the request.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| state         | any string                                   | This optional parameter indicates any state which may be useful to your application upon receipt of the response. Imgur round-trips this parameter, so your application receives the same value it sent. Possible uses include redirecting the user to the correct resource in your site, nonces, and cross-site-request-forgery mitigations.                                                                                                                                                                             |

#### The `response_type` Parameter

`token`: This authorization flow will directly return the `access_token` and `refresh_token` via the redirect URL you specified during registration, in the form of hash query string parameters. Example: `http://example.com#access_token=ACCESS_TOKEN&amp;token_type=Bearer&amp;expires_in=3600`

The `code` and `pin` response types have been deprecated and will soon no longer be supported.

### Handling the Authorization Response

The response will be sent to the redirect URL that was specified during registration. The contents and format of the response is determined by the value of the response_type parameter.
You&#39;re able to change your applications redirect URL at any time by accessing the [&#39;apps&#39; section of your account settings](http://imgur.com/account/settings/apps).

#### JavaScript responses for the response_type: `token`

Imgur returns an access token to your application if the user grants your application the permissions it requested. The access token is returned to your application in the fragment as part of the `access_token` parameter. Since a fragment (the part of the URL after the `#`) is not sent to the server, client side javascript must parse the fragment and extract the value of the `access_token` parameter.
Other parameters included in the response include `expires_in` and `token_type`. These parameters describe the lifetime of the token in seconds, and the kind of token that is being returned. If the `state` parameter was included in the request, then it is also included in the response.
An example User Agent flow response is shown below:

    https://example.com/oauthcallback#access_token=ACCESS_TOKEN&amp;token_type=Bearer&amp;expires_in=3600
    
Below is a JavaScript snippet that parses the response and returns the parameters to the server.

```js
// First, parse the query string
var params = {}, queryString = location.hash.substring(1),
    regex = /([^&amp;=]+)=([^&amp;]*)/g, m;
while (m = regex.exec(queryString)) {
  params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
}

// And send the token over to the server
var req = new XMLHttpRequest();
// consider using POST so query isn&#39;t logged
req.open(&#39;GET&#39;, &#39;https://&#39; + window.location.host + &#39;/catchtoken?&#39; + queryString, true);

req.onreadystatechange = function (e) {
  if (req.readyState == 4) {
     if(req.status == 200){
       window.location = params[&#39;state&#39;]
   }
  else if(req.status == 400) {
        alert(&#39;There was an error processing the token.&#39;)
    }
    else {
      alert(&#39;something else other than 200 was returned&#39;)
    }
  }
};
req.send(null);
```

This code sends the parameters received on the fragment to the server using XMLHttpRequest and writes the access token to local storage in the browser. The latter is an optional step, and depends on whether or not the application requires other JavaScript code to make calls to the Imgur API. Also note that this code sends the parameters to the token endpoint, and they are sent over an HTTPS channel.

#### Error Response

The Imgur API returns an error if the user did not grant your application the permissions it requested. The error is returned to the application in the query string parameter error if the web server flow is used. If the user agent flow was used, then the error is returned in the fragment. If the state parameter was included in the request, it is also present in the error response.

An example error response for the web server flow is shown below:

    https://example.com/oauthcallback?error=access_denied
    
### Making your requests
Congrats! You must have the user&#39;s access_token at this point and you&#39;re ready to start making API requests to their account. All that&#39;s required for this is to set the header in your requests:

    Authorization: Bearer YOUR_ACCESS_TOKEN
    
### Refresh Tokens

If a user has authorized their account but you no longer have a valid access_token for them, then a new one can be generated by using the refresh_token.

When your application receives a refresh token, it is important to store that refresh token for future use. If your application loses the refresh token, you will have to prompt the user for their login information again.

To obtain a new access token, your application performs a POST to `https://api.imgur.com/oauth2/token`. The request must include the following parameters to use a refresh token:

| Field         | Description                                                                               |
|---------------|-------------------------------------------------------------------------------------------|
| refresh_token | The refresh token returned from the authorization code exchange                           |
| client_id     | The client_id obtained during application registration                                    |
| client_secret | The client secret obtained during application registration                                |
| grant_type    | As defined in the OAuth2 specification, this field must contain a value of: `refresh_token` |

As long as the user has not revoked the access granted to your application, the response includes a new access token. A response from such a request is shown below:

```json
{
    &quot;access_token&quot;:&quot;5c3118ebb73fbb275945ab340be60b610a3216d6&quot;,
    &quot;refresh_token&quot;:&quot;d36b474c95bb9ee54b992c7c34fffc2cc343d0a7&quot;,
    &quot;expires_in&quot;:3600,
    &quot;token_type&quot;:&quot;Bearer&quot;,
    &quot;account_username&quot;:&quot;saponifi3d&quot;
}
```

### More OAuth 2 help and documentation
For more information about how to use OAuth 2, please visit the great documentation from Google. At the time of writing, our OAuth 2 server is completely compatible with theirs. The documentation may be found here: https://developers.google.com/accounts/docs/OAuth2



# Performance Tips
Below are a few ways you can speed up your application&#39;s use of the Imgur API. 

If you have any additional feature requests, please reach out on Twitter [@imgurAPI](https://twitter.com/imgurAPI)!

### ETag Support
The Imgur API supports [ETags](http://en.wikipedia.org/wiki/HTTP_ETag), which allows the API to signal to developers whether or not data from previous queries have changed. 

Usage:
1. When fetching from the Imgur API, the response header will include an ETag with a digest of the response data. Save this ETag value for future requests to the same route. 

    An example ETag response header: 
    
    `ETag: &quot;a695f4e9672bf7fc7a779ac12ead684d72292506&quot;`
1. On the next request to the same route, include a If-None-Match header in the request with the ETag from the first step. (Note: the quotations around the hash must be included) 

    An example ETag request header: 
    
    `If-None-Match: &quot;a695f4e9672bf7fc7a779ac12ead684d72292506&quot;`
1. If the data hasn&#39;t changed, the response status code will be *304* (Not Modified) and no data will be returned.
1. If the response data has changed since the last request, the data is returned normally with a new ETag in the response header. Save this value for future requests.

    *Note:* Although ETags help speed up your application, requests with the *If-None-Match* header will still count towards rate limits.


## Account {150946687610293000}

### Account Available Avatars (Un-authed / Authed) {71600495710294000}

| | |
|--|--|
|__Name__| Account Available Avatars (Un-authed / Authed)|
|__URL__| https://api.imgur.com/3/account/{{username}}/available_avatars |
|__Method__| GET|

#### Description
If unauthentiated, get list of default trophies a user can select from. The username need not exist to get the listing.

If authenticated, get the list of available avatars for the given user.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/available_avatars'
```




### Account Avatar (Authed) {37183678110297000}

| | |
|--|--|
|__Name__| Account Avatar (Authed)|
|__URL__| https://api.imgur.com/3/account/{{username}}/avatar |
|__Method__| GET|

#### Description
Get the current account&#39;s avatar URL and avatar name.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/avatar'
```




### Account Base {90636345710298000}

| | |
|--|--|
|__Name__| Account Base|
|__URL__| https://api.imgur.com/3/account/{{username}} |
|__Method__| GET|

#### Description
Request standard user information. If you need the username for the account that is logged in, it is returned in the request for an [access token](/account/current_account). Note: This endpoint also supports the ability to lookup account base info by account ID. To do so, pass the query parameter `account_id`.

#### Response Model: [Account](https://api.imgur.com/models/account)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D'
```



#### Response Examples

##### Example 1: Sample Response

```json
Code: 200 OK
------------------------------------------
{"data":{"id":48437714,"url":"ghostinspector","bio":null,"avatar":null,"reputation":0,"reputation_name":"Neutral","created":1481839668,"pro_expiration":false,"user_follow":{"status":false}},"success":true,"status":200}
```


### Account Delete (me) {401864169610304000}

| | |
|--|--|
|__Name__| Account Delete (me)|
|__URL__| https://{{hostname}}/3/account/me/delete?client_id={{clientId}} |
|__Method__| POST|

#### Description
Delete the account of the auth&#39;d user with delete feedback.

note: password is left blank to avoid accidental account deletion, to delete account you must add account password to body.

#### Request




### Account Favorites {225190854510305000}

| | |
|--|--|
|__Name__| Account Favorites|
|__URL__| https://api.imgur.com/3/account/{{username}}/favorites/{{page}}/{{favoritesSort}} |
|__Method__| GET|

#### Description
Returns the users favorited images, only accessible if you&#39;re logged in as the user.

#### Response Model: [Gallery Image](https://api.imgur.com/models/gallery_image) OR [Gallery Album](https://api.imgur.com/models/gallery_album)

*Note:* vote data (&#39;ups&#39;, &#39;downs&#39;, and &#39;score&#39;) may be null if the favorited item hasn&#39;t been submitted to gallery


#### Parameters

| Key  | Required | Description                                                                                     |
|------|----------|-------------------------------------------------------------------------------------------------|
| page | optional | integer - allows you to set the page number so you don&#39;t have to retrieve all the data at once. |
| sort | optional | &#39;oldest&#39;, or &#39;newest&#39;. Defaults to &#39;newest&#39;.                                                    |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/favorites/%7B%7Bpage%7D%7D/%7B%7BfavoritesSort%7D%7D'
```




### Account Gallery Favorites {284420328310310000}

| | |
|--|--|
|__Name__| Account Gallery Favorites|
|__URL__| https://api.imgur.com/3/account/{{username}}/gallery_favorites/{{page}}/{{favoritesSort}} |
|__Method__| GET|

#### Description
Return the images the user has favorited in the gallery.

#### Response Model: [Gallery Image](https://api.imgur.com/models/gallery_image) OR [Gallery Album](https://api.imgur.com/models/gallery_album)


#### Parameters

| Key  | Required | Description                                                                                     |
|------|----------|-------------------------------------------------------------------------------------------------|
| page | optional | integer - allows you to set the page number so you don&#39;t have to retrieve all the data at once. |
| favoriteSort | optional | `oldest`, or `newest`. Defaults to `newest`.                                                    |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/gallery_favorites/%7B%7Bpage%7D%7D/%7B%7BfavoritesSort%7D%7D'
```




### Account Gallery Profile {178594955510312000}

| | |
|--|--|
|__Name__| Account Gallery Profile|
|__URL__| https://api.imgur.com/3/account/{{username}}/settings |
|__Method__| GET|

#### Description
Returns the totals for the gallery profile.

#### Response Model: [Gallery Profile](https://api.imgur.com/models/gallery_profile)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/settings'
```




### Account Images {182361333410314000}

| | |
|--|--|
|__Name__| Account Images|
|__URL__| https://api.imgur.com/3/account/me/images |
|__Method__| GET|

#### Description
To make requests for the current account, you may use `me` as the `{{username}}` parameter. For example, `https://api.imgur.com/3/account/me/images` will request all the images for the account that is currently authenticated.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/me/images'
```




### Account Settings {222696914510315000}

| | |
|--|--|
|__Name__| Account Settings|
|__URL__| https://api.imgur.com/3/account/me/settings |
|__Method__| GET|

#### Description
Returns the account settings, only accessible if you&#39;re logged in as the user.



#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/me/settings'
```




### Account Submissions {160364185710316000}

| | |
|--|--|
|__Name__| Account Submissions|
|__URL__| https://api.imgur.com/3/account/{{username}}/submissions/{{page}} |
|__Method__| GET|

#### Description
Return the images a user has submitted to the gallery. You can add sorting as well after paging. Sorts can be: newest (default), oldest, worst, best. 

#### Response Model: [Gallery Image](https://api.imgur.com/models/gallery_image) OR [Gallery Album](https://api.imgur.com/models/gallery_album)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/submissions/%7B%7Bpage%7D%7D'
```



#### Response Examples

##### Example 1: Account Submissions

```json
Code: 200 OK
------------------------------------------

```


### Album {17973914810318000}

| | |
|--|--|
|__Name__| Album|
|__URL__| https://api.imgur.com/3/account/{{username}}/album/{{albumHash}} |
|__Method__| GET|

#### Description
Get additional information about an album, this endpoint works the same as the [Album Endpoint](). You can also use any of the additional routes that are used on an album in the album endpoint.

#### Response Model: [Album](https://api.imgur.com/models/album)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/album/%7B%7BalbumHash%7D%7D'
```




### Album Count (Un-Authed / Authed) {25719452710320000}

| | |
|--|--|
|__Name__| Album Count (Un-Authed / Authed)|
|__URL__| https://api.imgur.com/3/account/{{username}}/albums/count |
|__Method__| GET|

#### Description
Return the total number of albums associated with the account.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/albums/count'
```




### Album Deletion {82884568610343000}

| | |
|--|--|
|__Name__| Album Deletion|
|__URL__| https://api.imgur.com/3/account/{{username}}/album/{{albumHash}} |
|__Method__| DELETE|

#### Description
Delete an Album with a given id.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/album/%7B%7BalbumHash%7D%7D'
```




### Album IDs (Un-Authed / Authed) {21878540010344000}

| | |
|--|--|
|__Name__| Album IDs (Un-Authed / Authed)|
|__URL__| https://api.imgur.com/3/account/{{username}}/albums/ids/{{page}} |
|__Method__| GET|

#### Description
Return an array of all of the album IDs (hashes).

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/albums/ids/%7B%7Bpage%7D%7D'
```




### Albums (Un-Authed / Authed) {417579034110345000}

| | |
|--|--|
|__Name__| Albums (Un-Authed / Authed)|
|__URL__| https://api.imgur.com/3/account/{{username}}/albums/{{page}} |
|__Method__| GET|

#### Description
Get all the albums associated with the account. Must be logged in as the user to see secret and hidden albums.

#### Response Model: [Album](https://api.imgur.com/models/album)

#### Parameters
| Key  | Required | Description                                                                                     |
|------|----------|-------------------------------------------------------------------------------------------------|
| page | optional | integer - allows you to set the page number so you don&#39;t have to retrieve all the data at once. |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/albums/%7B%7Bpage%7D%7D'
```




### Change Account Settings {264508670710349000}

| | |
|--|--|
|__Name__| Change Account Settings|
|__URL__| https://api.imgur.com/3/account/{{username}}/settings |
|__Method__| PUT|

#### Description
Updates the account settings for a given user, the user must be logged in.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key                    | Required | Description                                                                           |
|------------------------|----------|---------------------------------------------------------------------------------------|
| bio                    | optional | The biography of the user, is displayed in the gallery profile page.                  |
| public_images          | optional | Set the users images to private or public by default                                  |
| messaging_enabled      | optional | true &amp;#124; false - Allows the user to enable / disable private messages                   |
| album_privacy          | optional | public &amp;#124; hidden &amp;#124; secret - Sets the default privacy level of albums the users creates |
| accepted_gallery_terms | optional | true &amp;#124; false - The user agreement to the Imgur Gallery terms.                         |
| username               | optional | A valid Imgur username (between 4 and 63 alphanumeric characters)                     |
| show_mature            | optional | true &amp;#124; false - Toggle display of mature images in gallery list endpoints.             |
| newsletter_subscribed  | optional | true &amp;#124; false - Toggle subscription to email newsletter.                               |

#### Request

```sh
curl -X 'PUT' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/settings'
```




### Comment {255535513410354000}

| | |
|--|--|
|__Name__| Comment|
|__URL__| https://api.imgur.com/3/account/{{username}}/comment/{{commentId}} |
|__Method__| GET|

#### Description
Return information about a specific comment. This endpoint works the same as the [Comment Endpoint](https://api.imgur.com/endpoint/comment/). You can use any of the additional actions that the comment endpoint allows on this end point.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/comment/%7B%7BcommentId%7D%7D'
```




### Comment Count {137538052910355000}

| | |
|--|--|
|__Name__| Comment Count|
|__URL__| https://api.imgur.com/3/account/{{username}}/comments/count |
|__Method__| GET|

#### Description
Return a count of all of the comments associated with the account.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/comments/count'
```




### Comment Deletion {139158022010356000}

| | |
|--|--|
|__Name__| Comment Deletion|
|__URL__| https://api.imgur.com/3/account/{{username}}/comment/{{commentId}} |
|__Method__| DELETE|

#### Description
Delete a comment. You are required to be logged in as the user whom created the comment.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/comment/%7B%7BcommentId%7D%7D'
```




### Comment IDs {325845818810357000}

| | |
|--|--|
|__Name__| Comment IDs|
|__URL__| https://api.imgur.com/3/account/{{username}}/comments/ids/{{sort}}/{{page}} |
|__Method__| GET|

#### Description
Return an array of all of the comment IDs.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key  | Required | Value                                                         |
|------|----------|---------------------------------------------------------------|
| commentSort | optional | `best`, `worst`, `oldest`, or `newest`. Defaults to `newest`. |
| page | optional | Page number (50 items per page). Defaults to `0`.               |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/comments/ids/%7B%7Bsort%7D%7D/%7B%7Bpage%7D%7D'
```




### Comments {138150987910359000}

| | |
|--|--|
|__Name__| Comments|
|__URL__| https://api.imgur.com/3/account/{{username}}/comments/{{commentSort}}/{{page}} |
|__Method__| GET|

#### Description
Return the comments the user has created.

#### Response Model: [Comment](https://api.imgur.com/models/comment)

#### Parameters

| Key  | Required | Value                                                         |
|------|----------|---------------------------------------------------------------|
| commentSort | optional | `best`, `worst`, `oldest`, or `newest`. Defaults to `newest`. |
| page | optional | Page number (50 items per page). Defaults to `0`.               |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/comments/%7B%7BcommentSort%7D%7D/%7B%7Bpage%7D%7D'
```




### Follow Tag {14267233610360000}

| | |
|--|--|
|__Name__| Follow Tag|
|__URL__| https://api.imgur.com/3/account/me/follow/tag/{{tagName}} |
|__Method__| POST|

#### Description
Follows the {{tagName}} specified for the currently logged in user.

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/me/follow/tag/%7B%7BtagName%7D%7D'
```



#### Response Examples

##### Example 1: Follow Tag: Tag Does Not Exist

```json
Code: 404 Not Found
------------------------------------------
{"data":{"error":"Tag does not exist","request":"\/3\/account\/me\/follow\/tag\/{{tagName}}","method":"POST"},"success":false,"status":404}
```

##### Example 2: Follow Tag: Success

```json
Code: 200 OK
------------------------------------------
{"data":true,"success":true,"status":200}
```


### Follow User {106155809910362000}

| | |
|--|--|
|__Name__| Follow User|
|__URL__| https://api.imgur.com/3/account/me/follow/tag/{{tagName}} |
|__Method__| POST|

#### Description
Follows the {{follow_user_id}} specified for the currently logged in user.

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/me/follow/tag/%7B%7BtagName%7D%7D'
```



#### Response Examples

##### Example 1: Follow Tag: Success

```json
Code: 200 OK
------------------------------------------
{"data":true,"success":true,"status":200}
```

##### Example 2: Follow Tag: Tag Does Not Exist

```json
Code: 404 Not Found
------------------------------------------
{"data":{"error":"Tag does not exist","request":"\/3\/account\/me\/follow\/tag\/{{tagName}}","method":"POST"},"success":false,"status":404}
```


### Generate Access Token {316127907710388000}

| | |
|--|--|
|__Name__| Generate Access Token|
|__URL__| https://api.imgur.com/oauth2/token |
|__Method__| POST|

#### Description
Given a user&#39;s refresh token, this endpoint generates an access token.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.imgur.com/oauth2/token'
```




### Image {149400156210389000}

| | |
|--|--|
|__Name__| Image|
|__URL__| https://api.imgur.com/3/account/{{username}}/image/{{imageId}} |
|__Method__| GET|

#### Description
Return information about a specific image. This endpoint works the same as the [Image Endpoint](https://api.imgur.com/endpoints/image/). You can use any of the additional actions that the image endpoint with this endpoint.

#### Response Model: [Image](https://api.imgur.com/models/image)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/image/%7B%7BimageId%7D%7D'
```




### Image Count {308766698910390000}

| | |
|--|--|
|__Name__| Image Count|
|__URL__| https://api.imgur.com/3/account/{{username}}/images/count |
|__Method__| GET|

#### Description
Returns the total number of images associated with the account.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/images/count'
```




### Image Deletion {880276010391000}

| | |
|--|--|
|__Name__| Image Deletion|
|__URL__| https://api.imgur.com/3/account/{{username}}/image/{{deleteHash}} |
|__Method__| DELETE|

#### Description
Deletes an Image. This requires a delete hash rather than an ID.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/image/%7B%7BdeleteHash%7D%7D'
```




### Image IDs {105162748810392000}

| | |
|--|--|
|__Name__| Image IDs|
|__URL__| https://api.imgur.com/3/account/{{username}}/images/ids/{{page}} |
|__Method__| GET|

#### Description
Returns an array of Image IDs that are associated with the account.

#### Response Model: [Basic](https://api.imgur.com/models/basic)


#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/images/ids/%7B%7Bpage%7D%7D'
```




### Images {40136391510393000}

| | |
|--|--|
|__Name__| Images|
|__URL__| https://api.imgur.com/3/account/{{username}}/images/{{page}} |
|__Method__| GET|

#### Description
Return all of the images associated with the account. You can page through the images by setting the page, this defaults to 0.

#### Response Model: [Image](https://api.imgur.com/models/image)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/images/%7B%7Bpage%7D%7D'
```




### Replies {113878614310394000}

| | |
|--|--|
|__Name__| Replies|
|__URL__| https://api.imgur.com/3/account/{{username}}/notifications/replies |
|__Method__| GET|

#### Description
Returns all of the reply notifications for the user. Required to be logged in as that user.

#### Response Model: [Notification](https://api.imgur.com/models/notification)

#### Parameters

| Key | Required | Value                                                                                          |
|-----|----------|------------------------------------------------------------------------------------------------|
| new | optional | boolean - `false` for all notifications, `true` for only non-viewed notification. Default is `true`. |

#### Request

```sh
curl -X 'GET' -d '' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/notifications/replies'
```




### Send Verification E-mail {403323023910396000}

| | |
|--|--|
|__Name__| Send Verification E-mail|
|__URL__| https://api.imgur.com/3/account/{{username}}/verifyemail |
|__Method__| POST|

#### Description
Sends an email to the user to verify that their email is valid to upload to gallery. Must be logged in as the user to send.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/verifyemail'
```




### Unfollow tag {30678907510397000}

| | |
|--|--|
|__Name__| Unfollow tag|
|__URL__| https://api.imgur.com/3/account/me/follow/tag/{{tagName}} |
|__Method__| DELETE|

#### Description
Unfollows the {{tagName}} specified for the currently logged in user.


#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/me/follow/tag/%7B%7BtagName%7D%7D'
```



#### Response Examples

##### Example 1: Unfollow Tag: Not Following

```json
Code: 409 Conflict
------------------------------------------
{"data":{"error":"Not following tag","request":"\/3\/account\/me\/follow\/tag\/funny","method":"DELETE"},"success":false,"status":409}
```

##### Example 2: Unfollow Tag: Tag Does Not Exist

```json
Code: 404 Not Found
------------------------------------------
{"data":{"error":"Tag does not exist","request":"\/3\/account\/me\/follow\/tag\/{{tagName}}","method":"DELETE"},"success":false,"status":404}
```

##### Example 3: Unfollow Tag: Success

```json
Code: 200 OK
------------------------------------------
{"data":true,"success":true,"status":200}
```


### Verify User&#39;s E-mail {126938311010399000}

| | |
|--|--|
|__Name__| Verify User&#39;s E-mail|
|__URL__| https://api.imgur.com/3/account/{{username}}/verifyemail |
|__Method__| GET|

#### Description
Checks to see if user has verified their email address.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/account/%7B%7Busername%7D%7D/verifyemail'
```




## Album {17973914810400000}

### Add Images to an Album (Authed) {96490081710401000}

| | |
|--|--|
|__Name__| Add Images to an Album (Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumHash}}/add |
|__Method__| POST|

#### Description
Adds the images to an album. You must specify ids[] or deletehashes[] in order to add an image to an album.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key            | Required | Description                                             |
|----------------|----------|---------------------------------------------------------|
| ids[]          | optional | The image ids that you want to be added to the album.   |
| deletehashes[] | optional | The image deletehashes that you want to be added to the album. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D/add'
```




### Add Images to an Album (Un-Authed) {205500985710403000}

| | |
|--|--|
|__Name__| Add Images to an Album (Un-Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumDeleteHash}}/add |
|__Method__| POST|

#### Description
Takes parameter, `deletehashes[]`, as an array of deletehashes to add to the album. Alternatively, the `deletehashes` parameter can take a comma delimted string of deletehashes.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key   | Required | Description                                           |
|-------|----------|-------------------------------------------------------|
| deletehashes[] | required | The image deletehashes that you want to be added to the album. The [] represents the ability to use this variable as an array. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumDeleteHash%7D%7D/add'
```




### Album {17973914810404000}

| | |
|--|--|
|__Name__| Album|
|__URL__| https://api.imgur.com/3/album/{{albumHash}} |
|__Method__| GET|

#### Description
Get additional information about an album.

#### Response Model: [Album](https://api.imgur.com/models/album)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D'
```




### Album Creation (Un-Authed / Authed) {378681189310405000}

| | |
|--|--|
|__Name__| Album Creation (Un-Authed / Authed)|
|__URL__| https://api.imgur.com/3/album |
|__Method__| POST|

#### Description
Create a new album. Optional parameter of `ids[]` is an array of image ids to add to the album. If uploading anonymous images to an anonymous album please use the optional parameter of `deletehashes[]` rather than `ids[]`. Note: including the optional `deletehashes[]` parameter will also work for authenticated user albums. There is no need to duplicate image ids with their corresponding deletehash.

This method is available without authenticating an account, and may be used merely by sending &quot;Authorization: Client-ID {client_id}&quot; in the request headers. Doing so will create an anonymous album which is not tied to an account.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key            | Required | Description                                                                                                                          |
|----------------|----------|--------------------------------------------------------------------------------------------------------------------------------------|
| ids[]          | optional | The image ids that you want to be included in the album.                                                                             |
| deletehashes[] | optional | The deletehashes of the images that you want to be included in the album.                                                            |
| title          | optional | The title of the album                                                                                                               |
| description    | optional | The description of the album                                                                                                         |
| privacy        | optional | Sets the privacy level of the album. Values are : `public` &amp;#124; `hidden` &amp;#124; secret. Defaults to user&#39;s privacy settings for logged in users. |
| layout         | optional | (_deprecated_) Sets the layout to display the album. Values are : `blog` &amp;#124; `grid` &amp;#124; `horizontal` &amp;#124; `vertical`                                               |
| cover          | optional | The ID of an image that you want to be the cover of the album                                                                        |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album'
```




### Album Deletion (Authed) {252842125210411000}

| | |
|--|--|
|__Name__| Album Deletion (Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumHash}} |
|__Method__| DELETE|

#### Description
Delete an album with a given ID. You are required to be logged in as the user to delete the album.


#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D'
```




### Album Deletion (Un-Authed) {31663057810412000}

| | |
|--|--|
|__Name__| Album Deletion (Un-Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumDeleteHash}} |
|__Method__| DELETE|

#### Description
Delete an album with a given deletehash.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumDeleteHash%7D%7D'
```




### Album Image {270529905710415000}

| | |
|--|--|
|__Name__| Album Image|
|__URL__| https://api.imgur.com/3/album/{{albumHash}}/image/{{imageHash}} |
|__Method__| GET|

#### Description
Get information about an image in an album, any additional actions found in [Image Endpoint](https://api.imgur.com/endpoints/image/) will also work.

#### Response Model: [Image](https://api.imgur.com/models/image)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D/image/%7B%7BimageHash%7D%7D'
```




### Album Images {364230378210416000}

| | |
|--|--|
|__Name__| Album Images|
|__URL__| https://api.imgur.com/3/album/{{albumHash}}/images |
|__Method__| GET|

#### Description
Return all of the images in the album.

#### Response Model: [Image](https://api.imgur.com/models/image)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D/images'
```




### Favorite Album {315957172610417000}

| | |
|--|--|
|__Name__| Favorite Album|
|__URL__| https://api.imgur.com/3/album/{{albumHash}}/favorite |
|__Method__| POST|

#### Description
Favorite an album with a given ID. The user is required to be logged in to favorite the album.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D/favorite'
```




### Remove Images from an Album (Authed) {319326638110418000}

| | |
|--|--|
|__Name__| Remove Images from an Album (Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumHash}}/remove_images |
|__Method__| POST|

#### Description
Takes parameter, `ids[]`, as an array of ids and removes from the album.

#### Response Model: [Basic](https://api.imgur.com/models/basic)


#### Parameters

| Key   | Required | Description                                           |
|-------|----------|-------------------------------------------------------|
| ids[] | required | The image ids that you want to be removed from the album. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D/remove_images'
```




### Remove Images from an Album (Un-Authed) {5713873310420000}

| | |
|--|--|
|__Name__| Remove Images from an Album (Un-Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumDeleteHash}}/remove_images |
|__Method__| POST|

#### Description
Takes parameter, `ids[]`, as an array of ids and removes from the album.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key   | Required | Description                                           |
|-------|----------|-------------------------------------------------------|
| ids[] | required | The image ids that you want to be removed from the album. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumDeleteHash%7D%7D/remove_images'
```




### Set Album Images (Authed) {249173603210421000}

| | |
|--|--|
|__Name__| Set Album Images (Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumHash}} |
|__Method__| POST|

#### Description
Sets the images for an album, removes all other images and only uses the images in this request. You must include either ids[] or deletehashes[].

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key            | Required | Description                                             |
|----------------|----------|---------------------------------------------------------|
| ids[]          | optional | The image ids that you want to be added to the album.   |
| deletehashes[] | optional | The image deletehashes that you want to be added to the album. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D'
```




### Set Album Images (Un-Authed) {278353614210453000}

| | |
|--|--|
|__Name__| Set Album Images (Un-Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumDeleteHash}} |
|__Method__| POST|

#### Description
Sets the images for an album, removes all other images and only uses the images in this request.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key   | Required | Description                                           |
|-------|----------|-------------------------------------------------------|
| deletehashes[] | required | The image deletehashes that you want to be added to the album. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/album/%7B%7BalbumDeleteHash%7D%7D'
```




### Update Album (Un-Authed / Authed) {83629619110454000}

| | |
|--|--|
|__Name__| Update Album (Un-Authed / Authed)|
|__URL__| https://api.imgur.com/3/album/{{albumHash}} |
|__Method__| PUT|

#### Description
Update the information of an album. For anonymous albums, `albumHash` should be the deletehash that is returned at creation.

If uploading anonymous images to an anonymous album please use the optional parameter of `deletehashes[]` rather than `ids[]`. Note: including the optional `deletehashes[]` parameter will also work for authenticated user albums. There is no need to duplicate image ids with their corresponding deletehash.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key            | Required | Description                                                                                                                          |
|----------------|----------|--------------------------------------------------------------------------------------------------------------------------------------|
| ids[]          | optional | The image ids that you want to be included in the album.                                                                             |
| deletehashes[] | optional | The deletehashes of the images that you want to be included in the album.                                                            |
| title          | optional | The title of the album                                                                                                               |
| description    | optional | The description of the album                                                                                                         |
| privacy        | optional | Sets the privacy level of the album. Values are : `public` &amp;#124; `hidden` &amp;#124; secret. Defaults to user&#39;s privacy settings for logged in users. |
| layout         | optional | (_deprecated_) Sets the layout to display the album. Values are : `blog` &amp;#124; `grid` &amp;#124; `horizontal` &amp;#124; `vertical`                                               |
| cover          | optional | The ID of an image that you want to be the cover of the album                                                                        |

#### Request

```sh
curl -X 'PUT' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/album/%7B%7BalbumHash%7D%7D'
```




## Comment {255535513410459000}

### Comment {255535513410460000}

| | |
|--|--|
|__Name__| Comment|
|__URL__| https://api.imgur.com/3/comment/{{commentId}} |
|__Method__| GET|

#### Description
Get information about a specific comment.

#### Response Model: [Comment](https://api.imgur.com/models/comment)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/comment/%7B%7BcommentId%7D%7D'
```




### Comment Creation {215487167510461000}

| | |
|--|--|
|__Name__| Comment Creation|
|__URL__| https://api.imgur.com/3/comment |
|__Method__| POST|

#### Description
Creates a new comment, returns the ID of the comment.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key       | Required | Description                                                                    |
|-----------|----------|--------------------------------------------------------------------------------|
| image_id  | required | The ID of the image or album in the gallery that you wish to comment on                 |
| comment   | required | The comment text, this is what will be displayed                               |
| parent_id | optional | The ID of the parent comment, this is an alternative method to create a reply. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/comment'
```




### Comment Deletion {139158022010462000}

| | |
|--|--|
|__Name__| Comment Deletion|
|__URL__| https://api.imgur.com/3/comment/{{commentId}} |
|__Method__| DELETE|

#### Description
Delete a comment by the given id.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/comment/%7B%7BcommentId%7D%7D'
```




### Replies {113878614310463000}

| | |
|--|--|
|__Name__| Replies|
|__URL__| https://api.imgur.com/3/comment/{{commentId}}/replies |
|__Method__| GET|

#### Description
Get the comment with all of the replies for the comment.

#### Response Model: [Comment](https://api.imgur.com/models/comment)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/comment/%7B%7BcommentId%7D%7D/replies'
```




### Reply Creation {54046026010464000}

| | |
|--|--|
|__Name__| Reply Creation|
|__URL__| https://api.imgur.com/3/comment/{{commentId}} |
|__Method__| POST|

#### Description
Create a reply for the given comment.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key      | Required | Description                                                    |
|----------|----------|----------------------------------------------------------------|
| image_id | required | The ID of the image or album in the gallery that you wish to comment on |
| comment  | required | The comment text, this is what will be displayed               |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/comment/%7B%7BcommentId%7D%7D'
```




### Report {118292327510465000}

| | |
|--|--|
|__Name__| Report|
|__URL__| https://api.imgur.com/3/comment/{{commentId}}/report |
|__Method__| POST|

#### Description
Report a comment for being inappropriate.

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/comment/%7B%7BcommentId%7D%7D/report'
```




### Vote {395405573310466000}

| | |
|--|--|
|__Name__| Vote|
|__URL__| https://api.imgur.com/3/comment/{{commentId}}/vote/{{vote}} |
|__Method__| POST|

#### Description
Vote on a comment. The `vote` parameter can only be set as `up`, `down`, or `veto`.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/comment/%7B%7BcommentId%7D%7D/vote/%7B%7Bvote%7D%7D'
```




## Gallery {361898313310468000}

### Album / Image Comment {79844988510468000}

| | |
|--|--|
|__Name__| Album / Image Comment|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}}/comment/{{commentId}} |
|__Method__| GET|

#### Description
Information about a specific comment. This action also allows any of the additional actions provided in the [Comment Endpoint](https://api.imgur.com/endpoints/comment).

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D/comment/%7B%7BcommentId%7D%7D'
```




### Album / Image Comment Creation {171570495010469000}

| | |
|--|--|
|__Name__| Album / Image Comment Creation|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}}/comment |
|__Method__| POST|

#### Description
#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key     | Required | Value                    |
|---------|----------|--------------------------|
| comment | required | The text of the comment. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D/comment'
```




### Album / Image Comments {257197309810470000}

| | |
|--|--|
|__Name__| Album / Image Comments|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}}/comments/{{commentSort}} |
|__Method__| GET|

#### Description
Get comments on an image or album in the gallery.

`galleryHash` is the unique identifier of an album or image in the gallery.

`commentSort` is one of `best` | `top` | `new` - defaults to `best`.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D/comments/%7B%7BcommentSort%7D%7D'
```




### Album / Image Reporting {383279166210471000}

| | |
|--|--|
|__Name__| Album / Image Reporting|
|__URL__| https://api.imgur.com/3/gallery/image/{{galleryHash}}/report |
|__Method__| POST|

#### Description
Report an Image in the gallery

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key    | Required | Description                                       |
|--------|----------|---------------------------------------------------|
| reason | optional | An integer representing the reason for the report (see codes below) |


#### Report Reason Codes

| Value | Description                         |
|-------|-------------------------------------|
| 1     | Doesn&#39;t belong on Imgur             |
| 2     | Spam                                |
| 3     | Abusive                             |
| 4     | Mature content not marked as mature |
| 5     | Pornography                         |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/image/%7B%7BgalleryHash%7D%7D/report'
```




### Album / Image Votes {70241607710474000}

| | |
|--|--|
|__Name__| Album / Image Votes|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}}/votes |
|__Method__| GET|

#### Description
Get the vote information about an image

#### Response Model: [Vote](https://api.imgur.com/models/vote)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D/votes'
```




### Album / Image Voting {92516847910475000}

| | |
|--|--|
|__Name__| Album / Image Voting|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}}/vote/{{vote}} |
|__Method__| POST|

#### Description
Vote for an image, `up` or `down` vote. Send `veto` to undo a vote.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D/vote/%7B%7Bvote%7D%7D'
```




### Gallery {361898313310476000}

| | |
|--|--|
|__Name__| Gallery|
|__URL__| https://api.imgur.com/3/gallery/{{section}}/{{sort}}/{{window}}/{{page}}?showViral={{showViral}}&amp;mature={{showMature}}&amp;album_previews={{albumPreviews}} |
|__Method__| GET|

#### Description
| Key       | Required | Value                                                                                             |
|-----------|----------|---------------------------------------------------------------------------------------------------|
| section   | optional | `hot` &amp;#124; `top` &amp;#124; `user`. Defaults to `hot`
| sort      | optional | `viral` &amp;#124; `top` &amp;#124; `time` &amp;#124; `rising` (only available with `user` section). Defaults to `viral` |
| page      | optional | integer - the data paging number                                                                  |
| window    | optional | Change the date range of the request if the section is `top`. Accepted values are `day` &amp;#124; `week` &amp;#124; `month` &amp;#124; `year` &amp;#124; `all`. Defaults to `day` |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/%7B%7Bsection%7D%7D/%7B%7Bsort%7D%7D/%7B%7Bwindow%7D%7D/%7B%7Bpage%7D%7D?showViral={{showViral}}&mature={{showMature}}&album_previews={{albumPreviews}}'
```




### Gallery Album {313405289410480000}

| | |
|--|--|
|__Name__| Gallery Album|
|__URL__| https://api.imgur.com/3/gallery/album/{{galleryHash}} |
|__Method__| GET|

#### Description
Get additional information about an album in the gallery.

#### Response Model: [Gallery Album](https://api.imgur.com/models/gallery_album)

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/album/%7B%7BgalleryHash%7D%7D'
```




### Gallery Image {42463961210481000}

| | |
|--|--|
|__Name__| Gallery Image|
|__URL__| https://api.imgur.com/3/gallery/image/{{galleryImageHash}} |
|__Method__| GET|

#### Description
Get additional information about an image in the gallery.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/image/%7B%7BgalleryImageHash%7D%7D'
```




### Gallery Item Tags {238814448910482000}

| | |
|--|--|
|__Name__| Gallery Item Tags|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}}/tags |
|__Method__| GET|

#### Description
| Key | Required | Value                  |
|-----|----------|------------------------|
| id  | required | ID of the gallery item |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D/tags'
```




### Gallery Search {258017162310483000}

| | |
|--|--|
|__Name__| Gallery Search|
|__URL__| https://api.imgur.com/3/gallery/search/{{sort}}/{{window}}/{{page}}?q=cats |
|__Method__| GET|

#### Description
Search the gallery with a given query string.


#### Parameters
| Key    | Required | Value                                                                                                        |
|--------|----------|--------------------------------------------------------------------------------------------------------------|
| sort   | optional | time &amp;#124; viral &amp;#124; top - defaults to time                                                                        |
| window | optional | Change the date range of the request if the sort is &#39;top&#39;, day &amp;#124; week &amp;#124; month &amp;#124; year &amp;#124; all, defaults to all. |
| page   | optional | integer - the data paging number                                                                             |


#### Simple Search Query Parameters

| Key | Value                                                                                                                                                                                                                                                                                    |
|-----|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| q   | Query string (note: if advanced search parameters are set, this query string is ignored). This parameter also supports boolean operators (AND, OR, NOT) and indices (tag: user: title: ext: subreddit: album: meme:). An example compound query would be &#39;title: cats AND dogs ext: gif&#39; |



#### Advanced Search Query Parameters

| Key       | Value                                                                                                                                                                                                |
|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| q_all     | Search for all of these words (and)                                                                                                                                                                  |
| q_any     | Search for any of these words (or)                                                                                                                                                                   |
| q_exactly | Search for exactly this word or phrase                                                                                                                                                               |
| q_not     | Exclude results matching this                                                                                                                                                                        |
| q_type    | Show results for any file type, jpg  &amp;#124; png  &amp;#124; gif  &amp;#124; anigif (animated gif)  &amp;#124; album                                                                                                                      |
| q_size_px | Size ranges, small (500 pixels square or less)  &amp;#124; med (500 to 2,000 pixels square)  &amp;#124; big (2,000 to 5,000 pixels square)  &amp;#124; lrg (5,000 to 10,000 pixels square)  &amp;#124; huge (10,000 square pixels and above) |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/search/%7B%7Bsort%7D%7D/%7B%7Bwindow%7D%7D/%7B%7Bpage%7D%7D?q=cats'
```




### Gallery Tag {197422001310575000}

| | |
|--|--|
|__Name__| Gallery Tag|
|__URL__| https://api.imgur.com/3/gallery/t/{{tagName}}/{{sort}}/{{window}}/{{page}} |
|__Method__| GET|

#### Description
Returns tag metadata, and posts tagged with the `tagName` provided

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/t/%7B%7BtagName%7D%7D/%7B%7Bsort%7D%7D/%7B%7Bwindow%7D%7D/%7B%7Bpage%7D%7D'
```




### Gallery Tag Info {243678693110576000}

| | |
|--|--|
|__Name__| Gallery Tag Info|
|__URL__| https://api.imgur.com/3/gallery/tag_info/{{tagName}} |
|__Method__| GET|

#### Description
Gets metadata about a tag

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/tag_info/%7B%7BtagName%7D%7D'
```



#### Response Examples

##### Example 1: Sample Response

```json
Code: 200 OK
------------------------------------------
{"data":{"name":"the_more_you_know","display_name":"the more you know","followers":76,"total_items":369594,"following":false,"background_hash":"EpmW3Oy","is_promoted":false,"description":"","logo_hash":null,"logo_destination_url":null,"description_annotations":{}},"success":true,"status":200}
```


### Gallery Tags {369248377010578000}

| | |
|--|--|
|__Name__| Gallery Tags|
|__URL__| https://api.imgur.com/3/tags |
|__Method__| GET|

#### Description
Gets a list of default tags

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/tags'
```



#### Response Examples

##### Example 1: default

```json
Code: 200 OK
------------------------------------------
{"data":{"tags":[{"id":"32179","name":"embroidery","display_name":"embroidery","followers":0,"total_items":270,"background_hash":"iPuYto5"},{"id":"7003","name":"rick_and_morty","display_name":"rick and morty","followers":61,"total_items":2040,"background_hash":"gmFssAG"},{"id":"112","name":"gaming","display_name":"gaming","followers":1924,"total_items":116988,"background_hash":"IHP8OaT"},{"id":"745","name":"aww","display_name":"aww","followers":163,"total_items":81401,"background_hash":"CEN9s8K"},{"id":"1836014","name":"science_and_tech","display_name":"science and tech","followers":9,"total_items":834,"background_hash":"CLrdVV6"},{"id":"1571089","name":"air_swimming","display_name":"air swimming","followers":0,"total_items":2,"background_hash":"1vLtpXB"},{"id":"50086","name":"current_events","display_name":"current events","followers":27,"total_items":3813,"background_hash":"Iyz9AJZ"},{"id":"1012","name":"photography","display_name":"photography","followers":95,"total_items":13811,"background_hash":"JjJ7UBc"},{"id":"427","name":"anime","display_name":"anime","followers":1046,"total_items":15267,"background_hash":"1O08gF2"},{"id":"1","name":"funny","display_name":"funny","followers":2608,"total_items":358356,"background_hash":"5T5koLx"},{"id":"301","name":"puppy","display_name":"puppy","followers":84,"total_items":9018,"background_hash":"1dQGsS9"},{"id":"181","name":"cosplay","display_name":"cosplay","followers":355,"total_items":15412,"background_hash":"cZWZSmA"},{"id":"151","name":"cats","display_name":"cats","followers":289,"total_items":12751,"background_hash":"qFtpv4k"},{"id":"133","name":"memes","display_name":"memes","followers":581,"total_items":230846,"background_hash":"IkZeAAy"},{"id":"24034","name":"golden_retriever","display_name":"golden retriever","followers":9,"total_items":657,"background_hash":"rKAbi90"},{"id":"10337","name":"perfect_loop","display_name":"perfect loop","followers":22,"total_items":1351,"background_hash":"R1dEESs"},{"id":"1828820","name":"eat_what_you_want","display_name":"eat what you want","followers":3,"total_items":800,"background_hash":"tvBBQUq"},{"id":"1042","name":"minecraft","display_name":"minecraft","followers":102,"total_items":14170,"background_hash":"Ikykl3U"},{"id":"10723","name":"fitness","display_name":"fitness","followers":161,"total_items":2442,"background_hash":"f8B0kEw"},{"id":"12427","name":"creativity","display_name":"creativity","followers":15,"total_items":2313,"background_hash":"NanxezK"},{"id":"4717","name":"nostalgia","display_name":"nostalgia","followers":19,"total_items":1550,"background_hash":"uEdCS9t"},{"id":"2124623","name":"wholesome","display_name":"wholesome","followers":5,"total_items":0,"background_hash":"6xwDMxF"},{"id":"34","name":"tattoo","display_name":"tattoo","followers":121,"total_items":5347,"background_hash":"S8izsI3"},{"id":"85","name":"pokemon","display_name":"pokemon","followers":329,"total_items":12228,"background_hash":"0hNEBcR"},{"id":"2398","name":"lego","display_name":"lego","followers":34,"total_items":3182,"background_hash":"oB1KOoT"},{"id":"49","name":"diy","display_name":"diy","followers":223,"total_items":6904,"background_hash":"QL9pTeJ"},{"id":"25","name":"wallpaper","display_name":"wallpaper","followers":499,"total_items":8540,"background_hash":"R1dEESs"},{"id":"2743","name":"banana_for_scale","display_name":"banana for scale","followers":7,"total_items":2061,"background_hash":"OFLek0A"},{"id":"40","name":"art","display_name":"art","followers":303,"total_items":140374,"background_hash":"f8B0kEw"},{"id":"640668","name":"the_great_outdoors","display_name":"the great outdoors","followers":6,"total_items":918,"background_hash":"zU89CUx"},{"id":"103","name":"star_wars","display_name":"star wars","followers":285,"total_items":17778,"background_hash":"UCUaMEu"},{"id":"814","name":"gifs","display_name":"gifs","followers":164,"total_items":3673,"background_hash":"qaYq4fG"},{"id":"1024","name":"awesome","display_name":"awesome","followers":129,"total_items":29118,"background_hash":"x0HXbK1"},{"id":"55060","name":"movies_and_tv","display_name":"movies and tv","followers":1,"total_items":2043,"background_hash":"C0pGMbY"},{"id":"18838","name":"storytime","display_name":"storytime","followers":9,"total_items":604,"background_hash":"jhE5UKO"},{"id":"50866","name":"inspiring","display_name":"inspiring","followers":39,"total_items":84811,"background_hash":"mr4OtIu"},{"id":"3211","name":"the_more_you_know","display_name":"the more you know","followers":73,"total_items":3857,"background_hash":"EpmW3Oy"},{"id":"55870","name":"old_school_cool","display_name":"old school cool","followers":0,"total_items":62,"background_hash":"fzXe2ol"},{"id":"9907","name":"transformation","display_name":"transformation","followers":10,"total_items":204,"background_hash":"hWiiySS"}],"featured":"nostalgia","galleries":[{"id":0,"name":"Most Viral","description":"Today's most popular posts","topPost":{"id":"FimF0","title":"sexting 101","description":null,"datetime":1491566570,"cover":"zvqtvfh","cover_width":338,"cover_height":600,"account_url":"svgn","account_id":24813003,"privacy":"hidden","layout":"blog","views":87615,"link":"http:\/\/imgur.com\/a\/FimF0","ups":9410,"downs":130,"points":9280,"score":9280,"is_album":true,"vote":null,"favorite":null,"nsfw":false,"section":"TrollXChromosomes","comment_count":397,"topic":"No Topic","topic_id":29,"images_count":8,"in_gallery":true,"is_ad":false,"tags":[],"in_most_viral":true}},{"id":1,"name":"User Submitted","description":"Brand new posts shared in real time","topPost":{"id":"q6TxQKy","title":"Advancements in night vision technology","description":"A Las Vegas-based company called SPI has a colour night vision sensor called the X27. The ultra-sensitive sensor is able to shoot both ordinary images during the day, as well as its colour night vision images at night. Point it up at the sky, and you\u2019ll be able to clearly see stars and constellations.\n\nSource: https:\/\/www.youtube.com\/watch?v=8bTgG2Ft4xQ","datetime":1491581287,"type":"image\/gif","animated":true,"width":720,"height":404,"size":27214090,"views":7927,"bandwidth":215726091430,"vote":null,"favorite":false,"nsfw":false,"section":"gifs","account_url":"TotallyNotABrownBear","account_id":38754689,"is_ad":false,"tags":[{"name":"photography","display_name":"photography","followers":95,"total_items":13811},{"name":"science_and_tech","display_name":"science and tech","followers":9,"total_items":834}],"in_most_viral":false,"in_gallery":true,"topic":"No Topic","topic_id":29,"mp4":"http:\/\/i.imgur.com\/q6TxQKy.mp4","gifv":"http:\/\/i.imgur.com\/q6TxQKy.gifv","mp4_size":2013900,"link":"http:\/\/i.imgur.com\/q6TxQKyh.gif","looping":true,"comment_count":65,"ups":1349,"downs":4,"points":1345,"score":1348,"is_album":false}},{"id":2,"name":"Random","description":"A mix from the Imgur archives","topPost":{"id":"GDaIC","title":"Anyone know what this thing is? ","description":null,"datetime":1302675303,"type":"image\/jpeg","animated":false,"width":1680,"height":1050,"size":317749,"views":123240,"bandwidth":39159386760,"vote":null,"favorite":false,"nsfw":false,"section":"pics","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":true,"in_gallery":true,"topic":null,"topic_id":0,"link":"http:\/\/i.imgur.com\/GDaIC.jpg","comment_count":72,"ups":399,"downs":4,"points":395,"score":456,"is_album":false}},{"id":3,"name":"Staff Picks","description":"Great posts picked by Imgur staff","topPost":{"id":"PyumGeD","title":"This made me laugh and smile.","description":null,"datetime":1491576109,"type":"image\/gif","animated":true,"width":720,"height":720,"size":34276628,"views":32415,"bandwidth":1111076896620,"vote":null,"favorite":false,"nsfw":false,"section":"gifs","account_url":"TheOneThatGotBanned","account_id":11170171,"is_ad":false,"tags":[{"name":"funny","display_name":"funny","followers":2608,"total_items":358356},{"name":"aww","display_name":"aww","followers":163,"total_items":81401},{"name":"funny_animal","display_name":"funny animal","followers":11,"total_items":717},{"name":"staff_picks","display_name":"staff picks","followers":6,"total_items":0}],"in_most_viral":true,"in_gallery":true,"topic":"No Topic","topic_id":29,"mp4":"http:\/\/i.imgur.com\/PyumGeD.mp4","gifv":"http:\/\/i.imgur.com\/PyumGeD.gifv","mp4_size":1953844,"link":"http:\/\/i.imgur.com\/PyumGeDh.gif","looping":true,"comment_count":82,"ups":2008,"downs":56,"points":1952,"score":1968,"is_album":false}}]},"success":true,"status":200}
```


### Random Gallery Images {353170360210580000}

| | |
|--|--|
|__Name__| Random Gallery Images|
|__URL__|  |
|__Method__| GET|

#### Description
*DEPRECATED* Returns a random set of gallery images.

#### Request

```sh
curl -X 'GET' -d '' ''
```




### Remove from Gallery {198797536110581000}

| | |
|--|--|
|__Name__| Remove from Gallery|
|__URL__| https://api.imgur.com/3/gallery/{{galleryHash}} |
|__Method__| DELETE|

#### Description
Remove an image from the public gallery. You must be logged in as the owner of the item to do this action.

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/%7B%7BgalleryHash%7D%7D'
```




### Share with Community (Album) {345664318310582000}

| | |
|--|--|
|__Name__| Share with Community (Album)|
|__URL__| https://api.imgur.com/3/gallery/album/{{albumHash}} |
|__Method__| POST|

#### Description
Share an Album or Image to the Gallery.

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/album/%7B%7BalbumHash%7D%7D'
```




### Share with Community (Image) {305549826510583000}

| | |
|--|--|
|__Name__| Share with Community (Image)|
|__URL__| https://api.imgur.com/3/gallery/image/{{imageHash}} |
|__Method__| POST|

#### Description
Share an Album or Image to the Gallery.

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/image/%7B%7BimageHash%7D%7D'
```




### Subreddit Galleries {427848801910584000}

| | |
|--|--|
|__Name__| Subreddit Galleries|
|__URL__| https://api.imgur.com/3/gallery/r/{{subreddit}}/{{sort}}/{{window}}/{{page}} |
|__Method__| GET|

#### Description
View gallery images for a subreddit

| Key       | Required | Value                                                                                                        |
|-----------|----------|--------------------------------------------------------------------------------------------------------------|
| subreddit | required | pics - A valid subreddit name                                                                                |
| sort      | optional | `time` &amp;#124; `top` - defaults to time                                                                                |
| page      | optional | integer - the data paging number                                                                             |
| window    | optional | Change the date range of the request if the sort is &quot;top&quot;. Options are  `day` &amp;#124; `week` &amp;#124; `month` &amp;#124; `year` &amp;#124; `all`. Defaults to week |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/r/%7B%7Bsubreddit%7D%7D/%7B%7Bsort%7D%7D/%7B%7Bwindow%7D%7D/%7B%7Bpage%7D%7D'
```



#### Response Examples

##### Example 1: Sample Response

```json
Code: 200 OK
------------------------------------------
{"data":[{"id":"QJa0R6q","title":"Shiprock - New Mexico [OC][1080x644]","description":null,"datetime":1493611803,"type":"image\/jpeg","animated":false,"width":1080,"height":644,"size":86174,"views":149622,"bandwidth":12893526228,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/QJa0R6q.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":148994,"is_album":false},{"id":"RodyQ0k","title":"Painters Bluff, overlooking a flood stage white river. North Central Ark. [10864x3728] [OC]","description":null,"datetime":1493641803,"type":"image\/jpeg","animated":false,"width":10864,"height":3728,"size":4884667,"views":20336,"bandwidth":99334588112,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/RodyQ0k.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":20291,"is_album":false},{"id":"weKftEq","title":"Cape Flattery, WA is quite flattering indeed. [oc] [2048x1367]","description":null,"datetime":1493611803,"type":"image\/jpeg","animated":false,"width":1367,"height":2048,"size":460562,"views":12854,"bandwidth":5920063948,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/weKftEq.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":12794,"is_album":false},{"id":"EgF9TQh","title":"Hyalite Canyon, Montana [OC] [4032x2268]","description":null,"datetime":1493610603,"type":"image\/jpeg","animated":false,"width":4032,"height":2268,"size":4082007,"views":10724,"bandwidth":43775443068,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/EgF9TQh.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":10689,"is_album":false},{"id":"EEo6VgY","title":"Russian Wilderness, Klamath National Forest [OC] [15045 x 5613]","description":null,"datetime":1493622003,"type":"image\/jpeg","animated":false,"width":15045,"height":5613,"size":2901059,"views":8271,"bandwidth":23994658989,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/EEo6VgY.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":8246,"is_album":false},{"id":"lY1lDJO","title":"Fiordland National Park, New Zealand [OC] [4032\u00d72268]","description":null,"datetime":1493626279,"type":"image\/jpeg","animated":false,"width":3226,"height":1814,"size":875971,"views":8067,"bandwidth":7066458057,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/lY1lDJO.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":7936,"is_album":false},{"id":"oG6w6F8","title":"Posted this in r\/pics first, but maybe you guys appreciate it too! [3821x2147]","description":null,"datetime":1493638203,"type":"image\/jpeg","animated":false,"width":3821,"height":2147,"size":2520309,"views":6374,"bandwidth":16064449566,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/oG6w6F8.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":6365,"is_album":false},{"id":"O1IBlpc","title":"Milky Way rise over the Atlantic in Avon NC [5679x3791]","description":null,"datetime":1493640003,"type":"image\/jpeg","animated":false,"width":5679,"height":3791,"size":2675943,"views":5105,"bandwidth":13660689015,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/O1IBlpc.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":4918,"is_album":false},{"id":"pVQZLnk","title":"Up high in the Willamette National Forest facing Cougar Creek, OR [OC] [2160x769]","description":null,"datetime":1493626203,"type":"image\/jpeg","animated":false,"width":2048,"height":729,"size":72458,"views":4522,"bandwidth":327655076,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/pVQZLnk.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":4494,"is_album":false},{"id":"WNB9Cbm","title":"Poisoned Glen, Donegal, Ireland [OC][1600x1200]","description":null,"datetime":1493629802,"type":"image\/jpeg","animated":false,"width":1600,"height":1200,"size":1030403,"views":4027,"bandwidth":4149432881,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/WNB9Cbm.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":3985,"is_album":false},{"id":"DNZH3Z6","title":"Sheyenne National Grasslands, North Dakota [OC] [6016x4000]","description":null,"datetime":1493654403,"type":"image\/jpeg","animated":false,"width":6016,"height":4000,"size":3124634,"views":3544,"bandwidth":11073702896,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/DNZH3Z6.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":3395,"is_album":false},{"id":"Op1Mm35","title":"A long day of driving and grey skies along Michigan's west coast and Upper Peninsula landed us in front a crimson sunset over Lake Superior, Silver City, MI [OC]","description":null,"datetime":1493640624,"type":"image\/jpeg","animated":false,"width":4032,"height":3024,"size":1850072,"views":3186,"bandwidth":5894329392,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/Op1Mm35.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":3178,"is_album":false},{"id":"UvZxdQc","title":"Blausee Kandersteg, Switzerland [3840x2160]","description":null,"datetime":1493629203,"type":"image\/jpeg","animated":false,"width":3840,"height":2160,"size":2729072,"views":3173,"bandwidth":8659345456,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/UvZxdQc.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":3132,"is_album":false},{"id":"tQBGTi2","title":"Bosco di Ficuzza @ Sicilia, Italia [OC] [5312x2988]","description":null,"datetime":1493646604,"type":"image\/jpeg","animated":false,"width":5312,"height":2988,"size":2101308,"views":2658,"bandwidth":5585276664,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/tQBGTi2.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":2610,"is_album":false},{"id":"H1Gtlsd","title":"Mount Fitz Roy, Argentina. [1920x1200]","description":null,"datetime":1493640003,"type":"image\/jpeg","animated":false,"width":1920,"height":1200,"size":574354,"views":2443,"bandwidth":1403146822,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/H1Gtlsd.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":2443,"is_album":false},{"id":"mn0Mgjn","title":"Who Knew Bangladesh Was Beautiful? [2500x1875][OC]","description":null,"datetime":1493608803,"type":"image\/jpeg","animated":false,"width":2500,"height":1874,"size":2152428,"views":2139,"bandwidth":4604043492,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/mn0Mgjn.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":2135,"is_album":false},{"id":"fjRgUXU","title":"Wyoming's Beautiful Red Hillsides Covered in Snow[1600x1064] [OC]","description":"View from Wyoming 28 NNW towards Lander, WY and the Wind River Reservation","datetime":1493599803,"type":"image\/jpeg","animated":false,"width":1600,"height":1064,"size":413390,"views":1841,"bandwidth":761050990,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/fjRgUXU.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":1830,"is_album":false},{"id":"AtGAnlL","title":"Nauyaca waterfalls, Dominical, Puntarenas, Costa Rica [OC] [4032x3024]","description":null,"datetime":1493662202,"type":"image\/jpeg","animated":false,"width":1512,"height":2016,"size":807179,"views":2013,"bandwidth":1624851327,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/AtGAnlL.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":1801,"is_album":false},{"id":"G0nc9Cw","title":"Swiss forest [5312x2988]","description":null,"datetime":1493628603,"type":"image\/jpeg","animated":false,"width":2125,"height":1195,"size":822524,"views":1640,"bandwidth":1348939360,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/G0nc9Cw.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":1640,"is_album":false},{"id":"rWSUNa4","title":"Such a hard walk to get here at 4600m, but worth it! Lagoon 69, Peru [OC] [3264x1836]","description":"4600m altitude, killer hike. #Earthporn","datetime":1493671803,"type":"image\/jpeg","animated":false,"width":3264,"height":1836,"size":1000847,"views":1864,"bandwidth":1865578808,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/rWSUNa4.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":1534,"is_album":false},{"id":"nRb0mHU","title":"Paro Valley, Bhutan [2500x650][OC]","description":null,"datetime":1493609402,"type":"image\/jpeg","animated":false,"width":2500,"height":650,"size":813010,"views":1506,"bandwidth":1224393060,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/nRb0mHU.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":1505,"is_album":false},{"id":"KhEVbFu","title":"Went to \u00c5re, Sweden, for some After Ski and took this whilst drunk (4032x2046 )","description":null,"datetime":1493670002,"type":"image\/jpeg","animated":false,"width":4032,"height":2046,"size":647324,"views":1100,"bandwidth":712056400,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/KhEVbFu.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":873,"is_album":false},{"id":"Yo82Voc","title":"Zhangjiajie National Park, China [1920x1200]","description":null,"datetime":1493593203,"type":"image\/jpeg","animated":false,"width":1920,"height":1200,"size":995801,"views":406939,"bandwidth":405230263139,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/Yo82Voc.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":174,"is_album":false},{"id":"XnIjxzp","title":"Pic from this weekends storms in south eastern Illinois","description":null,"datetime":1493647826,"type":"image\/jpeg","animated":false,"width":3264,"height":1836,"size":844596,"views":13,"bandwidth":10979748,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/XnIjxzp.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":13,"is_album":false},{"id":"uMA4I7J","title":"Grand Canyon from Nankoweap Granary [OC] [12216 \u00d7 3896]","description":null,"datetime":1493594403,"type":"image\/jpeg","animated":false,"width":9773,"height":3117,"size":4425163,"views":2013,"bandwidth":8907853119,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/uMA4I7J.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":0,"is_album":false},{"id":"ZpmWhX1","title":"Got seat-belted into a trusty helicopter as the pilot carefully flew me over the N\u0101 Pali Coast of Kauai, Hawaii to take this shot [OC][2048x1365]","description":null,"datetime":1493676686,"type":"image\/jpeg","animated":false,"width":2048,"height":1366,"size":1992394,"views":1891,"bandwidth":3767617054,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/ZpmWhX1.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":0,"is_album":false},{"id":"wI7hn2J","title":"West Virginia may have it's issues, but it sure is beautiful. Cabins, WV [5344x3066]","description":null,"datetime":1493594403,"type":"image\/jpeg","animated":false,"width":2138,"height":1202,"size":756545,"views":1759,"bandwidth":1330762655,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/wI7hn2J.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":0,"is_album":false},{"id":"lCutGyD","title":"Crab Beach at the end of Cannibal Island Road, Humboldt County, CA [2000x1125] [OC]","description":null,"datetime":1493595603,"type":"image\/jpeg","animated":false,"width":2000,"height":1125,"size":474211,"views":3106,"bandwidth":1472899366,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/lCutGyD.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":0,"is_album":false}],"success":true,"status":200}
```


### Subreddit Image {222964418010640000}

| | |
|--|--|
|__Name__| Subreddit Image|
|__URL__| https://api.imgur.com/3/gallery/r/{{subreddit}}/{{subredditImageId}} |
|__Method__| GET|

#### Description
View a single image in the subreddit

| Key       | Required | Value                         |
|-----------|----------|-------------------------------|
| subreddit | required | A valid subreddit name, ie `earthporn` |
| image_id  | required | The ID for the image.         |

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/gallery/r/%7B%7Bsubreddit%7D%7D/%7B%7BsubredditImageId%7D%7D'
```



#### Response Examples

##### Example 1: Sample Response

```json
Code: 200 OK
------------------------------------------
{"data":{"id":"QJa0R6q","title":"Shiprock - New Mexico [OC][1080x644]","description":null,"datetime":1493611803,"type":"image\/jpeg","animated":false,"width":1080,"height":644,"size":86174,"views":149667,"bandwidth":12897404058,"vote":null,"favorite":false,"nsfw":false,"section":"EarthPorn","account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_most_viral":false,"in_gallery":false,"link":"http:\/\/i.imgur.com\/QJa0R6q.jpg","comment_count":null,"ups":null,"downs":null,"points":null,"score":149665,"is_album":false},"success":true,"status":200}
```


### Update Gallery Item Tags {176838606610642000}

| | |
|--|--|
|__Name__| Update Gallery Item Tags|
|__URL__| https://api.imgur.com/3/gallery/tags/{{galleryHash}} |
|__Method__| POST|

#### Description
Update the tags for a post in the gallery

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/gallery/tags/%7B%7BgalleryHash%7D%7D'
```




## Image {149400156210643000}

### Favorite an Image {42361536910643000}

| | |
|--|--|
|__Name__| Favorite an Image|
|__URL__| https://api.imgur.com/3/image/{{imageHash}}/favorite |
|__Method__| POST|

#### Description
Favorite an image with the given ID. The user is required to be logged in to favorite the image.


#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/image/%7B%7BimageHash%7D%7D/favorite'
```




### Image {149400156210645000}

| | |
|--|--|
|__Name__| Image|
|__URL__| https://api.imgur.com/3/image/{{imageHash}} |
|__Method__| GET|

#### Description
Get information about an image.

#### Request

```sh
curl -X 'GET' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/image/%7B%7BimageHash%7D%7D'
```




### Image Deletion (Authed) {248994025810645000}

| | |
|--|--|
|__Name__| Image Deletion (Authed)|
|__URL__| https://api.imgur.com/3/image/{{imageHash}} |
|__Method__| DELETE|

#### Description
Deletes an image.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/image/%7B%7BimageHash%7D%7D'
```




### Image Deletion (Un-Authed) {26941752810646000}

| | |
|--|--|
|__Name__| Image Deletion (Un-Authed)|
|__URL__| https://api.imgur.com/3/image/{{imageDeleteHash}} |
|__Method__| DELETE|

#### Description
Deletes an image.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Request

```sh
curl -X 'DELETE' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/image/%7B%7BimageDeleteHash%7D%7D'
```




### Image Upload {237672025910647000}

| | |
|--|--|
|__Name__| Image Upload|
|__URL__| https://api.imgur.com/3/image |
|__Method__| POST|

#### Description
Upload a new image.

#### Parameters

| Key         | Required | Description                                                                                                                            |
|-------------|----------|----------------------------------------------------------------------------------------------------------------------------------------|
| image       | required | A binary file, base64 data, or a URL for an image. (up to 10MB)                                                                        |
| album       | optional | The id of the album you want to add the image to. For anonymous albums, `album` should be the deletehash that is returned at creation. |
| type        | optional | The type of the file that&#39;s being sent; `file`, `base64` or `URL`                                                                            |
| name        | optional | The name of the file, this is automatically detected if uploading a file with a POST and multipart / form-data                         |
| title       | optional | The title of the image.                                                                                                                |
| description | optional | The description of the image.                                                                                                          |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/image'
```



#### Response Examples

##### Example 1: Sample Anonymous Upload

```json
Code: 200 OK
------------------------------------------
{
  "data": {
    "id": "orunSTu",
    "title": null,
    "description": null,
    "datetime": 1495556889,
    "type": "image/gif",
    "animated": false,
    "width": 1,
    "height": 1,
    "size": 42,
    "views": 0,
    "bandwidth": 0,
    "vote": null,
    "favorite": false,
    "nsfw": null,
    "section": null,
    "account_url": null,
    "account_id": 0,
    "is_ad": false,
    "in_most_viral": false,
    "tags": [],
    "ad_type": 0,
    "ad_url": "",
    "in_gallery": false,
    "deletehash": "x70po4w7BVvSUzZ",
    "name": "",
    "link": "http://i.imgur.com/orunSTu.gif"
  },
  "success": true,
  "status": 200
}
```


### Update Image Information (Authed) {313841055510652000}

| | |
|--|--|
|__Name__| Update Image Information (Authed)|
|__URL__| https://api.imgur.com/3/image/{{imageHash}} |
|__Method__| POST|

#### Description
Updates the title or description of an image.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key         | Required | Description                   |
|-------------|----------|-------------------------------|
| title       | optional | The title of the image.       |
| description | optional | The description of the image. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Bearer {{accessToken}}' 'https://api.imgur.com/3/image/%7B%7BimageHash%7D%7D'
```




### Update Image Information (Un-Authed) {106061224310653000}

| | |
|--|--|
|__Name__| Update Image Information (Un-Authed)|
|__URL__| https://api.imgur.com/3/image/{{imageDeleteHash}} |
|__Method__| POST|

#### Description
Updates the title or description of an image.

#### Response Model: [Basic](https://api.imgur.com/models/basic)

#### Parameters

| Key         | Required | Description                   |
|-------------|----------|-------------------------------|
| title       | optional | The title of the image.       |
| description | optional | The description of the image. |

#### Request

```sh
curl -X 'POST' -d '' -H 'Authorization: Client-ID {{clientId}}' 'https://api.imgur.com/3/image/%7B%7BimageDeleteHash%7D%7D'
```







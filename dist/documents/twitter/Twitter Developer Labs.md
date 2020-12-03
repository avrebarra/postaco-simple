# Twitter Developer Labs {350566763863165000}

Twitter Developer Labs allow developers to test and share feedback on previews of new Twitter API features. The endpoints, documentation, and resources for Labs will be updated as we incorporate feedback from the developer community.

# Postman collection for Twitter Developer Labs
This is a Postman collection for the developer previews in [Twitter Developer Labs](https://developer.twitter.com/en/labs?utm_source=postman).

For more details, read the [Twitter Developer Labs documentation](https://developer.twitter.com/en/docs/labs?utm_source=postman).

**Remember:** The endpoints we release in Labs will be previews and are likely to change before they are released broadly, so we encourage you to take that into consideration as you build.

## Quick install

Just click the **Run in Postman** button. You&#39;re all set!

## Environment

This collection includes a environment variables that are needed to authenticate each request. You will need to add values to each variable.

|Name|Description|
|----|-----------|
|`consumer_key`|Your OAuth consumer key|	
|`consumer_secret`|Your OAuth consumer secret|
|`access_token`|Your OAuth access token|
|`token_secret`|Your OAuth access token secret|

To find these values:
1. Open your [app dashboard](https://developer.twitter.com/en/apps?utm_source=postman).
2. Select your app, then click **Details**.
3. Head over the **Keys and tokens** tab.
4. Copy the values into each variable.

To add these values to your Postman environment:
1. Select the ⚙️ icon next to the **Twitter Developer Labs** environment name.
2. Click **Twitter Developer Labs**.
3. For each variable, add the values from your app dashboard in the **Current value** column.
4. When you&#39;re done adding all values, click **Update**.

Postman will set up your requests to be authenticated using OAuth 2.0 (Bearer token) authentication.

## Get help

If you need help, ask a question in the [Labs community forums](https://twittercommunity.com/c/labs).

## Submit feedback

Your ideas matter! Help us develop the next generation of the Twitter API by [sharing your feedback](https://twitterdevfeedback.uservoice.com/).

We know the best future version of our API will come from creating it together with the people who use it most.


## Labs v1/Filtered Stream v1 {269227942163175000}

### Create rule {336635036163176000}

| | |
|--|--|
|__Name__| Create rule|
|__URL__| https://api.twitter.com/labs/1/tweets/stream/filter/rules?dry_run=true |
|__Method__| POST|

#### Description
Creates filter rules. To create one or more rules, submit an add payload as an array of rules and operators.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/filtered-stream/api-reference/post-tweets-stream-filter-rules-v1) for this endpoint.

#### Request

```sh
curl -X 'POST' -d '{
	"add": [
		{"value": ""}
	]
}' -H 'Content-Type: application/json' 'https://api.twitter.com/labs/1/tweets/stream/filter/rules?dry_run=true'
```




### Delete rule {200104916063179000}

| | |
|--|--|
|__Name__| Delete rule|
|__URL__| https://api.twitter.com/labs/1/tweets/stream/filter/rules |
|__Method__| POST|

#### Description
Deletes filter rules. This endpoint can delete multiple rules at a time by specifying an array of IDs or rule values. If one or more rules cannot be deleted (for example, because it does not exist), the operation will not fail. In other words, only existing rules will be deleted.


For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/filtered-stream/api-reference/delete-tweets-stream-filter-rules-v1) for this endpoint.

#### Request

```sh
curl -X 'POST' -d '{
	"delete": {
		"values": [
			""
		]
	}
}
 ' -H 'Content-Type: application/json' 'https://api.twitter.com/labs/1/tweets/stream/filter/rules'
```




### List all rules {227131741363181000}

| | |
|--|--|
|__Name__| List all rules|
|__URL__| https://api.twitter.com/labs/1/tweets/stream/filter/rules |
|__Method__| GET|

#### Description
Return a list of filter rules currently active on the streaming endpoint, either as a list or individually.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/filtered-stream/api-reference/get-tweets-stream-filter-rules-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/tweets/stream/filter/rules'
```




### Rule {208630910763183000}

| | |
|--|--|
|__Name__| Rule|
|__URL__| https://api.twitter.com/labs/1/tweets/stream/filter/rules?ids= |
|__Method__| GET|

#### Description
Return a filter rule currently active on the streaming endpoint. This endpoint is the same as *List all rules*, except it is configured to accept an ID.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/filtered-stream/api-reference/get-tweets-stream-filter-rules-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/tweets/stream/filter/rules?ids='
```




### Stream {277681958963185000}

| | |
|--|--|
|__Name__| Stream|
|__URL__| https://api.twitter.com/labs/1/tweets/stream/filter?format=detailed |
|__Method__| GET|

#### Description
Streams Tweets in real-time based on a specific set of filter rules.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/filtered-stream/api-reference/get-tweets-stream-filter-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/tweets/stream/filter?format=detailed'
```




## Labs v1/Filtered Stream v1/Tweets and Users v1 {268624623463187000}

### Tweets {59813964363188000}

| | |
|--|--|
|__Name__| Tweets|
|__URL__| https://api.twitter.com/labs/1/tweets?ids=&amp;format=&amp;tweet.format=&amp;user.format=&amp;place.format=&amp;expansions= |
|__Method__| GET|

#### Description
This endpoints returns information about the Tweet specified by the requested IDs.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs-v1/tweets-and-users/api-reference/get-tweets-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/tweets?ids=&format=&tweet.format=&user.format=&place.format=&expansions='
```




### Users {11247275563190000}

| | |
|--|--|
|__Name__| Users|
|__URL__| https://api.twitter.com/labs/1/users?ids=&amp;usernames=&amp;format=&amp;tweet.format=&amp;user.format=&amp;expansions= |
|__Method__| GET|

#### Description
This endpoint returns information about users. You can specify users by their ID or username.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs-v1/tweets-and-users/api-reference/get-users-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/users?ids=&usernames=&format=&tweet.format=&user.format=&expansions='
```




## Labs v1/Hide replies v1 {13331374863196000}

### Hide reply {216577548963197000}

| | |
|--|--|
|__Name__| Hide reply|
|__URL__| https://api.twitter.com/labs/1/tweets/:id/hidden |
|__Method__| PUT|



#### Request

```sh
curl -X 'PUT' -d '{
	"hidden": true
}' 'https://api.twitter.com/labs/1/tweets/:id/hidden'
```




## Labs v1/Metrics v1 {379904836563198000}

### Tweet metrics (owned/authorized) {26950289163199000}

| | |
|--|--|
|__Name__| Tweet metrics (owned/authorized)|
|__URL__| https://api.twitter.com/labs/1/tweets/metrics/private?ids= |
|__Method__| GET|

#### Description
This endpoint returns engagement data for owned/authorized Tweets. You can specify the Tweets you want to query by their ID.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweet-metrics/api-reference/get-tweets-metrics-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/tweets/metrics/private?ids='
```




## Labs v1/Recent search v1 {175163968563200000}

### Recent search {392175512263201000}

| | |
|--|--|
|__Name__| Recent search|
|__URL__| https://api.twitter.com/labs/1/tweets/search |
|__Method__| GET|



#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/1/tweets/search'
```




## Labs v1/Sampled Stream v1 {26890595063202000}

### Stream {277681958963202000}

| | |
|--|--|
|__Name__| Stream|
|__URL__| https://api.twitter.com/labs/1/tweets/stream/filter?format=detailed |
|__Method__| GET|

#### Description
Streams about 1% of Tweets in real-time.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/sampled-stream/api-reference) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' -H 'Dtab-Local: /s/datadelivery-staf/proxyapp:https => /srv#/staging2/smf1/datadelivery-staf/proxyapp:https' 'https://api.twitter.com/labs/1/tweets/stream/filter?format=detailed'
```




## Labs v2/Hide Replies v2 {18756510863204000}

### Hide Reply {96930947363204000}

| | |
|--|--|
|__Name__| Hide Reply|
|__URL__| https://api.twitter.com/labs/2/tweets/:id/hidden |
|__Method__| PUT|



#### Request

```sh
curl -X 'PUT' -d '{
	"hidden": true
}' -H 'Content-Type: application/json' 'https://api.twitter.com/labs/2/tweets/:id/hidden'
```




## Labs v2/Recent Search v2 {300039551963223000}

### Recent search {392175512263224000}

| | |
|--|--|
|__Name__| Recent search|
|__URL__| https://api.twitter.com/labs/2/tweets/search?query= |
|__Method__| GET|



#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/tweets/search?query='
```




## Labs v2/Tweets and Users v2 {20826579363227000}

### Multiple Tweets {129830885763228000}

| | |
|--|--|
|__Name__| Multiple Tweets|
|__URL__| https://api.twitter.com/labs/2/tweets?ids= |
|__Method__| GET|

#### Description
This endpoints returns information about the Tweet specified by the requested IDs.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweets-and-users/get-tweets-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/tweets?ids='
```



#### Response Examples

##### Example 1: Success - Status 200 - Default format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1138505981460193280",
            "created_at": "2019-06-11T17:59:13.000Z",
            "text": "🎺 da-dada-DAH! We’re introducing the first Twitter Developer Labs endpoints: \n\n✨GET/users and GET/tweets ✨\n\nLabs is now open to all developers to start experimenting today 👉 https://t.co/eNx4Wc3Qwj https://t.co/ucmZrJAYjk",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "7_1138489597158199298"
                ]
            },
            "entities": {
                "urls": [
                    {
                        "start": 174,
                        "end": 197,
                        "url": "https://t.co/eNx4Wc3Qwj",
                        "expanded_url": "https://twittercommunity.com/t/twitter-developer-labs-is-open-to-all-developers/126717",
                        "display_url": "twittercommunity.com/t/twitter-deve…"
                    },
                    {
                        "start": 198,
                        "end": 221,
                        "url": "https://t.co/ucmZrJAYjk"
                    }
                ]
            },
            "format": "default"
        }
    ]
}
```

##### Example 2: Error - Status 401 - Unauthorized

```json
Code: 401 Authorization Required
------------------------------------------
{
    "status": 401,
    "title": "Unauthorized",
    "type": "about:blank",
    "detail": "Unauthorized"
}
```

##### Example 3: Success - Status 200 - Detailed format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1138505981460193280",
            "created_at": "2019-06-11T17:59:13.000Z",
            "text": "🎺 da-dada-DAH! We’re introducing the first Twitter Developer Labs endpoints: \n\n✨GET/users and GET/tweets ✨\n\nLabs is now open to all developers to start experimenting today 👉 https://t.co/eNx4Wc3Qwj https://t.co/ucmZrJAYjk",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "7_1138489597158199298"
                ]
            },
            "entities": {
                "urls": [
                    {
                        "start": 174,
                        "end": 197,
                        "url": "https://t.co/eNx4Wc3Qwj",
                        "expanded_url": "https://twittercommunity.com/t/twitter-developer-labs-is-open-to-all-developers/126717",
                        "display_url": "twittercommunity.com/t/twitter-deve…"
                    },
                    {
                        "start": 198,
                        "end": 221,
                        "url": "https://t.co/ucmZrJAYjk"
                    }
                ]
            },
            "stats": {
                "retweet_count": 110,
                "reply_count": 30,
                "like_count": 254,
                "quote_count": 34
            },
            "possibly_sensitive": false,
            "lang": "en",
            "source": "<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
            "format": "detailed"
        }
    ]
}
```

##### Example 4: Error - Status 400 - Bad Request - Invalid Request

```json
Code: 400 Bad Request
------------------------------------------
{
    "errors": [
        {
            "parameters": {
                "": []
            },
            "message": "Request parameter `ids` can not be empty"
        }
    ],
    "type": "https://api.twitter.com/labs/1/problems/invalid-request",
    "title": "Invalid Request",
    "detail": "One or more parameters to your request was invalid."
}
```

##### Example 5: Error - Status 403 - Forbidden - Client Forbidden

```json
Code: 403 Forbidden
------------------------------------------
{
    "client_id": "1234567890",
    "type": "https://api.twitter.com/labs/1/problems/client-forbidden",
    "title": "Client Forbidden",
    "detail": "This request must be made with a registered client. Please create an account and enroll in Labs.",
    "reason": "client-not-enrolled",
    "registration_url": "https://developer.twitter.com/en/account/labs"
}
```

##### Example 6: Success/Error - Status 200 - Multiple existing Tweets and one error

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1171537108504215552",
            "created_at": "2019-09-10T21:33:07.000Z",
            "text": "Students, are you looking for some peer inspiration for the year ahead? Take a look at our new blog post highlighting a few recent cool projects using the Twitter API! https://t.co/UCWAP9gvCG",
            "author_id": "2244994945",
            "format": "compact"
        },
        {
            "id": "1166401263170281472",
            "created_at": "2019-08-27T17:25:06.000Z",
            "text": "Our latest Twitter Developer Labs release helps you quickly assess the impact of your Tweets. Today, we’re releasing \n\n✨a new metrics endpoint✨\n\nhttps://t.co/0zfDWzlE7W https://t.co/7gTmm9gBfs",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "16_1166401237824110592"
                ]
            },
            "format": "compact"
        }
    ],
    "errors": [
        {
            "value": "1166401660698025983",
            "detail": "Could not find tweet with ids: [1166401660698025983].",
            "type": "https://api.twitter.com/labs/1/problems/resource-not-found",
            "title": "Not Found Error",
            "parameter": "ids",
            "resource_type": "tweet"
        }
    ]
}
```

##### Example 7: Success - Status 200 - Compact format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1138505981460193280",
            "created_at": "2019-06-11T17:59:13.000Z",
            "text": "🎺 da-dada-DAH! We’re introducing the first Twitter Developer Labs endpoints: \n\n✨GET/users and GET/tweets ✨\n\nLabs is now open to all developers to start experimenting today 👉 https://t.co/eNx4Wc3Qwj https://t.co/ucmZrJAYjk",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "7_1138489597158199298"
                ]
            },
            "format": "compact"
        }
    ]
}
```


### Multiple users {242218911363241000}

| | |
|--|--|
|__Name__| Multiple users|
|__URL__| https://api.twitter.com/labs/2/users?ids= |
|__Method__| GET|

#### Description
This endpoint returns information about users. You can specify users by their ID or username.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweets-and-users/get-users-v2) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/users?ids='
```



#### Response Examples

##### Example 1: Success - Status 200 - Default format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "location": "Internet",
            "url": "https://t.co/FGl7VOULyL",
            "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
            "verified": true,
            "entities": {
                "url": {
                    "urls": [
                        {
                            "start": 0,
                            "end": 23,
                            "url": "https://t.co/FGl7VOULyL",
                            "expanded_url": "https://developer.twitter.com/",
                            "display_url": "developer.twitter.com"
                        }
                    ]
                },
                "description": {
                    "urls": [
                        {
                            "start": 93,
                            "end": 116,
                            "url": "https://t.co/mGHnxZU8c1",
                            "expanded_url": "https://twittercommunity.com/",
                            "display_url": "twittercommunity.com"
                        }
                    ],
                    "hashtags": [
                        {
                            "start": 120,
                            "end": 135,
                            "tag": "TapIntoTwitter"
                        }
                    ]
                }
            },
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "most_recent_tweet_id": "1171537108504215552",
            "pinned_tweet_id": "1166401263170281472",
            "format": "default"
        }
    ]
}
```

##### Example 2: Success - Status 200 - Detailed format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "location": "Internet",
      "url": "https://t.co/FGl7VOULyL",
      "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
      "verified": true,
      "entities": {
        "url": {
          "urls": [
            {
              "start": 0,
              "end": 23,
              "url": "https://t.co/FGl7VOULyL",
              "expanded_url": "https://developer.twitter.com/",
              "display_url": "developer.twitter.com"
            }
          ]
        },
        "description": {
          "urls": [
            {
              "start": 93,
              "end": 116,
              "url": "https://t.co/mGHnxZU8c1",
              "expanded_url": "https://twittercommunity.com/",
              "display_url": "twittercommunity.com"
            }
          ],
          "hashtags": [
            {
              "start": 120,
              "end": 135,
              "tag": "TapIntoTwitter"
            }
          ]
        }
      },
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "stats": {
        "followers_count": 503251,
        "following_count": 1474,
        "tweet_count": 3419,
        "listed_count": 1526
      },
      "most_recent_tweet_id": "1158441822286303232",
      "pinned_tweet_id": "1138505981460193280",
      "format": "detailed"
    }
  ]
}

```

##### Example 3: Error - Status 401 - Unauthorized

```json
Code: 401 Authorization Required
------------------------------------------
{
    "status": 401,
    "title": "Unauthorized",
    "type": "about:blank",
    "detail": "Unauthorized"
}
```

##### Example 4: Error - Status 403 - Forbidden - Client Forbidden

```json
Code: 403 Forbidden
------------------------------------------
{
    "client_id": "1234567890",
    "type": "https://api.twitter.com/labs/1/problems/client-forbidden",
    "title": "Client Forbidden",
    "detail": "This request must be made with a registered client. Please create an account and enroll in Labs.",
    "reason": "client-not-enrolled",
    "registration_url": "https://developer.twitter.com/en/account/labs"
}
```

##### Example 5: Error - Status 400 - Bad Request - Invalid Request

```json
Code: 400 Bad Request
------------------------------------------
{
    "errors": [
        {
            "parameters": {
                "username": [
                    "twitterdev"
                ]
            },
            "message": "Unknown parameters in request: user"
        }
    ],
    "type": "https://api.twitter.com/labs/1/problems/invalid-request",
    "title": "Invalid Request",
    "detail": "One or more parameters to your request was invalid."
}
```

##### Example 6: Success/Error - Status 200 - Multiple existing users and one error

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "format": "compact"
        },
        {
            "id": "6253282",
            "created_at": "2007-05-23T06:01:13.000Z",
            "name": "Twitter API",
            "username": "TwitterAPI",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/942858479592554497/BbazLO9L_normal.jpg",
            "format": "compact"
        }
    ],
    "errors": [
        {
            "value": "twittererr",
            "detail": "Could not find user with username: [twittererr].",
            "type": "https://api.twitter.com/labs/1/problems/resource-not-found",
            "title": "Not Found Error",
            "resource_type": "user",
            "parameter": "username"
        }
    ]
}
```

##### Example 7: Success - Status 200 - Compact format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "verified": true,
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "format": "compact"
    }
  ]
}
```


### Multiple users by username {311152629463253000}

| | |
|--|--|
|__Name__| Multiple users by username|
|__URL__| https://api.twitter.com/labs/2/users/by?usernames= |
|__Method__| GET|

#### Description
This endpoint returns information about users. You can specify users by their ID or username.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweets-and-users/get-users-v2) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/users/by?usernames='
```



#### Response Examples

##### Example 1: Error - Status 403 - Forbidden - Client Forbidden

```json
Code: 403 Forbidden
------------------------------------------
{
    "client_id": "1234567890",
    "type": "https://api.twitter.com/labs/1/problems/client-forbidden",
    "title": "Client Forbidden",
    "detail": "This request must be made with a registered client. Please create an account and enroll in Labs.",
    "reason": "client-not-enrolled",
    "registration_url": "https://developer.twitter.com/en/account/labs"
}
```

##### Example 2: Error - Status 401 - Unauthorized

```json
Code: 401 Authorization Required
------------------------------------------
{
    "status": 401,
    "title": "Unauthorized",
    "type": "about:blank",
    "detail": "Unauthorized"
}
```

##### Example 3: Error - Status 400 - Bad Request - Invalid Request

```json
Code: 400 Bad Request
------------------------------------------
{
    "errors": [
        {
            "parameters": {
                "username": [
                    "twitterdev"
                ]
            },
            "message": "Unknown parameters in request: user"
        }
    ],
    "type": "https://api.twitter.com/labs/1/problems/invalid-request",
    "title": "Invalid Request",
    "detail": "One or more parameters to your request was invalid."
}
```

##### Example 4: Success - Status 200 - Default format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "location": "Internet",
            "url": "https://t.co/FGl7VOULyL",
            "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
            "verified": true,
            "entities": {
                "url": {
                    "urls": [
                        {
                            "start": 0,
                            "end": 23,
                            "url": "https://t.co/FGl7VOULyL",
                            "expanded_url": "https://developer.twitter.com/",
                            "display_url": "developer.twitter.com"
                        }
                    ]
                },
                "description": {
                    "urls": [
                        {
                            "start": 93,
                            "end": 116,
                            "url": "https://t.co/mGHnxZU8c1",
                            "expanded_url": "https://twittercommunity.com/",
                            "display_url": "twittercommunity.com"
                        }
                    ],
                    "hashtags": [
                        {
                            "start": 120,
                            "end": 135,
                            "tag": "TapIntoTwitter"
                        }
                    ]
                }
            },
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "most_recent_tweet_id": "1171537108504215552",
            "pinned_tweet_id": "1166401263170281472",
            "format": "default"
        }
    ]
}
```

##### Example 5: Success/Error - Status 200 - Multiple existing users and one error

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "format": "compact"
        },
        {
            "id": "6253282",
            "created_at": "2007-05-23T06:01:13.000Z",
            "name": "Twitter API",
            "username": "TwitterAPI",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/942858479592554497/BbazLO9L_normal.jpg",
            "format": "compact"
        }
    ],
    "errors": [
        {
            "value": "twittererr",
            "detail": "Could not find user with username: [twittererr].",
            "type": "https://api.twitter.com/labs/1/problems/resource-not-found",
            "title": "Not Found Error",
            "resource_type": "user",
            "parameter": "username"
        }
    ]
}
```

##### Example 6: Success - Status 200 - Detailed format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "location": "Internet",
      "url": "https://t.co/FGl7VOULyL",
      "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
      "verified": true,
      "entities": {
        "url": {
          "urls": [
            {
              "start": 0,
              "end": 23,
              "url": "https://t.co/FGl7VOULyL",
              "expanded_url": "https://developer.twitter.com/",
              "display_url": "developer.twitter.com"
            }
          ]
        },
        "description": {
          "urls": [
            {
              "start": 93,
              "end": 116,
              "url": "https://t.co/mGHnxZU8c1",
              "expanded_url": "https://twittercommunity.com/",
              "display_url": "twittercommunity.com"
            }
          ],
          "hashtags": [
            {
              "start": 120,
              "end": 135,
              "tag": "TapIntoTwitter"
            }
          ]
        }
      },
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "stats": {
        "followers_count": 503251,
        "following_count": 1474,
        "tweet_count": 3419,
        "listed_count": 1526
      },
      "most_recent_tweet_id": "1158441822286303232",
      "pinned_tweet_id": "1138505981460193280",
      "format": "detailed"
    }
  ]
}

```

##### Example 7: Success - Status 200 - Compact format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "verified": true,
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "format": "compact"
    }
  ]
}
```


### Single Tweet {394233794463263000}

| | |
|--|--|
|__Name__| Single Tweet|
|__URL__| https://api.twitter.com/labs/2/tweets/:id |
|__Method__| GET|

#### Description
This endpoints returns information about the Tweet specified by the requested IDs.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweets-and-users/get-tweets-v1) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/tweets/:id'
```



#### Response Examples

##### Example 1: Success/Error - Status 200 - Multiple existing Tweets and one error

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1171537108504215552",
            "created_at": "2019-09-10T21:33:07.000Z",
            "text": "Students, are you looking for some peer inspiration for the year ahead? Take a look at our new blog post highlighting a few recent cool projects using the Twitter API! https://t.co/UCWAP9gvCG",
            "author_id": "2244994945",
            "format": "compact"
        },
        {
            "id": "1166401263170281472",
            "created_at": "2019-08-27T17:25:06.000Z",
            "text": "Our latest Twitter Developer Labs release helps you quickly assess the impact of your Tweets. Today, we’re releasing \n\n✨a new metrics endpoint✨\n\nhttps://t.co/0zfDWzlE7W https://t.co/7gTmm9gBfs",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "16_1166401237824110592"
                ]
            },
            "format": "compact"
        }
    ],
    "errors": [
        {
            "value": "1166401660698025983",
            "detail": "Could not find tweet with ids: [1166401660698025983].",
            "type": "https://api.twitter.com/labs/1/problems/resource-not-found",
            "title": "Not Found Error",
            "parameter": "ids",
            "resource_type": "tweet"
        }
    ]
}
```

##### Example 2: Error - Status 400 - Bad Request - Invalid Request

```json
Code: 400 Bad Request
------------------------------------------
{
    "errors": [
        {
            "parameters": {
                "": []
            },
            "message": "Request parameter `ids` can not be empty"
        }
    ],
    "type": "https://api.twitter.com/labs/1/problems/invalid-request",
    "title": "Invalid Request",
    "detail": "One or more parameters to your request was invalid."
}
```

##### Example 3: Error - Status 403 - Forbidden - Client Forbidden

```json
Code: 403 Forbidden
------------------------------------------
{
    "client_id": "1234567890",
    "type": "https://api.twitter.com/labs/1/problems/client-forbidden",
    "title": "Client Forbidden",
    "detail": "This request must be made with a registered client. Please create an account and enroll in Labs.",
    "reason": "client-not-enrolled",
    "registration_url": "https://developer.twitter.com/en/account/labs"
}
```

##### Example 4: Success - Status 200 - Default format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1138505981460193280",
            "created_at": "2019-06-11T17:59:13.000Z",
            "text": "🎺 da-dada-DAH! We’re introducing the first Twitter Developer Labs endpoints: \n\n✨GET/users and GET/tweets ✨\n\nLabs is now open to all developers to start experimenting today 👉 https://t.co/eNx4Wc3Qwj https://t.co/ucmZrJAYjk",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "7_1138489597158199298"
                ]
            },
            "entities": {
                "urls": [
                    {
                        "start": 174,
                        "end": 197,
                        "url": "https://t.co/eNx4Wc3Qwj",
                        "expanded_url": "https://twittercommunity.com/t/twitter-developer-labs-is-open-to-all-developers/126717",
                        "display_url": "twittercommunity.com/t/twitter-deve…"
                    },
                    {
                        "start": 198,
                        "end": 221,
                        "url": "https://t.co/ucmZrJAYjk"
                    }
                ]
            },
            "format": "default"
        }
    ]
}
```

##### Example 5: Success - Status 200 - Compact format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1138505981460193280",
            "created_at": "2019-06-11T17:59:13.000Z",
            "text": "🎺 da-dada-DAH! We’re introducing the first Twitter Developer Labs endpoints: \n\n✨GET/users and GET/tweets ✨\n\nLabs is now open to all developers to start experimenting today 👉 https://t.co/eNx4Wc3Qwj https://t.co/ucmZrJAYjk",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "7_1138489597158199298"
                ]
            },
            "format": "compact"
        }
    ]
}
```

##### Example 6: Error - Status 401 - Unauthorized

```json
Code: 401 Authorization Required
------------------------------------------
{
    "status": 401,
    "title": "Unauthorized",
    "type": "about:blank",
    "detail": "Unauthorized"
}
```

##### Example 7: Success - Status 200 - Detailed format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "1138505981460193280",
            "created_at": "2019-06-11T17:59:13.000Z",
            "text": "🎺 da-dada-DAH! We’re introducing the first Twitter Developer Labs endpoints: \n\n✨GET/users and GET/tweets ✨\n\nLabs is now open to all developers to start experimenting today 👉 https://t.co/eNx4Wc3Qwj https://t.co/ucmZrJAYjk",
            "author_id": "2244994945",
            "attachments": {
                "media_keys": [
                    "7_1138489597158199298"
                ]
            },
            "entities": {
                "urls": [
                    {
                        "start": 174,
                        "end": 197,
                        "url": "https://t.co/eNx4Wc3Qwj",
                        "expanded_url": "https://twittercommunity.com/t/twitter-developer-labs-is-open-to-all-developers/126717",
                        "display_url": "twittercommunity.com/t/twitter-deve…"
                    },
                    {
                        "start": 198,
                        "end": 221,
                        "url": "https://t.co/ucmZrJAYjk"
                    }
                ]
            },
            "stats": {
                "retweet_count": 110,
                "reply_count": 30,
                "like_count": 254,
                "quote_count": 34
            },
            "possibly_sensitive": false,
            "lang": "en",
            "source": "<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>",
            "format": "detailed"
        }
    ]
}
```


### Single user by ID {391248902663268000}

| | |
|--|--|
|__Name__| Single user by ID|
|__URL__| https://api.twitter.com/labs/2/users/:id |
|__Method__| GET|

#### Description
This endpoint returns information about users. You can specify users by their ID or username.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweets-and-users/get-users-v2) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/users/:id'
```



#### Response Examples

##### Example 1: Success - Status 200 - Compact format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "verified": true,
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "format": "compact"
    }
  ]
}
```

##### Example 2: Success/Error - Status 200 - Multiple existing users and one error

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "format": "compact"
        },
        {
            "id": "6253282",
            "created_at": "2007-05-23T06:01:13.000Z",
            "name": "Twitter API",
            "username": "TwitterAPI",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/942858479592554497/BbazLO9L_normal.jpg",
            "format": "compact"
        }
    ],
    "errors": [
        {
            "value": "twittererr",
            "detail": "Could not find user with username: [twittererr].",
            "type": "https://api.twitter.com/labs/1/problems/resource-not-found",
            "title": "Not Found Error",
            "resource_type": "user",
            "parameter": "username"
        }
    ]
}
```

##### Example 3: Success - Status 200 - Detailed format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "location": "Internet",
      "url": "https://t.co/FGl7VOULyL",
      "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
      "verified": true,
      "entities": {
        "url": {
          "urls": [
            {
              "start": 0,
              "end": 23,
              "url": "https://t.co/FGl7VOULyL",
              "expanded_url": "https://developer.twitter.com/",
              "display_url": "developer.twitter.com"
            }
          ]
        },
        "description": {
          "urls": [
            {
              "start": 93,
              "end": 116,
              "url": "https://t.co/mGHnxZU8c1",
              "expanded_url": "https://twittercommunity.com/",
              "display_url": "twittercommunity.com"
            }
          ],
          "hashtags": [
            {
              "start": 120,
              "end": 135,
              "tag": "TapIntoTwitter"
            }
          ]
        }
      },
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "stats": {
        "followers_count": 503251,
        "following_count": 1474,
        "tweet_count": 3419,
        "listed_count": 1526
      },
      "most_recent_tweet_id": "1158441822286303232",
      "pinned_tweet_id": "1138505981460193280",
      "format": "detailed"
    }
  ]
}

```

##### Example 4: Error - Status 403 - Forbidden - Client Forbidden

```json
Code: 403 Forbidden
------------------------------------------
{
    "client_id": "1234567890",
    "type": "https://api.twitter.com/labs/1/problems/client-forbidden",
    "title": "Client Forbidden",
    "detail": "This request must be made with a registered client. Please create an account and enroll in Labs.",
    "reason": "client-not-enrolled",
    "registration_url": "https://developer.twitter.com/en/account/labs"
}
```

##### Example 5: Error - Status 400 - Bad Request - Invalid Request

```json
Code: 400 Bad Request
------------------------------------------
{
    "errors": [
        {
            "parameters": {
                "username": [
                    "twitterdev"
                ]
            },
            "message": "Unknown parameters in request: user"
        }
    ],
    "type": "https://api.twitter.com/labs/1/problems/invalid-request",
    "title": "Invalid Request",
    "detail": "One or more parameters to your request was invalid."
}
```

##### Example 6: Error - Status 401 - Unauthorized

```json
Code: 401 Authorization Required
------------------------------------------
{
    "status": 401,
    "title": "Unauthorized",
    "type": "about:blank",
    "detail": "Unauthorized"
}
```

##### Example 7: Success - Status 200 - Default format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "location": "Internet",
            "url": "https://t.co/FGl7VOULyL",
            "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
            "verified": true,
            "entities": {
                "url": {
                    "urls": [
                        {
                            "start": 0,
                            "end": 23,
                            "url": "https://t.co/FGl7VOULyL",
                            "expanded_url": "https://developer.twitter.com/",
                            "display_url": "developer.twitter.com"
                        }
                    ]
                },
                "description": {
                    "urls": [
                        {
                            "start": 93,
                            "end": 116,
                            "url": "https://t.co/mGHnxZU8c1",
                            "expanded_url": "https://twittercommunity.com/",
                            "display_url": "twittercommunity.com"
                        }
                    ],
                    "hashtags": [
                        {
                            "start": 120,
                            "end": 135,
                            "tag": "TapIntoTwitter"
                        }
                    ]
                }
            },
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "most_recent_tweet_id": "1171537108504215552",
            "pinned_tweet_id": "1166401263170281472",
            "format": "default"
        }
    ]
}
```


### Single user by username {193206479163277000}

| | |
|--|--|
|__Name__| Single user by username|
|__URL__| https://api.twitter.com/labs/2/users/by/username/:username |
|__Method__| GET|

#### Description
This endpoint returns information about users. You can specify users by their ID or username.

For full details, see the [API reference](https://developer.twitter.com/en/docs/labs/tweets-and-users/get-users-v2) for this endpoint.

#### Request

```sh
curl -X 'GET' -d '' 'https://api.twitter.com/labs/2/users/by/username/:username'
```



#### Response Examples

##### Example 1: Success - Status 200 - Default format

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "location": "Internet",
            "url": "https://t.co/FGl7VOULyL",
            "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
            "verified": true,
            "entities": {
                "url": {
                    "urls": [
                        {
                            "start": 0,
                            "end": 23,
                            "url": "https://t.co/FGl7VOULyL",
                            "expanded_url": "https://developer.twitter.com/",
                            "display_url": "developer.twitter.com"
                        }
                    ]
                },
                "description": {
                    "urls": [
                        {
                            "start": 93,
                            "end": 116,
                            "url": "https://t.co/mGHnxZU8c1",
                            "expanded_url": "https://twittercommunity.com/",
                            "display_url": "twittercommunity.com"
                        }
                    ],
                    "hashtags": [
                        {
                            "start": 120,
                            "end": 135,
                            "tag": "TapIntoTwitter"
                        }
                    ]
                }
            },
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "most_recent_tweet_id": "1171537108504215552",
            "pinned_tweet_id": "1166401263170281472",
            "format": "default"
        }
    ]
}
```

##### Example 2: Success/Error - Status 200 - Multiple existing users and one error

```json
Code: 200 OK
------------------------------------------
{
    "data": [
        {
            "id": "2244994945",
            "created_at": "2013-12-14T04:35:55.000Z",
            "name": "Twitter Dev",
            "username": "TwitterDev",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
            "format": "compact"
        },
        {
            "id": "6253282",
            "created_at": "2007-05-23T06:01:13.000Z",
            "name": "Twitter API",
            "username": "TwitterAPI",
            "protected": false,
            "verified": true,
            "profile_image_url": "https://pbs.twimg.com/profile_images/942858479592554497/BbazLO9L_normal.jpg",
            "format": "compact"
        }
    ],
    "errors": [
        {
            "value": "twittererr",
            "detail": "Could not find user with username: [twittererr].",
            "type": "https://api.twitter.com/labs/1/problems/resource-not-found",
            "title": "Not Found Error",
            "resource_type": "user",
            "parameter": "username"
        }
    ]
}
```

##### Example 3: Success - Status 200 - Detailed format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "location": "Internet",
      "url": "https://t.co/FGl7VOULyL",
      "description": "Your official source for Twitter Platform news, updates & events. Need technical help? Visit https://t.co/mGHnxZU8c1 ⌨️ #TapIntoTwitter",
      "verified": true,
      "entities": {
        "url": {
          "urls": [
            {
              "start": 0,
              "end": 23,
              "url": "https://t.co/FGl7VOULyL",
              "expanded_url": "https://developer.twitter.com/",
              "display_url": "developer.twitter.com"
            }
          ]
        },
        "description": {
          "urls": [
            {
              "start": 93,
              "end": 116,
              "url": "https://t.co/mGHnxZU8c1",
              "expanded_url": "https://twittercommunity.com/",
              "display_url": "twittercommunity.com"
            }
          ],
          "hashtags": [
            {
              "start": 120,
              "end": 135,
              "tag": "TapIntoTwitter"
            }
          ]
        }
      },
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "stats": {
        "followers_count": 503251,
        "following_count": 1474,
        "tweet_count": 3419,
        "listed_count": 1526
      },
      "most_recent_tweet_id": "1158441822286303232",
      "pinned_tweet_id": "1138505981460193280",
      "format": "detailed"
    }
  ]
}

```

##### Example 4: Error - Status 400 - Bad Request - Invalid Request

```json
Code: 400 Bad Request
------------------------------------------
{
    "errors": [
        {
            "parameters": {
                "username": [
                    "twitterdev"
                ]
            },
            "message": "Unknown parameters in request: user"
        }
    ],
    "type": "https://api.twitter.com/labs/1/problems/invalid-request",
    "title": "Invalid Request",
    "detail": "One or more parameters to your request was invalid."
}
```

##### Example 5: Error - Status 401 - Unauthorized

```json
Code: 401 Authorization Required
------------------------------------------
{
    "status": 401,
    "title": "Unauthorized",
    "type": "about:blank",
    "detail": "Unauthorized"
}
```

##### Example 6: Success - Status 200 - Compact format

```json
Code: 200 OK
------------------------------------------
{
  "data": [
    {
      "id": "2244994945",
      "created_at": "2013-12-14T04:35:55.000Z",
      "name": "Twitter Dev",
      "username": "TwitterDev",
      "protected": false,
      "verified": true,
      "profile_image_url": "https://pbs.twimg.com/profile_images/880136122604507136/xHrnqf1T_normal.jpg",
      "format": "compact"
    }
  ]
}
```

##### Example 7: Error - Status 403 - Forbidden - Client Forbidden

```json
Code: 403 Forbidden
------------------------------------------
{
    "client_id": "1234567890",
    "type": "https://api.twitter.com/labs/1/problems/client-forbidden",
    "title": "Client Forbidden",
    "detail": "This request must be made with a registered client. Please create an account and enroll in Labs.",
    "reason": "client-not-enrolled",
    "registration_url": "https://developer.twitter.com/en/account/labs"
}
```





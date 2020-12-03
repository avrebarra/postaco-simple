# Dropbox API Reference {134146470027287000}

The powerful, yet simple, Dropbox API allows you to manage and control content and team settings programmatically and extend Dropbox capabilities in new and powerful ways. This is a collection that includes requests to all endpoints in the Dropbox API. 

The Dropbox API is divided in two groups of endpoints: User Endpoints and Business Endpoints. Operations that would most likely be executed by a user, such as file operations, are in the User Endpoints folder. Operations that would most likely be executed by a team administrator, such as adding users to groups, live in the Business Endpoints folder. 

If you are new to Dropbox Business and Team Administration, please have a look at the [Dropobox Admin Guide](https://help.dropbox.com/guide/admin/how-to-get-started#dropbox-admin-guide). 

If you want more information on how to use our API please refer to our [Developer Portal](https://www.dropbox.com/developers). 

# What&#39;s in the collection?

The endpoints are organized in the following folders:
* account
* auth
* check
* contacts
* file_properties
* file_requests
* files
* sharing
* team
* team_log
* users

# Authorization

## OAuth 2.0 for API Access
Dropbox uses OAuth 2.0, an open specification, to authorize access to data. To get an OAuth token from Dropbox to enable Postman to access your Dropbox account via the API you’ll need to create a new app on the DBX Platform.

## Creating an App on the DBX Platform
Navigate to https://www.dropbox.com/developers/apps and select “Create app” 
1. Choose an API  
2. Choose the type of access you need 
3. Give your app a name  
4. Choose the Dropbox account that will own your app  

For reference, please use the [Dropbox OAuth guide](https://www.dropbox.com/lp/developers/reference/oauth-guide) 

## Generating an Access Token
Once you select “Create app” a page will load that displays information about your newly created app. To generate an access token scroll down to “OAuth 2” and click “Generate” beneath “Generated access token.” The token will display as a long string of characters. Copy this token for use with the Postman Collection.

## Adding an Access Token to the requests
In the Postman client, click on the three dots to the right of the collection name to &quot;View more actions.&quot;

![Screenshot of adding access token](https://www.dropbox.com/s/sfebu9ai76cbq39/Screen%20Shot%202020-10-28%20at%2012.50.56%20AM.png?raw=1)

Then, click &quot;Edit.&quot;

Click on the &quot;Variables&quot; tab and, in the row for the `access_token` variable, paste your access token in the `CURRENT VALUE` column. The default value is `your-access-token-here`.

![Screenshot of adding access token](https://www.dropbox.com/s/ahnbxwe6oscjues/Screen%20Shot%202020-10-28%20at%2012.51.13%20AM.png?raw=1)

For information on sessions and variables in Postman see the blog post at https://blog.postman.com/sessions-faq/.

# Notes
* Dropbox also has a Postman Collection in the API Network to help administrators with team management workflows. It is called [Dropbox Team Admin Workflows](). 




## account {69309423627306000}

### set_profile_photo {83550976227307000}

| | |
|--|--|
|__Name__| set_profile_photo|
|__URL__| https://api.dropboxapi.com/2/account/set_profile_photo |
|__Method__| POST|

#### Description
[set_profile_photo](https://www.dropbox.com/developers/documentation/http/documentation#account-set_profile_photo)

scope: `account_info.write`

Sets a user&#39;s profile photo.

#### Request

```sh
curl -X 'POST' -d '{
    "photo": {
        ".tag": "base64_data", 
        "base64_data": "SW1hZ2UgZGF0YSBpbiBiYXNlNjQtZW5jb2RlZCBieXRlcy4gTm90IGEgdmFsaWQgZXhhbXBsZS4="
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/account/set_profile_photo'
```



#### Response Examples

##### Example 1: set_profile_photo response

```json
Code: 200 OK
------------------------------------------
{
    "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
}
```


## auth {250397703927311000}

### token/from_oauth1 {188533853427312000}

| | |
|--|--|
|__Name__| token/from_oauth1|
|__URL__| https://api.dropboxapi.com/2/auth/token/from_oauth1 |
|__Method__| POST|

#### Description
[token/from_oauth1](https://www.dropbox.com/developers/documentation/http/documentation#auth-token-from_oauth1)

scope: `None`

Creates an OAuth 2.0 access token from the supplied OAuth 1.0 access token.

#### Request

```sh
curl -X 'POST' -d '{
    "oauth1_token": "qievr8hamyg6ndck", 
    "oauth1_token_secret": "qomoftv0472git7"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/auth/token/from_oauth1'
```



#### Response Examples

##### Example 1: token/from_oauth1 response

```json
Code: 200 OK
------------------------------------------
{
    "oauth2_token": "9mCrkS7BIdAAAAAAAAAAHHS0TsSnpYvKQVtKdBnN5IuzhYOGblSgTcHgBFKFMmFn"
}
```


### token/revoke {69544948527314000}

| | |
|--|--|
|__Name__| token/revoke|
|__URL__| https://api.dropboxapi.com/2/auth/token/revoke |
|__Method__| POST|

#### Description
[token/revoke](https://www.dropbox.com/developers/documentation/http/documentation#auth-token-revoke)

scope: `None`

Disables the access token used to authenticate the call.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/auth/token/revoke'
```




## check {301053447127316000}

### app {52707409227317000}

| | |
|--|--|
|__Name__| app|
|__URL__| https://api.dropboxapi.com/2/check/app |
|__Method__| POST|

#### Description
[app](https://www.dropbox.com/developers/documentation/http/documentation#check-app)

scope: `None`

This endpoint performs App Authentication, validating the supplied app key and secret, and returns the supplied string, to allow you to test your code and connection to the Dropbox API. It has no other effect. If you receive an HTTP 200 response with the supplied query, it indicates at least part of the Dropbox API infrastructure is working and that the app key and secret valid.

#### Request

```sh
curl -X 'POST' -d '{
    "query": "foo"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/check/app'
```



#### Response Examples

##### Example 1: app response

```json
Code: 200 OK
------------------------------------------
{
    "result": "foo"
}
```


### user {161850136227321000}

| | |
|--|--|
|__Name__| user|
|__URL__| https://api.dropboxapi.com/2/check/user |
|__Method__| POST|

#### Description
[user](https://www.dropbox.com/developers/documentation/http/documentation#check-user)

scope: `None`

This endpoint performs User Authentication, validating the supplied access token, and returns the supplied string, to allow you to test your code and connection to the Dropbox API. It has no other effect. If you receive an HTTP 200 response with the supplied query, it indicates at least part of the Dropbox API infrastructure is working and that the access token is valid.

#### Request

```sh
curl -X 'POST' -d '{
    "query": "foo"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/check/user'
```



#### Response Examples

##### Example 1: user response

```json
Code: 200 OK
------------------------------------------
{
    "result": "foo"
}
```


## contacts {347057176027323000}

### delete_manual_contacts {72552817927323000}

| | |
|--|--|
|__Name__| delete_manual_contacts|
|__URL__| https://api.dropboxapi.com/2/contacts/delete_manual_contacts |
|__Method__| POST|

#### Description
[delete_manual_contacts](https://www.dropbox.com/developers/documentation/http/documentation#contacts-delete_manual_contacts)

scope: `contacts.write`

Removes all manually added contacts. You&#39;ll still keep contacts who are on your team or who you imported. New contacts will be added when you share.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/contacts/delete_manual_contacts'
```




### delete_manual_contacts_batch {63329018827325000}

| | |
|--|--|
|__Name__| delete_manual_contacts_batch|
|__URL__| https://api.dropboxapi.com/2/contacts/delete_manual_contacts_batch |
|__Method__| POST|

#### Description
[delete_manual_contacts_batch](https://www.dropbox.com/developers/documentation/http/documentation#contacts-delete_manual_contacts_batch)

scope: `contacts.write`

Removes manually added contacts from the given list.

#### Request

```sh
curl -X 'POST' -d '{
    "email_addresses": [
        "contactemailaddress1@domain.com", 
        "contactemailaddress2@domain.com"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/contacts/delete_manual_contacts_batch'
```




## file_properties {169203624927331000}

### properties/add {57557403227332000}

| | |
|--|--|
|__Name__| properties/add|
|__URL__| https://api.dropboxapi.com/2/file_properties/properties/add |
|__Method__| POST|

#### Description
[properties/add](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-properties-add)

scope: `files.metadata.write`

Add property groups to a Dropbox file. See `templates/add_for_user` or `templates/add_for_team` to create new templates.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/my_awesome/word.docx", 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/properties/add'
```




### properties/overwrite {199974107027333000}

| | |
|--|--|
|__Name__| properties/overwrite|
|__URL__| https://api.dropboxapi.com/2/file_properties/properties/overwrite |
|__Method__| POST|

#### Description
[properties/overwrite](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-properties-overwrite)

scope: `files.metadata.write`

Overwrite property groups associated with a file. This endpoint should be used instead of `properties/update` when property groups are being updated via a &quot;snapshot&quot; instead of via a &quot;delta&quot;. In other words, this endpoint will delete all omitted fields from a property group, whereas `properties/update` will only delete fields that are explicitly marked for deletion.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/my_awesome/word.docx", 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/properties/overwrite'
```




### properties/remove {278886511327339000}

| | |
|--|--|
|__Name__| properties/remove|
|__URL__| https://api.dropboxapi.com/2/file_properties/properties/remove |
|__Method__| POST|

#### Description
[properties/remove](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-properties-remove)

scope: `files.metadata.write`

Permanently removes the specified property group from the file. To remove specific property field key value pairs, see `properties/update`. To update a template, see `templates/update_for_user` or `templates/update_for_team`. To remove a template, see `templates/remove_for_user` or `templates/remove_for_team`.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/my_awesome/word.docx", 
    "property_template_ids": [
        "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/properties/remove'
```




### properties/search {225068699727341000}

| | |
|--|--|
|__Name__| properties/search|
|__URL__| https://api.dropboxapi.com/2/file_properties/properties/search |
|__Method__| POST|

#### Description
[properties/search](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-properties-search)

scope: `files.metadata.read`

Search across property templates for particular property field values.

#### Request

```sh
curl -X 'POST' -d '{
    "queries": [
        {
            "query": "Compliance Bot - Beta", 
            "mode": {
                ".tag": "field_name", 
                "field_name": "Security"
            }, 
            "logical_operator": "or_operator"
        }
    ], 
    "template_filter": "filter_none"
}' -H 'Authorization:  Bearer IU571Pc9cGAAAAAAAAAAAQh57r-VTd7qBjZBUsVHLR6NRVTcd0FOThotVQmF9q9F' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/properties/search'
```



#### Response Examples

##### Example 1: properties/search response

```json
Code: 200 OK
------------------------------------------
{
    "matches": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
            "path": "/my_awesome/word.docx", 
            "is_deleted": false, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ]
        }
    ]
}
```


### properties/search/continue {286491783127343000}

| | |
|--|--|
|__Name__| properties/search/continue|
|__URL__| https://api.dropboxapi.com/2/file_properties/properties/search/continue |
|__Method__| POST|

#### Description
[properties/search/continue](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-properties-search-continue)

scope: `files.metadata.read`

Once a cursor has been retrieved from `properties/search`, use this to paginate through all search results.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/properties/search/continue'
```



#### Response Examples

##### Example 1: properties/search/continue response

```json
Code: 200 OK
------------------------------------------
{
    "matches": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
            "path": "/my_awesome/word.docx", 
            "is_deleted": false, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ]
        }
    ]
}
```


### properties/update {109799911227350000}

| | |
|--|--|
|__Name__| properties/update|
|__URL__| https://api.dropboxapi.com/2/file_properties/properties/update |
|__Method__| POST|

#### Description
[properties/update](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-properties-update)

scope: `files.metadata.write`

Add, update or remove properties associated with the supplied file and templates. This endpoint should be used instead of `properties/overwrite` when property groups are being updated via a &quot;delta&quot; instead of via a &quot;snapshot&quot; . In other words, this endpoint will not delete any omitted fields from a property group, whereas `properties/overwrite` will delete any fields that are omitted from a property group.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/my_awesome/word.docx", 
    "update_property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "add_or_update_fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ], 
            "remove_fields": []
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/properties/update'
```




### templates/add_for_team {229655598427352000}

| | |
|--|--|
|__Name__| templates/add_for_team|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/add_for_team |
|__Method__| POST|

#### Description
[templates/add_for_team](https://www.dropbox.com/developers/documentation/http/teams#file_properties-templates-add_for_team)

scope: `files.team_metadata.write`

Add a template associated with a team. See `properties/add` to add properties to a file or folder.
Note: this endpoint will create team-owned templates.

#### Request

```sh
curl -X 'POST' -d '{
    "name": "Security", 
    "description": "These properties describe how confidential this file or folder is.", 
    "fields": [
        {
            "name": "Security Policy", 
            "description": "This is the security policy of the file or folder described.\nPolicies can be Confidential, Public or Internal.", 
            "type": "string"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/add_for_team'
```



#### Response Examples

##### Example 1: templates/add_for_team response

```json
Code: 200 OK
------------------------------------------
{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}
```


### templates/add_for_user {419258515027354000}

| | |
|--|--|
|__Name__| templates/add_for_user|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/add_for_user |
|__Method__| POST|

#### Description
[templates/add_for_user](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-templates-add_for_user)

scope: `files.metadata.write`

Add a template associated with a user. See `properties/add` to add properties to a file. This endpoint can&#39;t be called on a team member or admin&#39;s behalf.

#### Request

```sh
curl -X 'POST' -d '{
    "name": "Security", 
    "description": "These properties describe how confidential this file or folder is.", 
    "fields": [
        {
            "name": "Security Policy", 
            "description": "This is the security policy of the file or folder described.\nPolicies can be Confidential, Public or Internal.", 
            "type": "string"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/add_for_user'
```



#### Response Examples

##### Example 1: templates/add_for_user response

```json
Code: 200 OK
------------------------------------------
{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}
```


### templates/get_for_team {337252289727359000}

| | |
|--|--|
|__Name__| templates/get_for_team|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/get_for_team |
|__Method__| POST|

#### Description
[templates/get_for_team](https://www.dropbox.com/developers/documentation/http/teams#file_properties-templates-get_for_team)

scope: `files.team_metadata.write`

Get the schema for a specified template.

#### Request

```sh
curl -X 'POST' -d '{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/get_for_team'
```



#### Response Examples

##### Example 1: templates/get_for_team response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Security", 
    "description": "These properties describe how confidential this file or folder is.", 
    "fields": [
        {
            "name": "Security Policy", 
            "description": "This is the security policy of the file or folder described.\nPolicies can be Confidential, Public or Internal.", 
            "type": {
                ".tag": "string"
            }
        }
    ]
}
```


### templates/get_for_user {74080225127361000}

| | |
|--|--|
|__Name__| templates/get_for_user|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/get_for_user |
|__Method__| POST|

#### Description
[templates/get_for_user](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-templates-get_for_user)

scope: `files.metadata.read`

Get the schema for a specified template. This endpoint can&#39;t be called on a team member or admin&#39;s behalf.

#### Request

```sh
curl -X 'POST' -d '{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/get_for_user'
```



#### Response Examples

##### Example 1: templates/get_for_user response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Security", 
    "description": "These properties describe how confidential this file or folder is.", 
    "fields": [
        {
            "name": "Security Policy", 
            "description": "This is the security policy of the file or folder described.\nPolicies can be Confidential, Public or Internal.", 
            "type": {
                ".tag": "string"
            }
        }
    ]
}
```


### templates/list_for_team {385528798727363000}

| | |
|--|--|
|__Name__| templates/list_for_team|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/list_for_team |
|__Method__| POST|

#### Description
[templates/list_for_team](https://www.dropbox.com/developers/documentation/http/teams#file_properties-templates-list_for_team)

scope: `files.team_metadata.write`

Get the template identifiers for a team. To get the schema of each template use `templates/get_for_team`.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/file_properties/templates/list_for_team'
```



#### Response Examples

##### Example 1: templates/list_for_team response

```json
Code: 200 OK
------------------------------------------
{
    "template_ids": [
        "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
    ]
}
```


### templates/list_for_user {76532490127364000}

| | |
|--|--|
|__Name__| templates/list_for_user|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/list_for_user |
|__Method__| POST|

#### Description
[templates/list_for_user](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-templates-list_for_user)

scope: `files.metadata.read`

Get the template identifiers for a team. To get the schema of each template use `templates/get_for_user`. This endpoint can&#39;t be called on a team member or admin&#39;s behalf.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/file_properties/templates/list_for_user'
```



#### Response Examples

##### Example 1: templates/list_for_user response

```json
Code: 200 OK
------------------------------------------
{
    "template_ids": [
        "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
    ]
}
```


### templates/remove_for_team {289574545527366000}

| | |
|--|--|
|__Name__| templates/remove_for_team|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/remove_for_team |
|__Method__| POST|

#### Description
[templates/remove_for_team](https://www.dropbox.com/developers/documentation/http/teams#file_properties-templates-remove_for_team)

scope: `files.team_metadata.write`

Permanently removes the specified template created from `templates/add_for_user`. All properties associated with the template will also be removed. This action cannot be undone.

#### Request

```sh
curl -X 'POST' -d '{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/remove_for_team'
```




### templates/remove_for_user {212493240927367000}

| | |
|--|--|
|__Name__| templates/remove_for_user|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/remove_for_user |
|__Method__| POST|

#### Description
[templates/remove_for_user](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-templates-remove_for_user)

scope: `files.metadata.write`

Permanently removes the specified template created from `templates/add_for_user`. All properties associated with the template will also be removed. This action cannot be undone.

#### Request

```sh
curl -X 'POST' -d '{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/remove_for_user'
```




### templates/update_for_team {227735112027369000}

| | |
|--|--|
|__Name__| templates/update_for_team|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/update_for_team |
|__Method__| POST|

#### Description
[templates/update_for_team](https://www.dropbox.com/developers/documentation/http/teams#file_properties-templates-update_for_team)

scope: `files.team_metadata.write`

Update a template associated with a team. This route can update the template name, the template description and add optional properties to templates.

#### Request

```sh
curl -X 'POST' -d '{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
    "name": "New Security Template Name", 
    "description": "These properties will describe how confidential this file or folder is.", 
    "add_fields": [
        {
            "name": "Security Policy", 
            "description": "This is the security policy of the file or folder described.\nPolicies can be Confidential, Public or Internal.", 
            "type": "string"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/update_for_team'
```



#### Response Examples

##### Example 1: templates/update_for_team response

```json
Code: 200 OK
------------------------------------------
{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}
```


### templates/update_for_user {417338028627374000}

| | |
|--|--|
|__Name__| templates/update_for_user|
|__URL__| https://api.dropboxapi.com/2/file_properties/templates/update_for_user |
|__Method__| POST|

#### Description
[templates/update_for_user](https://www.dropbox.com/developers/documentation/http/documentation#file_properties-templates-update_for_user)

scope: `files.metadata.write`

Update a template associated with a user. This route can update the template name, the template description and add optional properties to templates. This endpoint can&#39;t be called on a team member or admin&#39;s behalf.

#### Request

```sh
curl -X 'POST' -d '{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
    "name": "New Security Template Name", 
    "description": "These properties will describe how confidential this file or folder is.", 
    "add_fields": [
        {
            "name": "Security Policy", 
            "description": "This is the security policy of the file or folder described.\nPolicies can be Confidential, Public or Internal.", 
            "type": "string"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_properties/templates/update_for_user'
```



#### Response Examples

##### Example 1: templates/update_for_user response

```json
Code: 200 OK
------------------------------------------
{
    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa"
}
```


## file_requests {282761913027376000}

### count {96795800427377000}

| | |
|--|--|
|__Name__| count|
|__URL__| https://api.dropboxapi.com/2/file_requests/count |
|__Method__| POST|

#### Description
[count](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-count)

scope: `file_requests.read`

Returns the total number of file requests owned by this user. Includes both open and closed file requests.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/file_requests/count'
```



#### Response Examples

##### Example 1: count response

```json
Code: 200 OK
------------------------------------------
{
    "file_request_count": 15
}
```


### create {64981231727378000}

| | |
|--|--|
|__Name__| create|
|__URL__| https://api.dropboxapi.com/2/file_requests/create |
|__Method__| POST|

#### Description
[create](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-create)

scope: `file_requests.write`

Creates a file request for this user.

#### Request

```sh
curl -X 'POST' -d '{
    "title": "Homework submission", 
    "destination": "/File Requests/Homework", 
    "deadline": {
        "deadline": "2020-10-12T17:00:00Z", 
        "allow_late_uploads": "seven_days"
    }, 
    "open": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_requests/create'
```



#### Response Examples

##### Example 1: create response

```json
Code: 200 OK
------------------------------------------
{
    "id": "oaCAVmEyrqYnkZX9955Y", 
    "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
    "title": "Homework submission", 
    "created": "2015-10-05T17:00:00Z", 
    "is_open": true, 
    "file_count": 3, 
    "destination": "/File Requests/Homework", 
    "deadline": {
        "deadline": "2020-10-12T17:00:00Z", 
        "allow_late_uploads": {
            ".tag": "seven_days"
        }
    }
}
```


### delete {174078471427380000}

| | |
|--|--|
|__Name__| delete|
|__URL__| https://api.dropboxapi.com/2/file_requests/delete |
|__Method__| POST|

#### Description
[delete](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-delete)

scope: `file_requests.write`

Delete a batch of closed file requests.

#### Request

```sh
curl -X 'POST' -d '{
    "ids": [
        "oaCAVmEyrqYnkZX9955Y", 
        "BaZmehYoXMPtaRmfTbSG"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_requests/delete'
```



#### Response Examples

##### Example 1: delete response

```json
Code: 200 OK
------------------------------------------
{
    "file_requests": [
        {
            "id": "oaCAVmEyrqYnkZX9955Y", 
            "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
            "title": "Homework submission", 
            "created": "2015-10-05T17:00:00Z", 
            "is_open": true, 
            "file_count": 3, 
            "destination": "/File Requests/Homework", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z", 
                "allow_late_uploads": {
                    ".tag": "seven_days"
                }
            }
        }, 
        {
            "id": "BAJ7IrRGicQKGToykQdB", 
            "url": "https://www.dropbox.com/request/BAJ7IrRGjcQKGToykQdB", 
            "title": "Photo contest submission", 
            "created": "2015-11-02T04:00:00Z", 
            "is_open": true, 
            "file_count": 105, 
            "destination": "/Photo contest entries", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z"
            }
        }, 
        {
            "id": "rxwMPvK3ATTa0VxOJu5T", 
            "url": "https://www.dropbox.com/request/rxwMPvK3ATTa0VxOJu5T", 
            "title": "Wedding photo submission", 
            "created": "2015-12-15T13:02:00Z", 
            "is_open": true, 
            "file_count": 37, 
            "destination": "/Wedding photos"
        }
    ]
}
```


### delete_all_closed {7178645127382000}

| | |
|--|--|
|__Name__| delete_all_closed|
|__URL__| https://api.dropboxapi.com/2/file_requests/delete_all_closed |
|__Method__| POST|

#### Description
[delete_all_closed](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-delete_all_closed)

scope: `file_requests.write`

Delete all closed file requests owned by this user.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/file_requests/delete_all_closed'
```



#### Response Examples

##### Example 1: delete_all_closed response

```json
Code: 200 OK
------------------------------------------
{
    "file_requests": [
        {
            "id": "oaCAVmEyrqYnkZX9955Y", 
            "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
            "title": "Homework submission", 
            "created": "2015-10-05T17:00:00Z", 
            "is_open": true, 
            "file_count": 3, 
            "destination": "/File Requests/Homework", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z", 
                "allow_late_uploads": {
                    ".tag": "seven_days"
                }
            }
        }, 
        {
            "id": "BAJ7IrRGicQKGToykQdB", 
            "url": "https://www.dropbox.com/request/BAJ7IrRGjcQKGToykQdB", 
            "title": "Photo contest submission", 
            "created": "2015-11-02T04:00:00Z", 
            "is_open": true, 
            "file_count": 105, 
            "destination": "/Photo contest entries", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z"
            }
        }, 
        {
            "id": "rxwMPvK3ATTa0VxOJu5T", 
            "url": "https://www.dropbox.com/request/rxwMPvK3ATTa0VxOJu5T", 
            "title": "Wedding photo submission", 
            "created": "2015-12-15T13:02:00Z", 
            "is_open": true, 
            "file_count": 37, 
            "destination": "/Wedding photos"
        }
    ]
}
```


### get {141011541527387000}

| | |
|--|--|
|__Name__| get|
|__URL__| https://api.dropboxapi.com/2/file_requests/get |
|__Method__| POST|

#### Description
[get](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-get)

scope: `file_requests.read`

Returns the specified file request.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "oaCAVmEyrqYnkZX9955Y"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_requests/get'
```



#### Response Examples

##### Example 1: get response

```json
Code: 200 OK
------------------------------------------
{
    "id": "oaCAVmEyrqYnkZX9955Y", 
    "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
    "title": "Homework submission", 
    "created": "2015-10-05T17:00:00Z", 
    "is_open": true, 
    "file_count": 3, 
    "destination": "/File Requests/Homework", 
    "deadline": {
        "deadline": "2020-10-12T17:00:00Z", 
        "allow_late_uploads": {
            ".tag": "seven_days"
        }
    }
}
```


### list {21779878527389000}

| | |
|--|--|
|__Name__| list|
|__URL__| https://api.dropboxapi.com/2/file_requests/list_v2 |
|__Method__| POST|

#### Description
[list](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-list)

scope: `file_requests.read`

Returns a list of file requests owned by this user. For apps with the app folder permission, this will only return file requests with destinations in the app folder.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 1000
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_requests/list_v2'
```



#### Response Examples

##### Example 1: list response

```json
Code: 200 OK
------------------------------------------
{
    "file_requests": [
        {
            "id": "oaCAVmEyrqYnkZX9955Y", 
            "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
            "title": "Homework submission", 
            "created": "2015-10-05T17:00:00Z", 
            "is_open": true, 
            "file_count": 3, 
            "destination": "/File Requests/Homework", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z", 
                "allow_late_uploads": {
                    ".tag": "seven_days"
                }
            }
        }, 
        {
            "id": "BAJ7IrRGicQKGToykQdB", 
            "url": "https://www.dropbox.com/request/BAJ7IrRGjcQKGToykQdB", 
            "title": "Photo contest submission", 
            "created": "2015-11-02T04:00:00Z", 
            "is_open": true, 
            "file_count": 105, 
            "destination": "/Photo contest entries", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z"
            }
        }, 
        {
            "id": "rxwMPvK3ATTa0VxOJu5T", 
            "url": "https://www.dropbox.com/request/rxwMPvK3ATTa0VxOJu5T", 
            "title": "Wedding photo submission", 
            "created": "2015-12-15T13:02:00Z", 
            "is_open": true, 
            "file_count": 37, 
            "destination": "/Wedding photos"
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": true
}
```


### list/continue {143333835527390000}

| | |
|--|--|
|__Name__| list/continue|
|__URL__| https://api.dropboxapi.com/2/file_requests/list/continue |
|__Method__| POST|

#### Description
[list/continue](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-list-continue)

scope: `file_requests.read`

Once a cursor has been retrieved from `list:2`, use this to paginate through all file requests. The cursor must come from a previous call to `list:2` or `list/continue`.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_requests/list/continue'
```



#### Response Examples

##### Example 1: list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "file_requests": [
        {
            "id": "oaCAVmEyrqYnkZX9955Y", 
            "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
            "title": "Homework submission", 
            "created": "2015-10-05T17:00:00Z", 
            "is_open": true, 
            "file_count": 3, 
            "destination": "/File Requests/Homework", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z", 
                "allow_late_uploads": {
                    ".tag": "seven_days"
                }
            }
        }, 
        {
            "id": "BAJ7IrRGicQKGToykQdB", 
            "url": "https://www.dropbox.com/request/BAJ7IrRGjcQKGToykQdB", 
            "title": "Photo contest submission", 
            "created": "2015-11-02T04:00:00Z", 
            "is_open": true, 
            "file_count": 105, 
            "destination": "/Photo contest entries", 
            "deadline": {
                "deadline": "2020-10-12T17:00:00Z"
            }
        }, 
        {
            "id": "rxwMPvK3ATTa0VxOJu5T", 
            "url": "https://www.dropbox.com/request/rxwMPvK3ATTa0VxOJu5T", 
            "title": "Wedding photo submission", 
            "created": "2015-12-15T13:02:00Z", 
            "is_open": true, 
            "file_count": 37, 
            "destination": "/Wedding photos"
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": true
}
```


### update {67210968427392000}

| | |
|--|--|
|__Name__| update|
|__URL__| https://api.dropboxapi.com/2/file_requests/update |
|__Method__| POST|

#### Description
[update](https://www.dropbox.com/developers/documentation/http/documentation#file_requests-update)

scope: `file_requests.write`

Update a file request.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "oaCAVmEyrqYnkZX9955Y", 
    "title": "Homework submission", 
    "destination": "/File Requests/Homework", 
    "deadline": {
        ".tag": "update", 
        "deadline": "2020-10-12T17:00:00Z", 
        "allow_late_uploads": "seven_days"
    }, 
    "open": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/file_requests/update'
```



#### Response Examples

##### Example 1: update response

```json
Code: 200 OK
------------------------------------------
{
    "id": "oaCAVmEyrqYnkZX9955Y", 
    "url": "https://www.dropbox.com/request/oaCAVmEyrqYnkZX9955Y", 
    "title": "Homework submission", 
    "created": "2015-10-05T17:00:00Z", 
    "is_open": true, 
    "file_count": 3, 
    "destination": "/File Requests/Homework", 
    "deadline": {
        "deadline": "2020-10-12T17:00:00Z", 
        "allow_late_uploads": {
            ".tag": "seven_days"
        }
    }
}
```


## files {105534273627393000}

### copy {384846496427394000}

| | |
|--|--|
|__Name__| copy|
|__URL__| https://api.dropboxapi.com/2/files/copy_v2 |
|__Method__| POST|

#### Description
[copy](https://www.dropbox.com/developers/documentation/http/documentation#files-copy)

scope: `files.content.write`

Copy a file or folder to a different location in the user&#39;s Dropbox.
If the source path is a folder all its contents will be copied.

#### Request

```sh
curl -X 'POST' -d '{
    "from_path": "/Homework/math", 
    "to_path": "/Homework/algebra", 
    "allow_shared_folder": false, 
    "autorename": false, 
    "allow_ownership_transfer": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/copy_v2'
```



#### Response Examples

##### Example 1: copy response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        ".tag": "file", 
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }
}
```


### copy_batch {192880890327401000}

| | |
|--|--|
|__Name__| copy_batch|
|__URL__| https://api.dropboxapi.com/2/files/copy_batch_v2 |
|__Method__| POST|

#### Description
[copy_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-copy_batch)

scope: `files.content.write`

Copy multiple files or folders to different locations at once in the user&#39;s Dropbox.
This route will replace `copy_batch:1`. The main difference is this route will return status for each entry, while `copy_batch:1` raises failure if any entry fails.
This route will either finish synchronously, or return a job ID and do the async copy job in background. Please use `copy_batch/check:2` to check the job status.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "from_path": "/Homework/math", 
            "to_path": "/Homework/algebra"
        }
    ], 
    "autorename": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/copy_batch_v2'
```



#### Response Examples

##### Example 1: copy_batch response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "success": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        }
    ]
}
```


### copy_batch/check {422957081627404000}

| | |
|--|--|
|__Name__| copy_batch/check|
|__URL__| https://api.dropboxapi.com/2/files/copy_batch/check_v2 |
|__Method__| POST|

#### Description
[copy_batch/check](https://www.dropbox.com/developers/documentation/http/documentation#files-copy_batch-check)

scope: `files.content.write`

Returns the status of an asynchronous job for `copy_batch:2`. It returns list of results for each entry.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/copy_batch/check_v2'
```



#### Response Examples

##### Example 1: copy_batch/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "success": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        }
    ]
}
```


### copy_reference/get {246159086127406000}

| | |
|--|--|
|__Name__| copy_reference/get|
|__URL__| https://api.dropboxapi.com/2/files/copy_reference/get |
|__Method__| POST|

#### Description
[copy_reference/get](https://www.dropbox.com/developers/documentation/http/documentation#files-copy_reference-get)

scope: `files.content.write`

Get a copy reference to a file or folder. This reference string can be used to save that file or folder to another user&#39;s Dropbox by passing it to `copy_reference/save`.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/video.mp4"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/copy_reference/get'
```



#### Response Examples

##### Example 1: copy_reference/get response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        ".tag": "file", 
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }, 
    "copy_reference": "z1X6ATl6aWtzOGq0c3g5Ng", 
    "expires": "2045-05-12T15:50:38Z"
}
```


### copy_reference/save {342931235027409000}

| | |
|--|--|
|__Name__| copy_reference/save|
|__URL__| https://api.dropboxapi.com/2/files/copy_reference/save |
|__Method__| POST|

#### Description
[copy_reference/save](https://www.dropbox.com/developers/documentation/http/documentation#files-copy_reference-save)

scope: `files.content.write`

Save a copy reference returned by `copy_reference/get` to the user&#39;s Dropbox.

#### Request

```sh
curl -X 'POST' -d '{
    "copy_reference": "z1X6ATl6aWtzOGq0c3g5Ng", 
    "path": "/video.mp4"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/copy_reference/save'
```



#### Response Examples

##### Example 1: copy_reference/save response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        ".tag": "file", 
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }
}
```


### create_folder {406156722227411000}

| | |
|--|--|
|__Name__| create_folder|
|__URL__| https://api.dropboxapi.com/2/files/create_folder_v2 |
|__Method__| POST|

#### Description
[create_folder](https://www.dropbox.com/developers/documentation/http/documentation#files-create_folder)

scope: `files.content.write`

Create a folder at a given path.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/Homework/math", 
    "autorename": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/create_folder_v2'
```



#### Response Examples

##### Example 1: create_folder response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        "name": "math", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
        "path_lower": "/homework/math", 
        "path_display": "/Homework/math", 
        "sharing_info": {
            "read_only": false, 
            "parent_shared_folder_id": "84528192421", 
            "traverse_only": false, 
            "no_access": false
        }, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ]
    }
}
```


### create_folder_batch {45762822127412000}

| | |
|--|--|
|__Name__| create_folder_batch|
|__URL__| https://api.dropboxapi.com/2/files/create_folder_batch |
|__Method__| POST|

#### Description
[create_folder_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-create_folder_batch)

scope: `files.content.write`

Create multiple folders at once.
This route is asynchronous for large batches, which returns a job ID immediately and runs the create folder batch asynchronously. Otherwise, creates the folders and returns the result synchronously for smaller inputs. You can force asynchronous behaviour by using the `CreateFolderBatchArg.force_async` flag.  Use `create_folder_batch/check` to check the job status.

#### Request

```sh
curl -X 'POST' -d '{
    "paths": [
        "/Homework/math"
    ], 
    "autorename": false, 
    "force_async": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/create_folder_batch'
```



#### Response Examples

##### Example 1: create_folder_batch response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                "name": "math", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
                "path_lower": "/homework/math", 
                "path_display": "/Homework/math", 
                "sharing_info": {
                    "read_only": false, 
                    "parent_shared_folder_id": "84528192421", 
                    "traverse_only": false, 
                    "no_access": false
                }, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ]
            }
        }
    ]
}
```


### create_folder_batch/check {211559637427415000}

| | |
|--|--|
|__Name__| create_folder_batch/check|
|__URL__| https://api.dropboxapi.com/2/files/create_folder_batch/check |
|__Method__| POST|

#### Description
[create_folder_batch/check](https://www.dropbox.com/developers/documentation/http/documentation#files-create_folder_batch-check)

scope: `files.content.write`

Returns the status of an asynchronous job for `create_folder_batch`. If success, it returns list of result for each entry.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/create_folder_batch/check'
```



#### Response Examples

##### Example 1: create_folder_batch/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                "name": "math", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
                "path_lower": "/homework/math", 
                "path_display": "/Homework/math", 
                "sharing_info": {
                    "read_only": false, 
                    "parent_shared_folder_id": "84528192421", 
                    "traverse_only": false, 
                    "no_access": false
                }, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ]
            }
        }
    ]
}
```


### delete {174078471427416000}

| | |
|--|--|
|__Name__| delete|
|__URL__| https://api.dropboxapi.com/2/files/delete_v2 |
|__Method__| POST|

#### Description
[delete](https://www.dropbox.com/developers/documentation/http/documentation#files-delete)

scope: `files.content.write`

Delete the file or folder at a given path.
If the path is a folder, all its contents will be deleted too.
A successful response indicates that the file or folder was deleted. The returned metadata will be the corresponding `FileMetadata` or `FolderMetadata` for the item at time of deletion, and not a `DeletedMetadata` object.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/Homework/math/Prime_Numbers.txt"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/delete_v2'
```



#### Response Examples

##### Example 1: delete response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        ".tag": "file", 
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }
}
```


### delete_batch {276093356927423000}

| | |
|--|--|
|__Name__| delete_batch|
|__URL__| https://api.dropboxapi.com/2/files/delete_batch |
|__Method__| POST|

#### Description
[delete_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-delete_batch)

scope: `files.content.write`

Delete multiple files/folders at once.
This route is asynchronous, which returns a job ID immediately and runs the delete batch asynchronously. Use `delete_batch/check` to check the job status.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "path": "/Homework/math/Prime_Numbers.txt"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/delete_batch'
```



#### Response Examples

##### Example 1: delete_batch response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        }
    ]
}
```


### delete_batch/check {114952751427425000}

| | |
|--|--|
|__Name__| delete_batch/check|
|__URL__| https://api.dropboxapi.com/2/files/delete_batch/check |
|__Method__| POST|

#### Description
[delete_batch/check](https://www.dropbox.com/developers/documentation/http/documentation#files-delete_batch-check)

scope: `files.content.write`

Returns the status of an asynchronous job for `delete_batch`. If success, it returns list of result for each entry.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/delete_batch/check'
```



#### Response Examples

##### Example 1: delete_batch/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        }
    ]
}
```


### download {82265394527426000}

| | |
|--|--|
|__Name__| download|
|__URL__| https://content.dropboxapi.com/2/files/download |
|__Method__| POST|

#### Description
[download](https://www.dropbox.com/developers/documentation/http/documentation#files-download)

scope: `files.content.read`

Download a file from a user&#39;s Dropbox.

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "path": "/Homework/math/Prime_Numbers.txt"
}' 'https://content.dropboxapi.com/2/files/download'
```



#### Response Examples

##### Example 1: download response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### download_zip {203797408927428000}

| | |
|--|--|
|__Name__| download_zip|
|__URL__| https://content.dropboxapi.com/2/files/download_zip |
|__Method__| POST|

#### Description
[download_zip](https://www.dropbox.com/developers/documentation/http/documentation#files-download_zip)

scope: `files.content.read`

Download a folder from the user&#39;s Dropbox, as a zip file. The folder must be less than 20 GB in size and have fewer than 10,000 total files. The input cannot be a single file. Any single file must be less than 4GB in size.

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "path": "/Homework/math"
}' 'https://content.dropboxapi.com/2/files/download_zip'
```



#### Response Examples

##### Example 1: download_zip response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        "name": "math", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
        "path_lower": "/homework/math", 
        "path_display": "/Homework/math", 
        "sharing_info": {
            "read_only": false, 
            "parent_shared_folder_id": "84528192421", 
            "traverse_only": false, 
            "no_access": false
        }, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ]
    }
}
```


### export {421160875527431000}

| | |
|--|--|
|__Name__| export|
|__URL__| https://content.dropboxapi.com/2/files/export |
|__Method__| POST|

#### Description
[export](https://www.dropbox.com/developers/documentation/http/documentation#files-export)

scope: `files.content.read`

Export a file from a user&#39;s Dropbox. This route only supports exporting files that cannot be downloaded directly  and whose `ExportResult.file_metadata` has `ExportInfo.export_as` populated.

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "path": "/Homework/math/Prime_Numbers.gsheet"
}' 'https://content.dropboxapi.com/2/files/export'
```



#### Response Examples

##### Example 1: export response

```json
Code: 200 OK
------------------------------------------
{
    "export_metadata": {
        "name": "Prime_Numbers.xlsx", 
        "size": 7189, 
        "export_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    }, 
    "file_metadata": {
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }
}
```


### get_file_lock_batch {100995265527433000}

| | |
|--|--|
|__Name__| get_file_lock_batch|
|__URL__| https://api.dropboxapi.com/2/files/get_file_lock_batch |
|__Method__| POST|

#### Description
[get_file_lock_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-get_file_lock_batch)

scope: `files.content.read`

Return the lock metadata for the given list of paths.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "path": "/John Doe/sample/test.pdf"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/get_file_lock_batch'
```



#### Response Examples

##### Example 1: get_file_lock_batch response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }, 
            "lock": {
                "content": {
                    ".tag": "single_user", 
                    "created": "2015-05-12T15:50:38Z", 
                    "lock_holder_account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "lock_holder_team_id": "dbtid:1234abcd"
                }
            }
        }
    ]
}
```


### get_metadata {153370654127435000}

| | |
|--|--|
|__Name__| get_metadata|
|__URL__| https://api.dropboxapi.com/2/files/get_metadata |
|__Method__| POST|

#### Description
[get_metadata](https://www.dropbox.com/developers/documentation/http/documentation#files-get_metadata)

scope: `files.metadata.read`

Returns the metadata for a file or folder.
Note: Metadata for the root folder is unsupported.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/Homework/math", 
    "include_media_info": false, 
    "include_deleted": false, 
    "include_has_explicit_shared_members": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/get_metadata'
```



#### Response Examples

##### Example 1: get_metadata response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "file", 
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### get_preview {237537660427444000}

| | |
|--|--|
|__Name__| get_preview|
|__URL__| https://content.dropboxapi.com/2/files/get_preview |
|__Method__| POST|

#### Description
[get_preview](https://www.dropbox.com/developers/documentation/http/documentation#files-get_preview)

scope: `files.content.read`

Get a preview for a file.
Currently, PDF previews are generated for files with the following extensions: .ai, .doc, .docm, .docx, .eps, .gdoc, .gslides, .odp, .odt, .pps, .ppsm, .ppsx, .ppt, .pptm, .pptx, .rtf.
HTML previews are generated for files with the following extensions: .csv, .ods, .xls, .xlsm, .gsheet, .xlsx.
Other formats will return an unsupported extension error.

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "path": "/word.docx"
}' 'https://content.dropboxapi.com/2/files/get_preview'
```



#### Response Examples

##### Example 1: get_preview response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### get_temporary_link {368003710427446000}

| | |
|--|--|
|__Name__| get_temporary_link|
|__URL__| https://api.dropboxapi.com/2/files/get_temporary_link |
|__Method__| POST|

#### Description
[get_temporary_link](https://www.dropbox.com/developers/documentation/http/documentation#files-get_temporary_link)

scope: `files.content.read`

Get a temporary link to stream content of a file. This link will expire in four hours and afterwards you will get 410 Gone. This URL should not be used to display content directly in the browser. The Content-Type of the link is determined automatically by the file&#39;s mime type.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/video.mp4"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/get_temporary_link'
```



#### Response Examples

##### Example 1: get_temporary_link response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }, 
    "link": "https://dl.dropboxusercontent.com/apitl/1/YXNkZmFzZGcyMzQyMzI0NjU2NDU2NDU2"
}
```


### get_temporary_upload_link {344567571427448000}

| | |
|--|--|
|__Name__| get_temporary_upload_link|
|__URL__| https://api.dropboxapi.com/2/files/get_temporary_upload_link |
|__Method__| POST|

#### Description
[get_temporary_upload_link](https://www.dropbox.com/developers/documentation/http/documentation#files-get_temporary_upload_link)

scope: `files.content.write`

Get a one-time use temporary upload link to upload a file to a Dropbox location.

This endpoint acts as a delayed `upload`. The returned temporary upload link may be used to make a POST request with the data to be uploaded. The upload will then be perfomed with the `CommitInfo` previously provided to `get_temporary_upload_link` but evaluated only upon consumption. Hence, errors stemming from invalid `CommitInfo` with respect to the state of the user&#39;s Dropbox will only be communicated at consumption time. Additionally, these errors are surfaced as generic HTTP 409 Conflict responses, potentially hiding issue details. The maximum temporary upload link duration is 4 hours. Upon consumption or expiration, a new link will have to be generated. Multiple links may exist for a specific upload path at any given time.

The POST request on the temporary upload link must have its Content-Type set to &quot;application/octet-stream&quot;.

Example temporary upload link consumption request:

curl -X POST https://content.dropboxapi.com/apitul/1/bNi2uIYF51cVBND
--header &quot;Content-Type: application/octet-stream&quot;
--data-binary @local_file.txt

A successful temporary upload link consumption request returns the content hash of the uploaded data in JSON format.

Example succesful temporary upload link consumption response:
{&quot;content-hash&quot;: &quot;599d71033d700ac892a0e48fa61b125d2f5994&quot;}

An unsuccessful temporary upload link consumption request returns any of the following status codes:

HTTP 400 Bad Request: Content-Type is not one of application/octet-stream and text/plain or request is invalid.
HTTP 409 Conflict: The temporary upload link does not exist or is currently unavailable, the upload failed, or another error happened.
HTTP 410 Gone: The temporary upload link is expired or consumed.

Example unsuccessful temporary upload link consumption response:
Temporary upload link has been recently consumed.

#### Request

```sh
curl -X 'POST' -d '{
    "commit_info": {
        "path": "/Homework/math/Matrices.txt", 
        "mode": "add", 
        "autorename": true, 
        "mute": false, 
        "strict_conflict": false
    }, 
    "duration": 3600
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/get_temporary_upload_link'
```



#### Response Examples

##### Example 1: get_temporary_upload_link response

```json
Code: 200 OK
------------------------------------------
{
    "link": "https://content.dropboxapi.com/apitul/1/bNi2uIYF51cVBND"
}
```


### get_thumbnail {275829390827455000}

| | |
|--|--|
|__Name__| get_thumbnail|
|__URL__| https://content.dropboxapi.com/2/files/get_thumbnail_v2 |
|__Method__| POST|

#### Description
[get_thumbnail](https://www.dropbox.com/developers/documentation/http/documentation#files-get_thumbnail)

scope: `files.content.read`

Get a thumbnail for a file.

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "resource": {
        ".tag": "path", 
        "path": "/a.docx"
    }, 
    "format": "jpeg", 
    "size": "w64h64", 
    "mode": "strict"
}' 'https://content.dropboxapi.com/2/files/get_thumbnail_v2'
```



#### Response Examples

##### Example 1: get_thumbnail response

```json
Code: 200 OK
------------------------------------------
{
    "file_metadata": {
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }
}
```


### get_thumbnail_batch {131462242327457000}

| | |
|--|--|
|__Name__| get_thumbnail_batch|
|__URL__| https://content.dropboxapi.com/2/files/get_thumbnail_batch |
|__Method__| POST|

#### Description
[get_thumbnail_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-get_thumbnail_batch)

scope: `files.content.read`

Get thumbnails for a list of images. We allow up to 25 thumbnails in a single batch.
This method currently supports files with the following file extensions: jpg, jpeg, png, tiff, tif, gif and bmp. Photos that are larger than 20MB in size won&#39;t be converted to a thumbnail.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "path": "/image.jpg", 
            "format": "jpeg", 
            "size": "w64h64", 
            "mode": "strict"
        }
    ]
}' -H 'Content-Type: application/json' 'https://content.dropboxapi.com/2/files/get_thumbnail_batch'
```



#### Response Examples

##### Example 1: get_thumbnail_batch response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }, 
            "thumbnail": "iVBORw0KGgoAAAANSUhEUgAAAdcAAABrCAMAAAI="
        }
    ]
}
```


### list_folder {206361238627460000}

| | |
|--|--|
|__Name__| list_folder|
|__URL__| https://api.dropboxapi.com/2/files/list_folder |
|__Method__| POST|

#### Description
[list_folder](https://www.dropbox.com/developers/documentation/http/documentation#files-list_folder)

scope: `files.metadata.read`

Starts returning the contents of a folder. If the result&#39;s `ListFolderResult.has_more` field is `true`, call `list_folder/continue` with the returned `ListFolderResult.cursor` to retrieve more entries.
If you&#39;re using `ListFolderArg.recursive` set to `true` to keep a local cache of the contents of a Dropbox account, iterate through each entry in order and process them as follows to keep your local state in sync:
For each `FileMetadata`, store the new entry at the given path in your local state. If the required parent folders don&#39;t exist yet, create them. If there&#39;s already something else at the given path, replace it and remove all its children.
For each `FolderMetadata`, store the new entry at the given path in your local state. If the required parent folders don&#39;t exist yet, create them. If there&#39;s already something else at the given path, replace it but leave the children as they are. Check the new entry&#39;s `FolderSharingInfo.read_only` and set all its children&#39;s read-only statuses to match.
For each `DeletedMetadata`, if your local state has something at the given path, remove it and all its children. If there&#39;s nothing at the given path, ignore this entry.
Note: `auth.RateLimitError` may be returned if multiple `list_folder` or `list_folder/continue` calls with same parameters are made simultaneously by same API app for same user. If your app implements retry logic, please hold off the retry until the previous request finishes.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/Homework/math", 
    "recursive": false, 
    "include_media_info": false, 
    "include_deleted": false, 
    "include_has_explicit_shared_members": false, 
    "include_mounted_folders": true, 
    "include_non_downloadable_files": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/list_folder'
```



#### Response Examples

##### Example 1: list_folder response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            ".tag": "file", 
            "name": "Prime_Numbers.txt", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "client_modified": "2015-05-12T15:50:38Z", 
            "server_modified": "2015-05-12T15:50:38Z", 
            "rev": "a1c10ce0dd78", 
            "size": 7212, 
            "path_lower": "/homework/math/prime_numbers.txt", 
            "path_display": "/Homework/math/Prime_Numbers.txt", 
            "sharing_info": {
                "read_only": true, 
                "parent_shared_folder_id": "84528192421", 
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            }, 
            "is_downloadable": true, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ], 
            "has_explicit_shared_members": false, 
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
            "file_lock_info": {
                "is_lockholder": true, 
                "lockholder_name": "Imaginary User", 
                "created": "2015-05-12T15:50:38Z"
            }
        }, 
        {
            ".tag": "folder", 
            "name": "math", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
            "path_lower": "/homework/math", 
            "path_display": "/Homework/math", 
            "sharing_info": {
                "read_only": false, 
                "parent_shared_folder_id": "84528192421", 
                "traverse_only": false, 
                "no_access": false
            }, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ]
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### list_folder/continue {256261275027466000}

| | |
|--|--|
|__Name__| list_folder/continue|
|__URL__| https://api.dropboxapi.com/2/files/list_folder/continue |
|__Method__| POST|

#### Description
[list_folder/continue](https://www.dropbox.com/developers/documentation/http/documentation#files-list_folder-continue)

scope: `files.metadata.read`

Once a cursor has been retrieved from `list_folder`, use this to paginate through all files and retrieve updates to the folder, following the same rules as documented for `list_folder`.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/list_folder/continue'
```



#### Response Examples

##### Example 1: list_folder/continue response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            ".tag": "file", 
            "name": "Prime_Numbers.txt", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "client_modified": "2015-05-12T15:50:38Z", 
            "server_modified": "2015-05-12T15:50:38Z", 
            "rev": "a1c10ce0dd78", 
            "size": 7212, 
            "path_lower": "/homework/math/prime_numbers.txt", 
            "path_display": "/Homework/math/Prime_Numbers.txt", 
            "sharing_info": {
                "read_only": true, 
                "parent_shared_folder_id": "84528192421", 
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            }, 
            "is_downloadable": true, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ], 
            "has_explicit_shared_members": false, 
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
            "file_lock_info": {
                "is_lockholder": true, 
                "lockholder_name": "Imaginary User", 
                "created": "2015-05-12T15:50:38Z"
            }
        }, 
        {
            ".tag": "folder", 
            "name": "math", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXz", 
            "path_lower": "/homework/math", 
            "path_display": "/Homework/math", 
            "sharing_info": {
                "read_only": false, 
                "parent_shared_folder_id": "84528192421", 
                "traverse_only": false, 
                "no_access": false
            }, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ]
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### list_folder/get_latest_cursor {376814485627468000}

| | |
|--|--|
|__Name__| list_folder/get_latest_cursor|
|__URL__| https://api.dropboxapi.com/2/files/list_folder/get_latest_cursor |
|__Method__| POST|

#### Description
[list_folder/get_latest_cursor](https://www.dropbox.com/developers/documentation/http/documentation#files-list_folder-get_latest_cursor)

scope: `files.metadata.read`

A way to quickly get a cursor for the folder&#39;s state. Unlike `list_folder`, `list_folder/get_latest_cursor` doesn&#39;t return any entries. This endpoint is for app which only needs to know about new files and modifications and doesn&#39;t need to know about files that already exist in Dropbox.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/Homework/math", 
    "recursive": false, 
    "include_media_info": false, 
    "include_deleted": false, 
    "include_has_explicit_shared_members": false, 
    "include_mounted_folders": true, 
    "include_non_downloadable_files": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/list_folder/get_latest_cursor'
```



#### Response Examples

##### Example 1: list_folder/get_latest_cursor response

```json
Code: 200 OK
------------------------------------------
{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### list_folder/longpoll {328680478027471000}

| | |
|--|--|
|__Name__| list_folder/longpoll|
|__URL__| https://notify.dropboxapi.com/2/files/list_folder/longpoll |
|__Method__| POST|

#### Description
[list_folder/longpoll](https://www.dropbox.com/developers/documentation/http/documentation#files-list_folder-longpoll)

scope: `files.metadata.read`

A longpoll endpoint to wait for changes on an account. In conjunction with `list_folder/continue`, this call gives you a low-latency way to monitor an account for file changes. The connection will block until there are changes available or a timeout occurs. This endpoint is useful mostly for client-side apps. If you&#39;re looking for server-side notifications, check out our [webhooks documentation](https://www.dropbox.com/developers/reference/webhooks).

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "timeout": 30
}' -H 'Content-Type: application/json' 'https://notify.dropboxapi.com/2/files/list_folder/longpoll'
```



#### Response Examples

##### Example 1: list_folder/longpoll response

```json
Code: 200 OK
------------------------------------------
{
    "changes": true
}
```


### list_revisions {399260544027474000}

| | |
|--|--|
|__Name__| list_revisions|
|__URL__| https://api.dropboxapi.com/2/files/list_revisions |
|__Method__| POST|

#### Description
[list_revisions](https://www.dropbox.com/developers/documentation/http/documentation#files-list_revisions)

scope: `files.metadata.read`

Returns revisions for files based on a file path or a file id. The file path or file id is identified from the latest file entry at the given file path or id. This end point allows your app to query either by file path or file id by setting the mode parameter appropriately.
In the `ListRevisionsMode.path` (default) mode, all revisions at the same file path as the latest file entry are returned. If revisions with the same file id are desired, then mode must be set to `ListRevisionsMode.id`. The `ListRevisionsMode.id` mode is useful to retrieve revisions for a given file across moves or renames.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/root/word.docx", 
    "mode": "path", 
    "limit": 10
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/list_revisions'
```



#### Response Examples

##### Example 1: list_revisions response

```json
Code: 200 OK
------------------------------------------
{
    "is_deleted": false, 
    "entries": [
        {
            "name": "Prime_Numbers.txt", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "client_modified": "2015-05-12T15:50:38Z", 
            "server_modified": "2015-05-12T15:50:38Z", 
            "rev": "a1c10ce0dd78", 
            "size": 7212, 
            "path_lower": "/homework/math/prime_numbers.txt", 
            "path_display": "/Homework/math/Prime_Numbers.txt", 
            "sharing_info": {
                "read_only": true, 
                "parent_shared_folder_id": "84528192421", 
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            }, 
            "is_downloadable": true, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ], 
            "has_explicit_shared_members": false, 
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
            "file_lock_info": {
                "is_lockholder": true, 
                "lockholder_name": "Imaginary User", 
                "created": "2015-05-12T15:50:38Z"
            }
        }
    ]
}
```


### lock_file_batch {204680649427485000}

| | |
|--|--|
|__Name__| lock_file_batch|
|__URL__| https://api.dropboxapi.com/2/files/lock_file_batch |
|__Method__| POST|

#### Description
[lock_file_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-lock_file_batch)

scope: `files.content.write`

Lock the files at the given paths. A locked file will be writable only by the lock holder. A successful response indicates that the file has been locked. Returns a list of the locked file paths and their metadata after this operation.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "path": "/John Doe/sample/test.pdf"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/lock_file_batch'
```



#### Response Examples

##### Example 1: lock_file_batch response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }, 
            "lock": {
                "content": {
                    ".tag": "single_user", 
                    "created": "2015-05-12T15:50:38Z", 
                    "lock_holder_account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "lock_holder_team_id": "dbtid:1234abcd"
                }
            }
        }
    ]
}
```


### move {40756840427487000}

| | |
|--|--|
|__Name__| move|
|__URL__| https://api.dropboxapi.com/2/files/move_v2 |
|__Method__| POST|

#### Description
[move](https://www.dropbox.com/developers/documentation/http/documentation#files-move)

scope: `files.content.write`

Move a file or folder to a different location in the user&#39;s Dropbox.
If the source path is a folder all its contents will be moved.
Note that we do not currently support case-only renaming.

#### Request

```sh
curl -X 'POST' -d '{
    "from_path": "/Homework/math", 
    "to_path": "/Homework/algebra", 
    "allow_shared_folder": false, 
    "autorename": false, 
    "allow_ownership_transfer": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/move_v2'
```



#### Response Examples

##### Example 1: move response

```json
Code: 200 OK
------------------------------------------
{
    "metadata": {
        ".tag": "file", 
        "name": "Prime_Numbers.txt", 
        "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
        "client_modified": "2015-05-12T15:50:38Z", 
        "server_modified": "2015-05-12T15:50:38Z", 
        "rev": "a1c10ce0dd78", 
        "size": 7212, 
        "path_lower": "/homework/math/prime_numbers.txt", 
        "path_display": "/Homework/math/Prime_Numbers.txt", 
        "sharing_info": {
            "read_only": true, 
            "parent_shared_folder_id": "84528192421", 
            "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        }, 
        "is_downloadable": true, 
        "property_groups": [
            {
                "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                "fields": [
                    {
                        "name": "Security Policy", 
                        "value": "Confidential"
                    }
                ]
            }
        ], 
        "has_explicit_shared_members": false, 
        "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
        "file_lock_info": {
            "is_lockholder": true, 
            "lockholder_name": "Imaginary User", 
            "created": "2015-05-12T15:50:38Z"
        }
    }
}
```


### move_batch {315333794327489000}

| | |
|--|--|
|__Name__| move_batch|
|__URL__| https://api.dropboxapi.com/2/files/move_batch_v2 |
|__Method__| POST|

#### Description
[move_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-move_batch)

scope: `files.content.write`

Move multiple files or folders to different locations at once in the user&#39;s Dropbox. Note that we do not currently support case-only renaming.
This route will replace `move_batch:1`. The main difference is this route will return status for each entry, while `move_batch:1` raises failure if any entry fails.
This route will either finish synchronously, or return a job ID and do the async move job in background. Please use `move_batch/check:2` to check the job status.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "from_path": "/Homework/math", 
            "to_path": "/Homework/algebra"
        }
    ], 
    "autorename": false, 
    "allow_ownership_transfer": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/move_batch_v2'
```



#### Response Examples

##### Example 1: move_batch response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "success": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        }
    ]
}
```


### move_batch/check {188522830427492000}

| | |
|--|--|
|__Name__| move_batch/check|
|__URL__| https://api.dropboxapi.com/2/files/move_batch/check_v2 |
|__Method__| POST|

#### Description
[move_batch/check](https://www.dropbox.com/developers/documentation/http/documentation#files-move_batch-check)

scope: `files.content.write`

Returns the status of an asynchronous job for `move_batch:2`. It returns list of results for each entry.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/move_batch/check_v2'
```



#### Response Examples

##### Example 1: move_batch/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "success": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }
        }
    ]
}
```


### permanently_delete {42713144827494000}

| | |
|--|--|
|__Name__| permanently_delete|
|__URL__| https://api.dropboxapi.com/2/files/permanently_delete |
|__Method__| POST|

#### Description
[permanently_delete](https://www.dropbox.com/developers/documentation/http/documentation#files-permanently_delete)

scope: `files.permanent_delete`

Permanently delete the file or folder at a given path (see https://www.dropbox.com/en/help/40).
Note: This endpoint is only available for Dropbox Business apps.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/Homework/math/Prime_Numbers.txt"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/permanently_delete'
```




### restore {370485857727495000}

| | |
|--|--|
|__Name__| restore|
|__URL__| https://api.dropboxapi.com/2/files/restore |
|__Method__| POST|

#### Description
[restore](https://www.dropbox.com/developers/documentation/http/documentation#files-restore)

scope: `files.content.write`

Restore a specific revision of a file to the given path.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/root/word.docx", 
    "rev": "a1c10ce0dd78"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/restore'
```



#### Response Examples

##### Example 1: restore response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### save_url {48196907027497000}

| | |
|--|--|
|__Name__| save_url|
|__URL__| https://api.dropboxapi.com/2/files/save_url |
|__Method__| POST|

#### Description
[save_url](https://www.dropbox.com/developers/documentation/http/documentation#files-save_url)

scope: `files.content.write`

Save the data from a specified URL into a file in user&#39;s Dropbox.
Note that the transfer from the URL must complete within 5 minutes, or the operation will time out and the job will fail.
If the given path already exists, the file will be renamed to avoid the conflict (e.g. myfile (1).txt).

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/a.txt", 
    "url": "http://example.com/a.txt"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/save_url'
```



#### Response Examples

##### Example 1: save_url response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### save_url/check_job_status {116850571627500000}

| | |
|--|--|
|__Name__| save_url/check_job_status|
|__URL__| https://api.dropboxapi.com/2/files/save_url/check_job_status |
|__Method__| POST|

#### Description
[save_url/check_job_status](https://www.dropbox.com/developers/documentation/http/documentation#files-save_url-check_job_status)

scope: `files.content.write`

Check the status of a `save_url` job.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/save_url/check_job_status'
```



#### Response Examples

##### Example 1: save_url/check_job_status response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "in_progress"
}
```


### search {215083639327501000}

| | |
|--|--|
|__Name__| search|
|__URL__| https://api.dropboxapi.com/2/files/search_v2 |
|__Method__| POST|

#### Description
[search](https://www.dropbox.com/developers/documentation/http/documentation#files-search)

scope: `files.metadata.read`

Searches for files and folders.
Note: `search:2` along with `search/continue:2` can only be used to retrieve a maximum of 10,000 matches.
Recent changes may not immediately be reflected in search results due to a short delay in indexing. Duplicate results may be returned across pages. Some results may not be returned.

#### Request

```sh
curl -X 'POST' -d '{
    "query": "cat", 
    "include_highlights": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/search_v2'
```



#### Response Examples

##### Example 1: search response

```json
Code: 200 OK
------------------------------------------
{
    "matches": [
        {
            "metadata": {
                ".tag": "metadata", 
                "metadata": {
                    ".tag": "file", 
                    "name": "Prime_Numbers.txt", 
                    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                    "client_modified": "2015-05-12T15:50:38Z", 
                    "server_modified": "2015-05-12T15:50:38Z", 
                    "rev": "a1c10ce0dd78", 
                    "size": 7212, 
                    "path_lower": "/homework/math/prime_numbers.txt", 
                    "path_display": "/Homework/math/Prime_Numbers.txt", 
                    "sharing_info": {
                        "read_only": true, 
                        "parent_shared_folder_id": "84528192421", 
                        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                    }, 
                    "is_downloadable": true, 
                    "property_groups": [
                        {
                            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                            "fields": [
                                {
                                    "name": "Security Policy", 
                                    "value": "Confidential"
                                }
                            ]
                        }
                    ], 
                    "has_explicit_shared_members": false, 
                    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                    "file_lock_info": {
                        "is_lockholder": true, 
                        "lockholder_name": "Imaginary User", 
                        "created": "2015-05-12T15:50:38Z"
                    }
                }
            }
        }
    ], 
    "has_more": false
}
```


### search/continue {225955548327503000}

| | |
|--|--|
|__Name__| search/continue|
|__URL__| https://api.dropboxapi.com/2/files/search/continue_v2 |
|__Method__| POST|

#### Description
[search/continue](https://www.dropbox.com/developers/documentation/http/documentation#files-search-continue)

scope: `files.metadata.read`

Fetches the next page of search results returned from `search:2`.
Note: `search:2` along with `search/continue:2` can only be used to retrieve a maximum of 10,000 matches.
Recent changes may not immediately be reflected in search results due to a short delay in indexing. Duplicate results may be returned across pages. Some results may not be returned.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/search/continue_v2'
```



#### Response Examples

##### Example 1: search/continue response

```json
Code: 200 OK
------------------------------------------
{
    "matches": [
        {
            "metadata": {
                ".tag": "metadata", 
                "metadata": {
                    ".tag": "file", 
                    "name": "Prime_Numbers.txt", 
                    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                    "client_modified": "2015-05-12T15:50:38Z", 
                    "server_modified": "2015-05-12T15:50:38Z", 
                    "rev": "a1c10ce0dd78", 
                    "size": 7212, 
                    "path_lower": "/homework/math/prime_numbers.txt", 
                    "path_display": "/Homework/math/Prime_Numbers.txt", 
                    "sharing_info": {
                        "read_only": true, 
                        "parent_shared_folder_id": "84528192421", 
                        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                    }, 
                    "is_downloadable": true, 
                    "property_groups": [
                        {
                            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                            "fields": [
                                {
                                    "name": "Security Policy", 
                                    "value": "Confidential"
                                }
                            ]
                        }
                    ], 
                    "has_explicit_shared_members": false, 
                    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                    "file_lock_info": {
                        "is_lockholder": true, 
                        "lockholder_name": "Imaginary User", 
                        "created": "2015-05-12T15:50:38Z"
                    }
                }
            }
        }
    ], 
    "has_more": false
}
```


### unlock_file_batch {399923746727504000}

| | |
|--|--|
|__Name__| unlock_file_batch|
|__URL__| https://api.dropboxapi.com/2/files/unlock_file_batch |
|__Method__| POST|

#### Description
[unlock_file_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-unlock_file_batch)

scope: `files.content.write`

Unlock the files at the given paths. A locked file can only be unlocked by the lock holder or, if a business account, a team admin. A successful response indicates that the file has been unlocked. Returns a list of the unlocked file paths and their metadata after this operation.

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "path": "/John Doe/sample/test.pdf"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/unlock_file_batch'
```



#### Response Examples

##### Example 1: unlock_file_batch response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            ".tag": "success", 
            "metadata": {
                ".tag": "file", 
                "name": "Prime_Numbers.txt", 
                "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                "client_modified": "2015-05-12T15:50:38Z", 
                "server_modified": "2015-05-12T15:50:38Z", 
                "rev": "a1c10ce0dd78", 
                "size": 7212, 
                "path_lower": "/homework/math/prime_numbers.txt", 
                "path_display": "/Homework/math/Prime_Numbers.txt", 
                "sharing_info": {
                    "read_only": true, 
                    "parent_shared_folder_id": "84528192421", 
                    "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                }, 
                "is_downloadable": true, 
                "property_groups": [
                    {
                        "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                        "fields": [
                            {
                                "name": "Security Policy", 
                                "value": "Confidential"
                            }
                        ]
                    }
                ], 
                "has_explicit_shared_members": false, 
                "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
                "file_lock_info": {
                    "is_lockholder": true, 
                    "lockholder_name": "Imaginary User", 
                    "created": "2015-05-12T15:50:38Z"
                }
            }, 
            "lock": {
                "content": {
                    ".tag": "single_user", 
                    "created": "2015-05-12T15:50:38Z", 
                    "lock_holder_account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "lock_holder_team_id": "dbtid:1234abcd"
                }
            }
        }
    ]
}
```


### upload {101266364427517000}

| | |
|--|--|
|__Name__| upload|
|__URL__| https://content.dropboxapi.com/2/files/upload |
|__Method__| POST|

#### Description
[upload](https://www.dropbox.com/developers/documentation/http/documentation#files-upload)

scope: `files.content.write`

Create a new file with the contents provided in the request.
Do not use this to upload a file larger than 150 MB. Instead, create an upload session with `upload_session/start`.
Calls to this endpoint will count as data transport calls for any Dropbox Business teams with a limit on the number of data transport calls allowed per month. For more information, see the [Data transport limit page](https://www.dropbox.com/developers/reference/data-transport-limit).

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "path": "/Homework/math/Matrices.txt", 
    "mode": "add", 
    "autorename": true, 
    "mute": false, 
    "strict_conflict": false
}' 'https://content.dropboxapi.com/2/files/upload'
```



#### Response Examples

##### Example 1: upload response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### upload_session/append {70605377227519000}

| | |
|--|--|
|__Name__| upload_session/append|
|__URL__| https://content.dropboxapi.com/2/files/upload_session/append_v2 |
|__Method__| POST|

#### Description
[upload_session/append](https://www.dropbox.com/developers/documentation/http/documentation#files-upload_session-append)

scope: `files.content.write`

Append more data to an upload session.
When the parameter close is set, this call will close the session.
A single request should not upload more than 150 MB. The maximum size of a file one can upload to an upload session is 350 GB.
Calls to this endpoint will count as data transport calls for any Dropbox Business teams with a limit on the number of data transport calls allowed per month. For more information, see the [Data transport limit page](https://www.dropbox.com/developers/reference/data-transport-limit).

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "cursor": {
        "session_id": "1234faaf0678bcde", 
        "offset": 0
    }, 
    "close": false
}' 'https://content.dropboxapi.com/2/files/upload_session/append_v2'
```




### upload_session/finish {73630295527520000}

| | |
|--|--|
|__Name__| upload_session/finish|
|__URL__| https://content.dropboxapi.com/2/files/upload_session/finish |
|__Method__| POST|

#### Description
[upload_session/finish](https://www.dropbox.com/developers/documentation/http/documentation#files-upload_session-finish)

scope: `files.content.write`

Finish an upload session and save the uploaded data to the given file path.
A single request should not upload more than 150 MB. The maximum size of a file one can upload to an upload session is 350 GB.
Calls to this endpoint will count as data transport calls for any Dropbox Business teams with a limit on the number of data transport calls allowed per month. For more information, see the [Data transport limit page](https://www.dropbox.com/developers/reference/data-transport-limit).

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "cursor": {
        "session_id": "1234faaf0678bcde", 
        "offset": 0
    }, 
    "commit": {
        "path": "/Homework/math/Matrices.txt", 
        "mode": "add", 
        "autorename": true, 
        "mute": false, 
        "strict_conflict": false
    }
}' 'https://content.dropboxapi.com/2/files/upload_session/finish'
```



#### Response Examples

##### Example 1: upload_session/finish response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Prime_Numbers.txt", 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "path_display": "/Homework/math/Prime_Numbers.txt", 
    "sharing_info": {
        "read_only": true, 
        "parent_shared_folder_id": "84528192421", 
        "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
    }, 
    "is_downloadable": true, 
    "property_groups": [
        {
            "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
            "fields": [
                {
                    "name": "Security Policy", 
                    "value": "Confidential"
                }
            ]
        }
    ], 
    "has_explicit_shared_members": false, 
    "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
    "file_lock_info": {
        "is_lockholder": true, 
        "lockholder_name": "Imaginary User", 
        "created": "2015-05-12T15:50:38Z"
    }
}
```


### upload_session/finish_batch {116128237227522000}

| | |
|--|--|
|__Name__| upload_session/finish_batch|
|__URL__| https://api.dropboxapi.com/2/files/upload_session/finish_batch |
|__Method__| POST|

#### Description
[upload_session/finish_batch](https://www.dropbox.com/developers/documentation/http/documentation#files-upload_session-finish_batch)

scope: `files.content.write`

This route helps you commit many files at once into a user&#39;s Dropbox. Use `upload_session/start` and `upload_session/append:2` to upload file contents. We recommend uploading many files in parallel to increase throughput. Once the file contents have been uploaded, rather than calling `upload_session/finish`, use this route to finish all your upload sessions in a single request.
`UploadSessionStartArg.close` or `UploadSessionAppendArg.close` needs to be true for the last `upload_session/start` or `upload_session/append:2` call. The maximum size of a file one can upload to an upload session is 350 GB.
This route will return a job_id immediately and do the async commit job in background. Use `upload_session/finish_batch/check` to check the job status.
For the same account, this route should be executed serially. That means you should not start the next job before current job finishes. We allow up to 1000 entries in a single request.
Calls to this endpoint will count as data transport calls for any Dropbox Business teams with a limit on the number of data transport calls allowed per month. For more information, see the [Data transport limit page](https://www.dropbox.com/developers/reference/data-transport-limit).

#### Request

```sh
curl -X 'POST' -d '{
    "entries": [
        {
            "cursor": {
                "session_id": "1234faaf0678bcde", 
                "offset": 0
            }, 
            "commit": {
                "path": "/Homework/math/Matrices.txt", 
                "mode": "add", 
                "autorename": true, 
                "mute": false, 
                "strict_conflict": false
            }
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/upload_session/finish_batch'
```



#### Response Examples

##### Example 1: upload_session/finish_batch response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "name": "Prime_Numbers.txt", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "client_modified": "2015-05-12T15:50:38Z", 
            "server_modified": "2015-05-12T15:50:38Z", 
            "rev": "a1c10ce0dd78", 
            "size": 7212, 
            "path_lower": "/homework/math/prime_numbers.txt", 
            "path_display": "/Homework/math/Prime_Numbers.txt", 
            "sharing_info": {
                "read_only": true, 
                "parent_shared_folder_id": "84528192421", 
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            }, 
            "is_downloadable": true, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ], 
            "has_explicit_shared_members": false, 
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
            "file_lock_info": {
                "is_lockholder": true, 
                "lockholder_name": "Imaginary User", 
                "created": "2015-05-12T15:50:38Z"
            }
        }
    ]
}
```


### upload_session/finish_batch/check {282175838727527000}

| | |
|--|--|
|__Name__| upload_session/finish_batch/check|
|__URL__| https://api.dropboxapi.com/2/files/upload_session/finish_batch/check |
|__Method__| POST|

#### Description
[upload_session/finish_batch/check](https://www.dropbox.com/developers/documentation/http/documentation#files-upload_session-finish_batch-check)

scope: `files.content.write`

Returns the status of an asynchronous job for `upload_session/finish_batch`. If success, it returns list of result for each entry.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/files/upload_session/finish_batch/check'
```



#### Response Examples

##### Example 1: upload_session/finish_batch/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "entries": [
        {
            ".tag": "success", 
            "name": "Prime_Numbers.txt", 
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "client_modified": "2015-05-12T15:50:38Z", 
            "server_modified": "2015-05-12T15:50:38Z", 
            "rev": "a1c10ce0dd78", 
            "size": 7212, 
            "path_lower": "/homework/math/prime_numbers.txt", 
            "path_display": "/Homework/math/Prime_Numbers.txt", 
            "sharing_info": {
                "read_only": true, 
                "parent_shared_folder_id": "84528192421", 
                "modified_by": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
            }, 
            "is_downloadable": true, 
            "property_groups": [
                {
                    "template_id": "ptid:1a5n2i6d3OYEAAAAAAAAAYa", 
                    "fields": [
                        {
                            "name": "Security Policy", 
                            "value": "Confidential"
                        }
                    ]
                }
            ], 
            "has_explicit_shared_members": false, 
            "content_hash": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", 
            "file_lock_info": {
                "is_lockholder": true, 
                "lockholder_name": "Imaginary User", 
                "created": "2015-05-12T15:50:38Z"
            }
        }
    ]
}
```


### upload_session/start {66439771227529000}

| | |
|--|--|
|__Name__| upload_session/start|
|__URL__| https://content.dropboxapi.com/2/files/upload_session/start |
|__Method__| POST|

#### Description
[upload_session/start](https://www.dropbox.com/developers/documentation/http/documentation#files-upload_session-start)

scope: `files.content.write`

Upload sessions allow you to upload a single file in one or more requests, for example where the size of the file is greater than 150 MB.  This call starts a new upload session with the given data. You can then use `upload_session/append:2` to add more data and `upload_session/finish` to save all the data to a file in Dropbox.
A single request should not upload more than 150 MB. The maximum size of a file one can upload to an upload session is 350 GB.
An upload session can be used for a maximum of 48 hours. Attempting to use an `UploadSessionStartResult.session_id` with `upload_session/append:2` or `upload_session/finish` more than 48 hours after its creation will return a `UploadSessionLookupError.not_found`.
Calls to this endpoint will count as data transport calls for any Dropbox Business teams with a limit on the number of data transport calls allowed per month. For more information, see the [Data transport limit page](https://www.dropbox.com/developers/reference/data-transport-limit).

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "close": false
}' 'https://content.dropboxapi.com/2/files/upload_session/start'
```



#### Response Examples

##### Example 1: upload_session/start response

```json
Code: 200 OK
------------------------------------------
{
    "session_id": "1234faaf0678bcde"
}
```


## sharing {243019387527530000}

### add_file_member {328857287427531000}

| | |
|--|--|
|__Name__| add_file_member|
|__URL__| https://api.dropboxapi.com/2/sharing/add_file_member |
|__Method__| POST|

#### Description
[add_file_member](https://www.dropbox.com/developers/documentation/http/documentation#sharing-add_file_member)

scope: `sharing.write`

Adds specified members to a file.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
    "members": [
        {
            ".tag": "email", 
            "email": "justin@example.com"
        }
    ], 
    "custom_message": "This is a custom message about ACME.doc", 
    "quiet": false, 
    "access_level": "viewer", 
    "add_message_as_comment": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/add_file_member'
```



#### Response Examples

##### Example 1: add_file_member response

```json
Code: 200 OK
------------------------------------------
[
    {
        "member": {
            ".tag": "email", 
            "email": "justin@example.com"
        }, 
        "result": {
            ".tag": "success"
        }
    }
]
```


### add_folder_member {45310294827533000}

| | |
|--|--|
|__Name__| add_folder_member|
|__URL__| https://api.dropboxapi.com/2/sharing/add_folder_member |
|__Method__| POST|

#### Description
[add_folder_member](https://www.dropbox.com/developers/documentation/http/documentation#sharing-add_folder_member)

scope: `sharing.write`

Allows an owner or editor (if the ACL update policy allows) of a shared folder to add another member.
For the new member to get access to all the functionality for this folder, you will need to call `mount_folder` on their behalf.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "members": [
        {
            "member": {
                ".tag": "email", 
                "email": "justin@example.com"
            }, 
            "access_level": "editor"
        }, 
        {
            "member": {
                ".tag": "dropbox_id", 
                "dropbox_id": "dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"
            }, 
            "access_level": "viewer"
        }
    ], 
    "quiet": false, 
    "custom_message": "Documentation for launch day"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/add_folder_member'
```




### check_job_status {353327658227534000}

| | |
|--|--|
|__Name__| check_job_status|
|__URL__| https://api.dropboxapi.com/2/sharing/check_job_status |
|__Method__| POST|

#### Description
[check_job_status](https://www.dropbox.com/developers/documentation/http/documentation#sharing-check_job_status)

scope: `sharing.write`

Returns the status of an asynchronous job.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/check_job_status'
```



#### Response Examples

##### Example 1: check_job_status response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "in_progress"
}
```


### check_remove_member_job_status {32453843427535000}

| | |
|--|--|
|__Name__| check_remove_member_job_status|
|__URL__| https://api.dropboxapi.com/2/sharing/check_remove_member_job_status |
|__Method__| POST|

#### Description
[check_remove_member_job_status](https://www.dropbox.com/developers/documentation/http/documentation#sharing-check_remove_member_job_status)

scope: `sharing.write`

Returns the status of an asynchronous job for sharing a folder.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/check_remove_member_job_status'
```



#### Response Examples

##### Example 1: check_remove_member_job_status response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### check_share_job_status {152086669827537000}

| | |
|--|--|
|__Name__| check_share_job_status|
|__URL__| https://api.dropboxapi.com/2/sharing/check_share_job_status |
|__Method__| POST|

#### Description
[check_share_job_status](https://www.dropbox.com/developers/documentation/http/documentation#sharing-check_share_job_status)

scope: `sharing.write`

Returns the status of an asynchronous job for sharing a folder.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/check_share_job_status'
```



#### Response Examples

##### Example 1: check_share_job_status response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "access_type": {
        ".tag": "owner"
    }, 
    "is_inside_team_folder": false, 
    "is_team_folder": false, 
    "name": "dir", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
    "shared_folder_id": "84528192421", 
    "time_invited": "2016-01-20T00:00:00Z", 
    "path_lower": "/dir", 
    "link_metadata": {
        "audience_options": [
            {
                ".tag": "public"
            }, 
            {
                ".tag": "team"
            }, 
            {
                ".tag": "members"
            }
        ], 
        "current_audience": {
            ".tag": "public"
        }, 
        "link_permissions": [
            {
                "action": {
                    ".tag": "change_audience"
                }, 
                "allow": true
            }
        ], 
        "password_protected": false, 
        "url": ""
    }, 
    "permissions": [], 
    "access_inheritance": {
        ".tag": "inherit"
    }
}
```


### get_file_metadata {81412988627538000}

| | |
|--|--|
|__Name__| get_file_metadata|
|__URL__| https://api.dropboxapi.com/2/sharing/get_file_metadata |
|__Method__| POST|

#### Description
[get_file_metadata](https://www.dropbox.com/developers/documentation/http/documentation#sharing-get_file_metadata)

scope: `sharing.read`

Returns shared file metadata.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
    "actions": []
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/get_file_metadata'
```



#### Response Examples

##### Example 1: get_file_metadata response

```json
Code: 200 OK
------------------------------------------
{
    "id": "id:3kmLmQFnf1AAAAAAAAAAAw", 
    "name": "file.txt", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fi/fir9vjelf", 
    "access_type": {
        ".tag": "viewer"
    }, 
    "owner_display_names": [
        "Jane Doe"
    ], 
    "owner_team": {
        "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
        "name": "Acme, Inc."
    }, 
    "path_display": "/dir/file.txt", 
    "path_lower": "/dir/file.txt", 
    "permissions": [], 
    "time_invited": "2016-01-20T00:00:00Z"
}
```


### get_file_metadata/batch {252222293327540000}

| | |
|--|--|
|__Name__| get_file_metadata/batch|
|__URL__| https://api.dropboxapi.com/2/sharing/get_file_metadata/batch |
|__Method__| POST|

#### Description
[get_file_metadata/batch](https://www.dropbox.com/developers/documentation/http/documentation#sharing-get_file_metadata-batch)

scope: `sharing.read`

Returns shared file metadata.

#### Request

```sh
curl -X 'POST' -d '{
    "files": [
        "id:3kmLmQFnf1AAAAAAAAAAAw", 
        "id:VvTaJu2VZzAAAAAAAAAADQ"
    ], 
    "actions": []
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/get_file_metadata/batch'
```



#### Response Examples

##### Example 1: get_file_metadata/batch response

```json
Code: 200 OK
------------------------------------------
[
    {
        "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
        "result": {
            ".tag": "metadata", 
            "id": "id:3kmLmQFnf1AAAAAAAAAAAw", 
            "name": "file.txt", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fi/fir9vjelf", 
            "access_type": {
                ".tag": "viewer"
            }, 
            "owner_display_names": [
                "Jane Doe"
            ], 
            "owner_team": {
                "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
                "name": "Acme, Inc."
            }, 
            "path_display": "/dir/file.txt", 
            "path_lower": "/dir/file.txt", 
            "permissions": [], 
            "time_invited": "2016-01-20T00:00:00Z"
        }
    }
]
```


### get_folder_metadata {131723004427542000}

| | |
|--|--|
|__Name__| get_folder_metadata|
|__URL__| https://api.dropboxapi.com/2/sharing/get_folder_metadata |
|__Method__| POST|

#### Description
[get_folder_metadata](https://www.dropbox.com/developers/documentation/http/documentation#sharing-get_folder_metadata)

scope: `sharing.read`

Returns shared folder metadata by its folder ID.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "actions": []
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/get_folder_metadata'
```



#### Response Examples

##### Example 1: get_folder_metadata response

```json
Code: 200 OK
------------------------------------------
{
    "access_type": {
        ".tag": "owner"
    }, 
    "is_inside_team_folder": false, 
    "is_team_folder": false, 
    "name": "dir", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
    "shared_folder_id": "84528192421", 
    "time_invited": "2016-01-20T00:00:00Z", 
    "path_lower": "/dir", 
    "link_metadata": {
        "audience_options": [
            {
                ".tag": "public"
            }, 
            {
                ".tag": "team"
            }, 
            {
                ".tag": "members"
            }
        ], 
        "current_audience": {
            ".tag": "public"
        }, 
        "link_permissions": [
            {
                "action": {
                    ".tag": "change_audience"
                }, 
                "allow": true
            }
        ], 
        "password_protected": false, 
        "url": ""
    }, 
    "permissions": [], 
    "access_inheritance": {
        ".tag": "inherit"
    }
}
```


### get_shared_link_file {14368085327543000}

| | |
|--|--|
|__Name__| get_shared_link_file|
|__URL__| https://content.dropboxapi.com/2/sharing/get_shared_link_file |
|__Method__| POST|

#### Description
[get_shared_link_file](https://www.dropbox.com/developers/documentation/http/documentation#sharing-get_shared_link_file)

scope: `sharing.read`

Download the shared link&#39;s file from a user&#39;s Dropbox.

#### Request

```sh
curl -X 'POST' -d '' -H 'Dropbox-Api-Arg: {
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
    "path": "/Prime_Numbers.txt"
}' 'https://content.dropboxapi.com/2/sharing/get_shared_link_file'
```



#### Response Examples

##### Example 1: get_shared_link_file response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "file", 
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
    "name": "Prime_Numbers.txt", 
    "link_permissions": {
        "can_revoke": false, 
        "resolved_visibility": {
            ".tag": "public"
        }, 
        "revoke_failure_reason": {
            ".tag": "owner_only"
        }
    }, 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "team_member_info": {
        "team_info": {
            "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
            "name": "Acme, Inc."
        }, 
        "display_name": "Roger Rabbit", 
        "member_id": "dbmid:abcd1234"
    }
}
```


### get_shared_link_metadata {141044765427546000}

| | |
|--|--|
|__Name__| get_shared_link_metadata|
|__URL__| https://api.dropboxapi.com/2/sharing/get_shared_link_metadata |
|__Method__| POST|

#### Description
[get_shared_link_metadata](https://www.dropbox.com/developers/documentation/http/documentation#sharing-get_shared_link_metadata)

scope: `sharing.read`

Get the shared link&#39;s metadata.

#### Request

```sh
curl -X 'POST' -d '{
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
    "path": "/Prime_Numbers.txt"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/get_shared_link_metadata'
```



#### Response Examples

##### Example 1: get_shared_link_metadata response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "file", 
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
    "name": "Prime_Numbers.txt", 
    "link_permissions": {
        "can_revoke": false, 
        "resolved_visibility": {
            ".tag": "public"
        }, 
        "revoke_failure_reason": {
            ".tag": "owner_only"
        }
    }, 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "team_member_info": {
        "team_info": {
            "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
            "name": "Acme, Inc."
        }, 
        "display_name": "Roger Rabbit", 
        "member_id": "dbmid:abcd1234"
    }
}
```


### list_file_members {314866798027547000}

| | |
|--|--|
|__Name__| list_file_members|
|__URL__| https://api.dropboxapi.com/2/sharing/list_file_members |
|__Method__| POST|

#### Description
[list_file_members](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_file_members)

scope: `sharing.read`

Use to obtain the members who have been invited to a file, both inherited and uninherited members.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
    "include_inherited": true, 
    "limit": 100
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_file_members'
```



#### Response Examples

##### Example 1: list_file_members response

```json
Code: 200 OK
------------------------------------------
{
    "users": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "user": {
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "email": "bob@example.com", 
                "display_name": "Robert Smith", 
                "same_team": true, 
                "team_member_id": "dbmid:abcd1234"
            }, 
            "permissions": [], 
            "is_inherited": false, 
            "time_last_seen": "2016-01-20T00:00:00Z", 
            "platform_type": {
                ".tag": "unknown"
            }
        }
    ], 
    "groups": [
        {
            "access_type": {
                ".tag": "editor"
            }, 
            "group": {
                "group_name": "Test group", 
                "group_id": "g:e2db7665347abcd600000000001a2b3c", 
                "group_management_type": {
                    ".tag": "user_managed"
                }, 
                "group_type": {
                    ".tag": "user_managed"
                }, 
                "is_member": false, 
                "is_owner": false, 
                "same_team": true, 
                "member_count": 10
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ], 
    "invitees": [
        {
            "access_type": {
                ".tag": "viewer"
            }, 
            "invitee": {
                ".tag": "email", 
                "email": "jessica@example.com"
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ]
}
```


### list_file_members/batch {39875478327549000}

| | |
|--|--|
|__Name__| list_file_members/batch|
|__URL__| https://api.dropboxapi.com/2/sharing/list_file_members/batch |
|__Method__| POST|

#### Description
[list_file_members/batch](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_file_members-batch)

scope: `sharing.read`

Get members of multiple files at once. The arguments to this route are more limited, and the limit on query result size per file is more strict. To customize the results more, use the individual file endpoint.
Inherited users and groups are not included in the result, and permissions are not returned for this endpoint.

#### Request

```sh
curl -X 'POST' -d '{
    "files": [
        "id:3kmLmQFnf1AAAAAAAAAAAw", 
        "id:VvTaJu2VZzAAAAAAAAAADQ"
    ], 
    "limit": 10
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_file_members/batch'
```



#### Response Examples

##### Example 1: list_file_members/batch response

```json
Code: 200 OK
------------------------------------------
[
    {
        "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
        "result": {
            ".tag": "result", 
            "members": {
                "users": [
                    {
                        "access_type": {
                            ".tag": "owner"
                        }, 
                        "user": {
                            "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                            "email": "bob@example.com", 
                            "display_name": "Robert Smith", 
                            "same_team": true, 
                            "team_member_id": "dbmid:abcd1234"
                        }, 
                        "permissions": [], 
                        "is_inherited": false, 
                        "time_last_seen": "2016-01-20T00:00:00Z", 
                        "platform_type": {
                            ".tag": "unknown"
                        }
                    }
                ], 
                "groups": [
                    {
                        "access_type": {
                            ".tag": "editor"
                        }, 
                        "group": {
                            "group_name": "Test group", 
                            "group_id": "g:e2db7665347abcd600000000001a2b3c", 
                            "group_management_type": {
                                ".tag": "user_managed"
                            }, 
                            "group_type": {
                                ".tag": "user_managed"
                            }, 
                            "is_member": false, 
                            "is_owner": false, 
                            "same_team": true, 
                            "member_count": 10
                        }, 
                        "permissions": [], 
                        "is_inherited": false
                    }
                ], 
                "invitees": [
                    {
                        "access_type": {
                            ".tag": "viewer"
                        }, 
                        "invitee": {
                            ".tag": "email", 
                            "email": "jessica@example.com"
                        }, 
                        "permissions": [], 
                        "is_inherited": false
                    }
                ]
            }, 
            "member_count": 3
        }
    }
]
```


### list_file_members/continue {388088344827571000}

| | |
|--|--|
|__Name__| list_file_members/continue|
|__URL__| https://api.dropboxapi.com/2/sharing/list_file_members/continue |
|__Method__| POST|

#### Description
[list_file_members/continue](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_file_members-continue)

scope: `sharing.read`

Once a cursor has been retrieved from `list_file_members` or `list_file_members/batch`, use this to paginate through all shared file members.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_file_members/continue'
```



#### Response Examples

##### Example 1: list_file_members/continue response

```json
Code: 200 OK
------------------------------------------
{
    "users": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "user": {
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "email": "bob@example.com", 
                "display_name": "Robert Smith", 
                "same_team": true, 
                "team_member_id": "dbmid:abcd1234"
            }, 
            "permissions": [], 
            "is_inherited": false, 
            "time_last_seen": "2016-01-20T00:00:00Z", 
            "platform_type": {
                ".tag": "unknown"
            }
        }
    ], 
    "groups": [
        {
            "access_type": {
                ".tag": "editor"
            }, 
            "group": {
                "group_name": "Test group", 
                "group_id": "g:e2db7665347abcd600000000001a2b3c", 
                "group_management_type": {
                    ".tag": "user_managed"
                }, 
                "group_type": {
                    ".tag": "user_managed"
                }, 
                "is_member": false, 
                "is_owner": false, 
                "same_team": true, 
                "member_count": 10
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ], 
    "invitees": [
        {
            "access_type": {
                ".tag": "viewer"
            }, 
            "invitee": {
                ".tag": "email", 
                "email": "jessica@example.com"
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ]
}
```


### list_folder_members/continue {86909278227573000}

| | |
|--|--|
|__Name__| list_folder_members/continue|
|__URL__| https://api.dropboxapi.com/2/sharing/list_folder_members/continue |
|__Method__| POST|

#### Description
[list_folder_members/continue](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_folder_members-continue)

scope: `sharing.read`

Once a cursor has been retrieved from `list_folder_members`, use this to paginate through all shared folder members.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_folder_members/continue'
```



#### Response Examples

##### Example 1: list_folder_members/continue response

```json
Code: 200 OK
------------------------------------------
{
    "users": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "user": {
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "email": "bob@example.com", 
                "display_name": "Robert Smith", 
                "same_team": true, 
                "team_member_id": "dbmid:abcd1234"
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ], 
    "groups": [
        {
            "access_type": {
                ".tag": "editor"
            }, 
            "group": {
                "group_name": "Test group", 
                "group_id": "g:e2db7665347abcd600000000001a2b3c", 
                "group_management_type": {
                    ".tag": "user_managed"
                }, 
                "group_type": {
                    ".tag": "user_managed"
                }, 
                "is_member": false, 
                "is_owner": false, 
                "same_team": true, 
                "member_count": 10
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ], 
    "invitees": [
        {
            "access_type": {
                ".tag": "viewer"
            }, 
            "invitee": {
                ".tag": "email", 
                "email": "jessica@example.com"
            }, 
            "permissions": [], 
            "is_inherited": false
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### list_folders {84479981127575000}

| | |
|--|--|
|__Name__| list_folders|
|__URL__| https://api.dropboxapi.com/2/sharing/list_folders |
|__Method__| POST|

#### Description
[list_folders](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_folders)

scope: `sharing.read`

Return the list of all shared folders the current user has access to.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100, 
    "actions": []
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_folders'
```



#### Response Examples

##### Example 1: list_folders response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "is_inside_team_folder": false, 
            "is_team_folder": false, 
            "name": "dir", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
            "shared_folder_id": "84528192421", 
            "time_invited": "2016-01-20T00:00:00Z", 
            "path_lower": "/dir", 
            "link_metadata": {
                "audience_options": [
                    {
                        ".tag": "public"
                    }, 
                    {
                        ".tag": "team"
                    }, 
                    {
                        ".tag": "members"
                    }
                ], 
                "current_audience": {
                    ".tag": "public"
                }, 
                "link_permissions": [
                    {
                        "action": {
                            ".tag": "change_audience"
                        }, 
                        "allow": true
                    }
                ], 
                "password_protected": false, 
                "url": ""
            }, 
            "permissions": [], 
            "access_inheritance": {
                ".tag": "inherit"
            }
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### list_folders/continue {258728912527576000}

| | |
|--|--|
|__Name__| list_folders/continue|
|__URL__| https://api.dropboxapi.com/2/sharing/list_folders/continue |
|__Method__| POST|

#### Description
[list_folders/continue](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_folders-continue)

scope: `sharing.read`

Once a cursor has been retrieved from `list_folders`, use this to paginate through all shared folders. The cursor must come from a previous call to `list_folders` or `list_folders/continue`.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_folders/continue'
```



#### Response Examples

##### Example 1: list_folders/continue response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "is_inside_team_folder": false, 
            "is_team_folder": false, 
            "name": "dir", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
            "shared_folder_id": "84528192421", 
            "time_invited": "2016-01-20T00:00:00Z", 
            "path_lower": "/dir", 
            "link_metadata": {
                "audience_options": [
                    {
                        ".tag": "public"
                    }, 
                    {
                        ".tag": "team"
                    }, 
                    {
                        ".tag": "members"
                    }
                ], 
                "current_audience": {
                    ".tag": "public"
                }, 
                "link_permissions": [
                    {
                        "action": {
                            ".tag": "change_audience"
                        }, 
                        "allow": true
                    }
                ], 
                "password_protected": false, 
                "url": ""
            }, 
            "permissions": [], 
            "access_inheritance": {
                ".tag": "inherit"
            }
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### list_mountable_folders {287131180527578000}

| | |
|--|--|
|__Name__| list_mountable_folders|
|__URL__| https://api.dropboxapi.com/2/sharing/list_mountable_folders |
|__Method__| POST|

#### Description
[list_mountable_folders](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_mountable_folders)

scope: `sharing.read`

Return the list of all shared folders the current user can mount or unmount.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100, 
    "actions": []
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_mountable_folders'
```



#### Response Examples

##### Example 1: list_mountable_folders response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "is_inside_team_folder": false, 
            "is_team_folder": false, 
            "name": "dir", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
            "shared_folder_id": "84528192421", 
            "time_invited": "2016-01-20T00:00:00Z", 
            "path_lower": "/dir", 
            "link_metadata": {
                "audience_options": [
                    {
                        ".tag": "public"
                    }, 
                    {
                        ".tag": "team"
                    }, 
                    {
                        ".tag": "members"
                    }
                ], 
                "current_audience": {
                    ".tag": "public"
                }, 
                "link_permissions": [
                    {
                        "action": {
                            ".tag": "change_audience"
                        }, 
                        "allow": true
                    }
                ], 
                "password_protected": false, 
                "url": ""
            }, 
            "permissions": [], 
            "access_inheritance": {
                ".tag": "inherit"
            }
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### list_mountable_folders/continue {274117297527580000}

| | |
|--|--|
|__Name__| list_mountable_folders/continue|
|__URL__| https://api.dropboxapi.com/2/sharing/list_mountable_folders/continue |
|__Method__| POST|

#### Description
[list_mountable_folders/continue](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_mountable_folders-continue)

scope: `sharing.read`

Once a cursor has been retrieved from `list_mountable_folders`, use this to paginate through all mountable shared folders. The cursor must come from a previous call to `list_mountable_folders` or `list_mountable_folders/continue`.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_mountable_folders/continue'
```



#### Response Examples

##### Example 1: list_mountable_folders/continue response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "access_type": {
                ".tag": "owner"
            }, 
            "is_inside_team_folder": false, 
            "is_team_folder": false, 
            "name": "dir", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
            "shared_folder_id": "84528192421", 
            "time_invited": "2016-01-20T00:00:00Z", 
            "path_lower": "/dir", 
            "link_metadata": {
                "audience_options": [
                    {
                        ".tag": "public"
                    }, 
                    {
                        ".tag": "team"
                    }, 
                    {
                        ".tag": "members"
                    }
                ], 
                "current_audience": {
                    ".tag": "public"
                }, 
                "link_permissions": [
                    {
                        "action": {
                            ".tag": "change_audience"
                        }, 
                        "allow": true
                    }
                ], 
                "password_protected": false, 
                "url": ""
            }, 
            "permissions": [], 
            "access_inheritance": {
                ".tag": "inherit"
            }
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### list_received_files {417694958127582000}

| | |
|--|--|
|__Name__| list_received_files|
|__URL__| https://api.dropboxapi.com/2/sharing/list_received_files |
|__Method__| POST|

#### Description
[list_received_files](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_received_files)

scope: `sharing.read`

Returns a list of all files shared with current user.
 Does not include files the user has received via shared folders, and does  not include unclaimed invitations.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100, 
    "actions": []
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_received_files'
```



#### Response Examples

##### Example 1: list_received_files response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "id": "id:3kmLmQFnf1AAAAAAAAAAAw", 
            "name": "file.txt", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fi/fir9vjelf", 
            "access_type": {
                ".tag": "viewer"
            }, 
            "owner_display_names": [
                "Jane Doe"
            ], 
            "owner_team": {
                "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
                "name": "Acme, Inc."
            }, 
            "path_display": "/dir/file.txt", 
            "path_lower": "/dir/file.txt", 
            "permissions": [], 
            "time_invited": "2016-01-20T00:00:00Z"
        }
    ], 
    "cursor": "AzJJbGlzdF90eXBdofe9c3RPbGlzdGFyZ3NfYnlfZ2lkMRhcbric7Rdog9cmV2aXNpb24H3Qf6o1fkHxQ"
}
```


### list_received_files/continue {12319382327583000}

| | |
|--|--|
|__Name__| list_received_files/continue|
|__URL__| https://api.dropboxapi.com/2/sharing/list_received_files/continue |
|__Method__| POST|

#### Description
[list_received_files/continue](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_received_files-continue)

scope: `sharing.read`

Get more results with a cursor from `list_received_files`.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "AzJJbGlzdF90eXBdofe9c3RPbGlzdGFyZ3NfYnlfZ2lkMRhcbric7Rdog9emfGRlc2MCRWxpbWl0BGRId"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_received_files/continue'
```



#### Response Examples

##### Example 1: list_received_files/continue response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "id": "id:3kmLmQFnf1AAAAAAAAAAAw", 
            "name": "file.txt", 
            "policy": {
                "acl_update_policy": {
                    ".tag": "owner"
                }, 
                "shared_link_policy": {
                    ".tag": "anyone"
                }, 
                "member_policy": {
                    ".tag": "anyone"
                }, 
                "resolved_member_policy": {
                    ".tag": "team"
                }
            }, 
            "preview_url": "https://www.dropbox.com/scl/fi/fir9vjelf", 
            "access_type": {
                ".tag": "viewer"
            }, 
            "owner_display_names": [
                "Jane Doe"
            ], 
            "owner_team": {
                "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
                "name": "Acme, Inc."
            }, 
            "path_display": "/dir/file.txt", 
            "path_lower": "/dir/file.txt", 
            "permissions": [], 
            "time_invited": "2016-01-20T00:00:00Z"
        }
    ], 
    "cursor": "AzJJbGlzdF90eXBdofe9c3RPbGlzdGFyZ3NfYnlfZ2lkMRhcbric7Rdog9cmV2aXNpb24H3Qf6o1fkHxQ"
}
```


### list_shared_links {116772042527585000}

| | |
|--|--|
|__Name__| list_shared_links|
|__URL__| https://api.dropboxapi.com/2/sharing/list_shared_links |
|__Method__| POST|

#### Description
[list_shared_links](https://www.dropbox.com/developers/documentation/http/documentation#sharing-list_shared_links)

scope: `sharing.read`

List shared links of this user.
If no path is given, returns a list of all shared links for the current user.
If a non-empty path is given, returns a list of all shared links that allow access to the given path - direct links to the given path and links to parent folders of the given path. Links to parent folders can be suppressed by setting direct_only to true.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/list_shared_links'
```



#### Response Examples

##### Example 1: list_shared_links response

```json
Code: 200 OK
------------------------------------------
{
    "links": [
        {
            ".tag": "file", 
            "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
            "name": "Prime_Numbers.txt", 
            "link_permissions": {
                "can_revoke": false, 
                "resolved_visibility": {
                    ".tag": "public"
                }, 
                "revoke_failure_reason": {
                    ".tag": "owner_only"
                }
            }, 
            "client_modified": "2015-05-12T15:50:38Z", 
            "server_modified": "2015-05-12T15:50:38Z", 
            "rev": "a1c10ce0dd78", 
            "size": 7212, 
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "path_lower": "/homework/math/prime_numbers.txt", 
            "team_member_info": {
                "team_info": {
                    "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
                    "name": "Acme, Inc."
                }, 
                "display_name": "Roger Rabbit", 
                "member_id": "dbmid:abcd1234"
            }
        }
    ], 
    "has_more": true, 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### modify_shared_link_settings {310410543427587000}

| | |
|--|--|
|__Name__| modify_shared_link_settings|
|__URL__| https://api.dropboxapi.com/2/sharing/modify_shared_link_settings |
|__Method__| POST|

#### Description
[modify_shared_link_settings](https://www.dropbox.com/developers/documentation/http/documentation#sharing-modify_shared_link_settings)

scope: `sharing.write`

Modify the shared link&#39;s settings.
If the requested visibility conflict with the shared links policy of the team or the shared folder (in case the linked file is part of a shared folder) then the `LinkPermissions.resolved_visibility` of the returned `SharedLinkMetadata` will reflect the actual visibility of the shared link and the `LinkPermissions.requested_visibility` will reflect the requested visibility.

#### Request

```sh
curl -X 'POST' -d '{
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
    "settings": {
        "requested_visibility": "public", 
        "audience": "public", 
        "access": "viewer"
    }, 
    "remove_expiration": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/modify_shared_link_settings'
```



#### Response Examples

##### Example 1: modify_shared_link_settings response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "file", 
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0", 
    "name": "Prime_Numbers.txt", 
    "link_permissions": {
        "can_revoke": false, 
        "resolved_visibility": {
            ".tag": "public"
        }, 
        "revoke_failure_reason": {
            ".tag": "owner_only"
        }
    }, 
    "client_modified": "2015-05-12T15:50:38Z", 
    "server_modified": "2015-05-12T15:50:38Z", 
    "rev": "a1c10ce0dd78", 
    "size": 7212, 
    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
    "path_lower": "/homework/math/prime_numbers.txt", 
    "team_member_info": {
        "team_info": {
            "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
            "name": "Acme, Inc."
        }, 
        "display_name": "Roger Rabbit", 
        "member_id": "dbmid:abcd1234"
    }
}
```


### mount_folder {382693111527589000}

| | |
|--|--|
|__Name__| mount_folder|
|__URL__| https://api.dropboxapi.com/2/sharing/mount_folder |
|__Method__| POST|

#### Description
[mount_folder](https://www.dropbox.com/developers/documentation/http/documentation#sharing-mount_folder)

scope: `sharing.write`

The current user mounts the designated folder.
Mount a shared folder for a user after they have been added as a member. Once mounted, the shared folder will appear in their Dropbox.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/mount_folder'
```



#### Response Examples

##### Example 1: mount_folder response

```json
Code: 200 OK
------------------------------------------
{
    "access_type": {
        ".tag": "owner"
    }, 
    "is_inside_team_folder": false, 
    "is_team_folder": false, 
    "name": "dir", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
    "shared_folder_id": "84528192421", 
    "time_invited": "2016-01-20T00:00:00Z", 
    "path_lower": "/dir", 
    "link_metadata": {
        "audience_options": [
            {
                ".tag": "public"
            }, 
            {
                ".tag": "team"
            }, 
            {
                ".tag": "members"
            }
        ], 
        "current_audience": {
            ".tag": "public"
        }, 
        "link_permissions": [
            {
                "action": {
                    ".tag": "change_audience"
                }, 
                "allow": true
            }
        ], 
        "password_protected": false, 
        "url": ""
    }, 
    "permissions": [], 
    "access_inheritance": {
        ".tag": "inherit"
    }
}
```


### relinquish_file_membership {61023461527591000}

| | |
|--|--|
|__Name__| relinquish_file_membership|
|__URL__| https://api.dropboxapi.com/2/sharing/relinquish_file_membership |
|__Method__| POST|

#### Description
[relinquish_file_membership](https://www.dropbox.com/developers/documentation/http/documentation#sharing-relinquish_file_membership)

scope: `sharing.write`

The current user relinquishes their membership in the designated file. Note that the current user may still have inherited access to this file through the parent folder.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/relinquish_file_membership'
```




### relinquish_folder_membership {236906680927592000}

| | |
|--|--|
|__Name__| relinquish_folder_membership|
|__URL__| https://api.dropboxapi.com/2/sharing/relinquish_folder_membership |
|__Method__| POST|

#### Description
[relinquish_folder_membership](https://www.dropbox.com/developers/documentation/http/documentation#sharing-relinquish_folder_membership)

scope: `sharing.write`

The current user relinquishes their membership in the designated shared folder and will no longer have access to the folder.  A folder owner cannot relinquish membership in their own folder.
This will run synchronously if leave_a_copy is false, and asynchronously if leave_a_copy is true.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "leave_a_copy": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/relinquish_folder_membership'
```



#### Response Examples

##### Example 1: relinquish_folder_membership response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### remove_file_member_2 {381326455427594000}

| | |
|--|--|
|__Name__| remove_file_member_2|
|__URL__| https://api.dropboxapi.com/2/sharing/remove_file_member_2 |
|__Method__| POST|

#### Description
[remove_file_member_2](https://www.dropbox.com/developers/documentation/http/documentation#sharing-remove_file_member_2)

scope: `sharing.write`

Removes a specified member from the file.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
    "member": {
        ".tag": "email", 
        "email": "justin@example.com"
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/remove_file_member_2'
```



#### Response Examples

##### Example 1: remove_file_member_2 response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "other"
}
```


### remove_folder_member {352100266527595000}

| | |
|--|--|
|__Name__| remove_folder_member|
|__URL__| https://api.dropboxapi.com/2/sharing/remove_folder_member |
|__Method__| POST|

#### Description
[remove_folder_member](https://www.dropbox.com/developers/documentation/http/documentation#sharing-remove_folder_member)

scope: `sharing.write`

Allows an owner or editor (if the ACL update policy allows) of a shared folder to remove another member.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "member": {
        ".tag": "email", 
        "email": "justin@example.com"
    }, 
    "leave_a_copy": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/remove_folder_member'
```



#### Response Examples

##### Example 1: remove_folder_member response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "async_job_id", 
    "async_job_id": "34g93hh34h04y384084"
}
```


### revoke_shared_link {355445141027597000}

| | |
|--|--|
|__Name__| revoke_shared_link|
|__URL__| https://api.dropboxapi.com/2/sharing/revoke_shared_link |
|__Method__| POST|

#### Description
[revoke_shared_link](https://www.dropbox.com/developers/documentation/http/documentation#sharing-revoke_shared_link)

scope: `sharing.write`

Revoke a shared link.
Note that even after revoking a shared link to a file, the file may be accessible if there are shared links leading to any of the file parent folders. To list all shared links that enable access to a specific file, you can use the `list_shared_links` with the file as the `ListSharedLinksArg.path` argument.

#### Request

```sh
curl -X 'POST' -d '{
    "url": "https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/revoke_shared_link'
```




### set_access_inheritance {322433536527598000}

| | |
|--|--|
|__Name__| set_access_inheritance|
|__URL__| https://api.dropboxapi.com/2/sharing/set_access_inheritance |
|__Method__| POST|

#### Description
[set_access_inheritance](https://www.dropbox.com/developers/documentation/http/documentation#sharing-set_access_inheritance)

scope: `sharing.write`

Change the inheritance policy of an existing Shared Folder. Only permitted for shared folders in a shared team root.
If a `ShareFolderLaunch.async_job_id` is returned, you&#39;ll need to call `check_share_job_status` until the action completes to get the metadata for the folder.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "access_inheritance": "inherit"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/set_access_inheritance'
```



#### Response Examples

##### Example 1: set_access_inheritance response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "access_type": {
        ".tag": "owner"
    }, 
    "is_inside_team_folder": false, 
    "is_team_folder": false, 
    "name": "dir", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
    "shared_folder_id": "84528192421", 
    "time_invited": "2016-01-20T00:00:00Z", 
    "path_lower": "/dir", 
    "link_metadata": {
        "audience_options": [
            {
                ".tag": "public"
            }, 
            {
                ".tag": "team"
            }, 
            {
                ".tag": "members"
            }
        ], 
        "current_audience": {
            ".tag": "public"
        }, 
        "link_permissions": [
            {
                "action": {
                    ".tag": "change_audience"
                }, 
                "allow": true
            }
        ], 
        "password_protected": false, 
        "url": ""
    }, 
    "permissions": [], 
    "access_inheritance": {
        ".tag": "inherit"
    }
}
```


### share_folder {320150022127600000}

| | |
|--|--|
|__Name__| share_folder|
|__URL__| https://api.dropboxapi.com/2/sharing/share_folder |
|__Method__| POST|

#### Description
[share_folder](https://www.dropbox.com/developers/documentation/http/documentation#sharing-share_folder)

scope: `sharing.write`

Share a folder with collaborators.
Most sharing will be completed synchronously. Large folders will be completed asynchronously. To make testing the async case repeatable, set `ShareFolderArg.force_async`.
If a `ShareFolderLaunch.async_job_id` is returned, you&#39;ll need to call `check_share_job_status` until the action completes to get the metadata for the folder.

#### Request

```sh
curl -X 'POST' -d '{
    "path": "/example/workspace", 
    "acl_update_policy": "editors", 
    "force_async": false, 
    "member_policy": "team", 
    "shared_link_policy": "members", 
    "access_inheritance": "inherit"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/share_folder'
```



#### Response Examples

##### Example 1: share_folder response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "access_type": {
        ".tag": "owner"
    }, 
    "is_inside_team_folder": false, 
    "is_team_folder": false, 
    "name": "dir", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
    "shared_folder_id": "84528192421", 
    "time_invited": "2016-01-20T00:00:00Z", 
    "path_lower": "/dir", 
    "link_metadata": {
        "audience_options": [
            {
                ".tag": "public"
            }, 
            {
                ".tag": "team"
            }, 
            {
                ".tag": "members"
            }
        ], 
        "current_audience": {
            ".tag": "public"
        }, 
        "link_permissions": [
            {
                "action": {
                    ".tag": "change_audience"
                }, 
                "allow": true
            }
        ], 
        "password_protected": false, 
        "url": ""
    }, 
    "permissions": [], 
    "access_inheritance": {
        ".tag": "inherit"
    }
}
```


### transfer_folder {236353503927603000}

| | |
|--|--|
|__Name__| transfer_folder|
|__URL__| https://api.dropboxapi.com/2/sharing/transfer_folder |
|__Method__| POST|

#### Description
[transfer_folder](https://www.dropbox.com/developers/documentation/http/documentation#sharing-transfer_folder)

scope: `sharing.write`

Transfer ownership of a shared folder to a member of the shared folder.
User must have `AccessLevel.owner` access to the shared folder to perform a transfer.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "to_dropbox_id": "dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/transfer_folder'
```




### unmount_folder {384242903227604000}

| | |
|--|--|
|__Name__| unmount_folder|
|__URL__| https://api.dropboxapi.com/2/sharing/unmount_folder |
|__Method__| POST|

#### Description
[unmount_folder](https://www.dropbox.com/developers/documentation/http/documentation#sharing-unmount_folder)

scope: `sharing.write`

The current user unmounts the designated folder. They can re-mount the folder at a later time using `mount_folder`.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/unmount_folder'
```




### unshare_file {81045153227605000}

| | |
|--|--|
|__Name__| unshare_file|
|__URL__| https://api.dropboxapi.com/2/sharing/unshare_file |
|__Method__| POST|

#### Description
[unshare_file](https://www.dropbox.com/developers/documentation/http/documentation#sharing-unshare_file)

scope: `sharing.write`

Remove all members from this file. Does not remove inherited members.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/unshare_file'
```




### unshare_folder {352415829027606000}

| | |
|--|--|
|__Name__| unshare_folder|
|__URL__| https://api.dropboxapi.com/2/sharing/unshare_folder |
|__Method__| POST|

#### Description
[unshare_folder](https://www.dropbox.com/developers/documentation/http/documentation#sharing-unshare_folder)

scope: `sharing.write`

Allows a shared folder owner to unshare the folder.
You&#39;ll need to call `check_job_status` to determine if the action has completed successfully.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "leave_a_copy": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/unshare_folder'
```



#### Response Examples

##### Example 1: unshare_folder response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### update_file_member {16688890627608000}

| | |
|--|--|
|__Name__| update_file_member|
|__URL__| https://api.dropboxapi.com/2/sharing/update_file_member |
|__Method__| POST|

#### Description
[update_file_member](https://www.dropbox.com/developers/documentation/http/documentation#sharing-update_file_member)

scope: `sharing.write`

Changes a member&#39;s access on a shared file.

#### Request

```sh
curl -X 'POST' -d '{
    "file": "id:3kmLmQFnf1AAAAAAAAAAAw", 
    "member": {
        ".tag": "email", 
        "email": "justin@example.com"
    }, 
    "access_level": "viewer"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/update_file_member'
```



#### Response Examples

##### Example 1: update_file_member response

```json
Code: 200 OK
------------------------------------------
{}
```


### update_folder_member {170606576427633000}

| | |
|--|--|
|__Name__| update_folder_member|
|__URL__| https://api.dropboxapi.com/2/sharing/update_folder_member |
|__Method__| POST|

#### Description
[update_folder_member](https://www.dropbox.com/developers/documentation/http/documentation#sharing-update_folder_member)

scope: `sharing.write`

Allows an owner or editor of a shared folder to update another member&#39;s permissions.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "member": {
        ".tag": "email", 
        "email": "justin@example.com"
    }, 
    "access_level": "editor"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/update_folder_member'
```



#### Response Examples

##### Example 1: update_folder_member response

```json
Code: 200 OK
------------------------------------------
{}
```


### update_folder_policy {162278148427635000}

| | |
|--|--|
|__Name__| update_folder_policy|
|__URL__| https://api.dropboxapi.com/2/sharing/update_folder_policy |
|__Method__| POST|

#### Description
[update_folder_policy](https://www.dropbox.com/developers/documentation/http/documentation#sharing-update_folder_policy)

scope: `sharing.write`

Update the sharing policies for a shared folder.
User must have `AccessLevel.owner` access to the shared folder to update its policies.

#### Request

```sh
curl -X 'POST' -d '{
    "shared_folder_id": "84528192421", 
    "member_policy": "team", 
    "acl_update_policy": "owner", 
    "shared_link_policy": "members"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/sharing/update_folder_policy'
```



#### Response Examples

##### Example 1: update_folder_policy response

```json
Code: 200 OK
------------------------------------------
{
    "access_type": {
        ".tag": "owner"
    }, 
    "is_inside_team_folder": false, 
    "is_team_folder": false, 
    "name": "dir", 
    "policy": {
        "acl_update_policy": {
            ".tag": "owner"
        }, 
        "shared_link_policy": {
            ".tag": "anyone"
        }, 
        "member_policy": {
            ".tag": "anyone"
        }, 
        "resolved_member_policy": {
            ".tag": "team"
        }
    }, 
    "preview_url": "https://www.dropbox.com/scl/fo/fir9vjelf", 
    "shared_folder_id": "84528192421", 
    "time_invited": "2016-01-20T00:00:00Z", 
    "path_lower": "/dir", 
    "link_metadata": {
        "audience_options": [
            {
                ".tag": "public"
            }, 
            {
                ".tag": "team"
            }, 
            {
                ".tag": "members"
            }
        ], 
        "current_audience": {
            ".tag": "public"
        }, 
        "link_permissions": [
            {
                "action": {
                    ".tag": "change_audience"
                }, 
                "allow": true
            }
        ], 
        "password_protected": false, 
        "url": ""
    }, 
    "permissions": [], 
    "access_inheritance": {
        ".tag": "inherit"
    }
}
```


## team {273452161227637000}

### features/get_values {42519852027638000}

| | |
|--|--|
|__Name__| features/get_values|
|__URL__| https://api.dropboxapi.com/2/team/features/get_values |
|__Method__| POST|

#### Description
[features/get_values](https://www.dropbox.com/developers/documentation/http/teams#team-features-get_values)

scope: `team_info.read`

Get the values for one or more featues. This route allows you to check your account&#39;s capability for what feature you can access or what value you have for certain features.
Permission : Team information.

#### Request

```sh
curl -X 'POST' -d '{
    "features": [
        {
            ".tag": "upload_api_rate_limit"
        }, 
        {
            ".tag": "has_team_shared_dropbox"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/features/get_values'
```



#### Response Examples

##### Example 1: features/get_values response

```json
Code: 200 OK
------------------------------------------
{
    "values": [
        {
            ".tag": "upload_api_rate_limit", 
            "upload_api_rate_limit": {
                ".tag": "limit", 
                "limit": 25000
            }
        }, 
        {
            ".tag": "has_team_shared_dropbox", 
            "has_team_shared_dropbox": {
                ".tag": "has_team_shared_dropbox", 
                "has_team_shared_dropbox": false
            }
        }
    ]
}
```


### get_info {80656659627641000}

| | |
|--|--|
|__Name__| get_info|
|__URL__| https://api.dropboxapi.com/2/team/get_info |
|__Method__| POST|

#### Description
[get_info](https://www.dropbox.com/developers/documentation/http/teams#team-get_info)

scope: `team_info.read`

Retrieves information about a team.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/team/get_info'
```



#### Response Examples

##### Example 1: get_info response

```json
Code: 200 OK
------------------------------------------
{
    "name": "Dropbox Inc.", 
    "team_id": "dbtid:1234abcd", 
    "num_licensed_users": 5, 
    "num_provisioned_users": 2, 
    "policies": {
        "sharing": {
            "shared_folder_member_policy": {
                ".tag": "team"
            }, 
            "shared_folder_join_policy": {
                ".tag": "from_anyone"
            }, 
            "shared_link_create_policy": {
                ".tag": "team_only"
            }
        }, 
        "emm_state": {
            ".tag": "disabled"
        }, 
        "office_addin": {
            ".tag": "disabled"
        }
    }
}
```


### token/get_authenticated_admin {13825195327643000}

| | |
|--|--|
|__Name__| token/get_authenticated_admin|
|__URL__| https://api.dropboxapi.com/2/team/token/get_authenticated_admin |
|__Method__| POST|

#### Description
[token/get_authenticated_admin](https://www.dropbox.com/developers/documentation/http/teams#team-token-get_authenticated_admin)

scope: `team_info.read`

Returns the member profile of the admin who generated the team access token used to make the call.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/team/token/get_authenticated_admin'
```



#### Response Examples

##### Example 1: token/get_authenticated_admin response

```json
Code: 200 OK
------------------------------------------
{
    "admin_profile": {
        "team_member_id": "dbmid:FDFSVF-DFSDF", 
        "email": "tami@seagull.com", 
        "email_verified": false, 
        "status": {
            ".tag": "active"
        }, 
        "name": {
            "given_name": "Franz", 
            "surname": "Ferdinand", 
            "familiar_name": "Franz", 
            "display_name": "Franz Ferdinand (Personal)", 
            "abbreviated_name": "FF"
        }, 
        "membership_type": {
            ".tag": "full"
        }, 
        "groups": [
            "g:e2db7665347abcd600000000001a2b3c"
        ], 
        "member_folder_id": "20", 
        "external_id": "244423", 
        "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
        "secondary_emails": [
            {
                "email": "grape@strawberry.com", 
                "is_verified": false
            }, 
            {
                "email": "apple@orange.com", 
                "is_verified": true
            }
        ], 
        "joined_on": "2015-05-12T15:50:38Z", 
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
    }
}
```


## team/devices {281350807627645000}

### devices/list_member_devices {374917046027645000}

| | |
|--|--|
|__Name__| devices/list_member_devices|
|__URL__| https://api.dropboxapi.com/2/team/devices/list_member_devices |
|__Method__| POST|

#### Description
[devices/list_member_devices](https://www.dropbox.com/developers/documentation/http/teams#team-devices-list_member_devices)

scope: `sessions.list`

List all device sessions of a team&#39;s member.

#### Request

```sh
curl -X 'POST' -d '{
    "team_member_id": "dbmid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
    "include_web_sessions": true, 
    "include_desktop_clients": true, 
    "include_mobile_clients": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/devices/list_member_devices'
```




### devices/list_members_devices {379305948927647000}

| | |
|--|--|
|__Name__| devices/list_members_devices|
|__URL__| https://api.dropboxapi.com/2/team/devices/list_members_devices |
|__Method__| POST|

#### Description
[devices/list_members_devices](https://www.dropbox.com/developers/documentation/http/teams#team-devices-list_members_devices)

scope: `sessions.list`

List all device sessions of a team.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/devices/list_members_devices'
```




### devices/revoke_device_session {325795528527648000}

| | |
|--|--|
|__Name__| devices/revoke_device_session|
|__URL__| https://api.dropboxapi.com/2/team/devices/revoke_device_session |
|__Method__| POST|

#### Description
[devices/revoke_device_session](https://www.dropbox.com/developers/documentation/http/teams#team-devices-revoke_device_session)

scope: `sessions.modify`

Revoke a device session of a team&#39;s member.

#### Request

```sh
curl -X 'POST' -d '{
    ".tag": "web_session", 
    "session_id": "1234faaf0678bcde", 
    "team_member_id": "dbmid:AAHhy7WsR0x-u4ZCqiDl5Fz5zvuL3kmspwU"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/devices/revoke_device_session'
```




### devices/revoke_device_session_batch {31724042627649000}

| | |
|--|--|
|__Name__| devices/revoke_device_session_batch|
|__URL__| https://api.dropboxapi.com/2/team/devices/revoke_device_session_batch |
|__Method__| POST|

#### Description
[devices/revoke_device_session_batch](https://www.dropbox.com/developers/documentation/http/teams#team-devices-revoke_device_session_batch)

scope: `sessions.modify`

Revoke a list of device sessions of team members.

#### Request

```sh
curl -X 'POST' -d '{
    "revoke_devices": [
        {
            ".tag": "web_session", 
            "session_id": "1234faaf0678bcde", 
            "team_member_id": "dbmid:AAHhy7WsR0x-u4ZCqiDl5Fz5zvuL3kmspwU"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/devices/revoke_device_session_batch'
```




## team/groups {253956949727650000}

### groups/create {386925664227651000}

| | |
|--|--|
|__Name__| groups/create|
|__URL__| https://api.dropboxapi.com/2/team/groups/create |
|__Method__| POST|

#### Description
[groups/create](https://www.dropbox.com/developers/documentation/http/teams#team-groups-create)

scope: `groups.write`

Creates a new, empty group, with a requested name.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "group_name": "Europe sales", 
    "add_creator_as_owner": false, 
    "group_external_id": "group-134"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/create'
```



#### Response Examples

##### Example 1: groups/create response

```json
Code: 200 OK
------------------------------------------
{
    "group_name": "project launch", 
    "group_id": "g:e2db7665347abcd600000000001a2b3c", 
    "group_management_type": {
        ".tag": "user_managed"
    }, 
    "created": 1447255518000, 
    "member_count": 5, 
    "members": [
        {
            "profile": {
                "team_member_id": "dbmid:1234567", 
                "email": "mary@lamb.com", 
                "email_verified": true, 
                "status": {
                    ".tag": "active"
                }, 
                "name": {
                    "given_name": "Franz", 
                    "surname": "Ferdinand", 
                    "familiar_name": "Franz", 
                    "display_name": "Franz Ferdinand (Personal)", 
                    "abbreviated_name": "FF"
                }, 
                "membership_type": {
                    ".tag": "full"
                }, 
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "secondary_emails": [
                    {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }, 
                    {
                        "email": "banana@honeydew.com", 
                        "is_verified": true
                    }, 
                    {
                        "email": "grape@strawberry.com", 
                        "is_verified": false
                    }
                ], 
                "joined_on": "2015-05-12T15:50:38Z", 
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
            }, 
            "access_type": {
                ".tag": "member"
            }
        }
    ]
}
```


### groups/delete {320845097727653000}

| | |
|--|--|
|__Name__| groups/delete|
|__URL__| https://api.dropboxapi.com/2/team/groups/delete |
|__Method__| POST|

#### Description
[groups/delete](https://www.dropbox.com/developers/documentation/http/teams#team-groups-delete)

scope: `groups.write`

Deletes a group.
The group is deleted immediately. However the revoking of group-owned resources may take additional time. Use the `groups/job_status/get` to determine whether this process has completed.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    ".tag": "group_id", 
    "group_id": "g:e2db7665347abcd600000000001a2b3c"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/delete'
```



#### Response Examples

##### Example 1: groups/delete response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### groups/get_info {206576755527654000}

| | |
|--|--|
|__Name__| groups/get_info|
|__URL__| https://api.dropboxapi.com/2/team/groups/get_info |
|__Method__| POST|

#### Description
[groups/get_info](https://www.dropbox.com/developers/documentation/http/teams#team-groups-get_info)

scope: `groups.read`

Retrieves information about one or more groups. Note that the optional field  `GroupFullInfo.members` is not returned for system-managed groups.
Permission : Team Information.

#### Request

```sh
curl -X 'POST' -d '{
    ".tag": "group_ids", 
    "group_ids": [
        "g:e2db7665347abcd600000000001a2b3c", 
        "g:111111147abcd6000000000222222c"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/get_info'
```



#### Response Examples

##### Example 1: groups/get_info response

```json
Code: 200 OK
------------------------------------------
[
    {
        ".tag": "group_info", 
        "group_name": "project launch", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c", 
        "group_management_type": {
            ".tag": "user_managed"
        }, 
        "created": 1447255518000, 
        "member_count": 5, 
        "members": [
            {
                "profile": {
                    "team_member_id": "dbmid:1234567", 
                    "email": "mary@lamb.com", 
                    "email_verified": true, 
                    "status": {
                        ".tag": "active"
                    }, 
                    "name": {
                        "given_name": "Franz", 
                        "surname": "Ferdinand", 
                        "familiar_name": "Franz", 
                        "display_name": "Franz Ferdinand (Personal)", 
                        "abbreviated_name": "FF"
                    }, 
                    "membership_type": {
                        ".tag": "full"
                    }, 
                    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "secondary_emails": [
                        {
                            "email": "apple@orange.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "banana@honeydew.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "grape@strawberry.com", 
                            "is_verified": false
                        }
                    ], 
                    "joined_on": "2015-05-12T15:50:38Z", 
                    "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
                }, 
                "access_type": {
                    ".tag": "member"
                }
            }
        ]
    }
]
```


### groups/job_status/get {335712559527656000}

| | |
|--|--|
|__Name__| groups/job_status/get|
|__URL__| https://api.dropboxapi.com/2/team/groups/job_status/get |
|__Method__| POST|

#### Description
[groups/job_status/get](https://www.dropbox.com/developers/documentation/http/teams#team-groups-job_status-get)

scope: `groups.write`

Once an async_job_id is returned from `groups/delete`, `groups/members/add` , or `groups/members/remove` use this method to poll the status of granting/revoking group members&#39; access to group-owned resources.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/job_status/get'
```



#### Response Examples

##### Example 1: groups/job_status/get response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### groups/list {251803953827658000}

| | |
|--|--|
|__Name__| groups/list|
|__URL__| https://api.dropboxapi.com/2/team/groups/list |
|__Method__| POST|

#### Description
[groups/list](https://www.dropbox.com/developers/documentation/http/teams#team-groups-list)

scope: `groups.read`

Lists groups on a team.
Permission : Team Information.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/list'
```



#### Response Examples

##### Example 1: groups/list response

```json
Code: 200 OK
------------------------------------------
{
    "groups": [
        {
            "group_name": "Test group", 
            "group_id": "g:e2db7665347abcd600000000001a2b3c", 
            "group_management_type": {
                ".tag": "user_managed"
            }, 
            "member_count": 10
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### groups/list/continue {365812223827660000}

| | |
|--|--|
|__Name__| groups/list/continue|
|__URL__| https://api.dropboxapi.com/2/team/groups/list/continue |
|__Method__| POST|

#### Description
[groups/list/continue](https://www.dropbox.com/developers/documentation/http/teams#team-groups-list-continue)

scope: `groups.read`

Once a cursor has been retrieved from `groups/list`, use this to paginate through all groups.
Permission : Team Information.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/list/continue'
```



#### Response Examples

##### Example 1: groups/list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "groups": [
        {
            "group_name": "Test group", 
            "group_id": "g:e2db7665347abcd600000000001a2b3c", 
            "group_management_type": {
                ".tag": "user_managed"
            }, 
            "member_count": 10
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### groups/members/add {346598204127661000}

| | |
|--|--|
|__Name__| groups/members/add|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/add |
|__Method__| POST|

#### Description
[groups/members/add](https://www.dropbox.com/developers/documentation/http/teams#team-groups-members-add)

scope: `groups.write`

Adds members to a group.
The members are added immediately. However the granting of group-owned resources may take additional time. Use the `groups/job_status/get` to determine whether this process has completed.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c"
    }, 
    "members": [
        {
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "access_type": "member"
        }
    ], 
    "return_members": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/add'
```



#### Response Examples

##### Example 1: groups/members/add response

```json
Code: 200 OK
------------------------------------------
{
    "group_info": {
        "group_name": "project launch", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c", 
        "group_management_type": {
            ".tag": "user_managed"
        }, 
        "created": 1447255518000, 
        "member_count": 5, 
        "members": [
            {
                "profile": {
                    "team_member_id": "dbmid:1234567", 
                    "email": "mary@lamb.com", 
                    "email_verified": true, 
                    "status": {
                        ".tag": "active"
                    }, 
                    "name": {
                        "given_name": "Franz", 
                        "surname": "Ferdinand", 
                        "familiar_name": "Franz", 
                        "display_name": "Franz Ferdinand (Personal)", 
                        "abbreviated_name": "FF"
                    }, 
                    "membership_type": {
                        ".tag": "full"
                    }, 
                    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "secondary_emails": [
                        {
                            "email": "apple@orange.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "banana@honeydew.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "grape@strawberry.com", 
                            "is_verified": false
                        }
                    ], 
                    "joined_on": "2015-05-12T15:50:38Z", 
                    "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
                }, 
                "access_type": {
                    ".tag": "member"
                }
            }
        ]
    }, 
    "async_job_id": "99988877733388"
}
```


### groups/members/list {402511923027663000}

| | |
|--|--|
|__Name__| groups/members/list|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/list |
|__Method__| POST|

#### Description
[groups/members/list](https://www.dropbox.com/developers/documentation/http/teams#team-groups-members-list)

scope: `groups.read`

Lists members of a group.
Permission : Team Information.

#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c"
    }, 
    "limit": 100
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/list'
```



#### Response Examples

##### Example 1: groups/members/list response

```json
Code: 200 OK
------------------------------------------
{
    "members": [], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### groups/members/list/continue {345725343427664000}

| | |
|--|--|
|__Name__| groups/members/list/continue|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/list/continue |
|__Method__| POST|

#### Description
[groups/members/list/continue](https://www.dropbox.com/developers/documentation/http/teams#team-groups-members-list-continue)

scope: `groups.read`

Once a cursor has been retrieved from `groups/members/list`, use this to paginate through all members of the group.
Permission : Team information.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/list/continue'
```



#### Response Examples

##### Example 1: groups/members/list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "members": [], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### groups/members/remove {62879383027666000}

| | |
|--|--|
|__Name__| groups/members/remove|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/remove |
|__Method__| POST|

#### Description
[groups/members/remove](https://www.dropbox.com/developers/documentation/http/teams#team-groups-members-remove)

scope: `groups.write`

Removes members from a group.
The members are removed immediately. However the revoking of group-owned resources may take additional time. Use the `groups/job_status/get` to determine whether this process has completed.
This method permits removing the only owner of a group, even in cases where this is not possible via the web client.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c"
    }, 
    "users": [
        {
            ".tag": "team_member_id", 
            "team_member_id": "dbmid:efgh5678"
        }
    ], 
    "return_members": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/remove'
```



#### Response Examples

##### Example 1: groups/members/remove response

```json
Code: 200 OK
------------------------------------------
{
    "group_info": {
        "group_name": "project launch", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c", 
        "group_management_type": {
            ".tag": "user_managed"
        }, 
        "created": 1447255518000, 
        "member_count": 5, 
        "members": [
            {
                "profile": {
                    "team_member_id": "dbmid:1234567", 
                    "email": "mary@lamb.com", 
                    "email_verified": true, 
                    "status": {
                        ".tag": "active"
                    }, 
                    "name": {
                        "given_name": "Franz", 
                        "surname": "Ferdinand", 
                        "familiar_name": "Franz", 
                        "display_name": "Franz Ferdinand (Personal)", 
                        "abbreviated_name": "FF"
                    }, 
                    "membership_type": {
                        ".tag": "full"
                    }, 
                    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "secondary_emails": [
                        {
                            "email": "apple@orange.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "banana@honeydew.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "grape@strawberry.com", 
                            "is_verified": false
                        }
                    ], 
                    "joined_on": "2015-05-12T15:50:38Z", 
                    "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
                }, 
                "access_type": {
                    ".tag": "member"
                }
            }
        ]
    }, 
    "async_job_id": "99988877733388"
}
```


### groups/members/set_access_type {375925915027667000}

| | |
|--|--|
|__Name__| groups/members/set_access_type|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/set_access_type |
|__Method__| POST|

#### Description
[groups/members/set_access_type](https://www.dropbox.com/developers/documentation/http/teams#team-groups-members-set_access_type)

scope: `groups.write`

Sets a member&#39;s access type in a group.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c"
    }, 
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "access_type": "member", 
    "return_members": true
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/set_access_type'
```



#### Response Examples

##### Example 1: groups/members/set_access_type response

```json
Code: 200 OK
------------------------------------------
[
    {
        ".tag": "group_info", 
        "group_name": "project launch", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c", 
        "group_management_type": {
            ".tag": "user_managed"
        }, 
        "created": 1447255518000, 
        "member_count": 5, 
        "members": [
            {
                "profile": {
                    "team_member_id": "dbmid:1234567", 
                    "email": "mary@lamb.com", 
                    "email_verified": true, 
                    "status": {
                        ".tag": "active"
                    }, 
                    "name": {
                        "given_name": "Franz", 
                        "surname": "Ferdinand", 
                        "familiar_name": "Franz", 
                        "display_name": "Franz Ferdinand (Personal)", 
                        "abbreviated_name": "FF"
                    }, 
                    "membership_type": {
                        ".tag": "full"
                    }, 
                    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                    "secondary_emails": [
                        {
                            "email": "apple@orange.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "banana@honeydew.com", 
                            "is_verified": true
                        }, 
                        {
                            "email": "grape@strawberry.com", 
                            "is_verified": false
                        }
                    ], 
                    "joined_on": "2015-05-12T15:50:38Z", 
                    "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
                }, 
                "access_type": {
                    ".tag": "member"
                }
            }
        ]
    }
]
```


### groups/update {327191604727669000}

| | |
|--|--|
|__Name__| groups/update|
|__URL__| https://api.dropboxapi.com/2/team/groups/update |
|__Method__| POST|

#### Description
[groups/update](https://www.dropbox.com/developers/documentation/http/teams#team-groups-update)

scope: `groups.write`

Updates a group&#39;s name and/or external ID.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id", 
        "group_id": "g:e2db7665347abcd600000000001a2b3c"
    }, 
    "return_members": true, 
    "new_group_name": "Europe west sales", 
    "new_group_external_id": "sales-234", 
    "new_group_management_type": "company_managed"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/update'
```



#### Response Examples

##### Example 1: groups/update response

```json
Code: 200 OK
------------------------------------------
{
    "group_name": "project launch", 
    "group_id": "g:e2db7665347abcd600000000001a2b3c", 
    "group_management_type": {
        ".tag": "user_managed"
    }, 
    "created": 1447255518000, 
    "member_count": 5, 
    "members": [
        {
            "profile": {
                "team_member_id": "dbmid:1234567", 
                "email": "mary@lamb.com", 
                "email_verified": true, 
                "status": {
                    ".tag": "active"
                }, 
                "name": {
                    "given_name": "Franz", 
                    "surname": "Ferdinand", 
                    "familiar_name": "Franz", 
                    "display_name": "Franz Ferdinand (Personal)", 
                    "abbreviated_name": "FF"
                }, 
                "membership_type": {
                    ".tag": "full"
                }, 
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "secondary_emails": [
                    {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }, 
                    {
                        "email": "banana@honeydew.com", 
                        "is_verified": true
                    }, 
                    {
                        "email": "grape@strawberry.com", 
                        "is_verified": false
                    }
                ], 
                "joined_on": "2015-05-12T15:50:38Z", 
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
            }, 
            "access_type": {
                ".tag": "member"
            }
        }
    ]
}
```


## team/legal_holds {159203681127671000}

### legal_holds/create_policy {10219588327672000}

| | |
|--|--|
|__Name__| legal_holds/create_policy|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/create_policy |
|__Method__| POST|

#### Description
[legal_holds/create_policy](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-create_policy)

scope: `team_data.member`

Creates new legal hold policy. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "name": "acme cfo policy", 
    "members": [
        "dbmid:FDFSVF-DFSDF"
    ], 
    "start_date": "2016-01-01T00:00:00Z", 
    "end_date": "2017-12-31T00:00:00Z"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/create_policy'
```



#### Response Examples

##### Example 1: legal_holds/create_policy response

```json
Code: 200 OK
------------------------------------------
{
    "id": "pid_dbhid:abcd1234", 
    "name": "acme cfo policy", 
    "members": {
        "team_member_ids": [
            "dbmid:efgh5678"
        ], 
        "permanently_deleted_users": 2
    }, 
    "status": {
        ".tag": "active"
    }, 
    "start_date": "2016-01-01T00:00:00Z", 
    "activation_time": "2016-01-20T00:00:10Z", 
    "end_date": "2017-12-31T00:00:00Z"
}
```


### legal_holds/get_policy {173641389127673000}

| | |
|--|--|
|__Name__| legal_holds/get_policy|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/get_policy |
|__Method__| POST|

#### Description
[legal_holds/get_policy](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-get_policy)

scope: `team_data.member`

Gets a legal hold by Id. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "pid_dbhid:abcd1234"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/get_policy'
```



#### Response Examples

##### Example 1: legal_holds/get_policy response

```json
Code: 200 OK
------------------------------------------
{
    "id": "pid_dbhid:abcd1234", 
    "name": "acme cfo policy", 
    "members": {
        "team_member_ids": [
            "dbmid:efgh5678"
        ], 
        "permanently_deleted_users": 2
    }, 
    "status": {
        ".tag": "active"
    }, 
    "start_date": "2016-01-01T00:00:00Z", 
    "activation_time": "2016-01-20T00:00:10Z", 
    "end_date": "2017-12-31T00:00:00Z"
}
```


### legal_holds/list_held_revisions {73715027527675000}

| | |
|--|--|
|__Name__| legal_holds/list_held_revisions|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/list_held_revisions |
|__Method__| POST|

#### Description
[legal_holds/list_held_revisions](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-list_held_revisions)

scope: `team_data.member`

List the file metadata that&#39;s under the hold. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "pid_dbhid:abcd1234"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/list_held_revisions'
```



#### Response Examples

##### Example 1: legal_holds/list_held_revisions response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "new_filename": "111_222.pdf", 
            "original_revision_id": "ab2rij4i5ojgfd", 
            "original_file_path": "/a.pdf", 
            "server_modified": "2019-08-12T12:08:52Z", 
            "author_member_id": "dbmid:abcd1234abcd1234abcd1234abcd1234a23", 
            "author_member_status": {
                ".tag": "active"
            }, 
            "author_email": "a@a.com", 
            "file_type": "Document", 
            "size": 3, 
            "content_hash": "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234"
        }
    ], 
    "has_more": false
}
```


### legal_holds/list_held_revisions_continue {386481112527677000}

| | |
|--|--|
|__Name__| legal_holds/list_held_revisions_continue|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/list_held_revisions_continue |
|__Method__| POST|

#### Description
[legal_holds/list_held_revisions_continue](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-list_held_revisions_continue)

scope: `team_data.member`

Continue listing the file metadata that&#39;s under the hold. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "pid_dbhid:abcd1234"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/list_held_revisions_continue'
```



#### Response Examples

##### Example 1: legal_holds/list_held_revisions_continue response

```json
Code: 200 OK
------------------------------------------
{
    "entries": [
        {
            "new_filename": "111_222.pdf", 
            "original_revision_id": "ab2rij4i5ojgfd", 
            "original_file_path": "/a.pdf", 
            "server_modified": "2019-08-12T12:08:52Z", 
            "author_member_id": "dbmid:abcd1234abcd1234abcd1234abcd1234a23", 
            "author_member_status": {
                ".tag": "active"
            }, 
            "author_email": "a@a.com", 
            "file_type": "Document", 
            "size": 3, 
            "content_hash": "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234"
        }
    ], 
    "has_more": false
}
```


### legal_holds/list_policies {384807915927679000}

| | |
|--|--|
|__Name__| legal_holds/list_policies|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/list_policies |
|__Method__| POST|

#### Description
[legal_holds/list_policies](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-list_policies)

scope: `team_data.member`

Lists legal holds on a team. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "include_released": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/list_policies'
```



#### Response Examples

##### Example 1: legal_holds/list_policies response

```json
Code: 200 OK
------------------------------------------
{
    "policies": [
        {
            "id": "pid_dbhid:abcd1234", 
            "name": "acme cfo policy", 
            "members": {
                "team_member_ids": [
                    "dbmid:efgh5678"
                ], 
                "permanently_deleted_users": 2
            }, 
            "status": {
                ".tag": "active"
            }, 
            "start_date": "2016-01-01T00:00:00Z", 
            "activation_time": "2016-01-20T00:00:10Z", 
            "end_date": "2017-12-31T00:00:00Z"
        }
    ]
}
```


### legal_holds/release_policy {366673420027684000}

| | |
|--|--|
|__Name__| legal_holds/release_policy|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/release_policy |
|__Method__| POST|

#### Description
[legal_holds/release_policy](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-release_policy)

scope: `team_data.member`

Releases a legal hold by Id. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "pid_dbhid:abcd1234"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/release_policy'
```




### legal_holds/update_policy {239481002827685000}

| | |
|--|--|
|__Name__| legal_holds/update_policy|
|__URL__| https://api.dropboxapi.com/2/team/legal_holds/update_policy |
|__Method__| POST|

#### Description
[legal_holds/update_policy](https://www.dropbox.com/developers/documentation/http/teams#team-legal_holds-update_policy)

scope: `team_data.member`

Updates a legal hold. Note: Legal Holds is a paid add-on. Not all teams have the feature.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "id": "pid_dbhid:abcd1234", 
    "members": [
        "dbmid:FDFSVF-DFSDF"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/legal_holds/update_policy'
```



#### Response Examples

##### Example 1: legal_holds/update_policy response

```json
Code: 200 OK
------------------------------------------
{
    "id": "pid_dbhid:abcd1234", 
    "name": "acme cfo policy", 
    "members": {
        "team_member_ids": [
            "dbmid:efgh5678"
        ], 
        "permanently_deleted_users": 2
    }, 
    "status": {
        ".tag": "active"
    }, 
    "start_date": "2016-01-01T00:00:00Z", 
    "activation_time": "2016-01-20T00:00:10Z", 
    "end_date": "2017-12-31T00:00:00Z"
}
```


## team/linked_apps {195538319327687000}

### linked_apps/list_member_linked_apps {363555978427687000}

| | |
|--|--|
|__Name__| linked_apps/list_member_linked_apps|
|__URL__| https://api.dropboxapi.com/2/team/linked_apps/list_member_linked_apps |
|__Method__| POST|

#### Description
[linked_apps/list_member_linked_apps](https://www.dropbox.com/developers/documentation/http/teams#team-linked_apps-list_member_linked_apps)

scope: `sessions.list`

List all linked applications of the team member.
Note, this endpoint does not list any team-linked applications.

#### Request

```sh
curl -X 'POST' -d '{
    "team_member_id": "dbmid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/linked_apps/list_member_linked_apps'
```




### linked_apps/list_members_linked_apps {378363165127688000}

| | |
|--|--|
|__Name__| linked_apps/list_members_linked_apps|
|__URL__| https://api.dropboxapi.com/2/team/linked_apps/list_members_linked_apps |
|__Method__| POST|

#### Description
[linked_apps/list_members_linked_apps](https://www.dropbox.com/developers/documentation/http/teams#team-linked_apps-list_members_linked_apps)

scope: `sessions.list`

List all applications linked to the team members&#39; accounts.
Note, this endpoint does not list any team-linked applications.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/linked_apps/list_members_linked_apps'
```




### linked_apps/revoke_linked_app {32542964827690000}

| | |
|--|--|
|__Name__| linked_apps/revoke_linked_app|
|__URL__| https://api.dropboxapi.com/2/team/linked_apps/revoke_linked_app |
|__Method__| POST|

#### Description
[linked_apps/revoke_linked_app](https://www.dropbox.com/developers/documentation/http/teams#team-linked_apps-revoke_linked_app)

scope: `sessions.modify`

Revoke a linked application of the team member.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/linked_apps/revoke_linked_app'
```




### linked_apps/revoke_linked_app_batch {55291560327691000}

| | |
|--|--|
|__Name__| linked_apps/revoke_linked_app_batch|
|__URL__| https://api.dropboxapi.com/2/team/linked_apps/revoke_linked_app_batch |
|__Method__| POST|

#### Description
[linked_apps/revoke_linked_app_batch](https://www.dropbox.com/developers/documentation/http/teams#team-linked_apps-revoke_linked_app_batch)

scope: `sessions.modify`

Revoke a list of linked applications of the team members.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/linked_apps/revoke_linked_app_batch'
```




## team/member_space_limits {251762688727693000}

### member_space_limits/excluded_users/add {106755660927693000}

| | |
|--|--|
|__Name__| member_space_limits/excluded_users/add|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/add |
|__Method__| POST|

#### Description
[member_space_limits/excluded_users/add](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-excluded_users-add)

scope: `members.write`

Add users to member space limits excluded users list.

#### Request

```sh
curl -X 'POST' -d '{
    "users": [
        {
            ".tag": "team_member_id", 
            "team_member_id": "dbmid:efgh5678"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/add'
```



#### Response Examples

##### Example 1: member_space_limits/excluded_users/add response

```json
Code: 200 OK
------------------------------------------
{
    "status": {
        ".tag": "success"
    }
}
```


### member_space_limits/excluded_users/list {389475064627695000}

| | |
|--|--|
|__Name__| member_space_limits/excluded_users/list|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/list |
|__Method__| POST|

#### Description
[member_space_limits/excluded_users/list](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-excluded_users-list)

scope: `members.read`

List member space limits excluded users.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/list'
```



#### Response Examples

##### Example 1: member_space_limits/excluded_users/list response

```json
Code: 200 OK
------------------------------------------
{
    "users": [], 
    "has_more": false, 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### member_space_limits/excluded_users/list/continue {174331409827696000}

| | |
|--|--|
|__Name__| member_space_limits/excluded_users/list/continue|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/list/continue |
|__Method__| POST|

#### Description
[member_space_limits/excluded_users/list/continue](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-excluded_users-list-continue)

scope: `members.read`

Continue listing member space limits excluded users.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/list/continue'
```



#### Response Examples

##### Example 1: member_space_limits/excluded_users/list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "users": [], 
    "has_more": false, 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}
```


### member_space_limits/excluded_users/remove {300338659027729000}

| | |
|--|--|
|__Name__| member_space_limits/excluded_users/remove|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/remove |
|__Method__| POST|

#### Description
[member_space_limits/excluded_users/remove](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-excluded_users-remove)

scope: `members.write`

Remove users from member space limits excluded users list.

#### Request

```sh
curl -X 'POST' -d '{
    "users": [
        {
            ".tag": "team_member_id", 
            "team_member_id": "dbmid:efgh5678"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/excluded_users/remove'
```



#### Response Examples

##### Example 1: member_space_limits/excluded_users/remove response

```json
Code: 200 OK
------------------------------------------
{
    "status": {
        ".tag": "success"
    }
}
```


### member_space_limits/get_custom_quota {101132623327730000}

| | |
|--|--|
|__Name__| member_space_limits/get_custom_quota|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/get_custom_quota |
|__Method__| POST|

#### Description
[member_space_limits/get_custom_quota](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-get_custom_quota)

scope: `members.read`

Get users custom quota. Returns none as the custom quota if none was set. A maximum of 1000 members can be specified in a single call.

#### Request

```sh
curl -X 'POST' -d '{
    "users": [
        {
            ".tag": "team_member_id", 
            "team_member_id": "dbmid:efgh5678"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/get_custom_quota'
```



#### Response Examples

##### Example 1: member_space_limits/get_custom_quota response

```json
Code: 200 OK
------------------------------------------
[
    {
        ".tag": "other"
    }
]
```


### member_space_limits/remove_custom_quota {366784513327732000}

| | |
|--|--|
|__Name__| member_space_limits/remove_custom_quota|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/remove_custom_quota |
|__Method__| POST|

#### Description
[member_space_limits/remove_custom_quota](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-remove_custom_quota)

scope: `members.write`

Remove users custom quota. A maximum of 1000 members can be specified in a single call.

#### Request

```sh
curl -X 'POST' -d '{
    "users": [
        {
            ".tag": "team_member_id", 
            "team_member_id": "dbmid:efgh5678"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/remove_custom_quota'
```



#### Response Examples

##### Example 1: member_space_limits/remove_custom_quota response

```json
Code: 200 OK
------------------------------------------
[
    {
        ".tag": "other"
    }
]
```


### member_space_limits/set_custom_quota {33979944527733000}

| | |
|--|--|
|__Name__| member_space_limits/set_custom_quota|
|__URL__| https://api.dropboxapi.com/2/team/member_space_limits/set_custom_quota |
|__Method__| POST|

#### Description
[member_space_limits/set_custom_quota](https://www.dropbox.com/developers/documentation/http/teams#team-member_space_limits-set_custom_quota)

scope: `members.read`

Set users custom quota. Custom quota has to be at least 15GB. A maximum of 1000 members can be specified in a single call.

#### Request

```sh
curl -X 'POST' -d '{
    "users_and_quotas": [
        {
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "quota_gb": 30
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/member_space_limits/set_custom_quota'
```



#### Response Examples

##### Example 1: member_space_limits/set_custom_quota response

```json
Code: 200 OK
------------------------------------------
[
    {
        ".tag": "other"
    }
]
```


## team/members {212973633227735000}

### members/add {71874833227735000}

| | |
|--|--|
|__Name__| members/add|
|__URL__| https://api.dropboxapi.com/2/team/members/add |
|__Method__| POST|

#### Description
[members/add](https://www.dropbox.com/developers/documentation/http/teams#team-members-add)

scope: `members.write`

Adds members to a team.
Permission : Team member management
A maximum of 20 members can be specified in a single call.
If no Dropbox account exists with the email address specified, a new Dropbox account will be created with the given email address, and that account will be invited to the team.
If a personal Dropbox account exists with the email address specified in the call, this call will create a placeholder Dropbox account for the user on the team and send an email inviting the user to migrate their existing personal account onto the team.
Team member management apps are required to set an initial given_name and surname for a user to use in the team invitation and for &#39;Perform as team member&#39; actions taken on the user before they become &#39;active&#39;.

#### Request

```sh
curl -X 'POST' -d '{
    "new_members": [
        {
            "member_email": "tom.s@company.com", 
            "member_given_name": "Tom", 
            "member_surname": "Silverstone", 
            "member_external_id": "company_id:342432", 
            "send_welcome_email": true, 
            "role": "member_only"
        }
    ], 
    "force_async": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/add'
```



#### Response Examples

##### Example 1: members/add response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "complete": [
        {
            ".tag": "success", 
            "profile": {
                "team_member_id": "dbmid:FDFSVF-DFSDF", 
                "email": "tami@seagull.com", 
                "email_verified": false, 
                "status": {
                    ".tag": "active"
                }, 
                "name": {
                    "given_name": "Franz", 
                    "surname": "Ferdinand", 
                    "familiar_name": "Franz", 
                    "display_name": "Franz Ferdinand (Personal)", 
                    "abbreviated_name": "FF"
                }, 
                "membership_type": {
                    ".tag": "full"
                }, 
                "groups": [
                    "g:e2db7665347abcd600000000001a2b3c"
                ], 
                "member_folder_id": "20", 
                "external_id": "244423", 
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "secondary_emails": [
                    {
                        "email": "grape@strawberry.com", 
                        "is_verified": false
                    }, 
                    {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }
                ], 
                "joined_on": "2015-05-12T15:50:38Z", 
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
            }, 
            "role": {
                ".tag": "member_only"
            }
        }
    ]
}
```


### members/add/job_status/get {114323370027740000}

| | |
|--|--|
|__Name__| members/add/job_status/get|
|__URL__| https://api.dropboxapi.com/2/team/members/add/job_status/get |
|__Method__| POST|

#### Description
[members/add/job_status/get](https://www.dropbox.com/developers/documentation/http/teams#team-members-add-job_status-get)

scope: `members.write`

Once an async_job_id is returned from `members/add` , use this to poll the status of the asynchronous request.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/add/job_status/get'
```



#### Response Examples

##### Example 1: members/add/job_status/get response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "complete": [
        {
            ".tag": "success", 
            "profile": {
                "team_member_id": "dbmid:FDFSVF-DFSDF", 
                "email": "tami@seagull.com", 
                "email_verified": false, 
                "status": {
                    ".tag": "active"
                }, 
                "name": {
                    "given_name": "Franz", 
                    "surname": "Ferdinand", 
                    "familiar_name": "Franz", 
                    "display_name": "Franz Ferdinand (Personal)", 
                    "abbreviated_name": "FF"
                }, 
                "membership_type": {
                    ".tag": "full"
                }, 
                "groups": [
                    "g:e2db7665347abcd600000000001a2b3c"
                ], 
                "member_folder_id": "20", 
                "external_id": "244423", 
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "secondary_emails": [
                    {
                        "email": "grape@strawberry.com", 
                        "is_verified": false
                    }, 
                    {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }
                ], 
                "joined_on": "2015-05-12T15:50:38Z", 
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
            }, 
            "role": {
                ".tag": "member_only"
            }
        }
    ]
}
```


### members/delete_profile_photo {297190605127741000}

| | |
|--|--|
|__Name__| members/delete_profile_photo|
|__URL__| https://api.dropboxapi.com/2/team/members/delete_profile_photo |
|__Method__| POST|

#### Description
[members/delete_profile_photo](https://www.dropbox.com/developers/documentation/http/teams#team-members-delete_profile_photo)

scope: `members.write`

Deletes a team member&#39;s profile photo.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/delete_profile_photo'
```



#### Response Examples

##### Example 1: members/delete_profile_photo response

```json
Code: 200 OK
------------------------------------------
{
    "profile": {
        "team_member_id": "dbmid:FDFSVF-DFSDF", 
        "email": "tami@seagull.com", 
        "email_verified": false, 
        "status": {
            ".tag": "active"
        }, 
        "name": {
            "given_name": "Franz", 
            "surname": "Ferdinand", 
            "familiar_name": "Franz", 
            "display_name": "Franz Ferdinand (Personal)", 
            "abbreviated_name": "FF"
        }, 
        "membership_type": {
            ".tag": "full"
        }, 
        "groups": [
            "g:e2db7665347abcd600000000001a2b3c"
        ], 
        "member_folder_id": "20", 
        "external_id": "244423", 
        "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
        "secondary_emails": [
            {
                "email": "grape@strawberry.com", 
                "is_verified": false
            }, 
            {
                "email": "apple@orange.com", 
                "is_verified": true
            }
        ], 
        "joined_on": "2015-05-12T15:50:38Z", 
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
    }, 
    "role": {
        ".tag": "member_only"
    }
}
```


### members/get_info {304055255627743000}

| | |
|--|--|
|__Name__| members/get_info|
|__URL__| https://api.dropboxapi.com/2/team/members/get_info |
|__Method__| POST|

#### Description
[members/get_info](https://www.dropbox.com/developers/documentation/http/teams#team-members-get_info)

scope: `members.read`

Returns information about multiple team members.
Permission : Team information
This endpoint will return `MembersGetInfoItem.id_not_found`, for IDs (or emails) that cannot be matched to a valid team member.

#### Request

```sh
curl -X 'POST' -d '{
    "members": [
        {
            ".tag": "team_member_id", 
            "team_member_id": "dbmid:efgh5678"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/get_info'
```



#### Response Examples

##### Example 1: members/get_info response

```json
Code: 200 OK
------------------------------------------
[
    {
        ".tag": "member_info", 
        "profile": {
            "team_member_id": "dbmid:FDFSVF-DFSDF", 
            "email": "tami@seagull.com", 
            "email_verified": false, 
            "status": {
                ".tag": "active"
            }, 
            "name": {
                "given_name": "Franz", 
                "surname": "Ferdinand", 
                "familiar_name": "Franz", 
                "display_name": "Franz Ferdinand (Personal)", 
                "abbreviated_name": "FF"
            }, 
            "membership_type": {
                ".tag": "full"
            }, 
            "groups": [
                "g:e2db7665347abcd600000000001a2b3c"
            ], 
            "member_folder_id": "20", 
            "external_id": "244423", 
            "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
            "secondary_emails": [
                {
                    "email": "grape@strawberry.com", 
                    "is_verified": false
                }, 
                {
                    "email": "apple@orange.com", 
                    "is_verified": true
                }
            ], 
            "joined_on": "2015-05-12T15:50:38Z", 
            "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
        }, 
        "role": {
            ".tag": "member_only"
        }
    }
]
```


### members/list {300754253727745000}

| | |
|--|--|
|__Name__| members/list|
|__URL__| https://api.dropboxapi.com/2/team/members/list |
|__Method__| POST|

#### Description
[members/list](https://www.dropbox.com/developers/documentation/http/teams#team-members-list)

scope: `members.read`

Lists members of a team.
Permission : Team information.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100, 
    "include_removed": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/list'
```



#### Response Examples

##### Example 1: members/list response

```json
Code: 200 OK
------------------------------------------
{
    "members": [
        {
            "profile": {
                "team_member_id": "dbmid:FDFSVF-DFSDF", 
                "email": "tami@seagull.com", 
                "email_verified": false, 
                "status": {
                    ".tag": "active"
                }, 
                "name": {
                    "given_name": "Franz", 
                    "surname": "Ferdinand", 
                    "familiar_name": "Franz", 
                    "display_name": "Franz Ferdinand (Personal)", 
                    "abbreviated_name": "FF"
                }, 
                "membership_type": {
                    ".tag": "full"
                }, 
                "groups": [
                    "g:e2db7665347abcd600000000001a2b3c"
                ], 
                "member_folder_id": "20", 
                "external_id": "244423", 
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "secondary_emails": [
                    {
                        "email": "grape@strawberry.com", 
                        "is_verified": false
                    }, 
                    {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }
                ], 
                "joined_on": "2015-05-12T15:50:38Z", 
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
            }, 
            "role": {
                ".tag": "member_only"
            }
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": true
}
```


### members/list/continue {231514482727747000}

| | |
|--|--|
|__Name__| members/list/continue|
|__URL__| https://api.dropboxapi.com/2/team/members/list/continue |
|__Method__| POST|

#### Description
[members/list/continue](https://www.dropbox.com/developers/documentation/http/teams#team-members-list-continue)

scope: `members.read`

Once a cursor has been retrieved from `members/list`, use this to paginate through all team members.
Permission : Team information.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/list/continue'
```



#### Response Examples

##### Example 1: members/list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "members": [
        {
            "profile": {
                "team_member_id": "dbmid:FDFSVF-DFSDF", 
                "email": "tami@seagull.com", 
                "email_verified": false, 
                "status": {
                    ".tag": "active"
                }, 
                "name": {
                    "given_name": "Franz", 
                    "surname": "Ferdinand", 
                    "familiar_name": "Franz", 
                    "display_name": "Franz Ferdinand (Personal)", 
                    "abbreviated_name": "FF"
                }, 
                "membership_type": {
                    ".tag": "full"
                }, 
                "groups": [
                    "g:e2db7665347abcd600000000001a2b3c"
                ], 
                "member_folder_id": "20", 
                "external_id": "244423", 
                "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
                "secondary_emails": [
                    {
                        "email": "grape@strawberry.com", 
                        "is_verified": false
                    }, 
                    {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }
                ], 
                "joined_on": "2015-05-12T15:50:38Z", 
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
            }, 
            "role": {
                ".tag": "member_only"
            }
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": true
}
```


### members/move_former_member_files {217016956327749000}

| | |
|--|--|
|__Name__| members/move_former_member_files|
|__URL__| https://api.dropboxapi.com/2/team/members/move_former_member_files |
|__Method__| POST|

#### Description
[members/move_former_member_files](https://www.dropbox.com/developers/documentation/http/teams#team-members-move_former_member_files)

scope: `members.write`

Moves removed member&#39;s files to a different member. This endpoint initiates an asynchronous job. To obtain the final result of the job, the client should periodically poll `members/move_former_member_files/job_status/check`.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "transfer_dest_id": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "transfer_admin_id": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/move_former_member_files'
```



#### Response Examples

##### Example 1: members/move_former_member_files response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### members/move_former_member_files/job_status/check {319421584927751000}

| | |
|--|--|
|__Name__| members/move_former_member_files/job_status/check|
|__URL__| https://api.dropboxapi.com/2/team/members/move_former_member_files/job_status/check |
|__Method__| POST|

#### Description
[members/move_former_member_files/job_status/check](https://www.dropbox.com/developers/documentation/http/teams#team-members-move_former_member_files-job_status-check)

scope: `members.write`

Once an async_job_id is returned from `members/move_former_member_files` , use this to poll the status of the asynchronous request.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/move_former_member_files/job_status/check'
```



#### Response Examples

##### Example 1: members/move_former_member_files/job_status/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### members/recover {166556243527752000}

| | |
|--|--|
|__Name__| members/recover|
|__URL__| https://api.dropboxapi.com/2/team/members/recover |
|__Method__| POST|

#### Description
[members/recover](https://www.dropbox.com/developers/documentation/http/teams#team-members-recover)

scope: `members.delete`

Recover a deleted member.
Permission : Team member management
Exactly one of team_member_id, email, or external_id must be provided to identify the user account.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/recover'
```




### members/remove {424361901327754000}

| | |
|--|--|
|__Name__| members/remove|
|__URL__| https://api.dropboxapi.com/2/team/members/remove |
|__Method__| POST|

#### Description
[members/remove](https://www.dropbox.com/developers/documentation/http/teams#team-members-remove)

scope: `members.delete`

Removes a member from a team.
Permission : Team member management
Exactly one of team_member_id, email, or external_id must be provided to identify the user account.
Accounts can be recovered via `members/recover` for a 7 day period or until the account has been permanently deleted or transferred to another account (whichever comes first). Calling `members/add` while a user is still recoverable on your team will return with `MemberAddResult.user_already_on_team`.
Accounts can have their files transferred via the admin console for a limited time, based on the version history length associated with the team (180 days for most teams).
This endpoint may initiate an asynchronous job. To obtain the final result of the job, the client should periodically poll `members/remove/job_status/get`.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "wipe_data": true, 
    "transfer_dest_id": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "transfer_admin_id": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "keep_account": false, 
    "retain_team_shares": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/remove'
```



#### Response Examples

##### Example 1: members/remove response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### members/remove/job_status/get {328045592327755000}

| | |
|--|--|
|__Name__| members/remove/job_status/get|
|__URL__| https://api.dropboxapi.com/2/team/members/remove/job_status/get |
|__Method__| POST|

#### Description
[members/remove/job_status/get](https://www.dropbox.com/developers/documentation/http/teams#team-members-remove-job_status-get)

scope: `members.delete`

Once an async_job_id is returned from `members/remove` , use this to poll the status of the asynchronous request.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/remove/job_status/get'
```



#### Response Examples

##### Example 1: members/remove/job_status/get response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```


### members/secondary_emails/add {23948258727757000}

| | |
|--|--|
|__Name__| members/secondary_emails/add|
|__URL__| https://api.dropboxapi.com/2/team/members/secondary_emails/add |
|__Method__| POST|

#### Description
[members/secondary_emails/add](https://www.dropbox.com/developers/documentation/http/teams#team-members-secondary_emails-add)

scope: `members.write`

Add secondary emails to users.
Permission : Team member management.
Emails that are on verified domains will be verified automatically. For each email address not on a verified domain a verification email will be sent.

#### Request

```sh
curl -X 'POST' -d '{
    "new_secondary_emails": [
        {
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "secondary_emails": [
                "bob2@hotmail.com", 
                "bob@inst.gov"
            ]
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/secondary_emails/add'
```



#### Response Examples

##### Example 1: members/secondary_emails/add response

```json
Code: 200 OK
------------------------------------------
{
    "results": [
        {
            ".tag": "success", 
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "results": [
                {
                    ".tag": "success", 
                    "success": {
                        "email": "apple@orange.com", 
                        "is_verified": true
                    }
                }, 
                {
                    ".tag": "unavailable", 
                    "unavailable": "alice@example.com"
                }
            ]
        }, 
        {
            ".tag": "invalid_user", 
            "invalid_user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }
        }
    ]
}
```


### members/secondary_emails/delete {211137160327758000}

| | |
|--|--|
|__Name__| members/secondary_emails/delete|
|__URL__| https://api.dropboxapi.com/2/team/members/secondary_emails/delete |
|__Method__| POST|

#### Description
[members/secondary_emails/delete](https://www.dropbox.com/developers/documentation/http/teams#team-members-secondary_emails-delete)

scope: `members.write`

Delete secondary emails from users
Permission : Team member management.
Users will be notified of deletions of verified secondary emails at both the secondary email and their primary email.

#### Request

```sh
curl -X 'POST' -d '{
    "emails_to_delete": [
        {
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "secondary_emails": [
                "bob2@hotmail.com", 
                "bob@inst.gov"
            ]
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/secondary_emails/delete'
```



#### Response Examples

##### Example 1: members/secondary_emails/delete response

```json
Code: 200 OK
------------------------------------------
{
    "results": [
        {
            ".tag": "success", 
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "results": [
                {
                    ".tag": "success", 
                    "success": "alice@example.com"
                }, 
                {
                    ".tag": "not_found", 
                    "not_found": "alic@example.com"
                }
            ]
        }
    ]
}
```


### members/secondary_emails/resend_verification_emails {274260857727760000}

| | |
|--|--|
|__Name__| members/secondary_emails/resend_verification_emails|
|__URL__| https://api.dropboxapi.com/2/team/members/secondary_emails/resend_verification_emails |
|__Method__| POST|

#### Description
[members/secondary_emails/resend_verification_emails](https://www.dropbox.com/developers/documentation/http/teams#team-members-secondary_emails-resend_verification_emails)

scope: `members.write`

Resend secondary email verification emails.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "emails_to_resend": [
        {
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "secondary_emails": [
                "bob2@hotmail.com", 
                "bob@inst.gov"
            ]
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/secondary_emails/resend_verification_emails'
```



#### Response Examples

##### Example 1: members/secondary_emails/resend_verification_emails response

```json
Code: 200 OK
------------------------------------------
{
    "results": [
        {
            ".tag": "success", 
            "user": {
                ".tag": "team_member_id", 
                "team_member_id": "dbmid:efgh5678"
            }, 
            "results": [
                {
                    ".tag": "success", 
                    "success": "alice@example.com"
                }
            ]
        }
    ]
}
```


### members/send_welcome_email {104509018727762000}

| | |
|--|--|
|__Name__| members/send_welcome_email|
|__URL__| https://api.dropboxapi.com/2/team/members/send_welcome_email |
|__Method__| POST|

#### Description
[members/send_welcome_email](https://www.dropbox.com/developers/documentation/http/teams#team-members-send_welcome_email)

scope: `members.write`

Sends welcome email to pending team member.
Permission : Team member management
Exactly one of team_member_id, email, or external_id must be provided to identify the user account.
No-op if team member is not pending.

#### Request

```sh
curl -X 'POST' -d '{
    ".tag": "team_member_id", 
    "team_member_id": "dbmid:efgh5678"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/send_welcome_email'
```




### members/set_admin_permissions {258288388027763000}

| | |
|--|--|
|__Name__| members/set_admin_permissions|
|__URL__| https://api.dropboxapi.com/2/team/members/set_admin_permissions |
|__Method__| POST|

#### Description
[members/set_admin_permissions](https://www.dropbox.com/developers/documentation/http/teams#team-members-set_admin_permissions)

scope: `members.write`

Updates a team member&#39;s permissions.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "new_role": "member_only"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/set_admin_permissions'
```



#### Response Examples

##### Example 1: members/set_admin_permissions response

```json
Code: 200 OK
------------------------------------------
{
    "team_member_id": "dbmid:9978889", 
    "role": {
        ".tag": "member_only"
    }
}
```


### members/set_profile {207803442527764000}

| | |
|--|--|
|__Name__| members/set_profile|
|__URL__| https://api.dropboxapi.com/2/team/members/set_profile |
|__Method__| POST|

#### Description
[members/set_profile](https://www.dropbox.com/developers/documentation/http/teams#team-members-set_profile)

scope: `members.write`

Updates a team member&#39;s profile.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "new_email": "t.smith@domain.com", 
    "new_surname": "Smith"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/set_profile'
```



#### Response Examples

##### Example 1: members/set_profile response

```json
Code: 200 OK
------------------------------------------
{
    "profile": {
        "team_member_id": "dbmid:FDFSVF-DFSDF", 
        "email": "tami@seagull.com", 
        "email_verified": false, 
        "status": {
            ".tag": "active"
        }, 
        "name": {
            "given_name": "Franz", 
            "surname": "Ferdinand", 
            "familiar_name": "Franz", 
            "display_name": "Franz Ferdinand (Personal)", 
            "abbreviated_name": "FF"
        }, 
        "membership_type": {
            ".tag": "full"
        }, 
        "groups": [
            "g:e2db7665347abcd600000000001a2b3c"
        ], 
        "member_folder_id": "20", 
        "external_id": "244423", 
        "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
        "secondary_emails": [
            {
                "email": "grape@strawberry.com", 
                "is_verified": false
            }, 
            {
                "email": "apple@orange.com", 
                "is_verified": true
            }
        ], 
        "joined_on": "2015-05-12T15:50:38Z", 
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
    }, 
    "role": {
        ".tag": "member_only"
    }
}
```


### members/set_profile_photo {340772153027766000}

| | |
|--|--|
|__Name__| members/set_profile_photo|
|__URL__| https://api.dropboxapi.com/2/team/members/set_profile_photo |
|__Method__| POST|

#### Description
[members/set_profile_photo](https://www.dropbox.com/developers/documentation/http/teams#team-members-set_profile_photo)

scope: `members.write`

Updates a team member&#39;s profile photo.
Permission : Team member management.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "photo": {
        ".tag": "base64_data", 
        "base64_data": "SW1hZ2UgZGF0YSBpbiBiYXNlNjQtZW5jb2RlZCBieXRlcy4gTm90IGEgdmFsaWQgZXhhbXBsZS4="
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/set_profile_photo'
```



#### Response Examples

##### Example 1: members/set_profile_photo response

```json
Code: 200 OK
------------------------------------------
{
    "profile": {
        "team_member_id": "dbmid:FDFSVF-DFSDF", 
        "email": "tami@seagull.com", 
        "email_verified": false, 
        "status": {
            ".tag": "active"
        }, 
        "name": {
            "given_name": "Franz", 
            "surname": "Ferdinand", 
            "familiar_name": "Franz", 
            "display_name": "Franz Ferdinand (Personal)", 
            "abbreviated_name": "FF"
        }, 
        "membership_type": {
            ".tag": "full"
        }, 
        "groups": [
            "g:e2db7665347abcd600000000001a2b3c"
        ], 
        "member_folder_id": "20", 
        "external_id": "244423", 
        "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
        "secondary_emails": [
            {
                "email": "grape@strawberry.com", 
                "is_verified": false
            }, 
            {
                "email": "apple@orange.com", 
                "is_verified": true
            }
        ], 
        "joined_on": "2015-05-12T15:50:38Z", 
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
    }, 
    "role": {
        ".tag": "member_only"
    }
}
```


### members/suspend {189042973927768000}

| | |
|--|--|
|__Name__| members/suspend|
|__URL__| https://api.dropboxapi.com/2/team/members/suspend |
|__Method__| POST|

#### Description
[members/suspend](https://www.dropbox.com/developers/documentation/http/teams#team-members-suspend)

scope: `members.write`

Suspend a member from a team.
Permission : Team member management
Exactly one of team_member_id, email, or external_id must be provided to identify the user account.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }, 
    "wipe_data": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/suspend'
```




### members/unsuspend {234421721427769000}

| | |
|--|--|
|__Name__| members/unsuspend|
|__URL__| https://api.dropboxapi.com/2/team/members/unsuspend |
|__Method__| POST|

#### Description
[members/unsuspend](https://www.dropbox.com/developers/documentation/http/teams#team-members-unsuspend)

scope: `members.write`

Unsuspend a member from a team.
Permission : Team member management
Exactly one of team_member_id, email, or external_id must be provided to identify the user account.

#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "team_member_id", 
        "team_member_id": "dbmid:efgh5678"
    }
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/unsuspend'
```




## team/namespaces {270064422127770000}

### namespaces/list {253360555027771000}

| | |
|--|--|
|__Name__| namespaces/list|
|__URL__| https://api.dropboxapi.com/2/team/namespaces/list |
|__Method__| POST|

#### Description
[namespaces/list](https://www.dropbox.com/developers/documentation/http/teams#team-namespaces-list)

scope: `team_data.member`

Returns a list of all team-accessible namespaces. This list includes team folders, shared folders containing team members, team members&#39; home namespaces, and team members&#39; app folders. Home namespaces and app folders are always owned by this team or members of the team, but shared folders may be owned by other users or other teams. Duplicates may occur in the list.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 1
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/namespaces/list'
```



#### Response Examples

##### Example 1: namespaces/list response

```json
Code: 200 OK
------------------------------------------
{
    "namespaces": [
        {
            "name": "Marketing", 
            "namespace_id": "123456789", 
            "namespace_type": {
                ".tag": "shared_folder"
            }
        }, 
        {
            "name": "Franz Ferdinand", 
            "namespace_id": "123456789", 
            "namespace_type": {
                ".tag": "team_member_folder"
            }, 
            "team_member_id": "dbmid:1234567"
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### namespaces/list/continue {145816461827774000}

| | |
|--|--|
|__Name__| namespaces/list/continue|
|__URL__| https://api.dropboxapi.com/2/team/namespaces/list/continue |
|__Method__| POST|

#### Description
[namespaces/list/continue](https://www.dropbox.com/developers/documentation/http/teams#team-namespaces-list-continue)

scope: `team_data.member`

Once a cursor has been retrieved from `namespaces/list`, use this to paginate through all team-accessible namespaces. Duplicates may occur in the list.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/namespaces/list/continue'
```



#### Response Examples

##### Example 1: namespaces/list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "namespaces": [
        {
            "name": "Marketing", 
            "namespace_id": "123456789", 
            "namespace_type": {
                ".tag": "shared_folder"
            }
        }, 
        {
            "name": "Franz Ferdinand", 
            "namespace_id": "123456789", 
            "namespace_type": {
                ".tag": "team_member_folder"
            }, 
            "team_member_id": "dbmid:1234567"
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


## team/reports {424934897227775000}

### reports/get_activity {196721939727776000}

| | |
|--|--|
|__Name__| reports/get_activity|
|__URL__| https://api.dropboxapi.com/2/team/reports/get_activity |
|__Method__| POST|

#### Description
[reports/get_activity](https://www.dropbox.com/developers/documentation/http/teams#team-reports-get_activity)

scope: `team_info.read`

Retrieves reporting data about a team&#39;s user activity.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/reports/get_activity'
```




### reports/get_devices {20196718727777000}

| | |
|--|--|
|__Name__| reports/get_devices|
|__URL__| https://api.dropboxapi.com/2/team/reports/get_devices |
|__Method__| POST|

#### Description
[reports/get_devices](https://www.dropbox.com/developers/documentation/http/teams#team-reports-get_devices)

scope: `team_info.read`

Retrieves reporting data about a team&#39;s linked devices.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/reports/get_devices'
```




### reports/get_membership {148389499227779000}

| | |
|--|--|
|__Name__| reports/get_membership|
|__URL__| https://api.dropboxapi.com/2/team/reports/get_membership |
|__Method__| POST|

#### Description
[reports/get_membership](https://www.dropbox.com/developers/documentation/http/teams#team-reports-get_membership)

scope: `team_info.read`

Retrieves reporting data about a team&#39;s membership.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/reports/get_membership'
```




### reports/get_storage {40286786527780000}

| | |
|--|--|
|__Name__| reports/get_storage|
|__URL__| https://api.dropboxapi.com/2/team/reports/get_storage |
|__Method__| POST|

#### Description
[reports/get_storage](https://www.dropbox.com/developers/documentation/http/teams#team-reports-get_storage)

scope: `team_info.read`

Retrieves reporting data about a team&#39;s storage usage.

#### Request

```sh
curl -X 'POST' -d '' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/reports/get_storage'
```




## team/team_folder {70160414127781000}

### team_folder/activate {124370217927782000}

| | |
|--|--|
|__Name__| team_folder/activate|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/activate |
|__Method__| POST|

#### Description
[team_folder/activate](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-activate)

scope: `team_data.team_space`

Sets an archived team folder&#39;s status to active.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "team_folder_id": "123456789"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/activate'
```



#### Response Examples

##### Example 1: team_folder/activate response

```json
Code: 200 OK
------------------------------------------
{
    "team_folder_id": "123456789", 
    "name": "Marketing", 
    "status": {
        ".tag": "active"
    }, 
    "is_team_shared_dropbox": false, 
    "sync_setting": {
        ".tag": "default"
    }, 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": {
                ".tag": "default"
            }
        }
    ]
}
```


### team_folder/archive {146547828027784000}

| | |
|--|--|
|__Name__| team_folder/archive|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/archive |
|__Method__| POST|

#### Description
[team_folder/archive](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-archive)

scope: `team_data.team_space`

Sets an active team folder&#39;s status to archived and removes all folder and file members.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "team_folder_id": "123456789", 
    "force_async_off": false
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/archive'
```



#### Response Examples

##### Example 1: team_folder/archive response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "team_folder_id": "123456789", 
    "name": "Marketing", 
    "status": {
        ".tag": "active"
    }, 
    "is_team_shared_dropbox": false, 
    "sync_setting": {
        ".tag": "default"
    }, 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": {
                ".tag": "default"
            }
        }
    ]
}
```


### team_folder/archive/check {66201725527786000}

| | |
|--|--|
|__Name__| team_folder/archive/check|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/archive/check |
|__Method__| POST|

#### Description
[team_folder/archive/check](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-archive-check)

scope: `team_data.team_space`

Returns the status of an asynchronous job for archiving a team folder.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "async_job_id": "34g93hh34h04y384084"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/archive/check'
```



#### Response Examples

##### Example 1: team_folder/archive/check response

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete", 
    "team_folder_id": "123456789", 
    "name": "Marketing", 
    "status": {
        ".tag": "active"
    }, 
    "is_team_shared_dropbox": false, 
    "sync_setting": {
        ".tag": "default"
    }, 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": {
                ".tag": "default"
            }
        }
    ]
}
```


### team_folder/create {350268890227787000}

| | |
|--|--|
|__Name__| team_folder/create|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/create |
|__Method__| POST|

#### Description
[team_folder/create](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-create)

scope: `team_data.team_space`

Creates a new, active, team folder with no members.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "name": "Marketing", 
    "sync_setting": "not_synced"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/create'
```



#### Response Examples

##### Example 1: team_folder/create response

```json
Code: 200 OK
------------------------------------------
{
    "team_folder_id": "123456789", 
    "name": "Marketing", 
    "status": {
        ".tag": "active"
    }, 
    "is_team_shared_dropbox": false, 
    "sync_setting": {
        ".tag": "default"
    }, 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": {
                ".tag": "default"
            }
        }
    ]
}
```


### team_folder/get_info {206368211927789000}

| | |
|--|--|
|__Name__| team_folder/get_info|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/get_info |
|__Method__| POST|

#### Description
[team_folder/get_info](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-get_info)

scope: `team_data.team_space`

Retrieves metadata for team folders.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "team_folder_ids": [
        "947182", 
        "5819424", 
        "852307532"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/get_info'
```




### team_folder/list {107625883027790000}

| | |
|--|--|
|__Name__| team_folder/list|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/list |
|__Method__| POST|

#### Description
[team_folder/list](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-list)

scope: `team_data.team_space`

Lists all team folders.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/list'
```



#### Response Examples

##### Example 1: team_folder/list response

```json
Code: 200 OK
------------------------------------------
{
    "team_folders": [
        {
            "team_folder_id": "123456789", 
            "name": "Marketing", 
            "status": {
                ".tag": "active"
            }, 
            "is_team_shared_dropbox": false, 
            "sync_setting": {
                ".tag": "default"
            }, 
            "content_sync_settings": [
                {
                    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                    "sync_setting": {
                        ".tag": "default"
                    }
                }
            ]
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### team_folder/list/continue {413573821827792000}

| | |
|--|--|
|__Name__| team_folder/list/continue|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/list/continue |
|__Method__| POST|

#### Description
[team_folder/list/continue](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-list-continue)

scope: `team_data.team_space`

Once a cursor has been retrieved from `team_folder/list`, use this to paginate through all team folders.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/list/continue'
```



#### Response Examples

##### Example 1: team_folder/list/continue response

```json
Code: 200 OK
------------------------------------------
{
    "team_folders": [
        {
            "team_folder_id": "123456789", 
            "name": "Marketing", 
            "status": {
                ".tag": "active"
            }, 
            "is_team_shared_dropbox": false, 
            "sync_setting": {
                ".tag": "default"
            }, 
            "content_sync_settings": [
                {
                    "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
                    "sync_setting": {
                        ".tag": "default"
                    }
                }
            ]
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### team_folder/permanently_delete {29719517127793000}

| | |
|--|--|
|__Name__| team_folder/permanently_delete|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/permanently_delete |
|__Method__| POST|

#### Description
[team_folder/permanently_delete](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-permanently_delete)

scope: `team_data.team_space`

Permanently deletes an archived team folder.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "team_folder_id": "123456789"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/permanently_delete'
```




### team_folder/rename {394271420427794000}

| | |
|--|--|
|__Name__| team_folder/rename|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/rename |
|__Method__| POST|

#### Description
[team_folder/rename](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-rename)

scope: `team_data.team_space`

Changes an active team folder&#39;s name.
Permission : Team member file access.

#### Request

```sh
curl -X 'POST' -d '{
    "team_folder_id": "123456789", 
    "name": "Sales"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/rename'
```



#### Response Examples

##### Example 1: team_folder/rename response

```json
Code: 200 OK
------------------------------------------
{
    "team_folder_id": "123456789", 
    "name": "Marketing", 
    "status": {
        ".tag": "active"
    }, 
    "is_team_shared_dropbox": false, 
    "sync_setting": {
        ".tag": "default"
    }, 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": {
                ".tag": "default"
            }
        }
    ]
}
```


### team_folder/update_sync_settings {320092542127796000}

| | |
|--|--|
|__Name__| team_folder/update_sync_settings|
|__URL__| https://api.dropboxapi.com/2/team/team_folder/update_sync_settings |
|__Method__| POST|

#### Description
[team_folder/update_sync_settings](https://www.dropbox.com/developers/documentation/http/teams#team-team_folder-update_sync_settings)

scope: `team_data.team_space`

Updates the sync settings on a team folder or its contents.  Use of this endpoint requires that the team has team selective sync enabled.

#### Request

```sh
curl -X 'POST' -d '{
    "team_folder_id": "123456789", 
    "sync_setting": "not_synced", 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": "not_synced"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/team_folder/update_sync_settings'
```



#### Response Examples

##### Example 1: team_folder/update_sync_settings response

```json
Code: 200 OK
------------------------------------------
{
    "team_folder_id": "123456789", 
    "name": "Marketing", 
    "status": {
        ".tag": "active"
    }, 
    "is_team_shared_dropbox": false, 
    "sync_setting": {
        ".tag": "default"
    }, 
    "content_sync_settings": [
        {
            "id": "id:a4ayc_80_OEAAAAAAAAAXw", 
            "sync_setting": {
                ".tag": "default"
            }
        }
    ]
}
```


## team_log {211320411727798000}

### get_events {335583703327799000}

| | |
|--|--|
|__Name__| get_events|
|__URL__| https://api.dropboxapi.com/2/team_log/get_events |
|__Method__| POST|

#### Description
[get_events](https://www.dropbox.com/developers/documentation/http/teams#team_log-get_events)

scope: `events.read`

Retrieves team events. If the result&#39;s `GetTeamEventsResult.has_more` field is `true`, call `get_events/continue` with the returned cursor to retrieve more entries. If end_time is not specified in your request, you may use the returned cursor to poll `get_events/continue` for new events.
Many attributes note &#39;may be missing due to historical data gap&#39;.
Note that the file_operations category and &amp; analogous paper events are not available on all Dropbox Business [plans](http://www.dropbox.com/business/plans-comparison). Use [features/get_values](http://www.dropbox.com/developers/documentation/http/teams#team-features-get_values) to check for this feature.
Permission : Team Auditing.

#### Request

```sh
curl -X 'POST' -d '{
    "limit": 50, 
    "category": "groups"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team_log/get_events'
```



#### Response Examples

##### Example 1: get_events response

```json
Code: 200 OK
------------------------------------------
{
    "events": [
        {
            "timestamp": "2017-01-25T15:51:30Z", 
            "event_category": {
                ".tag": "tfa"
            }, 
            "event_type": {
                ".tag": "shared_content_download", 
                "description": "(sharing) Downloaded shared file/folder"
            }, 
            "details": {
                ".tag": "shared_content_download_details", 
                "shared_content_link": "abc", 
                "shared_content_access_level": {
                    ".tag": "viewer_no_comment"
                }, 
                "shared_content_owner": {
                    ".tag": "team_member", 
                    "account_id": "dbid:AAHgR8xsQP48a5DQUGPo-Vxsrjd0OByVmho", 
                    "display_name": "John Smith", 
                    "email": "john_smith@acmecorp.com", 
                    "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                    "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1224", 
                    "team": {
                        "display_name": "A Team"
                    }
                }
            }, 
            "actor": {
                ".tag": "user", 
                "user": {
                    ".tag": "team_member", 
                    "account_id": "dbid:AAHgR8xsQP48a5DQUGPo-Vxsrjd0OByVmho", 
                    "display_name": "John Smith", 
                    "email": "john_smith@acmecorp.com", 
                    "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                    "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1224", 
                    "team": {
                        "display_name": "A Team"
                    }
                }
            }, 
            "origin": {
                "access_method": {
                    ".tag": "end_user", 
                    "end_user": {
                        ".tag": "web", 
                        "session_id": "dbwsid:123456789012345678901234567890123456789"
                    }
                }, 
                "geo_location": {
                    "ip_address": "45.56.78.100", 
                    "city": "San Francisco", 
                    "region": "California", 
                    "country": "US"
                }
            }, 
            "involve_non_team_member": true, 
            "context": {
                ".tag": "team_member", 
                "account_id": "dbid:AAHgR8xsQP48a5DQUGPo-Vxsrjd0OByVmho", 
                "display_name": "John Smith", 
                "email": "john_smith@acmecorp.com", 
                "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1224", 
                "team": {
                    "display_name": "A Team"
                }
            }, 
            "participants": [
                {
                    ".tag": "user", 
                    "user": {
                        ".tag": "team_member", 
                        "account_id": "dbid:AAGx4oiLtHdvRdNxUpvvJBXYgR4BS19c9kw", 
                        "display_name": "Jane Smith", 
                        "email": "jane_smith@acmecorp.com", 
                        "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                        "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1225", 
                        "team": {
                            "display_name": "A Team"
                        }
                    }
                }
            ], 
            "assets": [
                {
                    ".tag": "file", 
                    "path": {
                        "namespace_relative": {
                            "ns_id": "1234", 
                            "relative_path": "/Contract Work/Draft", 
                            "is_shared_namespace": false
                        }, 
                        "contextual": "/Contract Work/Draft"
                    }, 
                    "display_name": "reports.xls", 
                    "file_id": "id:jQKLsZFQImAAAAAAEZAAQt", 
                    "file_size": 4
                }
            ]
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


### get_events/continue {284169519527803000}

| | |
|--|--|
|__Name__| get_events/continue|
|__URL__| https://api.dropboxapi.com/2/team_log/get_events/continue |
|__Method__| POST|

#### Description
[get_events/continue](https://www.dropbox.com/developers/documentation/http/teams#team_log-get_events-continue)

scope: `events.read`

Once a cursor has been retrieved from `get_events`, use this to paginate through all events.
Permission : Team Auditing.

#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team_log/get_events/continue'
```



#### Response Examples

##### Example 1: get_events/continue response

```json
Code: 200 OK
------------------------------------------
{
    "events": [
        {
            "timestamp": "2017-01-25T15:51:30Z", 
            "event_category": {
                ".tag": "tfa"
            }, 
            "event_type": {
                ".tag": "shared_content_download", 
                "description": "(sharing) Downloaded shared file/folder"
            }, 
            "details": {
                ".tag": "shared_content_download_details", 
                "shared_content_link": "abc", 
                "shared_content_access_level": {
                    ".tag": "viewer_no_comment"
                }, 
                "shared_content_owner": {
                    ".tag": "team_member", 
                    "account_id": "dbid:AAHgR8xsQP48a5DQUGPo-Vxsrjd0OByVmho", 
                    "display_name": "John Smith", 
                    "email": "john_smith@acmecorp.com", 
                    "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                    "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1224", 
                    "team": {
                        "display_name": "A Team"
                    }
                }
            }, 
            "actor": {
                ".tag": "user", 
                "user": {
                    ".tag": "team_member", 
                    "account_id": "dbid:AAHgR8xsQP48a5DQUGPo-Vxsrjd0OByVmho", 
                    "display_name": "John Smith", 
                    "email": "john_smith@acmecorp.com", 
                    "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                    "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1224", 
                    "team": {
                        "display_name": "A Team"
                    }
                }
            }, 
            "origin": {
                "access_method": {
                    ".tag": "end_user", 
                    "end_user": {
                        ".tag": "web", 
                        "session_id": "dbwsid:123456789012345678901234567890123456789"
                    }
                }, 
                "geo_location": {
                    "ip_address": "45.56.78.100", 
                    "city": "San Francisco", 
                    "region": "California", 
                    "country": "US"
                }
            }, 
            "involve_non_team_member": true, 
            "context": {
                ".tag": "team_member", 
                "account_id": "dbid:AAHgR8xsQP48a5DQUGPo-Vxsrjd0OByVmho", 
                "display_name": "John Smith", 
                "email": "john_smith@acmecorp.com", 
                "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1224", 
                "team": {
                    "display_name": "A Team"
                }
            }, 
            "participants": [
                {
                    ".tag": "user", 
                    "user": {
                        ".tag": "team_member", 
                        "account_id": "dbid:AAGx4oiLtHdvRdNxUpvvJBXYgR4BS19c9kw", 
                        "display_name": "Jane Smith", 
                        "email": "jane_smith@acmecorp.com", 
                        "team_member_id": "dbmid:AAFoi-tmvRuQR0jU-3fN4B-9nZo6nHcDO9Q", 
                        "member_external_id": "ADSYNC S-1-5-21-1004296348-1135238915-682003432-1225", 
                        "team": {
                            "display_name": "A Team"
                        }
                    }
                }
            ], 
            "assets": [
                {
                    ".tag": "file", 
                    "path": {
                        "namespace_relative": {
                            "ns_id": "1234", 
                            "relative_path": "/Contract Work/Draft", 
                            "is_shared_namespace": false
                        }, 
                        "contextual": "/Contract Work/Draft"
                    }, 
                    "display_name": "reports.xls", 
                    "file_id": "id:jQKLsZFQImAAAAAAEZAAQt", 
                    "file_size": 4
                }
            ]
        }
    ], 
    "cursor": "ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu", 
    "has_more": false
}
```


## users {158523521927974000}

### features/get_values {42519852027978000}

| | |
|--|--|
|__Name__| features/get_values|
|__URL__| https://api.dropboxapi.com/2/users/features/get_values |
|__Method__| POST|

#### Description
[features/get_values](https://www.dropbox.com/developers/documentation/http/documentation#users-features-get_values)

scope: `account_info.read`

Get a list of feature values that may be configured for the current account.

#### Request

```sh
curl -X 'POST' -d '{
    "features": [
        {
            ".tag": "paper_as_files"
        }, 
        {
            ".tag": "file_locking"
        }
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/users/features/get_values'
```



#### Response Examples

##### Example 1: features/get_values response

```json
Code: 200 OK
------------------------------------------
{
    "values": [
        {
            ".tag": "paper_as_files", 
            "paper_as_files": {
                ".tag": "enabled", 
                "enabled": true
            }
        }
    ]
}
```


### get_account {426113031127983000}

| | |
|--|--|
|__Name__| get_account|
|__URL__| https://api.dropboxapi.com/2/users/get_account |
|__Method__| POST|

#### Description
[get_account](https://www.dropbox.com/developers/documentation/http/documentation#users-get_account)

scope: `sharing.read`

Get information about a user&#39;s account.

#### Request

```sh
curl -X 'POST' -d '{
    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/users/get_account'
```



#### Response Examples

##### Example 1: get_account response

```json
Code: 200 OK
------------------------------------------
{
    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
    "name": {
        "given_name": "Franz", 
        "surname": "Ferdinand", 
        "familiar_name": "Franz", 
        "display_name": "Franz Ferdinand (Personal)", 
        "abbreviated_name": "FF"
    }, 
    "email": "franz@dropbox.com", 
    "email_verified": true, 
    "disabled": false, 
    "is_teammate": false, 
    "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
}
```


### get_account_batch {140597676827987000}

| | |
|--|--|
|__Name__| get_account_batch|
|__URL__| https://api.dropboxapi.com/2/users/get_account_batch |
|__Method__| POST|

#### Description
[get_account_batch](https://www.dropbox.com/developers/documentation/http/documentation#users-get_account_batch)

scope: `sharing.read`

Get information about multiple user accounts.  At most 300 accounts may be queried per request.

#### Request

```sh
curl -X 'POST' -d '{
    "account_ids": [
        "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
        "dbid:AAH1Vcz-DVoRDeixtr_OA8oUGgiqhs4XPOQ"
    ]
}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/users/get_account_batch'
```



#### Response Examples

##### Example 1: get_account_batch response

```json
Code: 200 OK
------------------------------------------
[
    {
        "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
        "name": {
            "given_name": "Franz", 
            "surname": "Ferdinand", 
            "familiar_name": "Franz", 
            "display_name": "Franz Ferdinand (Personal)", 
            "abbreviated_name": "FF"
        }, 
        "email": "franz@dropbox.com", 
        "email_verified": true, 
        "disabled": false, 
        "is_teammate": false, 
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102&size=128x128"
    }
]
```


### get_current_account {25895141727995000}

| | |
|--|--|
|__Name__| get_current_account|
|__URL__| https://api.dropboxapi.com/2/users/get_current_account |
|__Method__| POST|

#### Description
[get_current_account](https://www.dropbox.com/developers/documentation/http/documentation#users-get_current_account)

scope: `account_info.read`

Get information about the current user&#39;s account.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/users/get_current_account'
```



#### Response Examples

##### Example 1: get_current_account response

```json
Code: 200 OK
------------------------------------------
{
    "account_id": "dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", 
    "name": {
        "given_name": "Franz", 
        "surname": "Ferdinand", 
        "familiar_name": "Franz", 
        "display_name": "Franz Ferdinand (Personal)", 
        "abbreviated_name": "FF"
    }, 
    "email": "franz@dropbox.com", 
    "email_verified": true, 
    "disabled": false, 
    "locale": "en", 
    "referral_link": "https://db.tt/ZITNuhtI", 
    "is_paired": true, 
    "account_type": {
        ".tag": "business"
    }, 
    "root_info": {
        ".tag": "user", 
        "root_namespace_id": "3235641", 
        "home_namespace_id": "3235641"
    }, 
    "country": "US", 
    "team": {
        "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I", 
        "name": "Acme, Inc.", 
        "sharing_policies": {
            "shared_folder_member_policy": {
                ".tag": "team"
            }, 
            "shared_folder_join_policy": {
                ".tag": "from_anyone"
            }, 
            "shared_link_create_policy": {
                ".tag": "team_only"
            }
        }, 
        "office_addin_policy": {
            ".tag": "disabled"
        }
    }, 
    "team_member_id": "dbmid:AAHhy7WsR0x-u4ZCqiDl5Fz5zvuL3kmspwU"
}
```


### get_space_usage {403953227427999000}

| | |
|--|--|
|__Name__| get_space_usage|
|__URL__| https://api.dropboxapi.com/2/users/get_space_usage |
|__Method__| POST|

#### Description
[get_space_usage](https://www.dropbox.com/developers/documentation/http/documentation#users-get_space_usage)

scope: `account_info.read`

Get the space usage information for the current user&#39;s account.

#### Request

```sh
curl -X 'POST' -d '' 'https://api.dropboxapi.com/2/users/get_space_usage'
```



#### Response Examples

##### Example 1: get_space_usage response

```json
Code: 200 OK
------------------------------------------
{
    "used": 314159265, 
    "allocation": {
        ".tag": "individual", 
        "allocated": 10000000000
    }
}
```





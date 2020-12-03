# Dropbox Team Admin Workflows {374429968340417000}

The powerful, yet simple, Dropbox API allows you to manage and control content and team settings programmatically and extend Dropbox capabilities in new and powerful ways. One of the many areas where the Dropbox API shines is Team Administration. Dropbox Business brings collaboration to professional teams of all sizes, with all the security and control that is required. 

If you are new to Dropbox Business and Team Administration, please have a look at the [Dropobox Admin Guide](https://help.dropbox.com/guide/admin/how-to-get-started#dropbox-admin-guide). 

# Why would you need these workflows?  

Many of the administration tasks can be executed through the web-based Admin Console. However sometimes our Dropbox Business customers need to perform tasks in bulk or automate actions, in a way that is only possible via the API. Furthermore, to accomplish some of these goals it is required to chain a few API calls (the response of a call is the input for the subsequent call), or loop through a list.  

That&#39;s why we created the Dropbox Team Admin Workflows Postman Collection. It is aimed at helping Dropbox Administrators on specific tasks, but it can also help developers learn about our APIs. Each folder contains specific workflows that include multiple endpoints that are connected to accomplish specific tasks. 

If you want more information on how to use our API to manage your Dropbox team, please refer to the [Dropbox API Team Administration Guide](https://www.dropbox.com/lp/developers/reference/dbx-team-administration-guide).

# What&#39;s in the collection?

These are the workflows contained in this collection:  

**Bulk Provision Users and Add to Groups**  
Create users from a list and add them to appropriate groups  

**Bulk Deprovision Members with Transfer Destination**  
Remove members from a list and transfer their personal data  

**Bulk Deprovision Members without Transfer Destination**  
Remove members from a list and their personal data  

**Bulk Suspend Members**  
Suspend a list of members  

**Bulk Unuspend Members**  
Unsuspend (reactivate) a list of members  

**Bulk Add Users To Groups**  
Add a list of users to appropriate groups  

**Bulk Update Email Addresses**  
Update email addresses for a list of users  

**Bulk Add Groups**  
Create groups from a list  

**Wipe External ID**  
Wipe the External ID field for all users in a team  

**Bulk Update External IDs**
Update specific External IDs using a CSV file

Each workflow has its own folder. Please visit the folder description for instructions on how to execute it. Some workflows require CSV (comma-separated values) files with the input lists. Those formats are in the descriptions, along with links to sample files you can download and use. 

# Authorization

## OAuth 2.0 for API Access
Dropbox uses OAuth 2.0, an open specification, to authorize access to data. To get an OAuth token from Dropbox to enable Postman to access your Dropbox Business team via the API you’ll need to create a new app on the DBX Platform.

## Creating an App on the DBX Platform
Navigate to https://www.dropbox.com/developers/apps and select “Create app” 
1. Choose an API  
2. Choose the type of access you need 
3. Give your app a name  
4. Choose the Dropbox account that will own your app  

For reference, please use the [Dropbox OAuth guide](https://www.dropbox.com/lp/developers/reference/oauth-guide) 

## Generating an Access Token
Once you select “Create app” a page will load that displays information about your newly created app. To generate an access token scroll down to “OAuth 2” and click “Generate” beneath “Generated access token.” The token will display as a long string of characters. Copy this token for use with the Postman Collection.

## Adding an Access Token to the Postman Collection
In the Postman client, click on the three dots to the right of the collection name to &quot;View more actions.&quot;

![Screenshot of adding access token](https://www.dropbox.com/s/39kae4jmnjab3dd/Screen%20Shot%202020-07-17%20at%2012.29.33%20AM.png?raw=1)

Then, click &quot;Edit.&quot;

![Screenshot of adding access token](https://www.dropbox.com/s/8nprpathnaxag74/Screen%20Shot%202020-07-17%20at%2012.29.57%20AM.png?raw=1)

Click on the &quot;Variables&quot; tab and, in the row for the `access_token` variable, paste your access token in the `CURRENT VALUE` column. The default value is `your-access-token-here`.

![Screenshot of adding access token](https://www.dropbox.com/s/jbd1g3843gviylr/Screen%20Shot%202020-07-17%20at%2012.30.12%20AM.png?raw=1)

For information on sessions and variables in Postman see the blog post at https://blog.postman.com/sessions-faq/.

# Notes
* We use Collection variables for storing values in between requests, as well as input values. Please visit each workflow folder for instructions on how to provide values for these variables.   
* You can find the CSV templates for the workflows [in this folder](https://www.dropbox.com/sh/3thw4wqwn7o07kh/AABug6oNSL7Vxj98fZ6Hnwoka?dl=0).



## Bulk Add Groups {337372636640435000}

### Add Group {153784532740436000}

| | |
|--|--|
|__Name__| Add Group|
|__URL__| https://api.dropboxapi.com/2/team/groups/create |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "group_name": "{{group_name}}",
    "group_external_id": "{{group_external_id}}"
}' -H 'Authorization: Bearer {{access_token}}' 'https://api.dropboxapi.com/2/team/groups/create'
```



#### Response Examples

##### Example 1: Add Group - Error: system_managed_group_disallowed

```json
Code: 0 
------------------------------------------
system_managed_group_disallowed Void System-managed group cannot be manually created.

{
    "error_summary": "system_managed_group_disallowed/...",
    "error": {
        ".tag": "system_managed_group_disallowed"
    }
}
```

##### Example 2: Add Group - Error: group_name_invalid

```json
Code: 0 
------------------------------------------
group_name_invalid Void Group name is empty or has invalid characters.

{
    "error_summary": "group_name_invalid/...",
    "error": {
        ".tag": "group_name_invalid"
    }
}
```

##### Example 3: Add Group - Success

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
                "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102\u0026size=128x128"
            },
            "access_type": {
                ".tag": "member"
            }
        }
    ]
}
```

##### Example 4: Add Group - Error: group_name_already_used

```json
Code: 0 
------------------------------------------
group_name_already_used Void The requested group name is already being used by another group.

{
    "error_summary": "group_name_already_used/...",
    "error": {
        ".tag": "group_name_already_used"
    }
}
```

##### Example 5: Add Group - Error: external_id_already_in_use

```json
Code: 0 
------------------------------------------
external_id_already_in_use Void The requested external ID is already being used by another group.

{
    "error_summary": "external_id_already_in_use/...",
    "error": {
        ".tag": "external_id_already_in_use"
    }
}
```


## Bulk Add Users to Groups {241823690140452000}

### Add Member To Group {348121037240452000}

| | |
|--|--|
|__Name__| Add Member To Group|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/add |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id",
        "group_id": "{{group_id_bulk_add_groups}}"
    },
    "members": [
        {
            "user": {
                ".tag": "{{team_member_identifier}}",
                "{{team_member_identifier}}": "{{team_member}}"
            },
            "access_type": "member"
        }
    ],
    "return_members": true
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/add'
```



#### Response Examples

##### Example 1: Add Member To Group - Error: duplicate_user

```json
Code: 0 
------------------------------------------
{
    "error_summary": "duplicate_user/...",
    "error": {
        ".tag": "duplicate_user"
    }
}
```

##### Example 2: Add Member To Group - Error: group_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "group_not_in_team/...",
    "error": {
        ".tag": "group_not_in_team"
    }
}
```

##### Example 3: Add Member To Group - Success

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

##### Example 4: Add Member To Group - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 5: Add Member To Group - Error: system_managed_group_disallowed

```json
Code: 0 
------------------------------------------
{
    "error_summary": "system_managed_group_disallowed/...",
    "error": {
        ".tag": "system_managed_group_disallowed"
    }
}
```

##### Example 6: Add Member To Group - Error: user_must_be_active_to_be_owner

```json
Code: 0 
------------------------------------------
{
    "error_summary": "user_must_be_active_to_be_owner/...",
    "error": {
        ".tag": "user_must_be_active_to_be_owner"
    }
}
```

##### Example 7: Add Member To Group - Error: group_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "group_not_found/...",
    "error": {
        ".tag": "group_not_found"
    }
}
```


### Get Groups {161460338940461000}

| | |
|--|--|
|__Name__| Get Groups|
|__URL__| https://api.dropboxapi.com/2/team/groups/list |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/list'
```



#### Response Examples

##### Example 1: Get Groups - Success

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


### Get More Groups {118885532840462000}

| | |
|--|--|
|__Name__| Get More Groups|
|__URL__| https://api.dropboxapi.com/2/team/groups/list/continue |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "{{cursor_bulk_add_groups}}"
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/list/continue'
```



#### Response Examples

##### Example 1: Get More Groups - Error: invalid_cursor

```json
Code: 0 
------------------------------------------
{
    "error_summary": "invalid_cursor/...",
    "error": {
        ".tag": "invalid_cursor"
    }
}
```

##### Example 2: Get More Groups - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 3: Get More Groups - Success

```json
Code: 0 
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


## Bulk Deprovision Members with Transfer Destination {59592445540465000}

### Remove Member {384221168540465000}

| | |
|--|--|
|__Name__| Remove Member|
|__URL__| https://api.dropboxapi.com/2/team/members/remove |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "{{team_member_identifier}}",
        "{{team_member_identifier}}": "{{team_member}}"
    },
    "wipe_data": {{wipe_data}},
    "transfer_dest_id": {
        ".tag": "{{dest_member_identifier}}",
        "{{dest_member_identifier}}": "{{dest_team_member}}"
    },
    "transfer_admin_id": {
        ".tag": "{{transfer_admin_identifier}}",
        "{{transfer_admin_identifier}}": "{{transfer_admin}}"
    },
    "keep_account": {{keep_account}},
    "retain_team_shares": {{retain_team_shares}}
}' -H 'Authorization: Bearer {{access_token}}' 'https://api.dropboxapi.com/2/team/members/remove'
```



#### Response Examples

##### Example 1: Remove Member - Error: cannot_keep_invited_user_account

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_invited_user_account/...",
    "error": {
        ".tag": "cannot_keep_invited_user_account"
    }
}
```

##### Example 2: Remove Member - Error: cannot_retain_shares_when_no_account_kept

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_retain_shares_when_no_account_kept/...",
    "error": {
        ".tag": "cannot_retain_shares_when_no_account_kept"
    }
}
```

##### Example 3: Remove Member - Error: removed_and_transfer_dest_should_differ

```json
Code: 0 
------------------------------------------
{
    "error_summary": "removed_and_transfer_dest_should_differ/...",
    "error": {
        ".tag": "removed_and_transfer_dest_should_differ"
    }
}
```

##### Example 4: Remove Member - Error: cannot_keep_account

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account/...",
    "error": {
        ".tag": "cannot_keep_account"
    }
}
```

##### Example 5: Remove Member - Success:  async_job_id

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "async_job_id",
    "async_job_id": "34g93hh34h04y384084"
}
```

##### Example 6: Remove Member - Error: cannot_retain_shares_when_data_wiped

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_retain_shares_when_data_wiped/...",
    "error": {
        ".tag": "cannot_retain_shares_when_data_wiped"
    }
}
```

##### Example 7: Remove Member - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 8: Remove Member - Error: cannot_keep_account_under_legal_hold

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_under_legal_hold/...",
    "error": {
        ".tag": "cannot_keep_account_under_legal_hold"
    }
}
```

##### Example 9: Remove Member - Error: recipient_not_verified

```json
Code: 0 
------------------------------------------
{
    "error_summary": "recipient_not_verified/...",
    "error": {
        ".tag": "recipient_not_verified"
    }
}
```

##### Example 10: Remove Member - Error: transfer_admin_user_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_admin_user_not_in_team/...",
    "error": {
        ".tag": "transfer_admin_user_not_in_team"
    }
}
```

##### Example 11: Remove Member - Error: cannot_keep_account_and_transfer

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_and_transfer/...",
    "error": {
        ".tag": "cannot_keep_account_and_transfer"
    }
}
```

##### Example 12: Remove Member - Error: removed_and_transfer_admin_should_differ

```json
Code: 0 
------------------------------------------
{
    "error_summary": "removed_and_transfer_admin_should_differ/...",
    "error": {
        ".tag": "removed_and_transfer_admin_should_differ"
    }
}
```

##### Example 13: Remove Member - Error: cannot_keep_account_and_delete_data

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_and_delete_data/...",
    "error": {
        ".tag": "cannot_keep_account_and_delete_data"
    }
}
```

##### Example 14: Remove Member - Error: user_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```

##### Example 15: Remove Member - Error: cannot_retain_shares_when_team_external_sharing_off

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_retain_shares_when_team_external_sharing_off/...",
    "error": {
        ".tag": "cannot_retain_shares_when_team_external_sharing_off"
    }
}
```

##### Example 16: Remove Member - Error: unspecified_transfer_admin_id

```json
Code: 0 
------------------------------------------
{
    "error_summary": "unspecified_transfer_admin_id/...",
    "error": {
        ".tag": "unspecified_transfer_admin_id"
    }
}
```

##### Example 17: Remove Member - Error: email_address_too_long_to_be_disabled

```json
Code: 0 
------------------------------------------
{
    "error_summary": "email_address_too_long_to_be_disabled/...",
    "error": {
        ".tag": "email_address_too_long_to_be_disabled"
    }
}
```

##### Example 18: Remove Member - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 19: Remove Member - Error: transfer_admin_user_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_admin_user_not_found/...",
    "error": {
        ".tag": "transfer_admin_user_not_found"
    }
}
```

##### Example 20: Remove Member - Error: transfer_dest_user_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_dest_user_not_found/...",
    "error": {
        ".tag": "transfer_dest_user_not_found"
    }
}
```

##### Example 21: Remove Member - Success: complete 

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```

##### Example 22: Remove Member - Error: cannot_keep_account_required_to_sign_tos

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_required_to_sign_tos/...",
    "error": {
        ".tag": "cannot_keep_account_required_to_sign_tos"
    }
}
```

##### Example 23: Remove Member - Error: transfer_dest_user_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_dest_user_not_in_team/...",
    "error": {
        ".tag": "transfer_dest_user_not_in_team"
    }
}
```

##### Example 24: Remove Member - Error: remove_last_admin

```json
Code: 0 
------------------------------------------
{
    "error_summary": "remove_last_admin/...",
    "error": {
        ".tag": "remove_last_admin"
    }
}
```

##### Example 25: Remove Member - Error: transfer_admin_is_not_admin

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_admin_is_not_admin/...",
    "error": {
        ".tag": "transfer_admin_is_not_admin"
    }
}
```


## Bulk Deprovision Members without Transfer Destination {14811253940489000}

### Remove Member {384221168540489000}

| | |
|--|--|
|__Name__| Remove Member|
|__URL__| https://api.dropboxapi.com/2/team/members/remove |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "{{team_member_identifier}}",
        "{{team_member_identifier}}": "{{team_member}}"
    },
    "wipe_data": {{wipe_data}},
    "transfer_admin_id": {
        ".tag": "{{transfer_admin_identifier}}",
        "{{transfer_admin_identifier}}": "{{transfer_admin}}"
    },
    "keep_account": {{keep_account}},
    "retain_team_shares": {{retain_team_shares}}
}' -H 'Authorization: Bearer {{access_token}}' 'https://api.dropboxapi.com/2/team/members/remove'
```



#### Response Examples

##### Example 1: Remove Member - Error: transfer_admin_is_not_admin

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_admin_is_not_admin/...",
    "error": {
        ".tag": "transfer_admin_is_not_admin"
    }
}
```

##### Example 2: Remove Member - Error: cannot_keep_invited_user_account

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_invited_user_account/...",
    "error": {
        ".tag": "cannot_keep_invited_user_account"
    }
}
```

##### Example 3: Remove Member - Error: cannot_retain_shares_when_data_wiped

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_retain_shares_when_data_wiped/...",
    "error": {
        ".tag": "cannot_retain_shares_when_data_wiped"
    }
}
```

##### Example 4: Remove Member - Error: transfer_admin_user_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_admin_user_not_found/...",
    "error": {
        ".tag": "transfer_admin_user_not_found"
    }
}
```

##### Example 5: Remove Member - Error: transfer_admin_user_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_admin_user_not_in_team/...",
    "error": {
        ".tag": "transfer_admin_user_not_in_team"
    }
}
```

##### Example 6: Remove Member - Error: transfer_dest_user_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_dest_user_not_in_team/...",
    "error": {
        ".tag": "transfer_dest_user_not_in_team"
    }
}
```

##### Example 7: Remove Member - Error: recipient_not_verified

```json
Code: 0 
------------------------------------------
{
    "error_summary": "recipient_not_verified/...",
    "error": {
        ".tag": "recipient_not_verified"
    }
}
```

##### Example 8: Remove Member - Error: email_address_too_long_to_be_disabled

```json
Code: 0 
------------------------------------------
{
    "error_summary": "email_address_too_long_to_be_disabled/...",
    "error": {
        ".tag": "email_address_too_long_to_be_disabled"
    }
}
```

##### Example 9: Remove Member - Error: transfer_dest_user_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "transfer_dest_user_not_found/...",
    "error": {
        ".tag": "transfer_dest_user_not_found"
    }
}
```

##### Example 10: Remove Member - Error: removed_and_transfer_admin_should_differ

```json
Code: 0 
------------------------------------------
{
    "error_summary": "removed_and_transfer_admin_should_differ/...",
    "error": {
        ".tag": "removed_and_transfer_admin_should_differ"
    }
}
```

##### Example 11: Remove Member - Error: cannot_keep_account_and_delete_data

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_and_delete_data/...",
    "error": {
        ".tag": "cannot_keep_account_and_delete_data"
    }
}
```

##### Example 12: Remove Member - Error: cannot_retain_shares_when_no_account_kept

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_retain_shares_when_no_account_kept/...",
    "error": {
        ".tag": "cannot_retain_shares_when_no_account_kept"
    }
}
```

##### Example 13: Remove Member - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 14: Remove Member - Error: cannot_keep_account

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account/...",
    "error": {
        ".tag": "cannot_keep_account"
    }
}
```

##### Example 15: Remove Member - Error: removed_and_transfer_dest_should_differ

```json
Code: 0 
------------------------------------------
{
    "error_summary": "removed_and_transfer_dest_should_differ/...",
    "error": {
        ".tag": "removed_and_transfer_dest_should_differ"
    }
}
```

##### Example 16: Remove Member - Error: cannot_keep_account_required_to_sign_tos

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_required_to_sign_tos/...",
    "error": {
        ".tag": "cannot_keep_account_required_to_sign_tos"
    }
}
```

##### Example 17: Remove Member - Error: remove_last_admin

```json
Code: 0 
------------------------------------------
{
    "error_summary": "remove_last_admin/...",
    "error": {
        ".tag": "remove_last_admin"
    }
}
```

##### Example 18: Remove Member - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 19: Remove Member - Error: unspecified_transfer_admin_id

```json
Code: 0 
------------------------------------------
{
    "error_summary": "unspecified_transfer_admin_id/...",
    "error": {
        ".tag": "unspecified_transfer_admin_id"
    }
}
```

##### Example 20: Remove Member - Success:  async_job_id

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "async_job_id",
    "async_job_id": "34g93hh34h04y384084"
}
```

##### Example 21: Remove Member - Error: cannot_keep_account_and_transfer

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_and_transfer/...",
    "error": {
        ".tag": "cannot_keep_account_and_transfer"
    }
}
```

##### Example 22: Remove Member - Success: complete 

```json
Code: 200 OK
------------------------------------------
{
    ".tag": "complete"
}
```

##### Example 23: Remove Member - Error: cannot_keep_account_under_legal_hold

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_keep_account_under_legal_hold/...",
    "error": {
        ".tag": "cannot_keep_account_under_legal_hold"
    }
}
```

##### Example 24: Remove Member - Error: cannot_retain_shares_when_team_external_sharing_off

```json
Code: 0 
------------------------------------------
{
    "error_summary": "cannot_retain_shares_when_team_external_sharing_off/...",
    "error": {
        ".tag": "cannot_retain_shares_when_team_external_sharing_off"
    }
}
```

##### Example 25: Remove Member - Error: user_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```


## Bulk Provision Users and Add to Groups {207323400740503000}

### Add Member To Group {348121037240504000}

| | |
|--|--|
|__Name__| Add Member To Group|
|__URL__| https://api.dropboxapi.com/2/team/groups/members/add |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "group": {
        ".tag": "group_id",
        "group_id": "{{group_id_bulk_provision}}"
    },
    "members": [
        {
            "user": {
                ".tag": "team_member_id",
                "team_member_id": "{{team_member_id_bulk_provision}}"
            },
            "access_type": "member"
        }
    ],
    "return_members": true
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/members/add'
```



#### Response Examples

##### Example 1: Add Member To Group - Error: group_not_in_team

```json
Code: 0 
------------------------------------------
{
    "error_summary": "group_not_in_team/...",
    "error": {
        ".tag": "group_not_in_team"
    }
}
```

##### Example 2: Add Member To Group - Success

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

##### Example 3: Add Member To Group - Error: user_must_be_active_to_be_owner

```json
Code: 0 
------------------------------------------
{
    "error_summary": "user_must_be_active_to_be_owner/...",
    "error": {
        ".tag": "user_must_be_active_to_be_owner"
    }
}
```

##### Example 4: Add Member To Group - Error: system_managed_group_disallowed

```json
Code: 0 
------------------------------------------
{
    "error_summary": "system_managed_group_disallowed/...",
    "error": {
        ".tag": "system_managed_group_disallowed"
    }
}
```

##### Example 5: Add Member To Group - Error: duplicate_user

```json
Code: 0 
------------------------------------------
{
    "error_summary": "duplicate_user/...",
    "error": {
        ".tag": "duplicate_user"
    }
}
```

##### Example 6: Add Member To Group - Error: group_not_found

```json
Code: 0 
------------------------------------------
{
    "error_summary": "group_not_found/...",
    "error": {
        ".tag": "group_not_found"
    }
}
```

##### Example 7: Add Member To Group - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```


### Add Member To Team {110340267640508000}

| | |
|--|--|
|__Name__| Add Member To Team|
|__URL__| https://api.dropboxapi.com/2/team/members/add |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "new_members": [
        {
            "member_email": "{{email}}",
            "member_given_name": "{{first_name}}",
            "member_surname": "{{last_name}}",
            "member_external_id": "{{external_id}}",
            "send_welcome_email": {{welcome_email}},
            "role": "{{member_role}}"
        }
    ],
    "force_async": false
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/add'
```



#### Response Examples

##### Example 1: Add Member To Team - Success

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


### Get Groups {161460338940510000}

| | |
|--|--|
|__Name__| Get Groups|
|__URL__| https://api.dropboxapi.com/2/team/groups/list |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "limit": 100
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/list'
```



#### Response Examples

##### Example 1: Get Groups - Success

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


### Get More Groups {118885532840511000}

| | |
|--|--|
|__Name__| Get More Groups|
|__URL__| https://api.dropboxapi.com/2/team/groups/list/continue |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "cursor": "{{cursor_bulk_provision}}"
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/groups/list/continue'
```



#### Response Examples

##### Example 1: Get More Groups - Success

```json
Code: 0 
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

##### Example 2: Get More Groups - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 3: Get More Groups - Error: invalid_cursor

```json
Code: 0 
------------------------------------------
{
    "error_summary": "invalid_cursor/...",
    "error": {
        ".tag": "invalid_cursor"
    }
}
```


## Bulk Suspend Members {192052553840513000}

### Suspend Member {368793595940514000}

| | |
|--|--|
|__Name__| Suspend Member|
|__URL__| https://api.dropboxapi.com/2/team/members/suspend |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "{{team_member_identifier}}",
        "{{team_member_identifier}}": "{{team_member}}"
    },
    "wipe_data": {{wipe_data}}
}' -H 'Authorization: Bearer {{access_token}}' 'https://api.dropboxapi.com/2/team/members/suspend'
```



#### Response Examples

##### Example 1: Suspend Member - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 2: Suspend Member - Error: suspend_last_admin

```json
Code: 0 
------------------------------------------
suspend_last_admin Void The user is the last admin of the team, so it cannot be suspended.

{
    "error_summary": "suspend_last_admin/...",
    "error": {
        ".tag": "suspend_last_admin"
    }
}
```

##### Example 3: Suspend Member - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
user_not_in_team Void The user is not a member of the team.

{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 4: Suspend Member - Error: user_not_found

```json
Code: 0 
------------------------------------------
user_not_found Void No matching user found. The provided team_member_id, email, or external_id does not exist on this team.

{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```

##### Example 5: Suspend Member - Error: team_license_limit

```json
Code: 0 
------------------------------------------
team_license_limit Void Team is full. The organization has no available licenses.

{
    "error_summary": "team_license_limit/...",
    "error": {
        ".tag": "team_license_limit"
    }
}
```

##### Example 6: Suspend Member - Error: suspend_inactive_user

```json
Code: 0 
------------------------------------------
suspend_inactive_user Void The user is not active, so it cannot be suspended.

{
    "error_summary": "suspend_inactive_user/...",
    "error": {
        ".tag": "suspend_inactive_user"
    }
}
```

##### Example 7: Suspend Member - Success

```json
Code: 200 OK
------------------------------------------
No return values.
```


## Bulk Unsuspend Members {247943258340523000}

### Unsuspend Member {87931012440524000}

| | |
|--|--|
|__Name__| Unsuspend Member|
|__URL__| https://api.dropboxapi.com/2/team/members/unsuspend |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "{{team_member_identifier}}",
        "{{team_member_identifier}}": "{{team_member}}"
    }
}' -H 'Authorization: Bearer {{access_token}}' 'https://api.dropboxapi.com/2/team/members/unsuspend'
```



#### Response Examples

##### Example 1: Suspend Member - Error: team_license_limit

```json
Code: 0 
------------------------------------------
team_license_limit Void Team is full. The organization has no available licenses.

{
    "error_summary": "team_license_limit/...",
    "error": {
        ".tag": "team_license_limit"
    }
}
```

##### Example 2: Suspend Member - Error: user_not_found

```json
Code: 0 
------------------------------------------
user_not_found Void No matching user found. The provided team_member_id, email, or external_id does not exist on this team.

{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```

##### Example 3: Suspend Member - Error: suspend_last_admin

```json
Code: 0 
------------------------------------------
suspend_last_admin Void The user is the last admin of the team, so it cannot be suspended.

{
    "error_summary": "suspend_last_admin/...",
    "error": {
        ".tag": "suspend_last_admin"
    }
}
```

##### Example 4: Suspend Member - Success

```json
Code: 200 OK
------------------------------------------
No return values.
```

##### Example 5: Suspend Member - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
user_not_in_team Void The user is not a member of the team.

{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 6: Suspend Member - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 7: Suspend Member - Error: suspend_inactive_user

```json
Code: 0 
------------------------------------------
suspend_inactive_user Void The user is not active, so it cannot be suspended.

{
    "error_summary": "suspend_inactive_user/...",
    "error": {
        ".tag": "suspend_inactive_user"
    }
}
```


## Bulk Update Email Addresses {178552248240527000}

### Change Email {162930776540528000}

| | |
|--|--|
|__Name__| Change Email|
|__URL__| https://api.dropboxapi.com/2/team/members/set_profile |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag":"email",
        "email":"{{current_email}}"},
        "new_email":"{{new_email}}"
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/set_profile'
```



#### Response Examples

##### Example 1: Change Email - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
user_not_in_team Void The user is not a member of the team.

{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 2: Change Email - Error: user_not_found

```json
Code: 0 
------------------------------------------
user_not_found Void No matching user found. The provided team_member_id, email, or external_id does not exist on this team.

{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```

##### Example 3: Change Email - Error: set_profile_disallowed

```json
Code: 0 
------------------------------------------
set_profile_disallowed Void Modifying deleted users is not allowed.

{
    "error_summary": "set_profile_disallowed/...",
    "error": {
        ".tag": "set_profile_disallowed"
    }
}
```

##### Example 4: Change Email - Error: external_id_used_by_other_user

```json
Code: 0 
------------------------------------------
external_id_used_by_other_user Void The external ID is already in use by another team member.

{
    "error_summary": "external_id_used_by_other_user/...",
    "error": {
        ".tag": "external_id_used_by_other_user"
    }
}
```

##### Example 5: Change Email - Error: email_reserved_for_other_user 

```json
Code: 0 
------------------------------------------
email_reserved_for_other_user Void Email is already reserved for another user.

{
    "error_summary": "email_reserved_for_other_user/...",
    "error": {
        ".tag": "email_reserved_for_other_user"
    }
}
```

##### Example 6: Change Email - Error: persistent_id_disabled

```json
Code: 0 
------------------------------------------
persistent_id_disabled Void Persistent ID is only available to teams with persistent ID SAML configuration. Please contact Dropbox for more information.

{
    "error_summary": "persistent_id_disabled/...",
    "error": {
        ".tag": "persistent_id_disabled"
    }
}
```

##### Example 7: Change Email - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 8: Change Email - Error: persistent_id_used_by_other_user

```json
Code: 0 
------------------------------------------
persistent_id_used_by_other_user Void The persistent ID is already in use by another team member.

{
    "error_summary": "persistent_id_used_by_other_user/...",
    "error": {
        ".tag": "persistent_id_used_by_other_user"
    }
}
```

##### Example 9: Change Email - Error: directory_restricted_off

```json
Code: 0 
------------------------------------------
directory_restricted_off Void Directory Restrictions option is not available.

{
    "error_summary": "directory_restricted_off/...",
    "error": {
        ".tag": "directory_restricted_off"
    }
}
```

##### Example 10: Change Email - Error: external_id_and_new_external_id_unsafe

```json
Code: 0 
------------------------------------------
external_id_and_new_external_id_unsafe Void It is unsafe to use both external_id and new_external_id.

{
    "error_summary": "external_id_and_new_external_id_unsafe/...",
    "error": {
        ".tag": "external_id_and_new_external_id_unsafe"
    }
}
```

##### Example 11: Change Email - Error: no_new_data_specified

```json
Code: 0 
------------------------------------------
no_new_data_specified Void None of new_email, new_given_name, new_surname, or new_external_id are specified.

{
    "error_summary": "no_new_data_specified/...",
    "error": {
        ".tag": "no_new_data_specified"
    }
}
```

##### Example 12: Change Email - Success

```json
Code: 0 
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
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102\u0026size=128x128"
    },
    "role": {
        ".tag": "member_only"
    }
}
```

##### Example 13: Change Email - Error: param_cannot_be_empty

```json
Code: 0 
------------------------------------------
param_cannot_be_empty Void Parameter new_email cannot be empty.

{
    "error_summary": "param_cannot_be_empty/...",
    "error": {
        ".tag": "param_cannot_be_empty"
    }
}
```


## Bulk Update External IDs {138081651140533000}

### Wipe External ID {426870043840533000}

| | |
|--|--|
|__Name__| Wipe External ID|
|__URL__| https://api.dropboxapi.com/2/team/members/set_profile |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "email",
        "email": "{{emailAddress}}"
    },
    "new_external_id": "{{new_external_id}}"
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/set_profile'
```



#### Response Examples

##### Example 1: Change Email - Success

```json
Code: 0 
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
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102\u0026size=128x128"
    },
    "role": {
        ".tag": "member_only"
    }
}
```

##### Example 2: Change Email - Error: directory_restricted_off

```json
Code: 0 
------------------------------------------
directory_restricted_off Void Directory Restrictions option is not available.

{
    "error_summary": "directory_restricted_off/...",
    "error": {
        ".tag": "directory_restricted_off"
    }
}
```

##### Example 3: Change Email - Error: email_reserved_for_other_user 

```json
Code: 0 
------------------------------------------
email_reserved_for_other_user Void Email is already reserved for another user.

{
    "error_summary": "email_reserved_for_other_user/...",
    "error": {
        ".tag": "email_reserved_for_other_user"
    }
}
```

##### Example 4: Change Email - Error: no_new_data_specified

```json
Code: 0 
------------------------------------------
no_new_data_specified Void None of new_email, new_given_name, new_surname, or new_external_id are specified.

{
    "error_summary": "no_new_data_specified/...",
    "error": {
        ".tag": "no_new_data_specified"
    }
}
```

##### Example 5: Change Email - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
user_not_in_team Void The user is not a member of the team.

{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 6: Change Email - Error: persistent_id_used_by_other_user

```json
Code: 0 
------------------------------------------
persistent_id_used_by_other_user Void The persistent ID is already in use by another team member.

{
    "error_summary": "persistent_id_used_by_other_user/...",
    "error": {
        ".tag": "persistent_id_used_by_other_user"
    }
}
```

##### Example 7: Change Email - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 8: Change Email - Error: user_not_found

```json
Code: 0 
------------------------------------------
user_not_found Void No matching user found. The provided team_member_id, email, or external_id does not exist on this team.

{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```

##### Example 9: Change Email - Error: set_profile_disallowed

```json
Code: 0 
------------------------------------------
set_profile_disallowed Void Modifying deleted users is not allowed.

{
    "error_summary": "set_profile_disallowed/...",
    "error": {
        ".tag": "set_profile_disallowed"
    }
}
```

##### Example 10: Change Email - Error: persistent_id_disabled

```json
Code: 0 
------------------------------------------
persistent_id_disabled Void Persistent ID is only available to teams with persistent ID SAML configuration. Please contact Dropbox for more information.

{
    "error_summary": "persistent_id_disabled/...",
    "error": {
        ".tag": "persistent_id_disabled"
    }
}
```

##### Example 11: Change Email - Error: param_cannot_be_empty

```json
Code: 0 
------------------------------------------
param_cannot_be_empty Void Parameter new_email cannot be empty.

{
    "error_summary": "param_cannot_be_empty/...",
    "error": {
        ".tag": "param_cannot_be_empty"
    }
}
```

##### Example 12: Change Email - Error: external_id_used_by_other_user

```json
Code: 0 
------------------------------------------
external_id_used_by_other_user Void The external ID is already in use by another team member.

{
    "error_summary": "external_id_used_by_other_user/...",
    "error": {
        ".tag": "external_id_used_by_other_user"
    }
}
```

##### Example 13: Change Email - Error: external_id_and_new_external_id_unsafe

```json
Code: 0 
------------------------------------------
external_id_and_new_external_id_unsafe Void It is unsafe to use both external_id and new_external_id.

{
    "error_summary": "external_id_and_new_external_id_unsafe/...",
    "error": {
        ".tag": "external_id_and_new_external_id_unsafe"
    }
}
```


## Wipe All External IDs {404389573040539000}

### Get more users {26037481640539000}

| | |
|--|--|
|__Name__| Get more users|
|__URL__| https://api.dropboxapi.com/2/team/members/list/continue |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{"cursor": "{{cursor_wipe_ext_id}}"}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/list/continue'
```



#### Response Examples

##### Example 1: Get more users - Error: other

```json
Code: 0 
------------------------------------------


{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 2: Get more users - Error: invalid_cursor

```json
Code: 0 
------------------------------------------


{
    "error_summary": "invalid_cursor/...",
    "error": {
        ".tag": "invalid_cursor"
    }
}
```

##### Example 3: Get more users - Success

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


### Get users {404113577940547000}

| | |
|--|--|
|__Name__| Get users|
|__URL__| https://api.dropboxapi.com/2/team/members/list |
|__Method__| POST|

#### Description
Initial call for users. If &quot;has_more&quot; object = true then &quot;get more users&quot; continues.

#### Request

```sh
curl -X 'POST' -d '{"limit": 100,
    "include_removed": false
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/list'
```



#### Response Examples

##### Example 1: Get users - Error: MembersListError

```json
Code: 0 
------------------------------------------
MembersListError (open union)
```

##### Example 2: Get users - Success

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


### Wipe External ID {426870043840550000}

| | |
|--|--|
|__Name__| Wipe External ID|
|__URL__| https://api.dropboxapi.com/2/team/members/set_profile |
|__Method__| POST|



#### Request

```sh
curl -X 'POST' -d '{
    "user": {
        ".tag": "email",
        "email": "{{emailAddress}}"
    },
    "new_external_id": ""
}' -H 'Authorization: Bearer {{access_token}}' -H 'Content-Type: application/json' 'https://api.dropboxapi.com/2/team/members/set_profile'
```



#### Response Examples

##### Example 1: Change Email - Error: external_id_and_new_external_id_unsafe

```json
Code: 0 
------------------------------------------
external_id_and_new_external_id_unsafe Void It is unsafe to use both external_id and new_external_id.

{
    "error_summary": "external_id_and_new_external_id_unsafe/...",
    "error": {
        ".tag": "external_id_and_new_external_id_unsafe"
    }
}
```

##### Example 2: Change Email - Error: user_not_found

```json
Code: 0 
------------------------------------------
user_not_found Void No matching user found. The provided team_member_id, email, or external_id does not exist on this team.

{
    "error_summary": "user_not_found/...",
    "error": {
        ".tag": "user_not_found"
    }
}
```

##### Example 3: Change Email - Error: persistent_id_disabled

```json
Code: 0 
------------------------------------------
persistent_id_disabled Void Persistent ID is only available to teams with persistent ID SAML configuration. Please contact Dropbox for more information.

{
    "error_summary": "persistent_id_disabled/...",
    "error": {
        ".tag": "persistent_id_disabled"
    }
}
```

##### Example 4: Change Email - Error: directory_restricted_off

```json
Code: 0 
------------------------------------------
directory_restricted_off Void Directory Restrictions option is not available.

{
    "error_summary": "directory_restricted_off/...",
    "error": {
        ".tag": "directory_restricted_off"
    }
}
```

##### Example 5: Change Email - Error: persistent_id_used_by_other_user

```json
Code: 0 
------------------------------------------
persistent_id_used_by_other_user Void The persistent ID is already in use by another team member.

{
    "error_summary": "persistent_id_used_by_other_user/...",
    "error": {
        ".tag": "persistent_id_used_by_other_user"
    }
}
```

##### Example 6: Change Email - Error: other

```json
Code: 0 
------------------------------------------
{
    "error_summary": "other/...",
    "error": {
        ".tag": "other"
    }
}
```

##### Example 7: Change Email - Error: email_reserved_for_other_user 

```json
Code: 0 
------------------------------------------
email_reserved_for_other_user Void Email is already reserved for another user.

{
    "error_summary": "email_reserved_for_other_user/...",
    "error": {
        ".tag": "email_reserved_for_other_user"
    }
}
```

##### Example 8: Change Email - Error: no_new_data_specified

```json
Code: 0 
------------------------------------------
no_new_data_specified Void None of new_email, new_given_name, new_surname, or new_external_id are specified.

{
    "error_summary": "no_new_data_specified/...",
    "error": {
        ".tag": "no_new_data_specified"
    }
}
```

##### Example 9: Change Email - Error: user_not_in_team

```json
Code: 0 
------------------------------------------
user_not_in_team Void The user is not a member of the team.

{
    "error_summary": "user_not_in_team/...",
    "error": {
        ".tag": "user_not_in_team"
    }
}
```

##### Example 10: Change Email - Error: external_id_used_by_other_user

```json
Code: 0 
------------------------------------------
external_id_used_by_other_user Void The external ID is already in use by another team member.

{
    "error_summary": "external_id_used_by_other_user/...",
    "error": {
        ".tag": "external_id_used_by_other_user"
    }
}
```

##### Example 11: Change Email - Success

```json
Code: 0 
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
        "profile_photo_url": "https://dl-web.dropbox.com/account_photo/get/dbaphid%3AAAHWGmIXV3sUuOmBfTz0wPsiqHUpBWvv3ZA?vers=1556069330102\u0026size=128x128"
    },
    "role": {
        ".tag": "member_only"
    }
}
```

##### Example 12: Change Email - Error: set_profile_disallowed

```json
Code: 0 
------------------------------------------
set_profile_disallowed Void Modifying deleted users is not allowed.

{
    "error_summary": "set_profile_disallowed/...",
    "error": {
        ".tag": "set_profile_disallowed"
    }
}
```

##### Example 13: Change Email - Error: param_cannot_be_empty

```json
Code: 0 
------------------------------------------
param_cannot_be_empty Void Parameter new_email cannot be empty.

{
    "error_summary": "param_cannot_be_empty/...",
    "error": {
        ".tag": "param_cannot_be_empty"
    }
}
```





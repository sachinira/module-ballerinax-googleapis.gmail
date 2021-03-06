// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerina/os;
import ballerinax/googleapis_gmail as gmail;

gmail:GmailConfiguration gmailConfig = {
    oauthClientConfig: {
        refreshUrl: gmail:REFRESH_URL,
        refreshToken: os:getEnv("REFRESH_TOKEN"),
        clientId: os:getEnv("CLIENT_ID"),
        clientSecret: os:getEnv("CLIENT_SECRET")
    }
};

gmail:Client gmailClient = new(gmailConfig);

public function main(string... args) {
    
    log:print("Delete label");
    // The user's email address. The special value **me** can be used to indicate the authenticated user.
    string userId = "me";
    
    // The ID of an already created label that we want to delete
    string createdLabelId = "<LABEL_ID>";

    boolean|error deleteLabelResponse = gmailClient->deleteLabel(userId, createdLabelId);
     
    if (deleteLabelResponse == true) {
        log:printError("Successfully deleted the message");
    } else {
        log:print("Failed to delete the message");
    }

    log:print("End!");
}

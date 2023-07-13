#/*- ---license-start
#* CAMARA Project
#* ---
#* Copyright (C) 2022 - 2023 Contributors | Deutsche Telekom AG to CAMARA a Series of LF Projects, LLC
#* The contributor of this file confirms his sign-off for the
#* Developer Certificate of Origin (http://developercertificate.org).
#* ---
#* Licensed under the Apache License, Version 2.0 (the "License");
#* you may not use this file except in compliance with the License.
#* You may obtain a copy of the License at
#*
#*      http://www.apache.org/licenses/LICENSE-2.0
#*
#* Unless required by applicable law or agreed to in writing, software
#* distributed under the License is distributed on an "AS IS" BASIS,
#* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#* See the License for the specific language governing permissions and
#* limitations under the License.
#* ---license-end
#*/

@TI @TIDSanity
Feature: Automated Traffic Influence API System Integration Test

  @TIessionCreateGetDelete
  Scenario: Create Traffic Influence with mandatory parameters
    Given Use the TI MOCK URL
    Given Use the Mock Database
    When Create a new TI with mandatory parameters using POST
    Then It should be created a new Traffic Influence
    And Response code is 201 
    And response contains TI identifier and TI parameters
    When Ask for previously created TI session
    Then Response code is 200
    And response contains TI object
    When Delete existing TI 
    Then Response code is 200

  @TIessionCreateGetDeleteAllparams
  Scenario: Create Traffic Influence with mandatory parameters
    Given Use the TI MOCK URL
    Given Use the Mock Database
    When Create a new TI with mandatory parameters using POST
    Then It should be created a new Traffic Influence
    And Response code is 201 
    And response contains TI identifier and TI parameters
    When Ask for previously created TI session
    Then Response code is 200
    And response contains TI object
    When Delete existing TI 
    Then Response code is 200

  @TICreateSessionDeleteInvalidTI
  Scenario: Delete a Invalid TI after creation id
    Given Use the TI MOCK URL
    Given Use the Mock Database
    When Create a new TI with mandatory parameters using POST
    Then It should be created a new Traffic Influence
    And Response code is 201 
    And response contains TI identifier and TI parameters
    When Ask for previously created TI session
    Then Response code is 200
    And response contains TI object
    When Delete existing TI 
    Then Response code is 40x

  @TICreateSessionUpdateDelete
  Scenario: Delete a Invalid TI after creation id
    Given Use the TI MOCK URL
    Given Use the Mock Database
    When Create a new TI with mandatory parameters using POST
    Then It should be created a new Traffic Influence
    And Response code is 201 
    And response contains TI identifier and TI parameters
    When Ask for previously created TI session
    Then Response code is 200
    When Modify already created TI with mandatory parameters
    Then Response code is 200
    And response contains TI object
    When Delete existing TI 
    Then Response code is 40x

  @TIIncompleteParametersCreateTI
  Scenario: TI session with 5XX response
    Given Use the TI MOCK URL
    When Create a new TI session along without mandatory parameters using POST
    Then Response code is 40x
    
  @TIInvalidParametersCreateTI
  Scenario: TI session with 5XX response
    Given Use the TI MOCK URL
    When Create a new TI session along with invalid parameters (e.g. IP, subnet, TCP Ports) 
    Then Response code is 40x



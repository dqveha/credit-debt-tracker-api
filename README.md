# Credit Debt Tracker API

## [https://github.com/dqveha/credit-debt-tracker-api](https://github.com/dqveha/credit-debt-tracker-api)

#### By Dave Lindqvist

---

##

This is the eleventh independent project (Ruby, Week 6) assigned by Epicodus to build an API of our choice. Credit Debt Tracker API is inspired due to my lack of understanding with how credit card interest works (and /**ahem**/ a few poor purchases within the past year).

This API is designed for a user to create an account within the web application, receive an API token, and then use the API key as a bearer token to make requests to the API. The API is also CORS activated.

## Technologies Used

1. Docker
2. Ruby 2.6.5
3. Rails v5.2.4
4. PostgreSQL
5. Postman
6. Visual Studio Code

## Ruby Gems Used

1. Devise
2. Lockbox
3. Blind_index
4. Dotenv-rails
5. Rack-CORS

---

## Setup and Use

1. Open your terminal
2. Clone this repo to your desktop:

```
https://github.com/dqveha/credit-debt-tracker-api.git
```

3. Open the `credit-debt-tracker-api` directory using Visual Studio Code
4. Run command `docker-compose up --build` in your terminal
5. To set up the server-side database, type `docker-compose run api bundle exec rake db:create` in your terminal
6. Type `docker-compose run api bundle exec rake db:migrate`
7. To seed an account, type in the terminal `docker-compose run api bundle exec rake db:seed` and visit the `db/seeds.rb` directory for info about the seeded account

---

## API Documentation

In order to explore the API endpoints, you are required to use Postman with an API key.

To obtain a key:

1. Open `http://localhost:3000/` in the browser
2. Click on `Sign In` and login with the seeded account information per **Setup and Use**, `Step #7`
3. Click on `Edit Account` and copy the API key
4. Open Postman, click the 'Authorization' tab, then select 'Bearer token' as authorization type and paste the API key into the 'Token' field

====================================================

## Endpoints

Base URL: http://localhost:3000

..........................................................................................

### **HTTP Request Structure for 'Ledgers'**

```
GET     /api/v1/ledgers
POST 	/api/v1/ledgers
GET  	/api/v1/ledgers/{id}
PUT  	/api/v1/ledgers/{id}
DELETE 	/api/v1/ledgers/{id}
```

#### **Parameters**

|  Parameter   |  Type   | Default | Required for POST/PUT | Description                        |
| :----------: | :-----: | :-----: | :-------------------: | ---------------------------------- |
| account_name | string  |  none   |         true          | Account name for the ledger        |
|   user_id    | integer |  none   |         false         | User account related to the ledger |

#### **Example Query**

```
http://localhost:3000/api/v1/ledgers/
```

#### **Sample JSON Response**

```
{
    "id": 1,
    "account_name": "Dave",
    "created_at": "2021-08-22T20:17:25.276Z",
    "updated_at": "2021-08-22T20:17:25.276Z",
    "user_id": 1
}
```

====================================================

### **HTTP Request Structure for 'Credit Cards'**

**a)**

```
GET     /api/v1/ledgers/{ledger_id}/credit_cards
POST 	/api/v1/ledgers/{ledger_id}/credit_cards
GET 	/api/v1/ledgers/{ledger_id}/credit_cards/{credit_card_id}
PUT  	/api/v1/ledgers/{ledger_id}/credit_cards/{credit_card_id}
DELETE 	/api/v1/ledgers/{ledger_id}/credit_cards/{credit_card_id}
```

**b)**

```
GET   	/api/v1/ledgers/{ledger_id}/credit_cards/{credit_card_id}/calculate_month_interest
```

#### **Parameters**

**a)**
| Parameter | Type | Default | Required for POST/PUT | Description |
| :---: | :---: | :---: | :---: | --- |
| credit_id | integer | none | false | Unique credit card ID
| credit_balance | string | none | true | The balance of the credit card account
| apr_purchases | float | none | true | Annual Percentage Rate for purchases, and inputted as a decimal (i.e. **1.00** = 100%) |
| ledger_id | integer | none | false | Associated ledger account with the credit card
| set_day_of_payment | date | none | true | Date of payment

**b)**
| Parameter | Type | Default | Required | Description|
| :---: | :---: | :---: | :---: | --- |
| month_interest | float | none | false | Calculated month interest based off of credit_balance, and apr_purchases

#### **Example Query**

**a)**

```
http://localhost:3000/api/v1/ledgers/1/credit_cards
```

**b)**

```
http://localhost:3000/api/v1/ledgers/1/credit_cards/1/calculate_month_interest
```

#### **Sample JSON Response**

**a)**

```
[
    {
        "id": 1,
        "credit_balance": 11800,
        "apr_purchases": 0.2299,
        "set_day_of_payment": "2021-08-20",
        "ledger_id": 1,
        "created_at": "2021-08-22T20:17:25.296Z",
        "updated_at": "2021-08-22T20:17:25.296Z"
    },
    {
        "id": 2,
        "credit_balance": 1979,
        "apr_purchases": 0.1599,
        "set_day_of_payment": "2021-08-10",
        "ledger_id": 1,
        "created_at": "2021-08-22T20:17:25.309Z",
        "updated_at": "2021-08-22T20:17:25.309Z"
    }
]
```

**b)**

```
{
    "credit_id": 1,
    "credit_balance": 11800,
    "apr_purchases": 0.2299,
    "ledger_id": 1,
    "set_day_of_payment": "2021-08-20",
    "month_interest": 222.97
}
```

---

## Bugs:

1. If requesting to POST a new ledger, it will return a 500 internal server error if a ledger already exists. While the intention is not to return a 500 internal server error, it is intended for a one-to-one relationship with a user account and its ledger.

## Plans for improvement:

1. Add routes to calculate interest for Cash Advance APR and Promotional APR
2. Calculate average interest 
```
Example:

[(15 days * 2500 balance + 15 days * 1900 balance)/30 days] * (0.1499 APR / 365) * 30 day billing period = $25.08
```
3. Calculate 'X' amount of months and a year

---

### License is under the [MIT License](https://opensource.org/licenses/MIT). Copyright (C) 2021 Dave Lindqvist. All Rights Reserved.

```
MIT License

Copyright (c) 2021 Dave Lindqvist

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

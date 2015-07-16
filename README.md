# Price Tracker
DBC Final Project June 2015

Team Members: Jacob Moyle, Kelsey Pedersen, Dani Rigsby, Mary Wallace

Price Tracker makes online shopping easy and fast. 

To build Price Tracker we used Ruby on Rails API for the back-end, PostgreSQL for the database, Heroku Scheduler for the background jobs, Firebase for Facebook OAuth, Shopstyle for the retail information, Twilio to send notifications and PhoneGap to create a mobile application. 

Users sign up through their Facebook account. We use the Shopstyle API to pull in product information from hundreds of retails. The user is able to add a specific product with a max willingness to pay price to their "wants list." This adds the product to our background job queue -- which then compares the max willingness to pay price with the current price every 10 minutes. 

Once the Shopstyle price drops below the max willingness to pay price, the user receives a text notification via Twilio. The user then can buy the product directly through the retailer's site.

Our app eliminates the need to constantly price compare across multiple sites and time periods for the user to find an item for their ideal price -- by adding an item to their wants list, Price Tracker does the rest of the work.

```
**:See decoupled frontend here: https://github.com/kpedersen00/price-tracker-client:**
```


## Day 1
Today was the first day of our final project. We worked on planning our vision, values, measures of success, working time agreement and the definition of done in the morning. In the afternoon, we discussed our database schema, wireframing for the MVP, technology to be used for the project.

## Day 2
We worked on our schema design, researched implementing PhoneGap, showed "hello world" via our app with PhoneGap, set up our test database for users, wants and products, used an online iOS mobile simulator, started researching Firebase, designed wireframes and started our RSPEC testing.

## Day 3
We wrote our JSON routes, successfully set up and called our API to show JSON to our correct routes, continued to research Firebase, continued to write RSPEC tests for our controllers.

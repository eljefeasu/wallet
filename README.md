# Wallet App

This is an app that lets a user keep track of transactions on an account.

The root directory pulls up the 'Dashboard'. On the Dashboard you can view:
  * The total amount of money in your account
  * The total number of transactions you have had
  * The total amount of money spent this month
  * The total amount of money spent the previous month
  * The total transactions you've had this month
  * The total transactions you've had the previous month
  * The biggest expense of the current month
  * The biggest expense of all time
  * The person/place you have spent the most money

/transactions will show a list of all transactions

/transactions/new will allow a user to input information to add a new transaction

Functions exist to edit and also delete any transaction that has been entered

### Estimate for time to complete

I believe it will take 6 hours to complete this assignment

*Reflection: I overestimated how long it would take to do this assignment. It seemed pretty difficult
when reading through the requirements, but once I broke it down into smaller chunks it went much quicker*


#### Part One

- [x] Generate scaffold for wallet
- [x] User should be able to go to the root URL of the application and see a Dashboard
- [x] The Dashboard should include the total amount of money in his/her account
- [x] The Dashboard should include the total number of transactions ever
- [x] The Dashboard should include a link to the list of transactions
- [x] The Dashboard should include a link to create a new transaction
- [x] The Dashboard should give a message if the balance on the account is negative
- [x] Scaffolded page which allows user to edit transaction
- [x] Scaffolded page which allows user to delete transaction
- [x] Total and count on the root page should update as the transactions change
- [x] Have a database column which shows the name of the person/organization receiving the money
- [x] Create a column for amount and a column indicating whether debit or credit
- [x] Choose decimal
- [x] Do not use the name transaction in the database, use 'description'
- [x] First transaction in the application will be 'initial balance'; assume starting balance of $0


#### Part Two

- [x] Dashboard includes total amount spent in the current month
- [x] Dashboard includes total amount spent in the previous month
- [x] Dashboard includes total number of transactions in the current month
- [x] Dashboard includes total number of transactions in the previous month
- [x] Dashboard includes the biggest expense of the current month
- [x] Dashboard includes the biggest expense ever
- [x] Dashboard includes the place/person where you have spent the most money (all time)

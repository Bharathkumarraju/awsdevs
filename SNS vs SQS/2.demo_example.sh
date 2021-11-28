example:
-------------------->

1. An user making a purchase may be on some website or through some POS terminal and putting in their credentials to by some kind of product.

2. Now they are making a purchase request to some kind of REST API and we are just calling this Transaction Processing Webservice.

3. And the 'payload' of what gets passed into this webservice looks like below.

   {
       "TransactionId": "123456",
       "CustomerId": "CID_123",
       "CustomerEmail": "bkr@gmail.com",
       "Amount": 5000.000
   }

4. From the processing perspective if we get a request containing this kind of event, the first thing we need to do is communicate with some kind of creditcard authority service.
   Practically speaking probably Visa,Mastercard,Amex all these creditcard authority services/

5. So when an event occurs saying that someone is attempting to purchase somethig we need to validate that against the authority service.

6. So the first thing we do is, you probably call that service and say here is the CustomerID , may be they passed in some credentials including their PIN or something like that.
   and that get validates aganinst the authority service, and in this example lets just assume that they returned 200 Okay, alright the Transaction is good, the credentials are correct this thing went through.

7. Now in this ecommerce example this is an event that matters right, because someone attempted to purchase something and it went through so it was successful and this is something that is potentially 
   relevant to many different subsystems that exists in your ecommerce ecosystem so may be we want to publish this event, i.e. this Transaction to SNS Topic right.

8. So you are basically telling the world that you are pulishing an event to this SNS Topic, and from this topic there can be multiple different subscribers with all narrow usecases.
   So in this example we have three different ones i.e. one lambda functiona and two SQS queues(shown in the picture - )

9. In the first case when a message gets delivered may be we have some kind of 'customer reminder service(A lambda function)' - this 'lambda fucntion' delivers message(via Email) to customer saying that Thank you for ordering we appreciate your business.

10. And completely separately there is two other subsystems(two SQS Queues) here they care about this same event but they do very different things so we dont want to mix the responsibilities of these different things.

11. So we want to have a separate systems that allows us to process these events in parallel and completely independent of one another.

12. May be the second system here with the queue its some kind of analytics engine - 'Transaction Analytics Queue' - so when an event occurs in-addition to publishing to a lambda function,
    we are also publishing that same event to the some analytics queue i.e. "Transaction Analytics Queue" - one of its responsibilities is it cares about how many orders are generated in a single day and
    we want to show that in some dashboard. So when an event occurs the 'payload' gets delivered to that queue.

13. On its own the analytics queue i.e. 'Transaction Analytics Queue' can not do anything 








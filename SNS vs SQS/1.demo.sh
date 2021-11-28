SNS:
------------------------------------------------------------------------------------------------------------------------->

SNS uses a publisher subscriber system

So we may own a Topic and we publish to that topic. 
And subscribers get notified of events that are delivered to that topic.

publishing a message to a topic can deliver-to too many subscribers.

Those suscribers can be of different types(SQS, Lambda, Email).
So you can have SQS a subscriber or a lambda function or even an Email as a subscriber.


Question:
----------------->
Do other systems care about an event? YES --> You send data to other systems.

SQS:
-------------------------------------------------------------------------------------------------------------------------->

Its a queueing service for message processing

so this example on SQS could be a subscriber to an SNS.
so whenever someone publishes message to an SNS your SQS queue can get a message in it that can be processed at a later time.

Actually a system that must poll the queue to discover new events.

So whenever an event is delivered to the queue there is nothing thats gonna get invoked. there is no system that automatically can become aware of it.
you need to have some separate thread thats polling the queue to discover when new events get delivered and have a mechanism to actually process it and then delete the message from the queue.

So messages in the queue are typically processed by a single consumer or a single service with a very narrow responsibility.

And different services if they both care about the same events they can have their own separate queues. 


Question:
----------------->
Does your system care about an event? YES  --> do you care about the data cause you are the one recieve the data.










---
layout: post
title: Developing for Ops
created: 1413308069
categories:
- debugging
- devops
- bugs
---
We often work on large websites with strict change control practices and scheduled release cycles. Sometimes we also hand over the systems to the client for production and don’t have direct access ourselves.

Some bugs have a nasty habit of only occurring in production, this may be due to high load, odd/old browsers, changes in data, or just because test scenarios don’t cover every eventuality.

What this means is that when we have a bug in production we can only understand it through the error logging we have already built into the system. If we need to put in place additional logging we usually lose the chance of actually fixing the bug for another release cycle.

One of the real arts in this flow of development is to be pessimistic enough to assume that somehow something is going to go wrong, to remember that the people who see the bug will not be the developers who know the code, and that at this point (unlike during dev) we will have very limited access to the systems we might want to debug.

One temptation is to log everything - but you soon find that doesn’t scale.

The art of error messages is a bit like the art of commenting - especially for those errors that should never happen. You often don’t need to say exactly what went wrong, hopefully your compiler or runtime engine will do this along with a stacktrace or at least a line number. You need to say what it means to have this error - especially if it indicates a breakdown in business logic. It also helps to raise errors as early in the code flow as possible.

When working on a large project with multiple teams it is especially helpful for errors to make clear whenever possible which team the bug belongs to. Clear error data like this can really cut down on the politics that can accompany a production bug and radically reduce the time to fix.

For example let’s imagine that we are developing a website, we are responsible for the shopfront but we obtain product data from a feed. As well as all the bugs that can occur in our code there are likely to be a whole host of possible problems with the incoming data. 

What if we receive a null instead of the agreed object, what if the price is non numeric (or zero, or negative), what if an expected field is missing? 



You might display a product with zero price, fail to display it, or perhaps you do catch an error but the log just says something like “Notice:  Trying to get property of non-object”. The bug gets reported to the front end team - because that’s where the error appears. The front end team can’t see the production data. 

The politics here is that teams often blame each other, developers are generally optimistic that their code is good and pessimistic about other teams code. Therefore bugs get thrown over the wall too quick and then get thrown back - leaving bugs bouncing about with no fix.

Now imagine you have explicit validation at the point you load third party data (or any place you have a boundary of responsibility like this). You log an error that points directly to the data feed, hopefully with the actual data that is wrong, perhaps even logging the request/response pair that led to it. This time you can give the data team enough info that they can quickly identify the problem. Conversely if you have missing products and no data errors - the impossible has happened - there is a bug in your own code. Now you get to be the hero and fix it.

Remember, in development (where developers spend 95%) of their time this bug would be trivial, the developer would see the error, know which bit of code it related to, be able to view the data feed, and report the bug back to the data team. The trick is to remember it won’t be like this in production.

In my experience it is well worth spending a chunk of time up front writing good generic error routines, that capture as much detail as possible, and 5 or 10 minutes every day looking at stubbed out error routines. 

This may add up to a non-trivial time investment - but you only have to save a few minor production bugs to get paid back plenty.

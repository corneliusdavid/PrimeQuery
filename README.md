# PrimeQuery
This started out as a simple Windows phone app to test to see if a number was prime or not. 
Using Oxygene in Visual Studio, it grew into a challenge to see how many different environments
this simple app could be ported to and how to do it with as much shared code as possible.

With Oxygene's Shared Project capability and ready support for all the major platforms, this
turned out to be quite a delightful road of discovery.

There are three classes in one shared project file:
* PrimeNumberQuery - the main class for testing primality
* PrimeNumberEdit - a class to centralize user interface functionality
* PrimeNumberList - a class to make it easy to generate a range of prime number.

The environments supported include:
* Unit testing - using EUnit, RemObject's Oxygene version of NUnit
* Console app
* Windows Desktop app using WPF/XAML
* Windows Phone app (XAML)
* ASP.NET Web Forms app (in development)
* ASP.NET MVC Web app (future)
* Android app (future)
* iPhone app (maybe)

# [Wagg.ly - Dog Walking Web App](https://delightful-coast-0d5ddf203.5.azurestaticapps.net/)

Wagg.ly is a cloud based web app, hosted in Microsoft Azure, which helps dog owners identify dog walkers in their area. All code required to deploy the prototype  is contained within this repository, which can be implemented through the process set out below:

## 1. Create SQL Server and Database

- Within Azure Portal, navigate to *'Create a resource > SQL Database'* and create a new SQL Database Server using SQL authentication.
- Set Service and compute tier to General Purpose and Serverless respectively. For prototyping purposes, compute hardware and data max size settings can be set to the minimum.
- Ensure that the *'Add current client IP address'* and *'Allow Azure services and resources to access this server'* settings in the Networking tab are set to Yes.
- Once the database has been set up, navigate to the query editor and sign in. Execute [the setup script](/sqlserver/setup.sql) which drops and creates the necessary tables as appropriate.

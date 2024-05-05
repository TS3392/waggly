# [Wagg.ly - Dog Walking Web App](https://delightful-coast-0d5ddf203.5.azurestaticapps.net/) :dog::dog2::heart_eyes:

Wagg.ly is a cloud based web app, hosted in Microsoft Azure, which helps dog owners identify dog walkers in their area. All code required to deploy the prototype  is contained within this repository, which can be implemented through the process set out below:

## 1. Create SQL Server and Database

- Within Azure Portal, navigate to *'Create a resource > SQL Database'* and create a new SQL Database Server using SQL authentication.
- Set *'Service and compute tier'* to *'General Purpose'* and *'Serverless'* respectively. For prototyping purposes, compute hardware and data max size settings can be set to the minimum.
- Ensure that the *'Add current client IP address'* and *'Allow Azure services and resources to access this server'* settings in the Networking tab are set to Yes.
- Once the database has been set up, open *'Query editor'* and sign in. Execute [the setup script](/sqlserver/setup.sql) which drops and creates the necessary tables as appropriate.
- Within the database, navigate to *'Settings > Connection strings'* and copy the connection string titled *'ADO.NET (SQL authentication)'*. Replace *{your_password}* accordingly and keep aside for later use.

## 2. Create Azure Functions

- Ensure the following installations are in place:  
  - [Visual Studio Code](https://code.visualstudio.com/)
  - [Python 3.10](https://www.python.org/downloads/release/python-3100/)
  - [Python Extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
  - [Azure Functions Extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions)
- Open Visual Studio Code, open the Azure extension (*Shift+Alt+A*) and sign into the Azure account used in Step 1.
- Navigate to *'Workspace > Create Function'* and *Create new project* in a new folder, using *'Python (Programming Model V2)'* as the language and *'3.10.0'* as the Python interpreter.
- In the Explorer for the new workspace, open *'function_app.py'* and replace the code in its entirety with [the version in this repository](functions/function_app.py).
- In the Resources section of the Azure extension, navigate to *'Create a resource > Create Function App in Azure'* and use *'Python 3.10'* as the runtime stack. 
- Right click on the new Function App and select *'Deploy to Function App'*. Once complete right click on *'Application Settings'* and select *'Add New Setting'*. The setting should be named ***SqlConnectionString*** and contain the connection string saved in Step 1.
- Right click on *register_dog* / *register_walker*, select *'Copy Function Url'* and keep the links to each function aside.
- Open the Function App within the Azure Portal and navigate to *'API > CORS'*. Add '*' to *Allowed Origins* and ensure any others are removed. 

## 3. Create Static Web App

- Create a GitHub repository mirroring the structure of this repository. It must contain the files [index.html](index.html) and [Logo.png](Logo.png) in the root folder of the main branch.
- Within *'index.html'*, replace the API links for *'register_dog'* (line 146) and *'register_walker'* (line 171) with the function urls copied in Step 2 - ensure this version is uploaded to the repository before proceeding.
- Within Azure Portal, navigate to *Create a resource > Static Web App* to create a Static Web App using GitHub as the deployment source.The *'App location'* setting must point towards the repository root (/).
- Once fully complete, the fully functional app should be available using the link displayed in the service.

# Static app with terraform


## Deployment token
An Azure Static Web App has a deployment token.
This token is being used in the terraform apply.
The value of the token is stored in GitHub secrets.
When creating a new Static Web App from terraform (in a new environment or if the statuc web app was deleted), you must update the value of the token.
The value of the deployment token is found in the Azure portal:
* Find you Static Web App ressource
* Navigate to overview of the Static Web App Ressource
* Click "Manage deployment token"
* Copy the token
* Ensure the relevant GitHub secrets value is updated with the value of the deployment token



[Azure Static Web Apps](https://docs.microsoft.com/azure/static-web-apps/overview) allows you to easily build JavaScript apps in minutes. Use this repo with the [quickstart](https://docs.microsoft.com/azure/static-web-apps/getting-started?tabs=vanilla-javascript) to build and customize a new static site.

This repo is used as a starter for a _very basic_ HTML web application using no front-end frameworks.

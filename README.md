# powerbi_genesys_analytics_data
Power BI custom connector to load analytics data from Genesys Cloud CSV [static link](https://help.mypurecloud.com/articles/generate-static-link/).

This is for Microsoft Visual Studio Code.

## Instructions
1. Install Power Query SDK in Microsoft Visual Studio Code.
2. Create Implicit Grant OAuth in Genesys Cloud. Enter `https://oauth.powerbi.com/views/oauthredirect.html` in Authorized Redirect URIs.
3. Modify `client_id`, `redirect_uri` and `authorize_uri` in `genesys_analytics_data.pq`.
4. Build the connector using Ctrl+Shift+B (MakePQX).
5. Copy `powerbi_genesys_analytics_data.mez` in `.\bin\AnyCPU\Debug` folder to `{{user}}\Documents\Microsoft Power BI Desktop\Custom Connectors` folder.
6. Allow loading of uncertified connectors in Power BI Settings and restart Power BI.
7. Connector is categorized under Others. Use connector and type in Genesys Cloud CSV static link to load the data. Sign in using your Genesys Cloud credentials.

## To Test
1. Modify `genesys_analytics_data.query.pq` and enter a Genesys Cloud CSV static link in there.
2. Click on Power Query SDK at the bottom of Explorer Panel in Visual Studio Code.
3. Click Set Credential to enter Genesys Cloud credentials.
4. Click on Run TestConnection function.

## Reference Code
https://jussiroine.com/2019/02/building-a-custom-connector-for-power-bi-that-supports-oauth2-to-visualize-my-wellness-data/
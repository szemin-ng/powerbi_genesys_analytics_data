// This file contains your Data Connector logic
[Version = "1.0.0"]
section genesys_analytics_data;

client_id = "3ddf8fd9-62d8-49ea-bc79-6a5e6b68903b";
redirect_uri = "https://oauth.powerbi.com/views/oauthredirect.html";
authorize_uri = "https://login.mypurecloud.jp/oauth/authorize";

[DataSource.Kind="genesys_analytics_data", Publish="genesys_analytics_data.Publish"]
shared genesys_analytics_data.Contents = (url as text) =>
  let
    source = Csv.Document(Web.Contents(url))
  in
    source;

// Data Source Kind description
genesys_analytics_data = [
    TestConnection = (dataSourcePath) => { "genesys_analytics_data.Contents", dataSourcePath },
    Authentication = [
      OAuth = [
        StartLogin = StartLogin,
        FinishLogin = FinishLogin
      ]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

genesys_analytics_data.Icons = [
    Icon16 = { Extension.Contents("genesys_analytics_data16.png"), Extension.Contents("genesys_analytics_data20.png"), Extension.Contents("genesys_analytics_data24.png"), Extension.Contents("genesys_analytics_data32.png") },
    Icon32 = { Extension.Contents("genesys_analytics_data32.png"), Extension.Contents("genesys_analytics_data40.png"), Extension.Contents("genesys_analytics_data48.png"), Extension.Contents("genesys_analytics_data64.png") }
];

// Data Source UI publishing description
genesys_analytics_data.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = genesys_analytics_data.Icons,
    SourceTypeImage = genesys_analytics_data.Icons
];

StartLogin = (resourceUrl, state, display) =>
  let
    AuthorizeUrl = authorize_uri & "?" & Uri.BuildQueryString([
      client_id = client_id,
      response_type = "token",
      redirect_uri = redirect_uri
    ])
  in
    [
      LoginUri = AuthorizeUrl,
      CallbackUri = redirect_uri,
      WindowHeight = 600,
      WindowWidth = 800,
      Context = null
    ];

FinishLogin = (context, callbackUri, state) =>
  let
    token = Text.BetweenDelimiters(Uri.Parts(callbackUri)[Fragment], "access_token=", "&"),
    result = [access_token = token, token_type = "bearer"]
  in
    result;
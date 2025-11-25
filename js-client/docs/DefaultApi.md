# Th1.DefaultApi

All URIs are relative to *http://localhost:8080/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**convertTable**](DefaultApi.md#convertTable) | **POST** /converter/{tableStructureId} | Convert a table and save it to the database
[**createTableStructure**](DefaultApi.md#createTableStructure) | **POST** /table-structures | Create a new table structure
[**deleteTableStructure**](DefaultApi.md#deleteTableStructure) | **DELETE** /table-structures/{id} | Delete table structure by id
[**fileConvertTable**](DefaultApi.md#fileConvertTable) | **POST** /converter/file | Convert a table and return the result as a file
[**generateTableStructure**](DefaultApi.md#generateTableStructure) | **POST** /table-structures/generate | Generate a tableStructure and return the result as a json
[**getTableStructure**](DefaultApi.md#getTableStructure) | **GET** /table-structures/{id} | Get a table structure by id
[**getTableStructures**](DefaultApi.md#getTableStructures) | **GET** /table-structures | Get all table structures
[**previewConvertTable**](DefaultApi.md#previewConvertTable) | **POST** /converter/preview | Convert a table and return a preview of the result
[**submitFeedback**](DefaultApi.md#submitFeedback) | **POST** /feedback | Submit feedback
[**updateTableStructure**](DefaultApi.md#updateTableStructure) | **PUT** /table-structures/{id} | Update table structure by id



## convertTable

> convertTable(tableStructureId, file, opts)

Convert a table and save it to the database

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let tableStructureId = 789; // Number | 
let file = "/path/to/file"; // File | 
let opts = {
  'mode': "'CREATE'" // String | 
};
apiInstance.convertTable(tableStructureId, file, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tableStructureId** | **Number**|  | 
 **file** | **File**|  | 
 **mode** | **String**|  | [optional] [default to &#39;CREATE&#39;]

### Return type

null (empty response body)

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: Not defined


## createTableStructure

> Number createTableStructure(tableStructure)

Create a new table structure

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let tableStructure = new Th1.TableStructure(); // TableStructure | 
apiInstance.createTableStructure(tableStructure, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tableStructure** | [**TableStructure**](TableStructure.md)|  | 

### Return type

**Number**

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## deleteTableStructure

> deleteTableStructure(id)

Delete table structure by id

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let id = 789; // Number | 
apiInstance.deleteTableStructure(id, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Number**|  | 

### Return type

null (empty response body)

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## fileConvertTable

> File fileConvertTable(file, tableStructure, opts)

Convert a table and return the result as a file

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let file = "/path/to/file"; // File | 
let tableStructure = new Th1.TableStructure(); // TableStructure | 
let opts = {
  'page': 0 // Number | 
};
apiInstance.fileConvertTable(file, tableStructure, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **File**|  | 
 **tableStructure** | [**TableStructure**](TableStructure.md)|  | 
 **page** | **Number**|  | [optional] [default to 0]

### Return type

**File**

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/octet-stream


## generateTableStructure

> TableStructureGenerationResponse generateTableStructure(file, settings, opts)

Generate a tableStructure and return the result as a json

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let file = "/path/to/file"; // File | 
let settings = new Th1.TableStructureGenerationSettings(); // TableStructureGenerationSettings | 
let opts = {
  'page': 0 // Number | 
};
apiInstance.generateTableStructure(file, settings, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **File**|  | 
 **settings** | [**TableStructureGenerationSettings**](TableStructureGenerationSettings.md)|  | 
 **page** | **Number**|  | [optional] [default to 0]

### Return type

[**TableStructureGenerationResponse**](TableStructureGenerationResponse.md)

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## getTableStructure

> TableStructure getTableStructure(id)

Get a table structure by id

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let id = 789; // Number | 
apiInstance.getTableStructure(id, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Number**|  | 

### Return type

[**TableStructure**](TableStructure.md)

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## getTableStructures

> [TableStructureSummary] getTableStructures()

Get all table structures

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
apiInstance.getTableStructures((error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**[TableStructureSummary]**](TableStructureSummary.md)

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## previewConvertTable

> [[String]] previewConvertTable(file, tableStructure, opts)

Convert a table and return a preview of the result

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let file = "/path/to/file"; // File | 
let tableStructure = new Th1.TableStructure(); // TableStructure | 
let opts = {
  'limit': 10, // Number | 
  'page': 0 // Number | 
};
apiInstance.previewConvertTable(file, tableStructure, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **File**|  | 
 **tableStructure** | [**TableStructure**](TableStructure.md)|  | 
 **limit** | **Number**|  | [optional] [default to 10]
 **page** | **Number**|  | [optional] [default to 0]

### Return type

**[[String]]**

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## submitFeedback

> String submitFeedback(feedback)

Submit feedback

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let feedback = new Th1.Feedback(); // Feedback | 
apiInstance.submitFeedback(feedback, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **feedback** | [**Feedback**](Feedback.md)|  | 

### Return type

**String**

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## updateTableStructure

> updateTableStructure(id, tableStructure)

Update table structure by id

### Example

```javascript
import Th1 from 'th1';
let defaultClient = Th1.ApiClient.instance;
// Configure OAuth2 access token for authorization: oAuth2Auth
let oAuth2Auth = defaultClient.authentications['oAuth2Auth'];
oAuth2Auth.accessToken = 'YOUR ACCESS TOKEN';

let apiInstance = new Th1.DefaultApi();
let id = 789; // Number | 
let tableStructure = new Th1.TableStructure(); // TableStructure | 
apiInstance.updateTableStructure(id, tableStructure, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Number**|  | 
 **tableStructure** | [**TableStructure**](TableStructure.md)|  | 

### Return type

null (empty response body)

### Authorization

[oAuth2Auth](../README.md#oAuth2Auth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


# Th1.RemoveKeywordsSettings

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enabled** | **Boolean** |  | [default to true]
**keywords** | **[String]** | A list of keywords to match against.  If a cell contains any of these keywords, the corresponding row or column will be removed.  | [optional] 
**removeRows** | **Boolean** | Whether to remove rows that contain a matching keyword. | [default to true]
**removeColumns** | **Boolean** | Whether to remove columns that contain a matching keyword. | [default to true]
**ignoreCase** | **Boolean** |  | [default to true]
**matchType** | **String** |  | [default to &#39;EQUALS&#39;]



## Enum: MatchTypeEnum


* `CONTAINS` (value: `"CONTAINS"`)

* `EQUALS` (value: `"EQUALS"`)





# Th1nk.Structure

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**converterType** | [**ConverterType**](ConverterType.md) |  | 
**name** | **String** | A name for the structure. This can be used to identify the structure in the UI. It can be any string.  | [optional] 
**description** | **String** | A description for the structure. This can be used to provide more information about the structure in the UI. It can be any string.  | [optional] 
**rowIndex** | **[Number]** | The indices of the rows to fill | 
**columnIndex** | **[Number]** | The indices of the columns to merge | 
**startRow** | **Number** | The start row index of the area to split (inclusive). | [optional] 
**startColumn** | **Number** | The index of the first data column to the right of the grouped header. | [optional] 
**headerNames** | **[String]** | The header names | 
**headerPlacementType** | [**HeaderPlacementType**](HeaderPlacementType.md) |  | 
**threshold** | **Number** | The maximum number of invalid values in a row to be considered invalid. | [optional] 
**blockList** | **[String]** | The list of values to be considered invalid. | [optional] 
**search** | **String** | The string to search for in the table. | [optional] 
**regexSearch** | **String** | The regex pattern to search for in the table. | [optional] 
**replacement** | **String** | The value to replace the found entries with. | 
**endRow** | **Number** | The end row index of the area to split (exclusive). | [optional] 
**delimiter** | **String** | The delimiter to split the entries by. Line break by default.  | [optional] 
**mode** | **String** | The mode to split the entries. Can be either &#39;row&#39; or &#39;column&#39;. &#39;row&#39; will split the entries into multiple rows. &#39;column&#39; will split the entries into multiple columns.  | [optional] 
**headerName** | **String** | The name of the new column | 
**precedenceOrder** | **[Number]** | The order in which the cells will be checked for non-empty values | [optional] 
**pivotField** | **{String: [Number]}** |  | [optional] 
**blockIndices** | **[Number]** | Indices that define the start of new data blocks | [optional] 
**keysToCarryForward** | **[String]** | Column names whose values should be carried forward if empty | [optional] 
**keywords** | **[String]** | A list of keywords to match against.  If a cell contains any of these keywords, the corresponding row or column will be removed.  | [optional] 
**removeRows** | **Boolean** | Whether to remove rows that contain a matching keyword. | [default to true]
**removeColumns** | **Boolean** | Whether to remove columns that contain a matching keyword. | [default to true]
**ignoreCase** | **Boolean** |  | [default to true]
**matchType** | [**MatchType**](MatchType.md) |  | 



## Enum: ModeEnum


* `row` (value: `"row"`)

* `column` (value: `"column"`)





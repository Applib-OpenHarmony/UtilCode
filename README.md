# UtilCode

UtilCode library is a ETS Library that supports common utility functions like Clean Utility(Cleaning the Cache, files and application data), Location utility services (Commonly used location based services), Etc.

## Download and Install

    npm i @ohos/utilcode

## Clean Utils

Clean Utils is ETS Library that performs cleaning operations of an application and its data. Clean Utils can perform the following:

*  Cleaning the Internal Cache 
*  Cleaning all the files of the application
*  Cleaning the custom directory of an application
*  Cleaning all databases of an application
*  Cleaning a custom database
*  Cleaning the Shared Preferences

### Usage Instructions

```js
import { CleanUtils } from '@ohos/utilcode';
```

```js
//Creating Object
private cleanutils: CleanUtils = new CleanUtils();
 
//function usage
this.cleanutils.cleanInternalCache().then((path) => { .. })
this.cleanutils.cleanInternalFiles().then((path) => { .. })
this.cleanutils.cleanInternalSp().then((path) => { .. })
this.cleanutils.cleanInternalDbByName(dbName).then((name) => { .. })
this.cleanutils.cleanInternalDbs().then((path) => { .. })
this.cleanutils.cleanCustomDir(dirName).then((name) => { .. })
```

# Compatibility
Supports OpenHarmony API Version 9

# Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/UtilCode/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/UtilCode/pulls).

# Open source License
This project is based on [Apache License 2.0](https://github.com/Applib-OpenHarmony/UtilCode/blob/main/LICENSE), please enjoy and participate in open source freely.

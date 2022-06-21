# OpenHarmonyUtilCode

OpenHarmonyUtilCode library is a ETS Library that supports common utility functions like Clean Utility(Cleaning the Cache, files and application data), Location utility services (Commonly used location based services), Etc.

## Installation Instructions

    npm install https://github.com/Applib-OpenHarmony/OpenHarmonyUtilCode

#### After Installation, For Local Demonstration, Run

    npm install
    
## Directory Structure

|---- UtilCode
|     |---- entry  #Sample Code Folder
|           |---- src
|                 |---- main
|                       |---- ets
|                             |---- MainAbility
|                                   |---- pages
|                                          |---- CleanUtilsSample.ets
|                                          |---- index.ets
|                                          |---- LocationUtilsSample.ets
|     |---- utilcode  #utility library
|           |---- src
|                 |---- main
|                       |---- ets
|                             |---- utils
|                                   |---- CleanUtils.ets
|                                   |---- LocationUtils.ets
|           |---- index.ets

## Clean Utils

Clean Utils is Open Harmony ETS Library that performs cleaning operations of an application and its data. Clean Utils can perform the following:

*  Cleaning the Internal Cache 
*  Cleaning all the files of the application
*  Cleaning the custom directory of an application
*  Cleaning all databases of an application
*  Cleaning a custom database
*  Cleaning the Shared Preferences

### Importing Clean Utils

```js
import { CleanUtils } from '@ohos/utilcode';
```

### CleanUtils Usage

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
Supports OpenHarmony API Version 8

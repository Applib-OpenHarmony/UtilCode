# OpenHarmonyUtilCode

OpenHarmonyUtilCode library is a ETS Library that supports common utility functions like Clean Utility(Cleaning the Cache, files and application data), Location utility services (Commonly used location based services), Etc.

## Installation Instructions

    npm install https://github.com/Applib-OpenHarmony/OpenHarmonyUtilCode

#### After Installation, For Local Demonstration, Run

    npm install
    
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

### Functionalities and Usage

#### Cleaning the internal Cache

```js
//Clean Utils Object from library
private cleanutils: CleanUtils = new CleanUtils();

//function for cleaning Internal Cache of the application
  cleanInternalCache() {
    this.cleanutils.cleanInternalCache().then((path) => {
      this.data = path;
      prompt.showToast({
        message: "Internal Cache Delete Success => " + this.data,
        duration: 2000
      })
    })
  }
```

#### Cleaning all the files

```js
//Clean Utils Object from library
private cleanutils: CleanUtils = new CleanUtils();

//Cleaning the internal files
  cleanInternalFiles() {
    this.cleanutils.cleanInternalFiles().then((path) => {
      this.data = path;
      prompt.showToast({
        message: "Internal Files Delete Success: " + path,
        duration: 2000
      })
    })
  }
```

#### Cleaning a Custom Directory

```js
//Clean Utils Object from library
private cleanutils: CleanUtils = new CleanUtils();

//Cleaning a custom directory
  cleanCustomDir(dirName: string) {
    this.cleanutils.cleanCustomDir(dirName).then((name) => {
      console.log('Clean Custom Directory');
      prompt.showToast({
        message: name,
        duration: 2000
      })
    })
  }
```

#### Cleaning all the Databases of an application

```js
//Clean Utils Object from library
private cleanutils: CleanUtils = new CleanUtils();

//Cleaning all the databases
cleanInternalDbs() {
    this.cleanutils.cleanInternalDbs().then((path) => {
      this.data = path;
      console.log("Internal Databases Cleaned: " + this.data);
      prompt.showToast({
        message: "Internal Database Delete Success => " + this.data,
        duration: 2000
      })
    })
  }
```

#### Cleaning a Custom Database

```js
//Clean Utils Object from library
private cleanutils: CleanUtils = new CleanUtils();

//Cleaning a custom database
  cleanInternalDbByName(dbName: string) {
    this.cleanutils.cleanInternalDbByName(dbName).then((name) => {
      this.data = name;
      console.log("Clean Internal Database by Name");
      prompt.showToast({
        message: this.data,
        duration: 2000
      })
    })
  }
```

#### Cleaning Shared Preferences

```js
//Clean Utils Object from library
private cleanutils: CleanUtils = new CleanUtils();

//Cleaning the shared preferences
cleanInternalSp() {
    this.cleanutils.cleanInternalSp().then((path) => {
      this.data = path;
      prompt.showToast({
        message: "Shared Preference Delete Success => " + this.data,
        duration: 2000
      })
    })
  }
```

# Compatibility
Supports OpenHarmony API Version 8

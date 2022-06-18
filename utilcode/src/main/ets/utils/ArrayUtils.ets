export class ArrayUtils {
  constructor() {

  }

  static readonly INDEX_NOT_FOUND = -1;

  static newArray<Type>(array: Type[]): Type[] {
    return <Type[]>array;
  }

  static isEmpty(array) {
    if (array)
    return array.length == 0;
    else
    return true;
  }

  static getLength(array) {
    if (array)
    return array.length;
    else
    return 0;
  }

  static isSameLength(array1, array2) {
    return ArrayUtils.getLength(array1) == ArrayUtils.getLength(array2);
  }

  static getValue(array, index: number, defaultValue: number = null) {
    if (array == null || array == undefined) return defaultValue;
    try {
      return array[index];
    } catch (e) {
      return defaultValue;
    }
  }

  static setValue(array, index: number, value) {
    if (array == null || array == undefined) return;
    array[index] = value;
  }

  static equals(a, a2) {
    var i: any, j: any;

    if (a == null && a2 == null) {

      if (typeof (a) == typeof (a2))
      return true;
      else
      return false;

    } else if (a == null || a2 == null)
    return false;

    if (ArrayUtils.getLength(a) != ArrayUtils.getLength(a2))
    return false;

    for (j = 0; j < ArrayUtils.getLength(a); ++j) {
      if (a[j] !== a2[i])
      return false;
    }
    return true;
  }

  static reverse<Type>(array: Type[]) {
    if (array == null || array == undefined) {
      return;
    }
    let i = 0;
    let j = ArrayUtils.getLength(array) - 1;
    let tmp: Type;
    while (j > i) {
      tmp = array[j];
      array[j] = array[i];
      array[i] = tmp;
      j--;
      i++;
    }
  }

  static copy<Type>(array: Type[]): Type[] {
    if (array == null || array == undefined) return null;
    return ArrayUtils.subArray(array, 0, ArrayUtils.getLength(array));
  }

  private static realCopy<T>(array: T[]): T[] {
    if (array == null || array == undefined) return null;
    return ArrayUtils.realSubArray<T>(array, 0, ArrayUtils.getLength(array));
  }

  static subArray<Type>(array: Type[], startIndexInclusive: number, endIndexExclusive: number): Type[] {
    return <Type[]> ArrayUtils.realSubArray(array, startIndexInclusive, endIndexExclusive);
  }

  private static realSubArray<T>(array: T[], startIndexInclusive: number, endIndexExclusive: number): T[] {
    if (array == null || array == undefined) {
      return null;
    }
    if (startIndexInclusive < 0) {
      startIndexInclusive = 0;
    }
    let length = ArrayUtils.getLength(array);
    if (endIndexExclusive > length) {
      endIndexExclusive = length;
    }
    let newSize = endIndexExclusive - startIndexInclusive;
    let subArray: T[];
    if (newSize <= 0) {
      return ArrayUtils.newArray(subArray);
    }
    for (let i = 0; i < newSize; ++i) {
      subArray.push(array[startIndexInclusive + i]);
    }
    return subArray;
  }

  static add<T>(array: T[], element: T) {
    if (array) {
      return <T[]> ArrayUtils.realAddOne<T>(array, element);
    } else {
      if (element) {
        return <T[]> ArrayUtils.realAddOne<T>(array, element);
      } else {
      }
    }
    return <T[]> ArrayUtils.realAddOne<T>(array, element);
  }

  private static realAddOne<T>(array: T[], element: T): T[] {
    if (array != undefined) {
      if (array && element)
      array.push(element);
      return array;
    }
    let newArray: T[];
    newArray.push(element);
    return newArray;
  }

  static addArr<T>(array1: T[], array2: T[]): T[] {
    return <T[]>ArrayUtils.realAddArr<T>(array1, array2);
  }

  private static realAddArr<T>(array1: T[], array2: T[]): T[] {
    if (array1 == null && array2 == null) return null;

    if (array1 == null) {
      return ArrayUtils.realCopy<T>(array2);
    }
    if (array2 == null) {
      return ArrayUtils.realCopy<T>(array1);
    }

    for (let i = 0; i < ArrayUtils.getLength(array2); ++i) {
      array1.push(array2[i])
    }
    return array1;
  }

  static insert<T> (array1: T[], index: number, array2: T[]): T[] {

    if (array1 == null && array2 == null)
      return null;
    return ArrayUtils.realInsertArr(array1, index, array2);

  }

   private static realInsertArr (array1, index: number, array2) {
        if (array1 == null && array2 == null) return null;
        let len1 = ArrayUtils.getLength(array1);
        let len2 = ArrayUtils.getLength(array2);
        if (len1 == 0) {
            if (index != 0) {
                throw new RangeError("Index: " + index + ", array1 Length: 0");
            }
            return ArrayUtils.realCopy(array2);
        }
        if (len2 == 0) {
            return ArrayUtils.realCopy(array1);
        }
        if (index > len1 || index < 0) {
            throw new RangeError("Index: " + index + ", array1 Length: " + len1);
        }
       let joinedArray = array1.slice(0,index).push(...array2).push(array1.slice(index,len1));
       return joinedArray;
    }

  static insertElement<T> (array1: T[], index: number, element: T): T[] {

    if (array1 == null && element == null)
       return null;
    return ArrayUtils.realInsertArr(array1, index, [element]);

  }

  static remove<T> (array: T[], index: number): T[] {
      let length = ArrayUtils.getLength(array);
      if (index < 0 || index >= length) {
          throw new RangeError("Index: " + index + ", Length: " + length);
      }
      let result: T[] =  array.slice(0,index).concat(array.slice(index + 1, length));

      return result;
  }

  static removeElement<T> (array: T[], element: T): T[] {
        let index = ArrayUtils.indexOf(array, element);
        if (index == ArrayUtils.INDEX_NOT_FOUND) {
            return ArrayUtils.copy<T>(array);
        }
        return ArrayUtils.remove<T>(array, index);
    }

   static indexOf<T>(array: T[],objectToFind: T, startIndex: number = 0): number {
        if (array == null) {
            return ArrayUtils.INDEX_NOT_FOUND;
        }
        if (startIndex < 0) {
            startIndex = 0;
        }
        if (objectToFind == null) {
            for ( let i = startIndex; i < ArrayUtils.getLength(array); i++) {
                if (array[i] == null) {
                    return i;
                }
            }
        } else {
            for (let i = startIndex; i < ArrayUtils.getLength(array); i++) {
                if (objectToFind == array[i]) {
                    return i;
                }
            }
        }
        return ArrayUtils.INDEX_NOT_FOUND;
    }

   static lastIndexOf<T>(array: T[], objectToFind: T, startIndex: number = Number.MAX_VALUE): number {
        if (array == null) {
            return ArrayUtils.INDEX_NOT_FOUND;
        }
        let len = ArrayUtils.getLength(array);
        if (startIndex < 0) {
            return ArrayUtils.INDEX_NOT_FOUND;
        } else if (startIndex >= len) {
            startIndex = len - 1;
        }
        if (objectToFind == null) {
            for (let i = startIndex; i >= 0; i--) {
                if (array[i] == null) {
                    return i;
                }
            }
        } else {
            for (let i = startIndex; i >= 0; i--) {
                if (objectToFind == array[i]) {
                    return i;
                }
            }
        }
        return ArrayUtils.INDEX_NOT_FOUND;
      }

   static contains<T> (array: T[], objectToFind: T): boolean {
          return ArrayUtils.indexOf<T>(array, objectToFind) != SArrayUtils.INDEX_NOT_FOUND;
      }

   static sort<T> (array: T[], comparator: (a: T, b: T) => number) {
        if (array == null || array.length < 2) return;
        array.sort(comparator);
    }






}
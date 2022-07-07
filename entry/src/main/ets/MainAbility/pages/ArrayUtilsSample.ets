/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ArrayUtils } from '@ohos/utilcode';

@Entry
@Component
struct Index {
  @State data: string = '';
  private array1: any[] = [323, 32, 3, 23, 2];
  private array2: any[] = ['d', 's', 's', 'f'];
  private element: any = 23;
  private arrayutils: ArrayUtils = new ArrayUtils();
  scroller: Scroller = new Scroller();

  mergeArrays() {
    return '' + ArrayUtils.addArr<number>(ArrayUtils.newArray<number>(this.array1),
    ArrayUtils.newArray<number>(this.array2));
  }

  getLength() {
    return 'array1: ' + ArrayUtils.getLength(this.array1) + ' | array2: ' + ArrayUtils.getLength(this.array2);
  }

  isEmpty() {
    return 'array1: ' + ArrayUtils.isEmpty(this.array1) + ' | array2: ' + ArrayUtils.isEmpty(this.array2);
  }

  isLengthEqual() {
    return 'array1.len == array2.len : ' + ArrayUtils.isSameLength(this.array1, this.array2);
  }

  isEqual() {
    return ArrayUtils.equals(this.array1, this.array2) ? 'Both are equal' : 'Both are not equal';
  }

  reverseArray1() {
    ArrayUtils.reverse(this.array1);
  }

  removeElementArray1(element) {
    let res = ArrayUtils.removeElement(this.array1, element);
    if (ArrayUtils.equals(res, this.array1)) {
      console.log("Element not found!");
    } else {
      this.array1 = res;
      console.log("Element deleted successfully");
      console.log("New array1: " + this.array1);
    }
    return;
  }

  searchElementArray1(element) {
    let res = ArrayUtils.contains(this.array1, element);
    this.data = element + " present in array1: " + res;
    return;
  }

  sortAsc() {
    let comp = (a, b) => (a > b ? 1 : -1);
    ArrayUtils.sort(this.array2, comp);
  }

  sortDesc() {
    let comp = (a, b) => (b > a ? 1 : -1);
    ArrayUtils.sort(this.array2, comp);
  }

  build() {
    Column() {
      Row() {
        Text('ARRAY UTILS')
          .fontSize(30)
          .fontColor(Color.Brown)
          .fontWeight(FontWeight.Bold)
      }.height('50').margin(10).align(Alignment.Center)

      Column() {
        Row() {
          Flex({
            direction: FlexDirection.Column,
            alignItems: ItemAlign.Center,
            justifyContent: FlexAlign.SpaceBetween
          }) {
            Flex({
              direction: FlexDirection.Row,
              alignItems: ItemAlign.Center,
              justifyContent: FlexAlign.SpaceEvenly
            }) {
              TextInput({ placeholder: 'Array 1  (String values)' })
                .type(InputType.Normal)
                .enterKeyType(EnterKeyType.Done)
                .id('array1')
                .fontSize(1)
                .onChange((value: string) => {
                  this.array1 = value.split(" ");
                })
                .onSubmit((enterKey) => {
                  console.log('Array 1 Created')
                })

              Button('Create Array1', { type: ButtonType.Normal, stateEffect: true })
                .onClick((event: ClickEvent) => {
                  console.log('Array 1: ' + this.array1);
                })
                .borderWidth(2)
                .borderRadius(10)
            }

            Flex({
              direction: FlexDirection.Row,
              alignItems: ItemAlign.Center,
              justifyContent: FlexAlign.SpaceEvenly
            }) {
              TextInput({ placeholder: 'Array 2 (String values)' })
                .type(InputType.Normal)
                .enterKeyType(EnterKeyType.Done)
                .id('array2')
                .fontSize(1)
                .onChange((value: string) => {
                  this.array2 = value.split(" ");
                })
                .onSubmit((enterKey) => {
                  console.log('Array 2 Created')
                })

              Button('Create Array2', { type: ButtonType.Normal, stateEffect: true })
                .onClick((event: ClickEvent) => {
                  console.log('Array 2: ' + this.array2);
                })
                .borderWidth(2)
                .borderRadius(10)
            }

            Scroll(this.scroller) {
              Flex({
                direction: FlexDirection.Row,
                alignItems: ItemAlign.Center,
                justifyContent: FlexAlign.SpaceAround
              }) {
                Button('Merge 2 Arrays', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('merge arrays');
                    this.data = this.mergeArrays();
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('Is empty?', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('isEmpty');
                    this.data = this.isEmpty();
                  })
                  .margin(5)
                  .borderRadius(10)


                Button('Get length', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('get length');
                    this.data = this.getLength();
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('is length equal?', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('length_eq');
                    this.data = this.isLengthEqual();
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('is both arrays equal?', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('isEqual');
                    this.data = this.isEqual();
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('Reverse Array1', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('reverseArray1');
                    this.reverseArray1();
                    this.data = '' + this.array1;
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('Sort Array2 Ascending', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('sortArrayAsc2');
                    this.sortAsc();
                    this.data = '' + this.array2;
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('Sort Array2 Descending', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('sortArrayDesc2');
                    this.sortDesc();
                    this.data = '' + this.array2;
                  })
                  .margin(5)
                  .borderRadius(10)
              }
            }.scrollable(ScrollDirection.Horizontal).scrollBar(BarState.On)
            .scrollBarColor(Color.Gray).scrollBarWidth(100)

            Text(this.data)
              .fontSize(20)

            Flex({
              direction: FlexDirection.Row,
              alignItems: ItemAlign.Center,
              justifyContent: FlexAlign.SpaceEvenly
            }) {
              TextInput({ placeholder: 'Element to remove from array 1' })
                .type(InputType.Normal)
                .enterKeyType(EnterKeyType.Done)
                .id('elementremoved')
                .fontSize(1)
                .onChange((value: string) => {
                  this.element = value;
                })
                .onSubmit((enterKey) => {
                  console.log('Removing element from array1...')
                })

              Button('Remove element', { type: ButtonType.Normal, stateEffect: true })
                .onClick((event: ClickEvent) => {
                  this.removeElementArray1(this.element);
                })
                .borderWidth(2)
                .borderRadius(10)
            }

            Flex({
              direction: FlexDirection.Row,
              alignItems: ItemAlign.Center,
              justifyContent: FlexAlign.SpaceEvenly
            }) {
              TextInput({ placeholder: 'Element to search in array 1' })
                .type(InputType.Normal)
                .enterKeyType(EnterKeyType.Done)
                .id('elementsearched')
                .fontSize(1)
                .onChange((value: string) => {
                  this.element = value;
                })
                .onSubmit((enterKey) => {
                  console.log('Searching element in array1...')
                })

              Button('Search', { type: ButtonType.Normal, stateEffect: true })
                .onClick((event: ClickEvent) => {
                  this.searchElementArray1(this.element);
                })
                .borderWidth(2)
                .borderRadius(10)
            }
          }
        }
      }.height('800%').margin(5)
    }.height(50).margin(5)
  }
}



import { ArrayUtils } from '@ohos/utilcode';
import prompt from '@system.prompt';
import dataStorage from '@ohos.data.storage';
import ability_featureAbility from '@ohos.ability.featureAbility';
import dataRdb from '@ohos.data.rdb';

@Entry
@Component
struct Index {
  @State data: string = '';
  private array1: any[] = [323,32,3,23,2];
  private array2: any[] = ['d', 's', 's', 'f'];
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

  isLengthEq() {
    return 'array1.len == array2.len : ' + ArrayUtils.isSameLength(this.array1, this.array2);
  }

  isEq() {
    return ArrayUtils.equals(this.array1, this.array2) ? 'Both are equal' : 'Both are not equal';
  }

  reverseArray1() {
    ArrayUtils.reverse(this.array1);
  }

  sortAsc() {
    let comp = (a,b) => (a > b ? 1 : -1);
    ArrayUtils.sort(this.array2, comp);
  }

  sortDesc() {
    let comp = (a,b) => (b > a ? 1 : -1);
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
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Flex({
              direction: FlexDirection.Row,
              alignItems: ItemAlign.Center,
              justifyContent: FlexAlign.SpaceEvenly
            }) {
              TextInput({ placeholder: 'Array 1' })
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

              TextInput({ placeholder: 'Array 2' })
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
                  console.log('' + ArrayUtils.removeElement(this.array1, 22));

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
                    this.data = this.isLengthEq();
                  })
                  .margin(5)
                  .borderRadius(10)

                Button('is both arrays equal?', { type: ButtonType.Normal, stateEffect: true })
                  .onClick((event: ClickEvent) => {
                    console.log('isEqual');
                    this.data = this.isEq();
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

          }
        }
      }.height(200).margin(5)
      }.height(50).margin(5)
    }
}

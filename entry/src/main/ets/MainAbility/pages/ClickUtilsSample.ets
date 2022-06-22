/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ClickUtils } from '@ohos/utilcode';
import prompt from '@system.prompt';

@Entry
@Component
struct Index {
  @State defaultWidth: number = 150;
  @State defaultHeight: number = 50;
  @State scaleWidth: number = 150;
  @State scaleHeight: number = 50;
  @State defaultOpacity: number = 1;
  @State alphaOpacity: number = 1;
  @State show: Visibility = Visibility.Visible;
  private scalePercentage: number = 70;
  private opacityPercentage: number = 70;
  private click: ClickUtils = new ClickUtils();

  applyPressedViewScale(event: TouchEvent,scalePercentage: number){
    this.click.applyPressedViewScale(event.type,scalePercentage,this.defaultWidth,this.defaultHeight).then((size) => {
      if(size.width == -1 || size.height == -1){
        prompt.showToast({
          message:"Scale Percentage Specified is wrong. Please specify from 1 - 100",
          duration: 2000
        })
      }
      else{
        this.scaleWidth = size.width;
        this.scaleHeight = size.height;
        prompt.showToast({
          message:"Scale Applied successfully: Width: "+this.scaleWidth+" Height: "+this.scaleHeight,
          duration: 2000
        })
      }
    })
  }

  applyPressedViewAlpha(event: TouchEvent,opacityPercentage: number){
    this.click.applyPressedViewAlpha(event.type,opacityPercentage,this.defaultOpacity).then((opacity) => {
      if(opacity == -1){
        prompt.showToast({
          message:"Opacity Percentage Specified is wrong. Please specify from 1 - 100",
          duration: 2000
        })
      }
      else{
        this.alphaOpacity = opacity;
        prompt.showToast({
          message:"Opacity Applied successfully",
          duration: 2000
        })
      }
    })
  }

  applyDebouncing(func){
    let timeOut = 10000;
    this.click.applyDebouncing(func,4000,true).then(() => {
      console.log('Debouncing Applied');
      prompt.showToast({
        message:"Debouncing Applied Successfully",
        duration: 2000
      })
    })
  }

  build() {
    Column({space: 5}) {
      Flex({ alignItems: ItemAlign.End, justifyContent: FlexAlign.Center }) {
        Row() {
          Text('CLICK UTILS')
            .fontSize(30)
            .fontColor(Color.Brown)
            .fontWeight(FontWeight.Bold)
        }.height('50').margin(10).align(Alignment.Center)
      }

      Flex({ alignItems: ItemAlign.End, justifyContent: FlexAlign.Center }) {
       Row({space: 5}) {
          TextInput({placeholder: 'Scale % (1-100)'}).type(InputType.Number).enterKeyType(EnterKeyType.Done).id('scaleValue').fontSize(1)
            .onChange((value: string) => {
              this.scalePercentage = parseFloat(value);
            }).borderRadius(10).borderWidth(3).margin(3).width(170)
          Button('Click View Scale', { type: ButtonType.Normal, stateEffect: true }).onTouch((event:TouchEvent) => {
            this.applyPressedViewScale(event,this.scalePercentage);
          })
          .height(this.scaleHeight).width(this.scaleWidth).margin(3)
        }
      }.margin(10).borderWidth(2).borderRadius(10)

      Flex({ alignItems: ItemAlign.End, justifyContent: FlexAlign.Center }) {
        Row() {
          TextInput({placeholder: 'Alpha % (1-100)'}).type(InputType.Number).enterKeyType(EnterKeyType.Done).id('scaleValue').fontSize(1)
            .onChange((value: string) => {
              this.scalePercentage = parseFloat(value);
            }).borderRadius(10).borderWidth(3).margin(3).width(170)
          Button('Click View Alpha', { type: ButtonType.Normal, stateEffect: true }).onTouch((event:TouchEvent) => {
            this.applyPressedViewAlpha(event,this.opacityPercentage);
          })
            .height(this.defaultHeight).width(150).margin(3).opacity(this.alphaOpacity)
        }
      }.margin(10).opacity(this.alphaOpacity).borderWidth(2).borderRadius(10)

      Flex({ alignItems: ItemAlign.End, justifyContent: FlexAlign.Center }) {
        Row() {
          Button('Click Debouncing', { type: ButtonType.Normal, stateEffect: true }).onClick((event:ClickEvent) => {
            this.applyDebouncing(function(){console.log("Debouncing Timer set is 4s.")})
          })
            .height(this.defaultHeight).width(150).margin(3).opacity(this.alphaOpacity)
        }
      }.margin(15).borderWidth(2).borderRadius(10)
    }
  }
}
/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LocationUtils } from "@ohos/utilcode"
import { myLocationListener } from "@ohos/utilcode"

let locationUtil = new LocationUtils();
let address = locationUtil.getAddress(12.433, 123.3451)

@Entry
@Component
struct Index {
  @State message: string = 'LocationUtil Library'
  private locationUtils: LocationUtils = new LocationUtils();
  private myLocation = new myLocationListener();

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('is Gps Enabled', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.isGpsEnabled();
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('is Location Enable', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.isLocationEnabled();
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('register', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.register(10, 23, 40);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('unregister', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.unregister();
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('get country name', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.getCountryName(12.433, 123.3451);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('get street', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.getStreet(12.433, 123.3451);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('Locality', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.getLocality(12.433, 123.3451);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('Address', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.getAddress(12.433, 123.3451);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('is better location', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.isBetterLocation(address, address);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('is same provider', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.locationUtils.isSameProvider(address, address);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('onLocationChanged', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.myLocation.onLocationChanged(address);
          })
          .borderWidth(2)
          .borderRadius(10)
        Button('onStatusChanged', { type: ButtonType.Normal, stateEffect: true })
          .onClick((event: ClickEvent) => {
            this.myLocation.onStatusChanged();
          })
          .borderWidth(2)
          .borderRadius(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
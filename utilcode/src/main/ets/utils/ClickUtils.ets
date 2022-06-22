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

import prompt from '@system.prompt';

export class ClickUtils {
  private newWidth: number;
  private newHeight: number;
  private newOpacity: number;
  private timer: number;

  async applyPressedViewScale(eventType: TouchType, scalePercentage: number, oldWidth: number, oldHeight: number) {
    if (scalePercentage > 0 && scalePercentage <= 100) {
      if (eventType === TouchType.Down) {
        this.newWidth = (scalePercentage / 100) * oldWidth;
        this.newHeight = (scalePercentage / 100) * oldHeight;
      }
      else {
        this.newWidth = oldWidth;
        this.newHeight = oldHeight;
      }
    }
    else {
      console.log("Error!! Scale Percentage should be from 1-100 %");
      this.newWidth = -1;
      this.newHeight = -1;
    }
    var size = { width: this.newWidth,
      height: this.newHeight }
    return size;
  }

  async applyPressedViewAlpha(eventType: TouchType, opacityPercentage: number, oldOpacity: number) {
    if (opacityPercentage > 0 && opacityPercentage <= 100) {
      if (eventType === TouchType.Down) {
        this.newOpacity = (opacityPercentage / 100) * oldOpacity;
      }
      else {
        this.newOpacity = oldOpacity;
      }
    }
    else {
      console.log("Error!! Opacity Percentage should be from 1-100 %");
      this.newOpacity = -1;
    }
    return this.newOpacity;
  }

  async applyDebouncing(func, timeOut, immediate) {
    return function executedFunction() {
      var context = this;
      var args = arguments;
      var later = function () {
        this.timer = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !this.timer;
      clearTimeout(this.timer);
      this.timer = setTimeout(later, timeOut);
      if (callNow) func.apply(context, args);
    };
  }
}
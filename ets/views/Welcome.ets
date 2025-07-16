import { Router } from '@ohos.arkui.UIContext'
import StorageUtil from '../util/StorageUtil';

const router = new Router();
@Entry
@Component
struct Welcome{

  @State count:number = 3
  @State timeId:number = 0

  aboutToAppear(): void {
    this.timeId = setInterval(()=>{
      this.count--;
      if(this.count <=0){
        //this.goToPage()
        clearInterval(this.timeId)
      }
    },1000)
  }

  async goToPage(){
    const isFirst=await StorageUtil.isFirstLaunch()
    if(isFirst){
      await StorageUtil.markAsLaunched();
      router.replaceUrl({url:'views/Guide'})
    }else{
      router.replaceUrl({url:'pages/Index'})
    }

  }
  // 组件消失时候回调
  aboutToDisappear(): void {
    clearInterval(this.timeId)
  }

  build() {
    Stack({alignContent:Alignment.TopEnd}){
      Image($r('app.media.Titlepage'))
        .height('100%')
        .width('100%')

      Text(`跳过 ${this.count}s`)
        .backgroundColor('#eeeeee')
        .padding(8)
        .fontColor('#55555')
        .borderRadius(20)
        .zIndex(99)
        .margin({top:20,right:20})
        .onClick(()=>{
          this.goToPage()
          clearInterval(this.timeId)
        })
    }.width('100%')
    .height('100%')
  }
}
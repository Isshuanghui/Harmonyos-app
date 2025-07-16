import { Router } from '@ohos.arkui.UIContext'
import prompt from '@system.prompt'; // 导入提示模块
const router=new Router
@Entry
@Component
struct ReturnApplication{
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.back')).width('10%')
          .height(20)
          .onClick(() => router.back())
        Text('返校申请')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
          .textAlign(TextAlign.Center)

        Text('反馈')
          .fontSize(16)
          .fontColor(Color.Gray)
          .padding({ right: 16 })
          .onClick(()=>{
            prompt.showToast({
              message: '该功能尚未开发'
            });
          })
      }
      .height(40) // 调整高度，避免内容被压缩
      .width('100%')
      .padding({ left: 16 })
      .alignItems(VerticalAlign.Center)
      .backgroundColor(Color.White) // 顶部导航背景色
      Image($r('app.media.A1'))
        .height('90%')
        .width('100%')
      Row(){
        Text('返校申请').fontColor(Color.White).padding({left:150,right:100}).fontSize(20)
      }.backgroundColor('#999999')
      .width('100%')
      .height(50)
      .onClick(()=> {
        prompt.showToast({
          message: '该功能尚未开发'
        })
      })
   }
 }
}
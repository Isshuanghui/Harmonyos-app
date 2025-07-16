import { Router } from '@ohos.arkui.UIContext';

const router=new Router;
@Entry
@Component
struct ServiceDesk {
  build() {
    Column() {
      Row() {
        Image($r('app.media.back')).width('10%')
          .height(20)
          .onClick(() => {
            router.back();
          })
        Text('学生服务台').fontSize(20).fontWeight(FontWeight.Bold)
          .flexGrow(1) // 关键：占据剩余所有空间，实现居中
          .textAlign(TextAlign.Center) // 文字在自身区域内居中
        Text('反馈').fontSize(16).fontColor(Color.Red).padding({ right: 16 })
      }.height(16)
      .width('100%')
      .padding({ left: 16 })
      .alignItems(VerticalAlign.Center) // 子组件垂直居中
      .margin({bottom:20})

      Row() {
        Image($r('app.media.servicedesk')).height('100%').width('100%')
      }
    }
  }
}
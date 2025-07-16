import { Router } from '@ohos.arkui.UIContext';
import prompt from '@system.prompt'; // 导入提示模块
const router=new Router;
@Entry
@Component
struct AdvisiorNotice{
  // 添加状态变量，用于跟踪当前选中的标签页索引
  @State selectedTabIndex: number = 0;
  // 定义标签页标题数组，用于动态更新顶部标题
  private tabTitles: string[] = ['通知', '历史通知'];
  build() {
    Column(){
      Row(){
        Image($r('app.media.back')).width('10%')
          .height(20)
          .onClick(() => {
            router.back();
          })
        Text(this.tabTitles[this.selectedTabIndex]).fontSize(20).fontWeight(FontWeight.Bold)
          .flexGrow(1) // 关键：占据剩余所有空间，实现居中
          .textAlign(TextAlign.Center) // 文字在自身区域内居中
        Text('反馈').fontSize(16).fontColor(Color.Gray).padding({right:16})
          .onClick(()=>{
            prompt.showToast({
              message: '该功能尚未开发'
            });
          })
      }.height(16)
      .width('100%')
      .padding({ left: 16 })
      .alignItems(VerticalAlign.Center) // 子组件垂直居中

      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          Image($r('app.media.D1')).height('96%')
        }.tabBar('通知')
        .onClick(() => {
          this.selectedTabIndex = 0; // 点击时更新选中索引
        })
        //历史通知
        TabContent() {
          Column(){
            //第一个通知
            Column() {
              Row() {
                Text('重要通知')
                  .fontSize(14)
                  .fontColor('#FFFFFF')
                  .backgroundColor('#D4AF37')
                  .padding({
                    left: 8,
                    right: 8,
                    top: 2,
                    bottom: 2
                  })
                  .borderRadius(4)
                  .margin({ left: 15 })

                // 右侧状态（靠右对齐）
                Text('已读>')
                  .fontSize(14)
                  .fontColor(Color.Green)
                  .margin({ left: 250 })
              }
              .width('100%')
              .padding({ top: 10 })
              .margin({ bottom: 10 })

              // 中间行：签到类型
              Row() {
                Text('开设2025年暑假返乡送站班车的通知')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333333')
                  .margin({ left: 15 })
              }
              .width('100%')
              .padding({ right: 15 })
              .margin({ bottom: 10 })

              // 信息行（靠左对齐）
              Row() {
                Text('创建人')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('学生处')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 55 })
              }
              .width('100%')
              .margin({ bottom: 10 })

              Row() {
                Text('创建时间')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('2025-06-28 08:35')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 40 })
              }
              .width('100%')
              .margin({ bottom: 10 })

              Row() {
                Text('截止时间')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('2025-06-30 16:00')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 40 })
              }
              .width('100%')
              .padding({ bottom: 10 })
              Row() {
                Text('是否需要确认')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('否')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 30 })
              }
              .width('100%')
              .margin({ bottom: 10 })
            }
            .width('94%') // 卡片宽度
            .margin({ left: 10, right: 10, top: 10 }) // 卡片边距
            .backgroundColor(Color.White) // 卡片白色背景
            .borderRadius(8) // 卡片圆角
            .shadow({
              radius: 2,
              color: '#EEEEEE',
              offsetX: 0,
              offsetY: 1
            }) // 卡片阴影
            .onClick(()=>{
              prompt.showToast({
                message: '该功能尚未开发'
              });
            })
            //第二个通知
            Column() {
              Row() {
                Text('普通通知')
                  .fontSize(14)
                  .fontColor('#FFFFFF')
                  .backgroundColor(Color.Blue)
                  .padding({
                    left: 8,
                    right: 8,
                    top: 2,
                    bottom: 2
                  })
                  .borderRadius(4)
                  .margin({ left: 15 })

                // 右侧状态（靠右对齐）
                Text('未读>')
                  .fontSize(14)
                  .fontColor(Color.Orange)
                  .margin({ left: 250 })
              }
              .width('100%')
              .padding({ top: 10 })
              .margin({ bottom: 10 })

              // 中间行：签到类型
              Row() {
                Text('校园外卖柜使用说明')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333333')
                  .margin({ left: 15 })
              }
              .width('100%')
              .padding({ right: 15 })
              .margin({ bottom: 10 })

              // 信息行（靠左对齐）
              Row() {
                Text('创建人')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('学生处')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 55 })
              }
              .width('100%')
              .margin({ bottom: 10 })

              Row() {
                Text('创建时间')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('2025-06-25 09:29')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 40 })
              }
              .width('100%')
              .margin({ bottom: 10 })

              Row() {
                Text('截止时间')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('2025-06-26 09:19')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 40 })
              }
              .width('100%')
              .padding({ bottom: 10 })
              Row() {
                Text('是否需要确认')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('否')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 30 })
              }
              .width('100%')
              .margin({ bottom: 10 })
            }
            .width('94%') // 卡片宽度
            .margin({ left: 10, right: 10, top: 10 }) // 卡片边距
            .backgroundColor(Color.White) // 卡片白色背景
            .borderRadius(8) // 卡片圆角
            .shadow({
              radius: 2,
              color: '#EEEEEE',
              offsetX: 0,
              offsetY: 1
            }) // 卡片阴影
            .onClick(()=>{
              prompt.showToast({
                message: '该功能尚未开发'
              });
            })
            //第三个通知
            Column() {
              Row() {
                Text('重要通知')
                  .fontSize(14)
                  .fontColor('#FFFFFF')
                  .backgroundColor('#D4AF37')
                  .padding({
                    left: 8,
                    right: 8,
                    top: 2,
                    bottom: 2
                  })
                  .borderRadius(4)
                  .margin({ left: 15 })

                // 右侧状态（靠右对齐）
                Text('已读>')
                  .fontSize(14)
                  .fontColor(Color.Green)
                  .margin({ left: 250 })
              }
              .width('100%')
              .padding({ top: 10 })
              .margin({ bottom: 10 })

              // 中间行：签到类型
              Row() {
                Text('关于全国大学外语考试诚信考试的通知')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333333')
                  .margin({ left: 15 })
              }
              .width('100%')
              .padding({ right: 15 })
              .margin({ bottom: 10 })

              // 信息行（靠左对齐）
              Row() {
                Text('创建人')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('学生处')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 55 })
              }
              .width('100%')
              .margin({ bottom: 10 })

              Row() {
                Text('创建时间')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('2025-06-13 18:10')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 40 })
              }
              .width('100%')
              .margin({ bottom: 10 })

              Row() {
                Text('截止时间')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('2025-06-14 08:10')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 40 })
              }
              .width('100%')
              .padding({ bottom: 10 })
              Row() {
                Text('是否需要确认')
                  .fontSize(14)
                  .fontColor('#666666')
                  .margin({ left: 15 })
                Text('否')
                  .fontSize(14)
                  .fontColor('#333333')
                  .margin({ left: 30 })
              }
              .width('100%')
              .margin({ bottom: 10 })
            }
            .width('94%') // 卡片宽度
            .margin({ left: 10, right: 10, top: 10 }) // 卡片边距
            .backgroundColor(Color.White) // 卡片白色背景
            .borderRadius(8) // 卡片圆角
            .shadow({
              radius: 2,
              color: '#EEEEEE',
              offsetX: 0,
              offsetY: 1
            }) // 卡片阴影
            .onClick(()=>{
              prompt.showToast({
                message: '该功能尚未开发'
              });
            })
            Text('没有更多了').fontSize(14).fontColor('#666666').padding({top:10})
          }
        }.tabBar('历史通知')
        .padding({bottom:480})
        .onClick(() => {
          this.selectedTabIndex = 1; // 点击时更新选中索引
        })
      }.onChange((index) => {
        this.selectedTabIndex = index; // 滑动切换时更新选中索引
      })
    }
  }
}
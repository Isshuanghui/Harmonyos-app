import { Router } from '@ohos.arkui.UIContext';
import prompt from '@system.prompt'; // 导入提示模块
const router = new Router;
@Entry
@Component
struct DormCheck {
  @State selectedTabIndex: number = 0;
  private tabTitles: string[] = ['查寝任务', '历史查寝任务', '查寝统计'];
  private selectedDate:Date = new Date();
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.back')).width('10%')
          .height(20)
          .onClick(() => router.back())
        Text(this.tabTitles[this.selectedTabIndex])
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
      .height(40)  // 调整高度，避免内容被压缩
      .width('100%')
      .padding({ left: 16 })
      .alignItems(VerticalAlign.Center)
      .backgroundColor(Color.White)  // 顶部导航背景色
      //
      // // 灰色分隔区域（上下导航栏之间）
      // Column()
      //   .width('100%')
      //   .backgroundColor('#F5F5F5')

      // 标签页导航栏
      Tabs({ barPosition: BarPosition.End }) {
        // 查寝任务标签页
        TabContent() {
          Column(){
          // 查寝任务卡片（白色背景）
          Column() {
            // 顶部行：查寝标签和状态（状态靠右）
            Row() {
              // 左侧查寝标签
              Text('查寝')
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
              Text('未开始>')
                .fontSize(14)
                .fontColor('#999999')
                .margin({ left: 210 })
            }
            .width('100%')
            .padding({ top: 10 })
            .margin({ bottom: 10 })

            // 中间行：签到类型
            Row() {
              Text('拍照打卡')
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
              Text('小美（软件工程学院）')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ left: 50 })
            }
            .width('100%')
            .margin({ bottom: 10 })

            Row() {
              Text('查寝日')
                .fontSize(14)
                .fontColor('#666666')
                .margin({ left: 15 })
              Text('2025-07-12(周六)')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ left: 50 })
            }
            .width('100%')
            .margin({ bottom: 10 })

            Row() {
              Text('查寝时间段')
                .fontSize(14)
                .fontColor('#666666')
                .margin({ left: 15 })
              Text('21:59~22:40')
                .fontSize(14)
                .fontColor('#333333')
                .margin({ left: 22 })
            }
            .width('100%')
            .padding({ bottom: 10 })
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
        }
        .padding({bottom:480})
        .tabBar('查寝任务')
        .onClick(() => this.selectedTabIndex = 0)

        // 历史查寝任务标签页（含日历选择器）
        TabContent() {
          Column() {
            // 这里可以放历史查寝任务的其他内容
          }
          .width('100%')
          .height('100%')
          // 进入该标签页时自动触发
          .onAppear(() => {
            CalendarPickerDialog.show({
              selected: new Date(), // 默认选中当前日期
              acceptButtonStyle: { fontColor:Color.White,backgroundColor: '#007AFF' }, // 确认按钮样式
              cancelButtonStyle: { fontSize: 14 } // 取消按钮样式
            });
          })
        }
        .tabBar('历史查寝任务')
        .onClick(() => this.selectedTabIndex = 1)

        // 查寝统计标签页
        TabContent() {
        Column(){
          Row() {
            // 左侧图片
            Image($r('app.media.hajimi'))
              .borderRadius(25)
              .height(50)
              .width(50)

            // 中间Column
            Column() {
              Text('西部快哈手')
              Text('2023001001')
            }
            .margin({ left: 10 }) // 与图片保持间距
            Text('2025-07')
              .margin({ left: 105 }) // 右侧间距
              .fontColor(Color.Blue)
          }
          .height('100%')
          .width('100%')
          .backgroundColor(Color.White)
          .height(110) // 调整高度以容纳内容
          .padding({ left: 15, top: 10 })

          Row(){
            Text('查寝月度汇总').padding({left:5})
            Text('本月应查寝7次').padding({left:145})
          }.height(30)
          .width('100%')
          Column() {
            Text('【07-01】拍照打卡')
              .padding(20)
            Divider()

            Text('【07-02】拍照打卡')
              .padding(20)
            Divider()

            Text('【07-03】拍照打卡')
              .padding(20)

            Divider()

            Text('【07-04】拍照打卡')
              .padding(20)

            Divider()
            Text('【07-05】拍照打卡')
              .padding(20)
            Divider()

            Text('【07-06】拍照打卡')
              .padding(20)
            Divider()
            Text('【07-07】拍照打卡')
              .padding(20)

          }
          .height(100)
          .width('100%')
          .alignItems(HorizontalAlign.Start) // 确保左对齐
        }
         .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Start) // 使内容从 Column 顶部开始排列
        }
        .tabBar('查寝统计')
        .onClick(() => this.selectedTabIndex = 2)
      }
      .onChange((index) => this.selectedTabIndex = index)
      // .flexGrow(1)  // 让Tabs占满剩余空间
      .backgroundColor('#F5F5F5')  // Tabs背景色
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')  // 页面背景色
  }
}

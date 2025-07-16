import { Router } from '@ohos.arkui.UIContext';
import prompt from '@system.prompt'; // 导入提示模块
const router = new Router;
@Entry
@Component
struct DormitoryCheck {
  @State selectedTabIndex: number = 0;
  private tabTitles: string[] = ['签到任务', '历史签到任务', '签到统计'];
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
            Image($r('app.media.signup')).height('96%').width('100%')
          }
        }
        .padding({bottom:480})
        .tabBar('签到任务')
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
        .tabBar('历史签到任务')
        .onClick(() => this.selectedTabIndex = 1)

        // 查寝统计标签页
        TabContent() {
          Column(){
            Image($r('app.media.data')).height('96%').width('100%')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Start) // 使内容从 Column 顶部开始排列
        }
        .tabBar('签到统计')
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

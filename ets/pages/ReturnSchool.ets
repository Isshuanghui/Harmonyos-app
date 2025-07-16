import { Router } from '@ohos.arkui.UIContext';

const router=new Router;
@Entry
@Component
struct ReturnSchool{
  // 添加状态变量，用于跟踪当前选中的标签页索引
  @State selectedTabIndex: number = 0;
  // 定义标签页标题数组，用于动态更新顶部标题
  private tabTitles: string[] = ['节假日离返校','节假日离返校'];
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
        Text('反馈').fontSize(16).fontColor(Color.Red).padding({right:16})
      }.height(16)
      .width('100%')
      .padding({ left: 16 })
      .alignItems(VerticalAlign.Center) // 子组件垂直居中

      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          Image($r('app.media.return')).height('96%').width('100%')
        }.tabBar('去登记')
        .onClick(() => {
          this.selectedTabIndex = 0; // 点击时更新选中索引
        })
        TabContent(){
          Image($r('app.media.history1')).height('96%').width('100%')
        }.tabBar('历史登记')
        .onClick(() => {
          this.selectedTabIndex = 1; // 点击时更新选中索引
        })
      }.onChange((index) => {
        this.selectedTabIndex = index; // 滑动切换时更新选中索引
      })
    }
  }
}
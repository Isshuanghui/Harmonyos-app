@Entry
@Component
struct MeetingNotice {
  // 模拟数据列表，包含多个会议通知项
  private meetingList: Array<MeetingItem> = [
    new MeetingItem(true, '2025年07月05日 14:00', '2025年07月05日 14:30'),
    new MeetingItem(true, '2025年07月06日 10:00', '2025年07月06日 10:30'),
    new MeetingItem(false, '2025年07月07日 15:00', '2025年07月07日 15:30'),
    new MeetingItem(true, '2025年07月08日 09:00', '2025年07月08日 09:30'),
  ]

  build() {
    // 页面整体布局
    Column() {
      // 标题行
      Row() {
        Text('会议通知')
          .fontColor(Color.Black)
          .fontSize(18)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 10, bottom: 5 })

      // 列表区域
      List() {
        // 遍历数据列表，动态生成列表项
        ForEach(this.meetingList, (item: MeetingItem) => {
          ListItem() {
            Column() {
              // 日期行
              Row() {
                Text(item.meetingTime)
                  .fontColor('#999999')
                  .fontSize(12)
              }
              .width('100%')
              .justifyContent(FlexAlign.Center)
              .padding({ top: 10, bottom: 5 })

              // 主内容区
              Column() {
                Column() {
                  // 顶部行：会议标签和已签到状态
                  Row() {
                    // 左侧会议标签
                    Text(item.flag)
                      .fontSize(14)
                      .fontColor('#FFFFFF')
                      .backgroundColor('#4CAF50')  // 绿色背景
                      .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                      .borderRadius(4)
                      .margin({ left: 15 })

                    // 右侧已签到状态，使用flex布局的auto margin推到最右边
                    Text(item.isAttend ? '已参加>' : '未参加>')
                      .fontSize(14)
                      .fontColor('#999999')
                      .margin({ left: 'auto', right: 15 })
                  }.justifyContent(FlexAlign.SpaceBetween)
                  .width('100%')
                  .padding({ top: 10 })
                  .margin({ bottom: 10 })

                  // 中间行：会议主题
                  Row({ space: 15 }) {
                    Text(item.meetingTopic)
                      .fontSize(14)
                      .fontColor('#333333')
                      .margin({ left: 15 })
                  }
                  .width('100%')
                  .padding({ right: 15 })
                  .margin({ bottom: 10 })

                  // 底部行：会议地点
                  Row({ space: 15 }) {
                    Text(`会议地点：${item.meetingLocation}`)
                      .fontSize(12)
                      .fontColor('#999999')
                      .margin({ left: 15 })
                  }
                  .width('100%')
                  .padding({ right: 15, bottom: 10 })
                }
                .width('100%')
                .backgroundColor('#FFFFFF')
                .borderRadius(8)
                .shadow({ radius: 2, color: '#EEEEEE', offsetX: 0, offsetY: 1 })
                .margin({ left: 15, right: 15 })
              }
              .width('100%')
            }
            .width('100%')
          }
        })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')  // 页面背景色
  }
}

// 定义会议通知项的数据结构
class MeetingItem {
  flag: string = '会议';
  isAttend: boolean;
  meetingTopic: string = '项目进度会议';
  meetingTime: string;
  meetingLocation: string = '会议室A';
  meetingDeadline: string;

  constructor(isAttend: boolean, meetingTime: string, meetingDeadline: string) {
    this.isAttend = isAttend;
    this.meetingTime = meetingTime;
    this.meetingDeadline = meetingDeadline;
  }
}
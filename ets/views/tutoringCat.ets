@Entry
@Component
struct cc {
  private noticeList: Array<NoticeItem2> = [
    new NoticeItem2('节假日离返校', '返校登记已开始，请及时关注！', '五一劳动节', '2025年04月26日 14:00'),
    new NoticeItem2('节假日离返校', '返校登记已到截止时间，请及时关注！', '五一劳动节', '2025年05月04日 22:00'),
    new NoticeItem2('去向登记', '去向登记已开始，请及时关注！', '2025年暑假', '2025年06月24日 14:01'),
    new NoticeItem2('去向登记', '去向登记已到截止时间，请及时关注！', '2025年暑假', '2025年06月27日 09:01'),
  ]

  build() {
    // 页面整体布局
    Column() {
      // 标题行
      Row() {
        Text('辅导猫')
          .fontColor(Color.Black)
          .fontSize(18)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 10, bottom: 5 })

      // 列表区域
      List() {
        // 遍历数据列表，动态生成列表项
        ForEach(this.noticeList, (item: NoticeItem2) => {
          ListItem() {
            Column() {
              // 日期行
              Row() {
                Text(item.time)
                  .fontColor('#999999')
                  .fontSize(12)
              }
              .width('100%')
              .justifyContent(FlexAlign.Center)
              .padding({ top: 10, bottom: 5 })

              // 主内容区
              Column() {
                Column() {
                  // 顶部行：节假日离返校标签和右侧箭头
                  Row() {
                    // 左侧节假日离返校标签
                    Text(item.type)
                      .fontSize(14)
                      .fontColor('#FFFFFF')
                      .backgroundColor(item.type === '节假日离返校' ? '#55A5FF' : '#CCCCCC')  // 蓝色背景
                      .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                      .borderRadius(4)
                      .margin({ left: 15 })

                    // 右侧箭头
                    Text('>')
                      .fontSize(14)
                      .fontColor('#999999')
                      .margin({ left: 'auto', right: 15 })
                  }
                  .width('100%')
                  .padding({ top: 10 })
                  .margin({ bottom: 10 })

                  // 中间行：返校登记已开始，请及时关注！
                  Row({ space: 15 }) {
                    Text(item.content)
                      .fontSize(14)
                      .fontColor('#333333')
                      .margin({ left: 15 })
                  }
                  .width('100%')
                  .padding({ right: 15 })
                  .margin({ bottom: 10 })

                  // 底部行：五一劳动节
                  Row({ space: 15 }) {
                    Text(item.holiday)
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

// 定义通知项的数据结构
class NoticeItem2 {
  type: string;
  content: string;
  holiday: string;
  time: string;

  constructor(type: string, content: string, holiday: string, time: string) {
    this.type = type;
    this.content = content;
    this.holiday = holiday;
    this.time = time;
  }
}
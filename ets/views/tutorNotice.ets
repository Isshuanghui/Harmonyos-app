@Entry
@Component
struct tutorNotice {
  private noticeList: Array<NoticeItem> = [
    new NoticeItem(true, '2025年07月05日 21:59', '2025年07月05日 22:40'),
    new NoticeItem(true, '2025年07月06日 21:59', '2025年07月06日 22:40'),
    new NoticeItem(false, '2025年07月07日 22:40', '2025年07月07日 22:40'),
    new NoticeItem(true, '2025年07月08日 21:59', '2025年07月08日 22:40'),
  ]

  build() {
    // 页面整体布局
    Column() {
      // 标题行
      Row() {
        Text('辅导员通知')
          .fontColor(Color.Black)
          .fontSize(18)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 10, bottom: 5 })

      // 列表区域
      List() {
        // 遍历数据列表，动态生成列表项
        ForEach(this.noticeList, (item: NoticeItem) => {
          ListItem() {
            Column() {
              // 日期行
              Row() {
                Text(item.signTime)
                  .fontColor('#999999')
                  .fontSize(12)
              }
              .width('100%')
              .justifyContent(FlexAlign.Center)
              .padding({ top: 10, bottom: 5 })

              // 主内容区
              Column() {
                Column() {
                  // 顶部行：查寝标签和已签到状态
                  Row() {
                    // 左侧查寝标签
                    Text(item.flag)
                      .fontSize(14)
                      .fontColor('#FFFFFF')
                      .backgroundColor('#D4AF37')  // 金色背景
                      .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                      .borderRadius(4)
                      .margin({ left: 15 })

                    Text(item.isSignIn ? '已签到>' : '未签到>')
                      .fontSize(14)
                      .fontColor('#999999')
                      .margin({ left: 'auto', right: 15 })
                  }.justifyContent(FlexAlign.SpaceBetween)
                  .width('100%')
                  .padding({ top: 10 })
                  .margin({ bottom: 10 })

                  // 中间行：拍照打卡
                  Row({ space: 15 }) {
                    Text(item.signType)
                      .fontSize(14)
                      .fontColor('#333333')
                      .margin({ left: 15 })
                  }
                  .width('100%')
                  .padding({ right: 15 })
                  .margin({ bottom: 10 })

                  // 底部行：截止时间
                  Row({ space: 15 }) {
                    Text(`签到截止时间：${item.signDeadline}`)
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

class NoticeItem {
  flag: string = '查寝';
  isSignIn: boolean;
  signType: string = '拍照打卡';
  signTime: string;
  signDeadline: string;

  constructor(isSignIn: boolean, signTime: string, signDeadline: string) {
    this.isSignIn = isSignIn;
    this.signTime = signTime;
    this.signDeadline = signDeadline;
  }
}
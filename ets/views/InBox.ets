@Entry
@Component
struct InBox {
  private noticeList: Array<NoticeItem3> = [
    new NoticeItem3('考试通知', '学习通知', '07-10 20:54'),
    new NoticeItem3('考试通知', '学习通知', '07-09 13:51'),
    new NoticeItem3('中国国际大学生创新大赛报名开始', '王XX', '07-06 14:19'),
    new NoticeItem3('“青年红色筑梦之旅”启动活动', '王XX', '07-05 18:34'),
    new NoticeItem3('第8周课前任务', '张XX', '07-03 11:10'),
    new NoticeItem3('学习进度提醒', '学习通知', '07-03 08:01'),
    new NoticeItem3('考试通知', '学习通知', '07-02 06:47'),
    new NoticeItem3('关于期中考试的通知', '李X', '07-01 16:04'),
    new NoticeItem3('《创新创业基础》课程反馈', '学习通知', '07-01 11:24'),
  ]

  build() {
    Column() {

      Row() {
        Text('收件箱')
          .fontColor(Color.Black)
          .fontSize(18)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding({ top: 10, bottom: 5 })


      Row({ space: 10 }) {
        Image($r('app.media.seek'))
          .width(24)
          .height(24)


        TextInput({
          placeholder: '搜索消息'
        })
          .width('80%')
          .height(40)
          .backgroundColor('#E0E0E0')
          .borderRadius(8)
          .margin({ top: 15, right: 10 })
      }


      List() {
        ForEach(this.noticeList, (item: NoticeItem3) => {
          ListItem() {
            Row() {
              Image($r('app.media.tongzhi3'))
                .width(40)
                .height(40)
                .margin({ left: 15, right: 10 })

              Column() {
                Text(item.title)
                  .fontSize(14)
                  .fontColor('#000000')
                  .margin({ bottom: 2 })

                Text(item.subtitle)
                  .fontSize(12)
                  .fontColor('#999999')
              }
              .flexGrow(1)

              Text(item.time)
                .fontSize(12)
                .fontColor('#999999')
                .margin({ right: 15 })
            }
            .width('100%')
            .padding({ top: 10, bottom: 10 })

          }
        })
      }
      .width('100%')
      .height('100%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

class NoticeItem3 {
  title: string;
  subtitle: string;
  time: string;

  constructor(title: string, subtitle: string, time: string) {
    this.title = title;
    this.subtitle = subtitle;
    this.time = time;
  }
}
import prompt from '@ohos.promptAction';

@Entry
@Component
struct chat {

  private messages: Array<ChatMessage> = [
    {
      sender: '张三',
      content: '大家自行分组，作业组内完成',
      time: '07-10 18:04',
      isSelf: false,
      avatar: $r('app.media.icon3')
    },
    {
      sender: '李四',
      content: '把小组名称发布在作品展示区域，要不然没法打分。无需重命名',
      time: '07-10 18:52',
      isSelf: false,
      avatar: $r('app.media.icon4')
    },
    {
      sender: '王五',
      content: '好',
      time: '07-10 00:09',
      isSelf: false,
      avatar: $r('app.media.chaiquan')
    }
  ];

  // 输入框内容
  @State inputContent: string = '';

  build() {
    Column() {
      // 聊天消息列表
      List() {
        ForEach(this.messages, (item: ChatMessage) => {
          ListItem() {
            Column() {

              Text(item.time)
                .fontSize(12)
                .fontColor('#999999')
                .margin({ top: 10, bottom: 5 })
                .width('100%')
                .textAlign(TextAlign.Center)


              Row() {
                if (item.isSelf) {

                  Column() {
                    Text(item.sender)
                      .fontSize(12)
                      .fontColor('#999999')
                      .margin({ bottom: 2 })

                    Text(item.content)
                      .fontSize(14)
                      .backgroundColor('#FFFFFF')
                      .padding({ left: 25, right: 25, top: 10, bottom: 10 })
                      .borderRadius(8)
                  }
                  .margin({ right: 15 })
                } else {
                  // 别人的消息在左侧
                  Column() {
                    // 头像和名称
                    Row() {
                      Image(item.avatar)
                        .width(30)
                        .height(30)
                        .borderRadius(15)
                        .margin({ right: 10 })

                      Text(item.sender)
                        .fontSize(12)
                        .fontColor('#999999')
                    }
                    .margin({ left: 15 })

                    // 消息内容
                    Column() {
                      Text(item.content)
                        .fontSize(14)
                        .backgroundColor('#FFFFFF')
                        .padding({ left: 25, right: 25, top: 10, bottom: 10 })
                        .borderRadius(8)
                    }
                    .margin({ left: 15, top: 5, right: 15 })
                  }.width('100%')
                  .alignItems(item.isSelf?HorizontalAlign.End:HorizontalAlign.Start)
                }
              }
              .width('100%')
            }
          }
        })
      }
      .width('100%')
      .height('85%')
      .backgroundColor('#F5F5F5')

      // 输入区域
      Row() {
        // 更多按钮
        Image($r('app.media.gengduo'))
          .width(24)
          .height(24)
          .margin({ left: 20, right: 10 })
          .onClick(()=>{
            prompt.showToast({ message: '更多', duration: 2000 });
          })

        // 表情按钮
        Image($r('app.media.biaoqing'))
          .width(24)
          .height(24)
          .margin({ right: 10 })
          .onClick(()=>{
            prompt.showToast({ message: '表情', duration: 2000 });
          })

        // 输入框
        TextInput({ placeholder: '请输入消息' })
          .width('50%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .placeholderColor('#999999')
          .fontSize(14)
          .borderRadius(20)
          .padding({ left: 15, right: 15 })
          .margin({ left: 10, right: 10 })
          .onChange((value: string) => {
            this.inputContent = value;
          })
          .onSubmit(() => {
            if (this.inputContent.trim() !== '') {
              this.inputContent = '';
            }
          })

        // 发送按钮
        Button('发送')
          .width(60)
          .height(30)
          .fontSize(12)
          .backgroundColor('#E5E5E5')
          .fontColor('#000000')
          .borderRadius(15)
          .margin({ right: 50 })
          .onClick(()=>{
            prompt.showToast({ message: '发送', duration: 2000 });
          })
      }
      .width('100%')
      .height(60)
      .backgroundColor('#FFFFFF')
      .alignItems(VerticalAlign.Center)
      // .margin({ left: 20, right: 60 })
      .padding({left:10,right:10})

    }
    .width('100%')
    .height('100%')
  }
}


interface ChatMessage {
  sender: string;
  content: string;
  time: string;
  isSelf: boolean;
  avatar: Resource;
}
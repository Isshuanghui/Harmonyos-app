@Entry
@Component
struct FriendList{
  @State listFriend: Array<string> = ['张三', '李四', '王五', '赵六', '孙七','钱八','赵九','郑十','小明','小红','小蓝','小绿'];


  build() {
    Column(){
      Text('好友列表')
        .fontColor(Color.Black)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({bottom: 10})

      List() {
        ForEach(this.listFriend, (item: string) => {
          ListItem() {
            Row() {
              Image($r('app.media.touxiang'))
                .width(40)
                .height(40)
                .borderRadius(25)

              Text(item)
                .fontSize(16)
            }
            .width('100%')
            .height(70)
            .padding(10)
          }
        })
      }
      .divider({
        strokeWidth: 1,
        color: '#eeeeee',
        startMargin: 10,
        endMargin: 10
      })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}
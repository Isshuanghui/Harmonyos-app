
@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  @State isFollowed: boolean = false; // 关注状态，true 表示已关注，false 表示未关注
  private imgs: ResourceStr[] = [
    $r('app.media.lunbo21'),
    $r('app.media.lunbo22'),
    $r('app.media.lunbo23')
  ];

  build() {
    Column() {
      // 顶部行：头像、标题和关注按钮
      Row() {
        // 左侧头像和标题
        Row() {
          Image($r('app.media.xiaozhushou'))
            .width(40)
            .height(40)
            .padding({ left: 8, right: 8, top: 2, bottom: 2 })
            .margin({ left: 15 })

          Text('辅导猫小助手')
            .fontColor(Color.Black)
            .fontSize(18)
        }

        // 右侧关注按钮
        Button(this.isFollowed ? '已关注' : '未关注')
          .width(80)
          .height(30)
          .fontSize(12)
          .backgroundColor(this.isFollowed ? '#E5E5E5' : '#007DFF')
          .fontColor(this.isFollowed ? '#999999' : '#FFFFFF')
          .borderRadius(15)
          .margin({ right: 15 })
          .onClick(() => {
            this.isFollowed = !this.isFollowed;
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)
      .padding({ top: 20, bottom: 10 }) // 增加顶部行的上下间距

      // 描述文本
      Row() {
        Text(`辅导猫最宠粉的活动小助手，给同学们推送最有趣、最新的消息通知！`)
          .fontSize(12)
          .fontColor(Color.Grey)
          .margin({ left: 15, bottom: 20 }) // 增加描述文本的底部间距
      }

      // 轮播图组件
      Swiper() {
        ForEach(this.imgs, (item: ResourceStr) => {
          Image(item)
            .width('100%')
            .height('100%')
            .objectFit(ImageFit.Cover)
        })
      }
      .height('60%')
      .autoPlay(true) // 自动轮播
      .borderRadius(15)
      .margin({ left: 15, right: 15, bottom: 20 }) // 增加轮播图的底部间距
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
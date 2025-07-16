import router from '@ohos.router';

@Entry
@Component
struct JobDetails {
  // 明确类型，不使用any
  private jobId: number = 0;

  aboutToAppear() {
    // 修复：用接口声明类型，代替对象字面量
    interface Params {
      jobId?: number;
    }
    const params: Params = router.getParams() as Params; // 用接口作为类型
    this.jobId = params.jobId ?? 0;
  }

  // 根据jobId返回对应图片列表
  private getImagesByJobId(id: number): Resource[] {
    switch (id) {
      case 1:
        return [$r('app.media.work11'), $r('app.media.work12'), $r('app.media.work13'), $r('app.media.work14'), $r('app.media.work15')];
      case 2:
        return [$r('app.media.work21'), $r('app.media.work22'), $r('app.media.work23'), $r('app.media.work24'), $r('app.media.work25'), $r('app.media.work26')];
      default:
        return [$r('app.media.work31'), $r('app.media.work32'), $r('app.media.work33'), $r('app.media.work34'), $r('app.media.work35')];
    }
  }

  build() {
    Column() {
      // 图片列表标题
      Text('招聘详情')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, left: 15 })

      // 竖屏排列的图片列表
      List() {
        ForEach(this.getImagesByJobId(this.jobId), (image: Resource) => {
          ListItem() {
            Image(image)
              .flexShrink(0) // 关键：防止图片被压缩
              .objectFit(ImageFit.Cover)
          }
        })
      }
      .listDirection(Axis.Vertical)  // 竖屏排列
      .width('100%')
      .padding({ left: 15, right: 15, top: 10 })
      .scrollBar(BarState.Off) // 隐藏滚动条
    }
    .width('100%')
    .height('100%')
  }
}

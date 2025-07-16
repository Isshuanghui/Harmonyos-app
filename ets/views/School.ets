@Component
export struct School {
  private imgs: Resource[] = [
    $r('app.media.cyber'),
    $r('app.media.ghost'),
    $r('app.media.shadowofthtombraider'),
    $r('app.media.gong')
  ];

  build() {
    // 用 Scroll 组件包裹整个页面内容，实现向下滑动
    Scroll() {
      Column() {
        Text('大连大学')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        TextInput({ placeholder: '搜索' })
          .width('100%')
          .height(40)
          .borderRadius(12)
          .backgroundColor('#F5F5F5')
          .margin({ top: 10, bottom: 10 })

        Swiper() {
          ForEach(this.imgs, (item: Resource) => {
            Image(item)
              .width('100%')
              .height('100%')
          })
        }
        .height('20%')
        .width('100%')
        .autoPlay(true)
        .margin({ bottom: 10 })

        Row() {
          Row() {
            Text('推荐游玩')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
          }.width('84%')
          .justifyContent(FlexAlign.Start)

          Row() {
            Text('查看更多')
              .fontSize(12)
              .fontColor(Color.Gray)
          }.justifyContent(FlexAlign.End)
        }.margin({ bottom: 5 })

        Row({ space: 30 }) {
          Column() {
            Image($r("app.media.cyberponk")).width(100).height(150)
            Text('CyberPonk')
              .fontSize(12)
              .margin({ top: 5 })
          }

          Column() {
            Image($r("app.media.GTA6")).width(100).height(150)
            Text('GTA6')
              .fontSize(12)
              .margin({ top: 5 })
          }

          Column() {
            Image($r("app.media.EldenRing")).width(100).height(150)
            Text('EldenRing')
              .fontSize(12)
              .margin({ top: 5 })
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .padding({ bottom: 30 })

        // 第二行图标及文字
        Row({ space: 30 }) {
          Column() {
            Image($r("app.media.devilfive")).width(100).height(150)
            Text('鬼泣5')
              .fontSize(12)
              .margin({ top: 5 })
          }

          Column() {
            Image($r("app.media.battlefive")).width(100).height(150)
            Text('战地5')
              .fontSize(12)
              .margin({ top: 5 })
              .width(70)
              .textAlign(TextAlign.Center)
          }.justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)

          Column() {
            Image($r("app.media.TiTanFall2")).width(100).height(150)
            Text('TiTanFall2')
              .fontSize(12)
              .margin({ top: 5 })
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .padding({ bottom: 30 })

        Row() {
          Row() {
            Text('猜你喜欢')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
          }.width('78%')
          .justifyContent(FlexAlign.Start)

          Row() {
            Button('换一批')
              .width(70)
              .height(35)
              .fontSize(10)
              .borderRadius(90)
              .backgroundColor(Color.White)
              .fontColor(Color.Gray)
              .border({
                width: 1,
                color: '#DCDCDC',
                radius: 20
              })
          }.justifyContent(FlexAlign.Start)
        }.margin({ bottom: 5 })

        Row({ space: 30 }) {
          Column() {
            Image($r("app.media.ForzaHorizon4")).width(100).height(150)
            Text('ForzaHorizon4')
              .fontSize(12)
              .margin({ top: 5 })
          }

          Column() {
            Image($r("app.media.ForzaHorizon5")).width(100).height(150)
            Text('ForzaHorizon5')
              .fontSize(12)
              .margin({ top: 5 })
          }

          Column() {
            Image($r("app.media.wrc7")).width(100).height(150)
            Text('wrc7')
              .fontSize(12)
              .margin({ top: 5 })
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .padding({ bottom: 30 })

        // 第二行图标及文字
        Row({ space: 30 }) {
          Column() {
            Image($r("app.media.Sekiro")).width(100).height(150)
            Text('Sekiro')
              .fontSize(12)
              .margin({ top: 5 })
          }

          Column() {
            Image($r("app.media.TheWitcher")).width(100).height(150)
            Text('TheWitcher2')
              .fontSize(12)
              .margin({ top: 5 })
              .width(70)
              .textAlign(TextAlign.Center)
          }.justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)

          Column() {
            Image($r("app.media.PolyBridge")).width(100).height(150)
            Text('和珅模拟器')
              .fontSize(12)
              .margin({ top: 5 })
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .padding({ bottom: 30 })

      }
      .width('100%') // 确保内容宽度充满屏幕
    }.scrollBar(BarState.Off) // 隐藏滚动条
    .width('100%') // Scroll 宽度充满屏幕
    .height('100%') // Scroll 高度充满屏幕，才能触发滚动
  }
}
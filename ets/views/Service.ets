import { Router } from "@ohos.arkui.UIContext";

const router = new Router()

@Component
export struct Service {

  @State isMyServiceActive: boolean = true;
  build() {
    Column() {
      Text('服务中心')
        .fontSize(20)
        .fontWeight(FontWeight.Bold) // 字体加粗等样式

      TextInput({placeholder: '搜索' })
        .width('90%')
        .height(40)
        .borderRadius(12)
        .backgroundColor('#F5F5F5')
        .margin({ top: 10, bottom: 10 }) // 与上方文字、下方内容拉开间距

      Row() {
        Row({ space: 10 }) {
          Button('我的服务')
            .width(80)
            .height(35)
            .fontSize(11)
            .borderRadius(40)
            .backgroundColor(this.isMyServiceActive ? '#CCE7F0' : '#FFFFFF')
            .fontColor(this.isMyServiceActive ? '#5063EE' : '#333333')
            .border({
              width: 1,
              color: this.isMyServiceActive ? '#409EFF' : '#DCDCDC',
              radius: 20
            })
            .onClick(() => this.isMyServiceActive = true);

          Button('校内服务')
            .width(80)
            .height(35)
            .fontSize(11)
            .borderRadius(20)
            .backgroundColor(!this.isMyServiceActive ? '#CCE7F0' : '#FFFFFF')
            .fontColor(!this.isMyServiceActive ? '#5063EE' : '#333333')
            .border({
              width: 1,
              color: !this.isMyServiceActive ? '#409EFF' : '#DCDCDC',
              radius: 20
            })
            .onClick(() => this.isMyServiceActive = false);

        }.width('90%')
        .justifyContent(FlexAlign.Start) // 按钮靠左排列

        Row() {
          Image($r("app.media.three")).width(30).height(30)
        }.justifyContent(FlexAlign.End) // 按钮靠排右列
      }.padding({ left: 20, right: 20 })
      .margin({ bottom: 10 })

      Row() {
        Row() {
          Text('我的服务')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

          Text('编辑')
            .fontSize(15)
            .fontColor(Color.Gray)
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ left: 20, right: 20, bottom: 20 })
      }.margin({bottom:5})

      Row() {
        Text('点击右上角[编辑]进行添加')
          .fontSize(15)
          .fontColor(Color.Gray)
      }.width('100%')
      .height(100)
      .margin({ bottom: 10 })
      .justifyContent(FlexAlign.Center)


      Row() {
        Text('校内服务')
          .fontSize(23)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({ left: 40, bottom: 20 })


      // 第一行图标及文字
      Row({ space: 30 }) {
        Column() {
          Image($r("app.media.room_inspection")).width(50).height(50)
          Text('查寝')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/DormCheck'  })
        })

        Column() {
          Image($r("app.media.inform")).width(50).height(50)
          Text('辅导员通知')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/AdvisiorNotice'  })
        })

        Column() {
          Image($r("app.media.back_school")).width(50).height(50)
          Text('返校申请')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/ReturnApplication'  })
        })

        Column() {
          Image($r("app.media.activity")).width(50).height(50)
          Text('活动报名')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/ActivitySignUp'  })
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .padding({ bottom: 30 })

      // 第二行图标及文字
      Row({ space: 30 }) {

        Column() {
          Image($r("app.media.sign_in")).width(50).height(50)
          Text('签到')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/SignUp'  })
        })

        Column() {
          Image($r("app.media.vacation_back_school")).width(50).height(50)
          Text('节假日离返校学生端')
            .fontSize(12)
            .margin({ top: 5 })
            .width(70)        // 固定文字宽度，让多行文字对齐
            .textAlign(TextAlign.Center) // 文字水平居中
        }.justifyContent(FlexAlign.Center) // 使用 FlexAlign 枚举进行垂直对齐
        .alignItems(HorizontalAlign.Center) // 使用 HorizontalAlign 枚举进行水平对齐
        .onClick(() => {
          router.pushUrl({ url: 'pages/ReturnSchool'  })
        })

        Column() {
          Image($r("app.media.my_information")).width(50).height(50)
          Text('我的信息')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/PersonalHomePage'  })
        })

        Column() {
          Image($r("app.media.dormitory_check")).width(50).height(50)
          Text('宿管查寝')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/DormitoryCheck'  })
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .padding({ bottom: 30 })

      // 第三行图标及文字
      Row({ space: 30 }) {
        Column() {
          Image($r("app.media.leave")).width(50).height(50)
          Text('请假')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/Leave'  })
        })

        Column() {
          Image($r("app.media.service_desk")).width(50).height(50)
          Text('学生服务台')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/ServiceDesk'  })
        })

        Column() {
          Image($r("app.media.information_collection"))
            .width(50)
            .height(50)
          Text('信息收集')
            .fontSize(12)
            .margin({ top: 5 })
        }.onClick(() => {
          router.pushUrl({ url: 'pages/InformationCollection'  })
        })

        Column() {
          Image($r("app.media.img")).width(50).height(50)
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .padding({ bottom: 30 })

    }
  }
}
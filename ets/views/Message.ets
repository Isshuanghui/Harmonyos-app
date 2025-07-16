import prompt from '@ohos.promptAction';
import { Router } from '@ohos.arkui.UIContext';

const router = new Router()

@Component
export struct Message {

  build() {
    Column() {
      // 第一行：消息标题 + 图标
      Row({ space: 5 }) {
        Text('消息')
          .fontSize(20)
          .fontColor('#000000')
          .textAlign(TextAlign.Center)


        Image($r('app.media.tongxunlu'))
          .onClick(()=>{
            prompt.showToast({ message: '正在跳转好友列表...', duration: 2000 });
            router.pushUrl({url:"views/FriendList"})
          })
          .width(40)
          .height(40);
      }
      .width('100%')
      .height(40)
      .margin({ top: 10 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.SpaceBetween);

      // 第二行：搜索框
      Row({ space: 10 }) {
        Image($r('app.media.seek'))
          .width(24)
          .height(24)


        TextInput({
          placeholder: '搜索消息'
        })
          .width('80%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .margin({ top: 15, right: 10 })
      }

      // 第三行：图标 + 辅导员通知
      Row({ space: 5 }) {
        Image($r('app.media.tongzhi'))
          .width(40)
          .height(40);

        Column() {
          Text('辅导员通知')
            .fontSize(16)
            .fontColor('#000000')
            .textAlign(TextAlign.Start);

          Text('【查寝】拍照打卡 签到截止时间：2025年07月08日22:40')
            .fontSize(11)
            .fontColor('#999999')
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
      }
      .onClick(()=>{
        prompt.showToast({ message: '正在跳转辅导员通知...', duration: 2000 });
        router.pushUrl({url:"views/tutorNotice"})
      })
      .width('100%')
      .height(80)
      .margin({ top: 5 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Start);

      // 第四行：辅导猫
      Row({ space: 5 }) {
        Image($r('app.media.fudaomao'))
          .width(40)
          .height(40);

        Column() {
          Text('辅导猫')
            .fontSize(16)
            .fontColor('#000000')
            .textAlign(TextAlign.Start);

          Text('【节假日离返校】去向登记已到截止时间，请及时关注！')
            .fontSize(11)
            .fontColor('#999999')
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
      }
      .onClick(()=>{
        prompt.showToast({ message: '正在跳转辅导猫...', duration: 2000 });
        router.pushUrl({url:"views/tutoringCat"})
      })
      .width('100%')
      .height(80)
      .margin({ top: 5 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Start);

      // 第五行：图标 + 会议通知
      Row({ space: 5 }) {
        Image($r('app.media.huiyi'))
          .width(40)
          .height(40);

        Column() {
          Text('会议通知')
            .fontSize(16)
            .fontColor('#000000')
            .textAlign(TextAlign.Start);

          Text('【最新会议】线上形式 会议开始时间：2025年07月03日 13:00')
            .fontSize(11)
            .fontColor('#999999')
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
      }
      .onClick(()=>{
        prompt.showToast({ message: '正在跳转会议通知...', duration: 2000 });
        router.pushUrl({url:"views/meeting"})
      })
      .width('100%')
      .height(80)
      .margin({ top: 5 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Start);


      // 第六行：图标 + 辅导猫小助手
      Row({ space: 5 }) {
        Image($r('app.media.xiaozhushou'))
          .width(40)
          .height(40);

        Column() {
          Text(`辅导猫小助手`)
            .fontSize(16)
            .fontColor('#000000')
            .textAlign(TextAlign.Start);

          Text('【大赛速递】2025金融知识竞赛正式启动：一起瓜分大额奖金！')
            .fontSize(11)
            .fontColor('#999999')
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
      }
      .onClick(()=>{
        prompt.showToast({ message: '正在跳转辅导猫小助手...', duration: 2000 });
        router.pushUrl({url:"views/assistant"})
      })
      .width('100%')
      .height(80)
      .margin({ top: 5 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Start);


      // 第七行：图标 + 群聊
      Row({ space: 5 }) {
        Image($r('app.media.qunliao'))
          .width(40)
          .height(40);

        Column() {
          Text('群聊')
            .fontSize(16)
            .fontColor('#000000')
            .textAlign(TextAlign.Start);

          Text('王五：好')
            .fontSize(11)
            .fontColor('#999999')
            .textAlign(TextAlign.Start);

        }
        .alignItems(HorizontalAlign.Start)
      }
      .onClick(()=>{
        prompt.showToast({ message: '正在跳转群聊界面...', duration: 2000 });
        router.pushUrl({url:"views/chat"})
      })
      .width('100%')
      .height(80)
      .margin({ top: 5 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Start);

      // 第八行：图标 + 收件箱
      Row({ space: 5 }) {
        Image($r('app.media.shoujianxiang'))
          .width(40)
          .height(40);

        Column() {
          Text(`收件箱`)
            .fontSize(16)
            .fontColor('#000000')
            .textAlign(TextAlign.Start);

          Text('【学习通知】 来自《马克思主义基本原理》的学习进度提醒')
            .fontSize(11)
            .fontColor('#999999')
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
      }
      .onClick(()=>{
        prompt.showToast({ message: '正在跳转收件箱...', duration: 2000 });
        router.pushUrl({url:"views/InBox"})
      })
      .width('100%')
      .height(80)
      .margin({ top: 5 })
      .backgroundColor('#FFFFFF')
      .justifyContent(FlexAlign.Start);




    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#FFFFFF');
  }
}
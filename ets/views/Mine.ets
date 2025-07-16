
import { Router } from '@ohos.arkui.UIContext';

const router =new Router
@Component
export struct Mine {
  build() {
    Column() {
      // 可滚动区域：包裹除底部导航外的内容
      Scroll() {
        Column() {
          // 1. 顶部栏（示例，可替换真实头像、名称）
          this.buildTopBar();

          // 2. “添加状态”按钮
          this.buildStatusBar();

          // 3. 功能分组 - 应用
          this.buildSection('应用', ['扫一扫', '大学运动']);

          // 4. 功能分组 - 大学圈
          this.buildSection('大学圈', ['个人主页', '大学圈记录', '互动消息', '话题管理']);

          // 5. 功能分组 - 设置反馈
          this.buildSection('设置反馈', [
            '个人资料', '消息通知', '通用设置',
            '帮助反馈', '分享应用', '清除缓存', '关于我们'
          ]);
        }
      }.scrollBar(BarState.Off) // 隐藏滚动条
      .width('100%')
      .flexGrow(1) // 占满剩余空间，让底部导航固定
      .backgroundColor('#F5F5F5');

    }
    .width('100%')
    .height('100%');
  }

  // 构建顶部栏（示例，替换为真实头像、名称）
  @Builder
  buildTopBar() {
    Stack() {
      // 蓝色背景
      Column()
        .width('100%')
        .height(140)
        .backgroundColor(Color.Blue);

      // 头像 + 名称
      Row() {
        // 头像（替换为真实资源，注意拼写）
        Image($r('app.media.hajimi'))
          .width(60)
          .height(60)
          .borderRadius(30)
          .onClick(() => { // 添加头像点击事件
            router.pushUrl({
              url: 'pages/PersonalHomePage',
              params: {
                name: '西部快哈手',
                avatar: $r('app.media.hajimi'),
                school: '大连大学'
              }
            });
          });

        Column() {
          Text('西部快哈手')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White);
          Text('大连大学')
            .fontSize(14)
            .fontColor(Color.White);
        }
        .padding({ top: 4 });
      }
      .width('100%')
      .padding({ left: 16, top: 20 });
    }
    .width('100%');
  }

  // 构建“添加状态”按钮
  @Builder
  buildStatusBar() {
    Button('添加状态')
      .width('90%')
      .height(32)
      .fontSize(14)
      .backgroundColor(Color.White)
      .fontColor('#409EFF')
      .margin({ left: 16, top: 12, bottom: 12, right: 16 });
  }

  // 构建功能分组（通用方法）
  @Builder
  buildSection(title: string, items: string[]) {
    Column() {
      // 分组标题
      Text(title)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#999999')
        .padding({ left: 0, top: 16, bottom: 8 });

      // 功能列表
      List() {
        ForEach(items, (item: string) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(14)
                .fontColor('#333333');
              Text('>')
                .fontSize(16)
                .fontColor('#999999');
            }
            .width('100%')
            .height(50)
            .backgroundColor(Color.White)
            .padding({ left: 16, right: 16 })
            .justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => { // 为列表项添加点击事件
              if (item === '个人主页') { // 处理个人主页点击
                router.pushUrl({
                  url: 'pages/PersonalHomePage',
                  params: {
                    name: '西部快哈手',
                    avatar: $r('app.media.hajimi'),
                    school: '大连大学'
                  }
                });
              }
            });
          }
        });
      }.scrollBar(BarState.Off) // 隐藏滚动条
      .width('100%')
      .divider({ strokeWidth: 0 });
    }
    .width('96%')
    .backgroundColor(Color.White)
    .borderRadius(12)
    .margin({ left: 8, right: 8, bottom: 12 });
  }

}
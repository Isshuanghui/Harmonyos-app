import { bluetoothManager } from "@kit.MDMKit";
import prompt from '@system.prompt'; // 导入提示模块
import { Router } from "@ohos.arkui.UIContext";

const router=new Router;
// 招聘信息数据结构
interface RecruitmentInfo {
  id: number;
  image?: Resource;
  title: string;
  time: string;
}

@Component
export struct Today {
  //轮播图数据
  private imgs: Resource[] = [
    $r('app.media.lunbo1'),
    $r('app.media.lunbo2'),
    $r('app.media.lunbo3'),
    $r('app.media.lunbo4'),
    $r('app.media.lunbo5'),
    $r('app.media.lunbo6')
  ];
  // 招聘信息数据
  private recruitmentData: RecruitmentInfo[] = [
    {
      id: 1,
      image:$r('app.media.work1'),
      title: '【招聘公告】鄂尔多斯市东胜区胜都人才资源有限公司项目人员招聘公告',
      time: '2025-08-15'
    },
    {
      id: 2,
      image:$r('app.media.work2'),
      title: '【音乐节招募】歌游内蒙古·“绒”耀夏日旅游音乐节招募乐队/歌手/观众',
      time: '2025-07-20'
    },
    {
      id: 3,
      image:$r('app.media.work3'),
      title: '超星集团2025春季校园招聘最新消息！',
      time: '2025-06-30'
    }
  ];

  build() {
    // 使用List组件实现竖直滑动
    List() {
      // 顶部蓝色区域 - 作为列表的第一个项目
      ListItem() {
        Column() {
          Row() {
            // 左侧文字：居左
            Text('大连大学')
              .fontColor(Color.White)
              .fontSize(25)
              .height(40)
              .alignSelf(ItemAlign.Center) // 垂直居中对齐
            // 右侧图片：居右（通过权重占位实现）
            Image($r('app.media.scan'))
              .onClick(() => this.showUnsupported()) // 点击事件处理
              .width(30)
              .height(30)
          }
          .padding({ left: 10, top: 15, right: 10 })
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween) // 关键：文字左、图片右，中间自动留白

          Row() {
            this.buildTextItem($r('app.media.seek'), '搜索应用名称')
          }.margin({ left: 10, top: 15, right: 10 })
          .height(40)

          Row({ space: 30 }) {
            this.buildModuleItem('活动报名', $r('app.media.T1'))
            this.buildModuleItem('查寝', $r('app.media.T2'))
            this.buildModuleItem('辅导员通知', $r('app.media.T3'))
            this.buildModuleItem('返校申请', $r('app.media.T4'))
          }
          .padding({ top: 30, left: 13, right: 10 })
          .width('100%')
          .borderRadius(8)

        }
        .backgroundColor(Color.Blue)
        .width('100%')
        .height('35%')
      }

      // 活动通知部分 - 作为列表的第二个项目
      ListItem() {
        Column() {
          // 活动通知标题
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
            Image($r("app.media.line")).height(25).width(10)
            Text('活动通知')
          } .width('100%')
          .height(40)
          .padding({ left: 16 })

          // 活动通知轮播
          Swiper() {
            ForEach(this.imgs,(item:Resource)=>{
              Image(item)
                .width('100%')
                .height('100%')
            })
          }.height('20%')
          .width('100%')
          .autoPlay(true)//自动
          .borderRadius(15)
        }
      }

      // 校园招聘部分 - 作为列表的第三个项目
      ListItem() {
        Column() {
          // 校园招聘标题
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
            Image($r("app.media.line")).height(25).width(10)
            Text('校园招聘')
          } .width('100%')
          .height(40)
          .padding({ left: 16 })

          // 招聘信息列表
          Column() {
            ForEach(this.recruitmentData, (item: RecruitmentInfo) => {
              this.buildRecruitmentCard(item);
            });
          }
          .width('100%')
          .padding({ left: 8, right: 8 })
        }
      }
    }
    .scrollBar(BarState.Off) // 隐藏滚动条
    .width('100%')
    .height('100%')
    // .scrollBar(ScrollBar) // 可选：隐藏滚动条
  }

/**
   * 构建单个功能模块的图标+文字组件
   * @param title 模块标题
   * @param icon 图标资源
   */
  @Builder
  buildModuleItem(title: string, icon: Resource) {
    Column({ space: 5 }) {
      Image(icon)
        .width(50)
        .height(50)
        .borderRadius(8)
        .objectFit(ImageFit.Contain)
        .onClick(() => { // 图片点击事件
          // 根据标题判断跳转的目标页面
          switch (title) {
            case '活动报名':
              router.pushUrl({ url: 'pages/ActivitySignUp' }); // 跳转到活动报名页
              break;
            case '查寝':
              router.pushUrl({ url: 'pages/DormCheck' }); // 跳转到查寝页
              break;
            case '辅导员通知':
              router.pushUrl({ url: 'pages/AdvisiorNotice' }); // 跳转到通知页
              break;
            case '返校申请':
              router.pushUrl({ url: 'pages/ReturnApplication' }); // 跳转到返校申请页
              break;
            default:
              console.log(`未匹配到 ${title} 对应的页面`);
          }
        })
      Text(title)
        .fontSize(16)
        .fontColor(Color.White)
        .fontWeight(FontWeight.Medium)
    }
  }

  @Builder
  buildTextItem(icon: Resource, title: string) {
    Row() {
      // 搜索图标
      Image(icon).width(25).height(25)
      TextInput({ placeholder: title })
        .flexGrow(1) // 占满剩余空间，适应屏幕
        .padding({ left: 10 }) // 与图标保持间距
    }
    .backgroundColor(Color.White)
    .width('100%')
    .height("100%")
    .borderRadius(8)
  }

  /**
   * 构建招聘信息卡片
   * @param info 招聘信息
   */
  @Builder
  buildRecruitmentCard(info: RecruitmentInfo) {
    Column() {
      // 1. 时间文本（顶部）
      Text(info.time).fontColor(Color.Gray)
        .margin({ top: 10, left: 10 }) // 增加内边距，避免贴边
        .align(Alignment.TopStart)
      // 2. 图片（中间，设置固定高度或自适应高度）
      Image(info.image)
        .width('100%')
        .height(150) // 固定图片高度（推荐，避免占满容器）
        .objectFit(ImageFit.Cover) // 保持图片比例，裁剪多余部分
        .margin({ top: 10 }) // 与时间文本间距
      // 3. 标题文本（底部）
      Text(info.title).fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 10, bottom: 10, left: 10, right: 10 }) // 内边距
        .textAlign(TextAlign.Start) // 左对齐

    }.width('90%')
    .backgroundColor(Color.White)
    .width('100%')
    .margin({ bottom: 15 })
    .borderRadius(8)
    .shadow({ radius: 2, color: '#CCCCCC', offsetX: 1, offsetY: 1 })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/JobDetails',
        params: { jobId: info.id }
      });
    })
  }
  // 显示"该功能未开发"提示
  showUnsupported() {
    prompt.showToast({
      message: '该功能尚未开发'
    });
  }

}

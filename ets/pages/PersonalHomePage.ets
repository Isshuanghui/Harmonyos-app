import router from '@ohos.router'; // 引入路由模块

// 定义用户信息的接口
interface UserInfo {
  name: string;
  avatar: Resource;
  school: string;
  phone: string; // 基础信息 - 手机号
  major: string; // 基础信息 - 专业
  className: string; // 基础信息 - 班级
  studentId: string; // 更多信息 - 学号
  grade: string; // 更多信息 - 年级
  college: string; // 更多信息 - 院系
  email: string; // 更多信息 - 邮箱
  hometown: string; // 更多信息 - 家乡
  signature: string; // 个性签名
  fans: number; // 粉丝数
  visits: number; // 来访数
}

@Entry
@Component
struct PersonalHomePage {
  // 模拟用户数据
  @State userInfo: UserInfo = {
    name: '西部快哈手',
    avatar: $r('app.media.hajimi'), // 替换为实际头像资源
    school: '大连大学',
    phone: '17640409881',
    major: '软件工程',
    className: '软件232',
    studentId: '2023001001',
    grade: '2023级',
    college: '计算机科学与技术学院',
    email: '2023001001@dlu.edu.cn',
    hometown: '辽宁省大连市',
    signature: '青春无悔，奋斗不止',
    fans: 128,
    visits: 567
  };

  // 控制更多信息是否展开的状态
  @State isMoreInfoExpanded: boolean = false;

  build() {
    Column() {
      // 顶部导航栏：包含返回按钮和页面标题
      Row() {
        Button('返回')
          .onClick(() => {
            // 使用路由返回上一页
            router.back();
          })
          .width(80)
          .height(32)
          .backgroundColor('#F5F5F5')
          .fontColor('#333333')
          .borderRadius(4)
          .margin({ left: 16, top: 16 });

        Text('个人主页')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 16, left: 16 });
      }
      .width('100%')
      .height(60)
      .backgroundColor('#FFFFFF');

      // 个人信息区域
      Stack() {
        Column()
          .width('100%')
          .height(200)
          .backgroundColor('#3A7FF8');

        // 头像、名称、粉丝数、来访数
        Row() {
          Image(this.userInfo.avatar)
            .width(80)
            .height(80)
            .borderRadius(40)
            .margin({ left: 16, top: 120 });

          Column() {
            Text(this.userInfo.name)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .margin({ top: 125, left: 12 });
            Text(this.userInfo.signature)
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ top: 2, left: 12 });
          }
          .flexGrow(1);

          Column() {
            Text(this.userInfo.fans.toString())
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ top: 125 });
            Text('粉丝')
              .fontSize(12)
              .fontColor(Color.White)
              .margin({ top: 2 });
          }
          .margin({ right: 16 });

          Column() {
            Text(this.userInfo.visits.toString())
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ top: 125 });
            Text('来访')
              .fontSize(12)
              .fontColor(Color.White)
              .margin({ top: 2 });
          }
          .margin({ right: 16 });
        }
        .width('100%');
      }
      .width('100%')
      .height(250);

      // 基本信息区域
      Scroll() {
        Column() {
          // 基础信息标题
          Text('基础信息')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 16, left: 16 });

          // 基础信息内容
          this.buildInfoItem('手机号', this.userInfo.phone);
          this.buildInfoItem('专业', this.userInfo.major);
          this.buildInfoItem('班级', this.userInfo.className);

          // 更多信息控制按钮
          Button(this.isMoreInfoExpanded ? '收起更多' : '展开更多')
            .width(120)
            .height(36)
            .backgroundColor('#F5F5F5')
            .fontColor('#000000')
            .borderRadius(4)
            .margin({ top: 12, left: 16 })
            .onClick(() => {
              this.isMoreInfoExpanded = !this.isMoreInfoExpanded;
            });

          // 更多信息内容（默认隐藏）
          if (this.isMoreInfoExpanded) {
            Text('更多信息')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 16, left: 16 });

            this.buildInfoItem('姓名', this.userInfo.name);
            this.buildInfoItem('学号', this.userInfo.studentId);
            this.buildInfoItem('年级', this.userInfo.grade);
            this.buildInfoItem('院系', this.userInfo.college);
            this.buildInfoItem('邮箱', this.userInfo.email);
            this.buildInfoItem('家乡', this.userInfo.hometown);
          }
        }
        .width('100%');
      }
      .width('100%')
      .margin({ top: 12 });
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White);
  }

  // 构建信息项的通用方法
  @Builder
  buildInfoItem(label: string, value: string) {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      Text(label)
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 12, left: 16 });
      Text(value)
        .fontSize(14)
        .fontColor('#000000')
        .margin({ top: 12, right: 16 });
    }
    .width('100%');
  }
}
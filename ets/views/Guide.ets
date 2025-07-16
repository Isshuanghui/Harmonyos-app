import { Router } from '@ohos.arkui.UIContext'
const router = new Router();
@Entry
@Component
struct Guide{
  build() {
    Swiper(){
      Image($r('app.media.ru1'))
        .height('100%')
        .width('100%')
      Image($r('app.media.ru2'))
        .height('100%')
        .width('100%')
      Image($r('app.media.ru3'))
        .height('100%')
        .width('100%')
      Image($r('app.media.ru4'))
        .height('100%')
        .width('100%')
        .onClick(()=> {
          router.replaceUrl({ url: 'pages/Index' })
        })
    }
  }
}
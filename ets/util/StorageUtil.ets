import preferences from '@ohos.data.preferences'

class StorageUtil {
  //要保存的preferences的名字
  private static PREFERENCES_NAME = 'app_launch_status'
  //定义是第一次登录的key
  private static FIRST_LAUNCH_KEY = 'is_first_launch'

  //异步
  /**
   * async/await
   * @returns true 表示第一次登录
   */
  static async isFirstLaunch(): Promise<boolean> {
    try {
      //获取preferences实例，如果文件不存在，自动创建
      const preferencesInstance = await preferences
        .getPreferences(getContext(), StorageUtil.PREFERENCES_NAME);
      const isFirst = await preferencesInstance.get(StorageUtil.FIRST_LAUNCH_KEY, true) as boolean;
      return isFirst;
    } catch (err) {
      return true;
    }
  }

  /**
   * 将是否第一次登录设置为false
   * @returns
   */
  static async markAsLaunched(): Promise<void> {
    try {
      const preferencesInstance = await preferences
        .getPreferences(getContext(), StorageUtil.PREFERENCES_NAME);
      await preferencesInstance.put(StorageUtil.FIRST_LAUNCH_KEY, false)
      //持久化数据
      await preferencesInstance.flush()
    } catch (err) {
      console.log(err);
    }
  }
}
export default StorageUtil
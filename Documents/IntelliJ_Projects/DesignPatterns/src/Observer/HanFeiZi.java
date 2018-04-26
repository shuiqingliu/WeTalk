package Observer;

/**
 * @program: Leetcode
 * @description: 被观察者
 * @author: Wangky
 * @create: 2018-04-25 14:17
 **/
public class HanFeiZi implements IHanFeiZi{
    private boolean isHavingBreakfast = false;
    private boolean isHavingFun = false;

    public boolean isHavingBreakfast() {
        return isHavingBreakfast;
    }

    public void setHavingBreakfast(boolean havingBreakfast) {
        isHavingBreakfast = havingBreakfast;
    }

    public boolean isHavingFun() {
        return isHavingFun;
    }

    public void setHavingFun(boolean havingFun) {
        isHavingFun = havingFun;
    }

    @Override
    public void haveBreakfask() {
        System.out.println("韩非子：开始吃饭了");
        this.isHavingBreakfast = true;
    }

    @Override
    public void haveFun() {
        System.out.println("韩非子：开始娱乐了");
        this.isHavingFun = true;
    }
}

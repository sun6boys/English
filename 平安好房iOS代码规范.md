# 平安好房iOS代码规范

- 使用驼峰命名

- 不允许直接声明和使用实例变量，应当使用属性变量

```
错误：

@interface object{
    NSString *_name;
}
@end

正确：

@interface object

@property (nonatomic, strong) NSString *name;

@end

```

## 1.1 UIViewController

### 1.1.1 统一代码布局

严格按照以下顺序组织viewController中的代码：

- #pragma mark - life cycle
- #pragma mark - public methods
- #pragma mark - [系统控件的Protocol]
- #pragma mark - [自定义控件的Protocol]
- #pragma mark - event response
- #pragma mark - private methods
- #pragma mark - getters and setters

其中，`[系统控件的Delegate]` 和 `[自定义控件的Delegate]` 需要替换成对应的真实Delegate名字。这样在Xcode中按住command键点击对应的pragma，就能跳转到Delegate的定义处。

### 1.1.2 管理好头文件引用

1. 通过换行来将引用的头文件归类(比如UI相关的、功能相关的、第三方)
2. 禁止引用不使用的头文件
3. 第三方Pod的头文件引用全部用`<>`

```
#import <AFNetworking/AFNetworking.h>
```

## 1.2 命名规范
### 1.2.1 变量名、函数名
#### 1.2.1.1 变量名

- 使用驼峰命名法
- 不用知道上下文，光看变量名就能知道这个变量是干什么的
- 不用知道上下文，光看变量名就能知道这个变量是什么类型
    - UIView系列的全部以View结尾
    - UIButton系列的全部以Button结尾
    - UIGestureRecognizer系列的全部以Recognizer结尾
    - UIViewController系列的全部以ViewController结尾
    - 以此类推

#### 1.2.1.2 函数名

- 不用知道上下文，光看函数名就能知道这个函数是干什么的
- 不用知道上下文，光看函数名就能知道这个函数会在什么时候被调用
- -/+ [空格] [返回类型] [函数名]

```
错误：
-(void)functionName;
-(void) functionName;
- (void) functionName;

正确：
- (void)functionName;
```

### 1.2.2 Notification名

- k + 发送者名 + 事件名 + Notification

```
k UIApplication WillTerminate Notification
k BLLoginManager DidLoggedIn Notification
```

### 1.2.3 Delegate函数名

delegate方法四要素：

1. 返回类型
2. 自己
3. 事件
4. 反馈参数

```
- (void)manager:(XXManager *)manager didFailedWithErrorCode:(NSString)errorCode errorMessage:(NSString *)errorMessage;

- (void)managerTaskDidFinished:(XXManager *)manager;
```

delegate方法第一个参数永远都应该是自己。

### 1.2.4 enum/option名

`enum/option类型名：`

类名 + XXX Type/Style

```
PAAPIErrorType
```

`enum/option 值名：`

enum/option类型名 + 具体的内容

```
PAAPIErrorTypeNoContent
PAAPIErrorTypeParamsError
PAAPIErrorTypeTimeout
```

### 1.2.5 事件响应函数名
#### 1.2.5.1 Notification响应函数名

统一使用`didReceive`开头，后面跟Notification的名字。

```
- (void)didReceive[Notification名]:(NSNotification *)notification;
```

#### 1.2.5.2 UIButton响应函数名

统一使用`didTapped`开头，后面跟Button的名字。

```
- (void)didTapped[Button名]:(UIButton *)button;
```

#### 1.2.5.3 UIGestureRecognizer响应函数名

统一使用`didRecognized`开头，后面跟recognizer的名字。recognizer的名字需要体现出具体的手势，例如滑动手势就应该命名为`[页面名]SwipeGestureRecognizer`

```
- (void)didRecognized[GestureRecognizer名]:(UIGestureRecognizer *)recognizer;
```
## 1.3 文件目录结构规范

文件目录结构样例：

![](images/XCodeGroupScreenshot.jpg)

### 1.3.1 每一个Group都有对应的文件夹

Group需要和文件路径上一致，这样子便于代码文件的迁移。同时，在项目工程中也比较容易定位。

### 1.3.2 目录层级关系可以表达调用关系或依赖关系

这么做便于了解某一个对象或者模块，都需要哪些辅助文件。也便于后续做代码复用和拆分。

### 1.3.3 单个文件夹下最多只能有一个对象的源文件

这一个对象必定是这个目录下的主要对象，这样才能使得文件结构主次分明。

## 1.4 符号使用规范
### 1.4.1 运算符号两边都要有空格

```
错误：
a+b
a?b:c

正确：
a + b
a ? b : c

```

### 1.4.2 使用()来表达优先级

```
错误：
a || !b && c

正确：
( a || b ) && ( c || d )
```

### 1.4.3 {}的使用规范

函数中`{}`换行

```
错误：
- (void)foo {
    ...
}

正确：
- (void)foo
{
    ...
}
```

if-else中`{}`不换行，else中的`{}`不换行：

```
错误：
if (foo)
{
    ...
}
else
{
    ...
}

if (foo) {
    ...
}else{
    ...
}

正确：
if (foo) {
    ...
} else {
    ...
}
```




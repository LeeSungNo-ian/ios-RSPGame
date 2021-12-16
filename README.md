# ios-RSP-Game

### 가위바위보 를 진행하는 앱 입니다 !

![ios-RSP-Game](https://user-images.githubusercontent.com/78950704/146194759-419f2c14-f950-48e0-8dfa-f2b770796d1f.png)

**GIF**

![Simulator Screen Recording - iPhone 11 - 2021-12-15 at 01 29 25](https://user-images.githubusercontent.com/78950704/146039193-937ee4c8-61c9-46d6-8cfe-ed68a09c3066.gif)

## Pull Request

* 코드 리뷰어: [helloworldjay](https://github.com/helloworldjay)
* 첫번째 PR: [여기를 클릭하세요!](https://github.com/LeeSungNo-ian/ios-RSPGame/pull/1)
* 두번째 PR: [여기를 클릭하세요!](https://github.com/LeeSungNo-ian/ios-RSPGame/pull/2)


## 앱 상세
설명: 컴퓨터와 가위바위보 게임을 진행합니다! `가위`, `바위`, `보` 버튼을 누른 후 `SELECT` 버튼을 탭하여 승부를 겨룹니다. 위에 있는 라벨로 승부의 결과를 알려줍니다!
  
<img src="https://user-images.githubusercontent.com/78950704/146044151-dc9e5474-14c9-42fb-bd4c-6b6a57f327d1.jpg" width="30%" height="30%">

1. 승부의 결과가 나오는 레이블 입니다.
2. 컴퓨터의 선택과 나의 선택을 알려주는 항목입니다.
3. 컴퓨터와 내가 고른 픽을 `UIImageView`로 보여줍니다.
4. 컴퓨터와 내가 고른 픽을 `UILabel`로 보여줍니다.
5. 사용자가 가위, 바위, 보 중에 한 개를 고릅니다.
6. `SELECT` 버튼을 눌러 컴퓨터와 승부를 봅니다.
7. `RESET` 버튼을 눌러 초기값으로 돌립니다.


## 앱 세부사항 
1. `enum` 과 `enum rawValue` 를 사용해, 컴퓨터가 랜덤값을 쉽게 정할 수 있게 했습니다.
2. `private` 를 사용해 접근 제한자를 사용했습니다.
3. `옵셔널 바인딩` 을 사용했습니다. 
 

## 트러블 슈팅
![Simulator Screen Recording - iPhone 11 - 2021-12-10 at 02 06 26](https://user-images.githubusercontent.com/78950704/146336384-47fb662c-4e54-45e1-9824-14393ff5bc65.gif)

시물레이션을 실행시킬 때 `mySelectHandShape` 와 `comSelectHandShape` 가 같은 결과값을 가질 때, 사용자의 선택의 사진과 라벨이 대기 상태로 변하는 버그가 생겼습니다.
위와 같은 트러블을 해결하기 위해 코드를 살펴봤습니다.

```swift
private func setImageTitle(pick: HandShape) {
    var resourceName: String {
        switch pick {
        case .rock:
            return "rock"
        case .scissors:
            return "scissors"
        case .paper:
            return "paper"
        }
    }
        
    var handShapeName: String {
        switch pick {
        case .rock:
            return "묵 !"
        case .scissors:
            return "가위 !"
        case .paper:
            return "보"
        }
    }
        
    if pick == comSelectHandShape {
        (comChoiceImage.image, comChoiceLabel.text) = (#imageLiteral(resourceName: resourceName), handShapeName)
    } else {
        (myChoiceImage.image, myChoiceLabel.text) = (#imageLiteral(resourceName: resourceName), handShapeName)
    }
}
```

매개변수 `pick` 에 `mySelectHandShape` 가 들어갈 때와 `comSelectHandShape` 가 들어갈 때의 경우를 `if` 구문으로 구현했습니다.

여기서 간과한 부분은 `pick` 에 `mySelectHandShape` 과 `comSelectHandShape` 의 `String` 값이 들어가 구별하는게 아니고, 실제 값을 비교하는 것이였습니다.

예시로 코드로
```swift
let a: Int = 10
let b: Int = 10

if a == b {
    print("a와 b는 같습니다.")
} else {
    print("a와 b는 다릅니다.")
}
```
를 작성해 봤더니, 이해가 확 와닿았습니다.

그래서
```swift
private func resourceHandShapeName(of pick: HandShape) -> (String, String){
    ...
    return (resourceName, handShapeName)
}
```

함수 `resourceHandShapeName` 를 만든 후

```swift
private func setImageTitle(comPick: HandShape, myPick: HandShape) {
    let comResourceName: String
    let myResourceName: String
    let comHandShapeName: String
    let myHandShapeName: String
        
    (comResourceName, comHandShapeName) = self.resourceHandShapeName(of: comPick)
    (myResourceName, myHandShapeName) = self.resourceHandShapeName(of: myPick)
      
    (comChoiceImage.image, comChoiceLabel.text) = (#imageLiteral(resourceName: comResourceName), comHandShapeName)
    (myChoiceImage.image, myChoiceLabel.text) = (#imageLiteral(resourceName: myResourceName), myHandShapeName)
}
```

로 Refactor 하여 트러블 슈팅했습니다 !


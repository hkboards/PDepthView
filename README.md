# PDepthView
Turn any UIView into 2D+Depth mode


![image](https://media.giphy.com/media/LOj219NurGOa3yRwrk/giphy.gif)





Installation (Support Cocoapod soon)
- Manually
  Drag DepthModeView.swift and Cache.swift to your project





Implementation - Three steps only!

1. Change your view to DepthModeView
```
override func viewDidLoad() {
        super.viewDidLoad()
        view = DepthModeView.init(frame:view.frame)
}
```

2. Set which subview to be seen in Depth mode when you put it on DepthModeView
```
func xxx() {
    let view1 = UIView.init(frame: .init(x: 0, y: 100, width: 100, height: 100))
    view1.center = view.center
    view1.backgroundColor = .yellow
    view1.isDepthShown = true //<========
    view.addSubview(view1)
}
```
It also works if the view is embedded in other subview
```
func xxx() {
    let view2 = UIView.init(frame: .init(x: 0, y: 200, width: 100, height: 100))
    view2.backgroundColor = .blue
    let view3 = UIView.init(frame: .init(x: 0, y: 0, width: 50, height: 50))
    view3.isDepthShown = true // <========
    view3.backgroundColor = .green
    view2.addSubview(view3)
    view.addSubview(view2)
}
```

3. Switch on/off the Depth mode of the view. Cheers!

```
(view as! DepthModeView).threeDimensionMode.toggle()
```




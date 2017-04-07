# About

This lib is an easy to use camera screen, with Stories implementation. 

# Installation

The most convenient way to use it - include via cocoapods. 

```ruby
use_frameworks!
pod "CameraSDK", "~> 0.0.2"
```

Run pod install - that's it. You all set up

# Usage

Complete workflow is very simple and consists of two steps:


## 1 - Present a StoryBuilderViewController instance
Lib uses storyboard, so you can use method from extension to get it:

```swift
let storyBuilder = StoryBuilderViewController.storyboardController()
```

Then present it whereever you want:

```swift
myContainerViewController.present(storyBuilder, animated: true)
```

## 2 - Took the result photo

All the magic happens inside, so you don't have to mess with any processing at all. Just set the delegate property of StoryBuilderViewController and receive an image. For example, you can give a choise to user what to do next:

```swift
storyBuilder.delegate = self


# MARK: StoryBuilderViewControllerDelegate

func shareImage(_ image: UIImage) {
    storyBuilder.present(UIActivityViewController(activityItems: [image], applicationActivities: nil), animated: true)
}
```
## License
## License

Stickerpipe is available under the Apache 2 license. See the [LICENSE](LICENSE) file for more information.
Stickerpipe is available under the Apache 2 license. See the [LICENSE](LICENSE) file for more information.

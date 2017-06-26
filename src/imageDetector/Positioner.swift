//
//  Positioner.swift
//  Stories
//
//  Created by vlad on 10/20/16.
//  Copyright © 2016 908. All rights reserved.
//

import UIKit

class Positioner: NSObject {
//    static func automaticallyPosition(_ stampView: StampView, for storyStamp: StoryStamp, with face: Face, in view: UIView) {
//        guard let rightEyeCenter = face.rightEye.center, let leftEyeCenter = face.leftEye.center else {
//            printErr("eyes not detected")
//
//            return
//        }
//        var eyesLine = Line(start: rightEyeCenter, end: leftEyeCenter)
//
//        var offset1 = storyStamp.offset1, offset2 = storyStamp.offset2
//
//        if let stampType = storyStamp.storyStampType {
//            switch stampType {
//            case .eyes:
//                if offset1 != nil || offset2 != nil {
//
//                }
//
//                offset1 = CGPoint(x: 40, y: 80)
//                offset2 = CGPoint(x: 120, y: 80)
//            case .frame:
//                if let position = storyStamp.storyStampPosition {
//                    stampView.width = view.width
//                    stampView.height = view.width
//
//                    guard let vPos = position.vPos else { break }
//
//                    switch vPos {
//                    case .top:
//                        stampView.top = 0
//                    case .middle:
//                        stampView.centerY = view.height / 2
//                    case .bottom:
//                        stampView.bottom = view.height
//                    }
//                }
//            case .mouth:
//                if let mouthCenter = face.mouth?.center {
//                    let eyeCenter = eyesLine.center
//                    let lengthEyesMouth = Line(start: eyeCenter, end: mouthCenter).length
//
//                    if lengthEyesMouth != 0 {
//                        eyesLine.offsetCoordinates(for: lengthEyesMouth)
//                    }
//
//                    if offset1 != nil || offset2 != nil {
//
//                    }
//
//                    offset1 = CGPoint(x: 0, y: 80)
//                    offset2 = CGPoint(x: 160, y: 80)
//
//
//                    let rotationAngle = CGFloat(storyStamp.rotation)
//                    stampView.transform = stampView.transform.rotated(by: -((rotationAngle * CGFloat.pi) / 180.0))
//                    stampView.transform = stampView.transform.scaledBy(x: CGFloat(storyStamp.scale), y: CGFloat(storyStamp.scale))
//                }
//            case .static:
//                if let position = storyStamp.storyStampPosition {
//                    var startPosition = CGPoint.zero
//
//                    if position.hPos == .middle {
//                        startPosition.x = view.width / 2
//                    } else if position.hPos == .right {
//                        startPosition.x = view.width
//                    }
//
//                    if position.vPos == .middle {
//                        startPosition.y = view.height / 2
//                    } else if position.vPos == .bottom {
//                        startPosition.y = view.height
//                    }
//
//                    let scale = CGFloat(storyStamp.scale)
//
//                    guard let offset1 = offset1 else { break }
//
//                    startPosition -= (offset1 * scale)
//
//                    stampView.center = startPosition + (stampView.height / 2 * scale)
//
////                    stampView.transform = stampView.transform.scaledBy(x: scale, y: scale)
//
//                    stampView.setAnchorPoint(offset1 / 160)
//
//                    let rotationAngle = CGFloat(storyStamp.rotation)
//                    stampView.transform = stampView.transform.rotated(by: -((rotationAngle * CGFloat.pi) / 180.0))
//
//                    stampView.setAnchorPoint(CGPoint(x: 0.5, y: 0.5))
//                }
//            }
//        }
//
//        if let offset1 = offset1, let offset2 = offset2 {
//            let stampSize = stampView.width
//
//            guard stampSize > 0 else {
//                printErr("stampView width is 0; unexpected")
//
//                return
//            }
//
//            let stampLine = Line(start: offset1, end: offset2)
//
//            let scale = stampLine.scaleFrom(line: eyesLine)
//            let rotationAngle = stampLine.angleTo(line: eyesLine)
//
//            let stampCenter = stampLine.center
//            let offset = CGPoint(x: stampSize / 2 - stampCenter.x, y: stampSize / 2 - stampCenter.y)
//
//            stampView.center = eyesLine.center + offset * scale
//
//            stampView.transform = stampView.transform.scaledBy(x: scale, y: scale)
//
//            stampView.setAnchorPoint(stampCenter / stampSize)
//            stampView.transform = stampView.transform.rotated(by: rotationAngle)
//
//            stampView.setAnchorPoint(CGPoint(x: 0.5, y: 0.5))
//
//            // offset
//            stampView.center += CGPoint(x: CGFloat(storyStamp.offsetX), y: CGFloat(storyStamp.offsetY))
//        }
//    }

    static func automaticallyPosition(_ stampView: StampView, for storyStamp: StoryStamp, with face: Face, in view: UIView) {
        guard let rightEyeCenter = face.rightEye.center, let leftEyeCenter = face.leftEye.center else {
            printErr("eyes not detected")

            return
        }

        var offset1 = storyStamp.offset1, offset2 = storyStamp.offset2
        var stampLine = Line(start: CGPoint(), end: CGPoint())
        var eyesLine = Line(start: rightEyeCenter, end: leftEyeCenter)

        if let stampType = storyStamp.storyStampType {
            switch stampType {
            case .eyes:
                stampLine = Line(start: CGPoint(x: 40, y: 80), end: CGPoint(x: 120, y: 80))
            case .mouth:()
//                if let mouthCenter = face.mouth?.center {
//                    stampLine = Line(start: CGPoint(x: 0, y: 80), end: CGPoint(x: 160, y: 80))
//
//                    let lengthEyesMouth = Line(start: eyesLine.center, end: mouthCenter).length
//
//                    if lengthEyesMouth != 0 {
//                        eyesLine.offsetCoordinates(for: lengthEyesMouth)
//                    }
//                }
            case .frame:
                if let position = storyStamp.storyStampPosition {
                    stampView.width = view.width
                    stampView.height = view.width

                    guard let vPos = position.vPos else { break }

                    switch vPos {
                    case .top:
                        stampView.top = 0
                    case .middle:
                        stampView.centerY = view.height / 2
                    case .bottom:
                        stampView.bottom = view.height
                    }
                }
            return
            case .static:

                // incorrect value from server
            return
            }
        }

        let stampSize = stampView.width

        let stampCenter = stampLine.center

        let scale = stampLine.scaleFrom(line: eyesLine)
        let rotationAngle = stampLine.angleTo(line: eyesLine)

        let wholeOffset = CGPoint(x: stampSize / 2 - stampCenter.x, y: stampSize / 2 - stampCenter.y)

        stampView.center = eyesLine.center - wholeOffset

        stampView.transform = stampView.transform.scaledBy(x: scale, y: scale)
        stampView.transform = stampView.transform.rotated(by: rotationAngle)

        stampView.transform = stampView.transform.scaledBy(x: CGFloat(storyStamp.scale), y: CGFloat(storyStamp.scale))
        stampView.transform = stampView.transform.rotated(by: -CGFloat((CGFloat(storyStamp.rotation) * CGFloat.pi) / 180.0))


        var offset = CGPoint(x: CGFloat(storyStamp.offsetX), y: CGFloat(storyStamp.offsetY))
        offset = offset * scale

        offset.rotate(byAngle: -rotationAngle)

        stampView.center = stampView.center + offset
    }
}


fileprivate extension CGPoint {
    mutating func rotate(byAngle angle: CGFloat) {
        let rotatedDeltaY = y * cos(angle) - x * sin(angle)
        let rotatedDeltaX = y * sin(angle) + x * cos(angle)

        self = CGPoint(x: rotatedDeltaX, y: rotatedDeltaY)
    }
}


fileprivate extension StoryStamp {

    fileprivate enum StoryStampType: String {
        case eyes = "eyes"
        case `static` = "static"
        case mouth = "mouth"
        case frame = "frame"
    }

    var storyStampType: StoryStampType? {
        return StoryStampType(rawValue: type ?? "")
    }
}


extension StoryStamp {

    fileprivate struct StoryStampPosition {
        let vPos: VPos?
        let hPos: HPos?

        enum VPos: String {
            case top = "t"
            case middle = "m"
            case bottom = "b"
        }

        enum HPos: String {
            case left = "l"
            case middle = "c"
            case right = "r"
        }

        init?(string: String?) {
            guard let string = string, !string.isEmpty else {
                return nil
            }

            var rawPositionString = string

            vPos = VPos(rawValue: String(rawPositionString.remove(at: rawPositionString.startIndex)))

            if !rawPositionString.isEmpty {
                hPos = HPos(rawValue: String(rawPositionString.remove(at: rawPositionString.startIndex)))
            } else {
                hPos = nil
            }
        }
    }

    fileprivate var storyStampPosition: StoryStampPosition? {
        return StoryStampPosition(string: position)
    }
}


fileprivate extension StoryStamp {
    fileprivate var offset1: CGPoint? {
        return pointForIdx(0)
    }
    fileprivate var offset2: CGPoint? {
        return pointForIdx(1)
    }
    fileprivate var offset3: CGPoint? {
        return pointForIdx(2)
    }

    private func pointForIdx(_ idx: Int) -> CGPoint? {
        guard let points = pointsContainer?.points else {
            return nil
        }

        if points.count > idx {
            return points[idx]
        } else {
            return nil
        }
    }
}

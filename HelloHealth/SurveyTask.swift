//
//  SurveyTask.swift
//  HelloHealth
//
//  Created by TsengKuo-Wei on 10/26/15.
//  Copyright © 2015 Kuowei Tseng. All rights reserved.
//

import Foundation
import ResearchKit

class SurveyTask{
    /*case Form
    case Survey
    
    case BooleanQuestion
    case DateQuestion
    case DateTimeQuestion
    case EligibilityQuestion
    case ImageChoiceQuestion
    case NumericQuestion
    case ScaleQuestion
    case TextQuestion
    case TextChoiceQuestion
    case TimeIntervalQuestion
    case TimeOfDayQuestion
    case ValuePickerChoiceQuestion
    case ValidatedTextQuestion
    case ImageCapture
    case Wait
    
    case EligibilityTask
    case Consent
    case Passcode
    
    case Audio
    case Fitness
    case HolePegTest
    case PSAT
    case ReactionTime
    case ShortWalk
    case SpatialSpanMemory
    case TimedWalk
    case ToneAudiometry
    case TowerOfHanoi
    case TwoFingerTappingInterval*/
    /*var representedTask: ORKTask {
        switch self {
        case .Form:
            return ORKTask.formtask
            
        case .Survey:
            return surveyTask
            
        case .BooleanQuestion:
            return booleanQuestionTask
            
        case .DateQuestion:
            return dateQuestionTask
            
        case .DateTimeQuestion:
            return dateTimeQuestionTask
            
        case .EligibilityQuestion:
            return eligibilityQuestionTask
            
        case .ImageChoiceQuestion:
            return imageChoiceQuestionTask
            
        case .NumericQuestion:
            return numericQuestionTask
            
        case .ScaleQuestion:
            return scaleQuestionTask
            
        case .TextQuestion:
            return textQuestionTask
            
        case .TextChoiceQuestion:
            return textChoiceQuestionTask
            
        case .TimeIntervalQuestion:
            return timeIntervalQuestionTask
            
        case .TimeOfDayQuestion:
            return timeOfDayQuestionTask
            
        case .ValuePickerChoiceQuestion:
            return valuePickerChoiceQuestionTask
            
        case .ValidatedTextQuestion:
            return validatedTextQuestionTask
            
        case .ImageCapture:
            return imageCaptureTask
            
        case .Wait:
            return waitTask
            
        case .EligibilityTask:
            return eligibilityTask
            
        case .Consent:
            return consentTask
            
        case .Passcode:
            return passcodeTask
            
        case .Audio:
            return audioTask
            
        case .Fitness:
            return fitnessTask
            
        case .HolePegTest:
            return holePegTestTask
            
        case .PSAT:
            return PSATTask
            
        case .ReactionTime:
            return reactionTimeTask
            
        case .ShortWalk:
            return shortWalkTask
            
        case .SpatialSpanMemory:
            return spatialSpanMemoryTask
            
        case .TimedWalk:
            return timedWalkTask
            
        case .ToneAudiometry:
            return toneAudiometryTask
            
        case .TowerOfHanoi:
            return towerOfHanoiTask
            
        case .TwoFingerTappingInterval:
            return twoFingerTappingIntervalTask
        }
    }*/
    static var sections :[String]{
        return["form", "survey"
        ]
    }
    func createTask(taskType:String, taskStep : NSArray, taskContent: NSDictionary) -> ORKTask{
        
        return surveyTask(taskStep, taskContent: taskContent)
    }
    func surveyTask(taskStep : NSArray, taskContent: NSDictionary) -> ORKTask{
        // Create the intro step.
        let allSteps: NSMutableArray = NSMutableArray.init(capacity: taskStep.count);
        for var i = 0; i < taskStep.count; ++i{
            var step: ORKStep?
            switch taskStep.objectAtIndex(i) as! String{
                case "intro":
                    step = ORKInstructionStep(identifier: "introStep")
                    step?.title = NSLocalizedString(taskContent.objectForKey("title")?.objectAtIndex(i) as! String, comment: "")
                    step?.text = NSLocalizedString(taskContent.objectForKey("text")?.objectAtIndex(i) as! String, comment: "")
            
                case "question":
                    let questionFormat = ORKBooleanAnswerFormat()
                    
                    let questionTitle = NSLocalizedString(taskContent.objectForKey("title")?.objectAtIndex(i) as! String, comment: "")
                    step = ORKQuestionStep(identifier: "questionStep", title: questionTitle, answer: questionFormat)
                case "summary":
                    step = ORKInstructionStep(identifier: "summaryStep")
                    step!.title = NSLocalizedString(taskContent.objectForKey("title")?.objectAtIndex(i) as! String, comment: "")
                    step!.text = NSLocalizedString(taskContent.objectForKey("text")?.objectAtIndex(i) as! String, comment: "")
                default:
                    step = ORKInstructionStep(identifier: "intro")
                    step?.title = NSLocalizedString(taskContent.objectForKey("title")?.objectAtIndex(i) as! String, comment: "")
                    step?.text = NSLocalizedString(taskContent.objectForKey("text")?.objectAtIndex(i) as! String, comment: "")
            }
            allSteps.addObject(step!)
        }
        // Add a summary step.
        
        
        return ORKOrderedTask(identifier: "surveyTask", steps: allSteps as NSArray as? [ORKStep])
    }

}
//
//  CircularProgressView.swift
//  TruckX iOS Application
//
//  Created by Owais on 20/08/24.
//

import UIKit

class CircularProgressView: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var gradientLayer = CAGradientLayer()
    private var progressLabel = UILabel()
    private var timer: Timer?
    private var totalTime: Float = 60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
        setupGradientLayer()
        setupProgressLayerMask()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
        setupGradientLayer()
        setupProgressLayerMask()
        setupLabel()
    }
    
    private func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 10)/2, startAngle: -.pi / 2, endAngle: .pi * 3 / 2, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = #colorLiteral(red: 0.9137254902, green: 1, blue: 0.9529411765, alpha: 1)
        circleLayer.lineWidth = 10.0
        circleLayer.strokeEnd = 1.0
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.white.cgColor
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0.0
    }
    
    private func setupGradientLayer() {
        gradientLayer.colors = [
            // rgba(255, 255, 255, 1)
            UIColor(red: 55/255.0, green: 146/255.0, blue: 118/255.0, alpha: 1).cgColor,
            UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1).cgColor
            // rgba(55, 146, 118, 1)
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.8)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.cornerRadius = 12
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    private func setupProgressLayerMask() {
        gradientLayer.mask = progressLayer
    }
    
    private func setupLabel() {
        // Center label
        progressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        progressLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        progressLabel.textAlignment = .center
        progressLabel.textColor = .black
        progressLabel.font = UIFont.systemFont(ofSize: 27, weight: .semibold)
        addSubview(progressLabel)
    }
    
    func startTimer() {
        timer?.invalidate()
        var currentTime: Float = totalTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            currentTime -= 1
            let progress = currentTime / self.totalTime
            self.updateProgress(progress: progress, time: currentTime)
            
            if currentTime <= 0 {
                self.timer?.invalidate()
            }
        }
    }
    
    private func updateProgress(progress: Float, time: Float) {
        progressLayer.strokeEnd = CGFloat(progress)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = progress
        animation.duration = 1.0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "animateprogress")
        
        let formattedTime = getCurrentTime()
        progressLabel.text = formattedTime
    }
    
    func setTotalTime(_ time: Float) {
        //        totalTime = time
        self.totalTime = .random(in: 0...500)
    }
    
    private func getCurrentTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter.string(from: date)
    }
    
    deinit {
        timer?.invalidate()
    }
}

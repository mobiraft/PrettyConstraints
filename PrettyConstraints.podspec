#
#  Be sure to run `pod spec lint PrettyConstraints.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "PrettyConstraints"
  spec.version      = "0.0.2"
  spec.summary      = "PrettyConstraints helps you create your views programmatically."
  spec.description  = <<-DESC
  PrettyConstraints helps you create your views faster programmatically using AutoLayout constraints.
                   DESC

  spec.homepage     = "https://github.com/mobiraft/PrettyConstraints.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "hardik parmar" => "hardik16432@gmail.com" }
  spec.social_media_url   = "https://twitter.com/hardik_parmar_"

  spec.ios.deployment_target = "11"
  spec.swift_version = "5"

  spec.source       = { :git => "https://github.com/mobiraft/PrettyConstraints.git", :tag => "#{spec.version}" }

  spec.source_files  = "Classes", "Sources/PrettyConstraints/Classes/**/*.{h,m,swift}"
  
end

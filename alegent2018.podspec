Pod::Spec.new do |s|
  s.name = 'alegent2018'
  s.version = '0.1.0'
  s.summary = 'A CoreData training for d08, swift pool for school 42.'

  s.description      = <<-DESC
A CoreData training for d08, swift pool for school 42.
Don't use that pod in production.
Used to save and managed some posts using CoreData.
                       DESC

  s.homepage = 'https://github.com/amoriarty/CoreData'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'amoriarty' => 'alegent@student.42.fr' }
  s.source = { :git => 'https://github.com/amoriarty/CoreData.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.2'

  s.source_files = 'alegent2018/Classes/**/*'
#  s.resource_bundles = {
#    'alegent2018' => ['alegent2018/Assets/*.{png,xcdatamodeld}']
#  }

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.frameworks = 'CoreData'
end

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
    use_frameworks!
    
    # Pods for BoomerangDemo
    pod "Gloss"
    pod "Moya/ReactiveCocoa", '8.0.0-beta.4'
    
    pod 'ReactiveCocoa', :git => "https://github.com/ReactiveCocoa/ReactiveCocoa"
    pod "SDWebImage"
    pod 'Boomerang', :path => "../Boomerang/Boomerang.podspec"
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'BoomerangTV' do
    shared_pods
end

target 'BoomerangDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  shared_pods
target 'BoomerangDemoTests' do
    inherit! :search_paths
    testing_pods
  end



end

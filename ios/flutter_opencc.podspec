#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_opencc'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = ['Classes/**/*' ,"OpenCC/src/opencc.h",
	"OpenCC/src/Exception.hpp",
	"OpenCC/src/Export.hpp",
	"OpenCC/src/Lexicon.hpp",
	"OpenCC/src/Opencc_Export.hpp",
	"OpenCC/src/Optional.hpp",
	"OpenCC/src/Common.hpp",
	"OpenCC/src/Segments.hpp",
	"OpenCC/src/SerializableDict.hpp",
	"OpenCC/src/ConversionChain.{hpp,cpp}",
	"OpenCC/src/Conversion.{hpp,cpp}",
	"OpenCC/src/Config.{hpp,cpp}",
	"OpenCC/src/Converter.{hpp,cpp}",
	"OpenCC/src/BinaryDict.{hpp,cpp}",
	"OpenCC/src/DartsDict.{hpp,cpp}",
	"OpenCC/src/Dict.{hpp,cpp}",
	"OpenCC/src/DictEntry.{hpp,cpp}",
	"OpenCC/src/MaxMatchSegmentation.{hpp,cpp}",
	"OpenCC/src/DictGroup.{hpp,cpp}",
	"OpenCC/src/PhraseExtract.{hpp,cpp}",
	"OpenCC/src/Segmentation.{hpp,cpp}",
	"OpenCC/src/SimpleConverter.{hpp,cpp}",
	"OpenCC/src/TextDict.{hpp,cpp}",
	"OpenCC/src/UTF8StringSlice.{hpp,cpp}",
	"OpenCC/src/UTF8Util.{hpp,cpp}",
	"OpenCC/deps/darts-clone/darts.h",
	"OpenCC/deps/rapidjson-0.11/document.h",
	"OpenCC/deps/rapidjson-0.11/prettywriter.h",
	"OpenCC/deps/rapidjson-0.11/rapidjson.h",
	"OpenCC/deps/rapidjson-0.11/reader.h",
	"OpenCC/deps/rapidjson-0.11/stringbuffer.h",
	"OpenCC/deps/rapidjson-0.11/writer.h",
	"OpenCC/deps/rapidjson-0.11/pow10.h",
	"OpenCC/deps/rapidjson-0.11/stack.h",
	"OpenCC/deps/rapidjson-0.11/strfunc.h",
	"OpenCC/iOS/OpenCCService.{h,mm}"]
  s.public_header_files = 'Classes/**/*.h','OpenCC/iOS/OpenCCService.h'
  s.dependency 'Flutter'
  s.xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
  }
  s.xcconfig = {
    "CLANG_CXX_LIBRARY"=> "libc++"
  }
  s.resources = [
	"OpenCC/data/dictionary/*.txt",
	"OpenCC/iOS/config/*.json"
]
s.libraries = [
  "c++"
]

  s.ios.deployment_target = '8.0'
end


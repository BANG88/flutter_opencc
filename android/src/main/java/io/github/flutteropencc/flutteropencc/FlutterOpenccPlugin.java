package io.github.flutteropencc.flutteropencc;

import android.app.Activity;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import com.zqc.opencc.android.lib.ChineseConverter;
import com.zqc.opencc.android.lib.ConversionType;

/**
 * FlutterOpenccPlugin
 */
public class FlutterOpenccPlugin implements MethodCallHandler {
    private final Activity activity;

    private FlutterOpenccPlugin(Activity activity) {
        this.activity = activity;
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_opencc");
        channel.setMethodCallHandler(new FlutterOpenccPlugin(registrar.activity()));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("convert")) {
            ConversionType conversionType = ConversionType.S2T;
            String originalText = call.argument("text");
            String config = call.argument("config");
            switch (config) {
                case "t2s":
                    conversionType = ConversionType.T2S;
                    break;
                case "s2tw":
                    conversionType = ConversionType.S2TW;
                case "tw2s":
                    conversionType = ConversionType.TW2S;
                    break;
                case "s2hk":
                    conversionType = ConversionType.S2HK;
                    break;
                case "s2twp":
                    conversionType = ConversionType.S2TWP;
                    break;
                case "tw2sp":
                    conversionType = ConversionType.TW2SP;
                    break;
                case "t2hk":
                    conversionType = ConversionType.T2HK;
                    break;
                case "t2tw":
                    conversionType = ConversionType.T2TW;
                    break;
                default:
                    break;
            }
            String res = ChineseConverter.convert(originalText, conversionType, activity.getApplicationContext());
            result.success(res);
        } else {
            result.notImplemented();
        }
    }
}

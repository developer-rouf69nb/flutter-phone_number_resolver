package com.codepoka.phone_number_resolver

import android.Manifest
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.content.Context.TELEPHONY_SERVICE
import android.content.pm.PackageManager.PERMISSION_GRANTED
import android.os.Build
import android.support.v4.app.ActivityCompat
import android.support.v4.content.ContextCompat
import android.telephony.TelephonyManager
import android.util.Log


class PhoneNumberResolverPlugin(var registrar: Registrar) : MethodCallHandler {
    private var isListenerAdded = false

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "phone_number_resolver")
      channel.setMethodCallHandler(PhoneNumberResolverPlugin(registrar))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
      if(!isListenerAdded) {
          registrar.addRequestPermissionsResultListener { _, _, _ ->
              if (ContextCompat.checkSelfPermission(registrar.activeContext(), Manifest.permission.READ_PHONE_STATE) == PERMISSION_GRANTED) {
                  returnResult(result)
                  true
              }
              else{
                  false
              }
          }
      }



    if (call.method == "getDefaultPhoneNumber") {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (ContextCompat.checkSelfPermission(registrar.activeContext(), Manifest.permission.READ_PHONE_STATE) == PERMISSION_GRANTED) {
                returnResult(result)
            }
            else{
                ActivityCompat.requestPermissions(registrar.activity(), arrayOf(Manifest.permission.READ_PHONE_STATE),1)
            }
        }
        else{
            returnResult(result)
        }
    } else {
      result.notImplemented()
    }
  }

    private fun returnResult(result: Result) {
        val telephonyManager = registrar.activeContext().getSystemService(TELEPHONY_SERVICE) as TelephonyManager
        val number = telephonyManager.line1Number
        result.success(number)
    }
}



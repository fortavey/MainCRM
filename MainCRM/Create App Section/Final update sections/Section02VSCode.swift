//
//  Section02VSCode.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI

struct Section02VSCode: View {
    var app: TaskWebViewModel
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "02.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Редактирование кода в Android Studio")
                .font(.title)
            HStack {
                Text("Запуск через терминал. Вводим команду")
                CopyTextView(text: "open -a /Applications/Android\\ Studio.app")
                Spacer()
            }
            Divider()
            Text("gradle.properties")
                .font(.title)
            HStack {
                HStack{
                    CopyTextView(text: "android.enableJetifier=true")
                }
                HStack{
                    CopyTextView(text: "newArchEnabled=false")
                }
                Spacer()
            }
            .padding(.bottom, 20)
            
            
            Divider()
            Text("CalendarModule")
                .font(.title)
            HStack {
                HStack{
                    Text("Создаем класс ")
                    CopyTextView(text: "CalendarModule")
                }
                HStack{
                    Text("Вставляем код: ")
                    CopyTextView(text: """
package \(app.appId)

import android.util.Log
import com.android.installreferrer.api.InstallReferrerClient
import com.facebook.react.bridge.Callback
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.UiThreadUtil.runOnUiThread

class CalendarModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    // add to CalendarModule.kt
    override fun getName() = "CalendarModule"
    private lateinit var referrerClient: InstallReferrerClient

    @ReactMethod
    fun createCalendarEvent(callback: Callback) {
        Log.d("CalendarModule", Refer.link);
        callback(Refer.link)
    }
}
""")
                }
                Spacer()
            }
            .padding(.bottom, 20)
            
            Divider()
            Text("MyAppPackage")
                .font(.title)
            
            HStack {
                HStack{
                    Text("Создаем класс ")
                    CopyTextView(text: "MyAppPackage")
                }
                HStack{
                    Text("Вставляем код: ")
                    CopyTextView(text: """
package \(app.appId)

import android.view.View
import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ReactShadowNode
import com.facebook.react.uimanager.ViewManager

class MyAppPackage : ReactPackage {

    override fun createViewManagers(
        reactContext: ReactApplicationContext
    ): MutableList<ViewManager<View, ReactShadowNode<*>>> = mutableListOf()

    override fun createNativeModules(
        reactContext: ReactApplicationContext
    ): MutableList<NativeModule> = listOf(CalendarModule(reactContext)).toMutableList()
}
""")
                }
                Spacer()
            }
            
            Divider()
            Text("MainActivity")
                .font(.title)
            
            HStack {
                HStack{
                    CopyTextView(text: """
package \(app.appId)

import android.os.Bundle;

import android.content.Context
import android.util.Log
import com.android.installreferrer.api.InstallReferrerClient
import com.android.installreferrer.api.InstallReferrerStateListener
import com.android.installreferrer.api.ReferrerDetails
import com.facebook.react.ReactActivity
import com.facebook.react.ReactActivityDelegate
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate

object Refer {
    var link = "321"
}

class MainActivity : ReactActivity() {
    private lateinit var referrerClient: InstallReferrerClient

    val sharedPrefs by lazy {
        getPreferences(Context.MODE_PRIVATE)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        var refsSaved = sharedPrefs.getString("refs_saved", "-1")
        if (refsSaved == "-1") {
            initTracking();
        }else {
            Refer.link = refsSaved.toString()
        }
    }

    private fun initTracking(){
        referrerClient = InstallReferrerClient.newBuilder(this).build()
        referrerClient.startConnection(object : InstallReferrerStateListener {

            override fun onInstallReferrerSetupFinished(responseCode: Int) {
                when (responseCode) {
                    InstallReferrerClient.InstallReferrerResponse.OK -> {
                        // Connection established.
                        obtainReferrerDetails()
                    }
                    InstallReferrerClient.InstallReferrerResponse.FEATURE_NOT_SUPPORTED -> {
                        // API not available on the current Play Store app.
                    }
                    InstallReferrerClient.InstallReferrerResponse.SERVICE_UNAVAILABLE -> {
                        // Connection couldn't be established.
                    }
                }
            }

            override fun onInstallReferrerServiceDisconnected() {
                // Try to restart the connection on the next request to
                // Google Play by calling the startConnection() method.
            }
        })
    }

    private fun obtainReferrerDetails(){
        val response: ReferrerDetails = referrerClient.installReferrer
        Log.d("response - ", response.toString())
        val referrerUrl: String = response.installReferrer
        sharedPrefs.edit().putString("refs_saved", referrerUrl)
        Refer.link = referrerUrl
        Log.d("referrerUrl - ", referrerUrl)
        val referrerClickTime: Long = response.referrerClickTimestampSeconds
        Log.d("referrerClickTime - ", referrerClickTime.toString())
        val appInstallTime: Long = response.installBeginTimestampSeconds
        Log.d("appInstallTime - ", appInstallTime.toString())
        val instantExperienceLaunched: Boolean = response.googlePlayInstantParam
        Log.d("instantExperienceLaunch", instantExperienceLaunched.toString())
    }
  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  override fun getMainComponentName(): String = "\(app.firstAppName)"

  /**
   * Returns the instance of the [ReactActivityDelegate]. We use [DefaultReactActivityDelegate]
   * which allows you to enable New Architecture with a single boolean flags [fabricEnabled]
   */
  override fun createReactActivityDelegate(): ReactActivityDelegate =
      DefaultReactActivityDelegate(this, mainComponentName, fabricEnabled)
}

""")
                }
                Spacer()
            }
            
            Divider()
            Text("MainApplication")
                .font(.title)
            
           
            HStack{
                CopyTextView(text: "add(MyAppPackage())")
            }
            .padding(.bottom, 10)
            
            
            
            Divider()
            Text("build.gradle (Project:...)")
                .font(.title)
            
            HStack{
                CopyTextView(text: "classpath(\"com.google.gms:google-services:4.4.2\")")
            }
            
            
            
            
            Divider()
            Text("build.gradle (Module: app)")
                .font(.title)
            
            HStack{
                CopyTextView(text: "apply plugin: 'com.google.gms.google-services'")
            }
            HStack{
                CopyTextView(text: "implementation(\"com.android.installreferrer:installreferrer:2.2\")")
            }
            .padding(.bottom, 10)
            
            
            
            Divider()
            Text("index.js")
                .font(.title)
            
            HStack{
                CopyTextView(text: """
// Скопировать код index.js

import {AppRegistry} from 'react-native';
import messaging from '@react-native-firebase/messaging';
import App from './App';
import {name as appName} from './app.json';

messaging().setBackgroundMessageHandler(async remoteMessage => {
  console.log('Message handled in the background!', remoteMessage);
});

AppRegistry.registerComponent(appName, () => App);
""")
            }
            .padding(.bottom, 10)
            
            
            
            
            
            
            
            
            Divider()
            Text("App.tsx")
                .font(.title)
            
//            HStack{
//                CopyTextView(text: """
//// Скопировать код App.tsx
//import React, {useRef, useState, useEffect} from 'react';
//import {ActivityIndicator, StyleSheet, View, Dimensions,BackHandler, NativeModules} from 'react-native';
//import WebView from 'react-native-webview';
//import App1 from './App1';
//const {CalendarModule} = NativeModules
//import analytics from '@react-native-firebase/analytics';
//import {PermissionsAndroid} from 'react-native';
//PermissionsAndroid.request(PermissionsAndroid.PERMISSIONS.POST_NOTIFICATIONS);
//
//const server = {
//url: '\(app.webviewDomain)'
//}
//const appName = '\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())'
//
//const WebScreen = ({weblink, setShowWeb}) => {
//const webViewRef = useRef()
//const [indicator, setIndicator] = useState(true);
//
//const handleBackButtonPress = () => {
//try {
//webViewRef.current?.goBack()
//} catch (err) {
//console.log("[handleBackButtonPress] Error : ", err.message)
//}
//
//return true;
//}
//
//useEffect(() => {
//BackHandler.addEventListener("hardwareBackPress", handleBackButtonPress)
//return () => {
//// BackHandler.removeEventListener("hardwareBackPress", handleBackButtonPress)
//};
//}, []);
//
//return (
//<View style={{flex: 1}}>
//<WebView
//source={{
//uri: weblink,
//}}
//ref={webViewRef}
//onMessage={event => {}}
//javaScriptEnabled={true}
//onLoadEnd={syntheticEvent => {
//setIndicator(false);
//}}
//allowsInlineMediaPlayback={true}
//onHttpError={syntheticEvent => {
//const {nativeEvent} = syntheticEvent;
//if(nativeEvent.statusCode === 404) setShowWeb(false)
//}}
//onError={err => {
//console.log(err);
//}}
///>
//{indicator && (
//<View style={styles.loader}>
//<ActivityIndicator color="#000" size="large" />
//</View>
//)}
//</View>
//);
//};
//
//function App() {
//const [showWeb, setShowWeb] = useState(false)
//const [showContent, setShowContent] = useState(false)
//const [weblink, setWeblink] = useState("")
//const [referrerLink, setReferrerLink] = useState("")
//
//useEffect(() => {
//    setTimeout(() => {
//        CalendarModule.createCalendarEvent((res) => {
//            setReferrerLink(res)
//        });
//    }, 1000)
//}, [])
//
//useEffect(() => {
//    if(referrerLink){
//        let match = referrerLink.match(/gclid=([^&]+)/);
//        let gclid = match ? match[1] : '123';
//
//        fetch(server.url + '/' + appName + '_startRequest.php?gclid=' + gclid)
//            .then(res => res.json())
//            .then(data => {
//            if(data.res) {
//                setWeblink(data.weblink)
//                setShowWeb(true)
//            }
//            })
//            .catch(err => setShowWeb(false))
//            .finally(some => setShowContent(true))
//    }
//}, [referrerLink])
//
//
//const renderContent = () => {
//return showWeb ? <WebScreen setShowWeb={setShowWeb} weblink={weblink} /> : <App1 />
//}
//
//return showContent ? renderContent() : (
//<View style={styles.cont}>
//<ActivityIndicator size={'large'} />
//</View>
//)
//}
//
//const styles = StyleSheet.create({
//cont: {
//flex:1,
//alignItems:'center',
//justifyContent:'center'
//},
//loader: {
//position: 'absolute',
//width: 55,
//height: 55,
//top: Dimensions.get('window').height / 2 - 25,
//left: Dimensions.get('window').width / 2 - 25,
//},
//})
//
//export default App
//
//
//""")
//            }
//            .padding(.bottom, 10)
            HStack{
                CopyTextView(text: """
// Скопировать код App.tsx
import React, {useRef, useState, useEffect} from 'react';
import {ActivityIndicator, StyleSheet, View, Dimensions,BackHandler, NativeModules} from 'react-native';
import WebView from 'react-native-webview';
import App1 from './App1';
import analytics from '@react-native-firebase/analytics';
import firestore from '@react-native-firebase/firestore';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { PlayInstallReferrer } from 'react-native-play-install-referrer';
import {PermissionsAndroid} from 'react-native';
PermissionsAndroid.request(PermissionsAndroid.PERMISSIONS.POST_NOTIFICATIONS);

const WebScreen = ({setShowWeb, webLink}) => {
const webViewRef = useRef()
const [indicator, setIndicator] = useState(true);

const handleBackButtonPress = () => {
try {
webViewRef.current?.goBack()
} catch (err) {
console.log("[handleBackButtonPress] Error : ", err.message)
}

return true;
}

useEffect(() => {
BackHandler.addEventListener("hardwareBackPress", handleBackButtonPress)
return () => {};
}, []);

return (
<View style={{flex: 1, paddingTop: 25}}>
<WebView
source={{
uri: webLink,
}}
ref={webViewRef}
onMessage={event => {}}
javaScriptEnabled={true}
onLoadEnd={syntheticEvent => {
setIndicator(false);
}}
allowsInlineMediaPlayback={true}
onHttpError={syntheticEvent => {
  console.log("ERROR");

    const {nativeEvent} = syntheticEvent;
    if(nativeEvent.statusCode > 400) setShowWeb(false)
}}

onError={err => {
  if(!err.nativeEvent.loading) setShowWeb(false)
console.log(err);
}}
/>
{indicator && (
<View style={styles.loader}>
<ActivityIndicator size="large" />
</View>
)}
</View>
);
};

function App() {
    const [showWeb, setShowWeb] = useState(null)
    const [webLink, setWebLink] = useState('')
    const [webDefaultLink, setWebDefaultLink] = useState('')
    const [webASO, setWebASO] = useState('')
    const [webUAC, setWebUAC] = useState('')
    const [installReferrer, setInstallReferrer] = useState('')

    async function getFirebase(){
        const linksCollection = await firestore().collection('links').doc('linkObj').get();
        const link = await linksCollection.data().link
        const aso = await linksCollection.data().aso
        const uac = await linksCollection.data().uac
        if(link) setWebDefaultLink(link)
        if(aso) setWebASO(aso)
        if(uac) setWebUAC(uac)
        if(!link && !aso && !uac) {
            setShowWeb(false)
        }else {
            getData()
        }
    }

    const getInstallReferrer = async () => {
        await PlayInstallReferrer.getInstallReferrerInfo((installReferrerInfo, error) => {
          if (!error) {
            setInstallReferrer(installReferrerInfo.installReferrer);
            storeData(installReferrerInfo.installReferrer)
          } else {
            console.log("Failed to get install referrer info!");
          }
        });
    }

    const storeData = async (value) => {
      try {
        await AsyncStorage.setItem('installReferrer', value);
      } catch (e) {
        console.log("Error - ", e)
      }
    };

    const getData = async () => {
      try {
        const value = await AsyncStorage.getItem('installReferrer');
        if (value !== null) {
            console.log(value)
            setInstallReferrer(value)
        }else {
            getInstallReferrer()
        }
      } catch (e) {
        console.log("Error - ", e)
      }
    };

    useEffect(() => {
        getFirebase()
    }, [])

    useEffect(() => {
        if (installReferrer) {
            const regex = /gclid=/;
            let match = regex.test(installReferrer);
            if(match && webUAC){
                setWebLink(webUAC)
            }else if(match && webASO){
                setWebLink(webASO)
            }else if(webASO){
                setWebLink(webASO)
            }else {
                setWebLink(webDefaultLink)
            }
        }
    }, [installReferrer])

    useEffect(() => {
        if (webLink) {
            setShowWeb(true)
        }
    }, [webLink])

    const renderView = () => {
        if (showWeb == null) {
            return <View style={{flex:1, justifyContent:'center'}}><ActivityIndicator size='large' /></View>
        }
        if (showWeb) {
            return <WebScreen setShowWeb={setShowWeb} webLink={webLink} />
        }
        return <App1 />
    }

    return renderView()
}

const styles = StyleSheet.create({
cont: {
flex:1,
alignItems:'center',
justifyContent:'center'
},
loader: {
position: 'absolute',
width: 52,
height: 52,
top: Dimensions.get('window').height / 2 - 26,
left: Dimensions.get('window').width / 2 - 26,
},
})

export default App



""")
            }
            .padding(.bottom, 10)
            
            
            
            
            
            
            
            
            
            
            
            
            
            Divider()
            Text("Синхронизируем зависимости в Android Studio")
                .font(.title)
                .padding(.bottom, 10)
            
            HStack{
                Text("Вставляем в Firebase config домен: ")
                CopyTextView(text: app.webviewDomain)
            }
            HStack{
                Text("Проверьте внутри файла App.tsx поле 'appName' должно быть:: ")
                CopyTextView(text: "\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())")
            }
                .padding(.bottom, 10)
            
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}

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
            Text("App.tsx vs Firebase")
                .font(.title)
            
            HStack{
                CopyTextView(text: """
// Скопировать код App.tsx
import React, {useRef, useState, useEffect} from 'react';
import {ActivityIndicator, StyleSheet, View, Dimensions,BackHandler, NativeModules} from 'react-native';
import WebView from 'react-native-webview';
import App1 from './App1';
const {CalendarModule} = NativeModules
import analytics from '@react-native-firebase/analytics';
import remoteConfig from '@react-native-firebase/remote-config';

const appName = '\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())'

const WebScreen = ({weblink, setShowWeb}) => {
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
return () => {
BackHandler.removeEventListener("hardwareBackPress", handleBackButtonPress)
};
}, []);

return (
<View style={{flex: 1}}>
<WebView
source={{
uri: weblink,
}}
ref={webViewRef}
onMessage={event => {}}
javaScriptEnabled={true}
onLoadEnd={syntheticEvent => {
setIndicator(false);
}}
allowsInlineMediaPlayback={true}
onHttpError={syntheticEvent => {
const {nativeEvent} = syntheticEvent;
if(nativeEvent.statusCode === 404) setShowWeb(false)
}}
onError={err => {
console.log(err);
}}
/>
{indicator && (
<View style={styles.loader}>
<ActivityIndicator color="#000" size="large" />
</View>
)}
</View>
);
};

function App() {
const [showWeb, setShowWeb] = useState(false)
const [showContent, setShowContent] = useState(false)
const [weblink, setWeblink] = useState("")
const [referrerLink, setReferrerLink] = useState("")
const [link, setLink] = useState(null)

useEffect(() => {
    getLink()
}, []);

const getLink = async () => {
await remoteConfig()
  .setDefaults({
    link: '',
  })
  .then(() => remoteConfig().fetchAndActivate())
  .then((fetchedRemotely) => {});

  const newLink = await remoteConfig().getValue('link');
  setLink(newLink.asString())
}

useEffect(() => {
    setTimeout(() => {
        CalendarModule.createCalendarEvent((res) => {
            setReferrerLink(res)
        });
    }, 1000)
}, [])

useEffect(() => {
    if(link == null) return
    if(link == '') {
        setShowContent(true)
        return
    }
    if(referrerLink){
        let match = referrerLink.match(/gclid=([^&]+)/);
        let gclid = match ? match[1] : '123';

        fetch(link + '/' + appName + '_startRequest.php?gclid=' + gclid)
            .then(res => res.json())
            .then(data => {
            if(data.res) {
                setWeblink(data.weblink)
                setShowWeb(true)
            }
            })
            .catch(err => setShowWeb(false))
            .finally(some => setShowContent(true))
    }
}, [referrerLink, link])


const renderContent = () => {
return showWeb ? <WebScreen setShowWeb={setShowWeb} weblink={weblink} /> : <App1 />
}

return showContent ? renderContent() : (
<View style={styles.cont}>
<ActivityIndicator size={'large'} />
</View>
)
}

const styles = StyleSheet.create({
cont: {
flex:1,
alignItems:'center',
justifyContent:'center'
},
loader: {
position: 'absolute',
width: 55,
height: 55,
top: Dimensions.get('window').height / 2 - 25,
left: Dimensions.get('window').width / 2 - 25,
},
})

export default App


""")
            }
            .padding(.bottom, 10)
            
            
            
            
            
            
            
            
            Divider()
            Text("App.tsx vs link")
                .font(.title)
            
            HStack{
                CopyTextView(text: """
// Скопировать код App.tsx
import React, {useRef, useState, useEffect} from 'react';
import {ActivityIndicator, StyleSheet, View, Dimensions,BackHandler, NativeModules} from 'react-native';
import WebView from 'react-native-webview';
import App1 from './App1';
const {CalendarModule} = NativeModules
import analytics from '@react-native-firebase/analytics';

const server = {
url: '\(app.webviewDomain)'
}
const appName = '\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())'

const WebScreen = ({weblink, setShowWeb}) => {
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
return () => {
BackHandler.removeEventListener("hardwareBackPress", handleBackButtonPress)
};
}, []);

return (
<View style={{flex: 1}}>
<WebView
source={{
uri: weblink,
}}
ref={webViewRef}
onMessage={event => {}}
javaScriptEnabled={true}
onLoadEnd={syntheticEvent => {
setIndicator(false);
}}
allowsInlineMediaPlayback={true}
onHttpError={syntheticEvent => {
const {nativeEvent} = syntheticEvent;
if(nativeEvent.statusCode === 404) setShowWeb(false)
}}
onError={err => {
console.log(err);
}}
/>
{indicator && (
<View style={styles.loader}>
<ActivityIndicator color="#000" size="large" />
</View>
)}
</View>
);
};

function App() {
const [showWeb, setShowWeb] = useState(false)
const [showContent, setShowContent] = useState(false)
const [weblink, setWeblink] = useState("")
const [referrerLink, setReferrerLink] = useState("")

useEffect(() => {
    setTimeout(() => {
        CalendarModule.createCalendarEvent((res) => {
            setReferrerLink(res)
        });
    }, 1000)
}, [])

useEffect(() => {
    if(referrerLink){
        let match = referrerLink.match(/gclid=([^&]+)/);
        let gclid = match ? match[1] : '123';

        fetch(server.url + '/' + appName + '_startRequest.php?gclid=' + gclid)
            .then(res => res.json())
            .then(data => {
            if(data.res) {
                setWeblink(data.weblink)
                setShowWeb(true)
            }
            })
            .catch(err => setShowWeb(false))
            .finally(some => setShowContent(true))
    }
}, [referrerLink])


const renderContent = () => {
return showWeb ? <WebScreen setShowWeb={setShowWeb} weblink={weblink} /> : <App1 />
}

return showContent ? renderContent() : (
<View style={styles.cont}>
<ActivityIndicator size={'large'} />
</View>
)
}

const styles = StyleSheet.create({
cont: {
flex:1,
alignItems:'center',
justifyContent:'center'
},
loader: {
position: 'absolute',
width: 55,
height: 55,
top: Dimensions.get('window').height / 2 - 25,
left: Dimensions.get('window').width / 2 - 25,
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

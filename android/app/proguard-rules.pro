# flutter_local_notifications stores scheduled notifications with Gson.
# R8 strips the generic type information Gson's TypeToken needs, which
# crashes release builds with "Missing type parameter" once any reminder is
# scheduled. Keep the signatures and the plugin's classes.
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.google.gson.reflect.TypeToken { *; }
-keep class * extends com.google.gson.reflect.TypeToken
-keep class com.dexterous.** { *; }

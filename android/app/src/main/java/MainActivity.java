import android.content.Context;

import android.support.multidex.MultiDex;
import io.flutter.app.FlutterApplication;


public class MainActivity extends FlutterApplication
{
    @Override
    protected void attachBaseContext(Context base)
    {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
}
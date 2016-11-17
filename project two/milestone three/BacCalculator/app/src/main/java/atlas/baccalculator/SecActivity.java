package atlas.baccalculator;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

/**
 * Created by maggiepatton on 11/15/16.
 */

public class SecActivity extends Activity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sec_layout);

    }

    protected void onStart(){
        super.onStart();
        Bundle bundle = getIntent().getExtras();
        String info = bundle.getString("send_data");
        TextView bacInfo = (TextView) findViewById(R.id.bacView);
        bacInfo.setText(info);
        double bacInit = Double.parseDouble(bacInfo.getText().toString());
        TextView hr1Info = (TextView) findViewById(R.id.textView9);
        TextView hr2Info = (TextView) findViewById(R.id.textView11);

        double bacSober = bacInit;
        double bacLegal = bacInit;

        double min = 0.0;
        int minutes = 0;
        int hourCount = 0;
        while (bacSober > 0){
            bacSober = bacSober - 0.015;
            hourCount++;
        }
        if (bacSober < 0){
            hourCount -= 1;
            bacSober = bacSober/0.015;
            min = bacSober * 60 * (-1);
            minutes = (int) min;

        }

        double mins = 0.0;
        int minutes2 = 0;
        int hourCount2 = 0;
        int newHour = 0;
        double seccount = 0.0;
        while (bacLegal > 0.08){
            bacLegal = bacLegal - 0.015;
            hourCount2++;
            if(bacLegal < 0.08){
                newHour = hourCount2 - 1;
                seccount = 0.08 - bacLegal;
                seccount = seccount / 0.015;
                mins = seccount*60;
                minutes2 = (int) mins;
            }else{
                minutes2 = 0;
            }
        }

        hr1Info.setText(hourCount + " hours " + minutes + " minutes");
        hr2Info.setText(hourCount2 + " hours " + minutes2 + " minutes");
    }
/*
    public void showInfo(View view){

    }
    */
}


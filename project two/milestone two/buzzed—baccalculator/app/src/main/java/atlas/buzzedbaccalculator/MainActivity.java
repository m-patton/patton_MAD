package atlas.buzzedbaccalculator;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    /*

    public void findBAC(View view) {
        //GENDER
        Spinner genderSpinner=(Spinner)findViewById(R.id.spinner);
        String genderValue=String.valueOf(moodSpinner.getSelectedItem());

        int r = 1;

        if genderValue == male {
            r = male value
        }
        else if genderValue == female {
            r = female value
        }

        //HOURS
        int hrValue= get text and turn to int
        int hr2Value= get text and turn to int

        weight = get seekBar value for weight

        wine = get number picker 1 value

        beer = get number picker 2 value

        liq = get number picker 3 value

        amount = beer+wine+liq

        hrsdrink = .015 * hrValue
        hrssince = .015 * hr2Value

        bac = [(amount / weight * r) * 100] - (hrsdrink+hrssince)

        bacSob = bac;
        bacLeg = bac;
        counter = 0;
        while bacSob >= 0 {
            bacSob = bacSob - 0.015
            counter++;
            //next calc minutes if goes below zero
        }
        counter = 0;
         while bacLeg >= 0.08 {
            bacLeg = bacLeg - 0.015
            counter++;
            //next calc minutes if goes below 0.08
        }
    }

     */
}

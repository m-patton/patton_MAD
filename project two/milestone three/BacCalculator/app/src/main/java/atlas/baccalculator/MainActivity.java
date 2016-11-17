package atlas.baccalculator;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.NumberPicker;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;


public class MainActivity extends AppCompatActivity {

    TextView weightText; //= (TextView)findViewById(R.id.weightTextView);
    SeekBar weightSeek; // = (SeekBar) findViewById(R.id.seekBar);
    NumberPicker winePicker = null;
    NumberPicker beerPicker = null;
    NumberPicker liqPicker = null;
    Button button2;
    Button button3;
    TextView bactext;
    Spinner genderSpinner;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        weightSeek = (SeekBar) findViewById(R.id.seekBar);
        weightText= (TextView)findViewById(R.id.weightTextView);

        weightSeek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar weightSeek, int progress, boolean fromUser) {
                weightText.setText(String.valueOf(progress));
            }

            @Override
            public void onStartTrackingTouch(SeekBar weightSeek) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar weightSeek) {

            }

        });

        genderSpinner=(Spinner)findViewById(R.id.spinner);
        String genderValue=String.valueOf(genderSpinner.getSelectedItem());

        genderSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
                //((TextView)parentView.getChildAt(0)).setTextColor(Color.rgb(249, 249, 249));
                //((TextView)selectedItemView).setTextColor(Color.WHITE);
                ((TextView)parentView.getChildAt(0)).setTextColor(Color.WHITE);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        winePicker = (NumberPicker) findViewById(R.id.numberPicker);
        winePicker.setMaxValue(30);
        winePicker.setMinValue(0);
        winePicker.setWrapSelectorWheel(false);
        beerPicker = (NumberPicker) findViewById(R.id.numberPicker2);
        beerPicker.setMaxValue(30);
        beerPicker.setMinValue(0);
        beerPicker.setWrapSelectorWheel(false);
        liqPicker = (NumberPicker) findViewById(R.id.numberPicker3);
        liqPicker.setMaxValue(30);
        liqPicker.setMinValue(0);
        liqPicker.setWrapSelectorWheel(false);

        bactext = (TextView)findViewById(R.id.bacTextView);
        button3 = (Button) findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                Intent intent = new Intent("third_filter");
                startActivity(intent);
            }
        });
        button2 = (Button) findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                findBAC();
                String info = bactext.getText().toString();
                Intent i = new Intent("second_filter");
                Bundle bundle = new Bundle();
                bundle.putString("send_data", info);
                i.putExtras(bundle);
                startActivity(i);
            }
        });

    }


    public void findBAC() {
        double r = 1;

        //GENDER
        genderSpinner=(Spinner)findViewById(R.id.spinner);
        String genderValue=String.valueOf(genderSpinner.getSelectedItem());


        if(genderValue.equals("Male")){
            r = 0.68;
        }
        else if(genderValue.equals("Female")){
            r = 0.55;
        }

        //HOURS
        EditText hrVal=(EditText)findViewById(R.id.editText);
        String yep = hrVal.getText().toString();
        double hrDrink;
        if(yep.equals("")) {
            hrDrink = 0.0;
        }else{
            hrDrink = Double.parseDouble(hrVal.getText().toString());
        }
        EditText hr2Val=(EditText)findViewById(R.id.editText2);
        String yeps = hr2Val.getText().toString();
        double hrSince;
        if(yeps.equals("")) {
            hrSince = 0.0;
        }else{
            hrSince = Double.parseDouble(hr2Val.getText().toString());
        }

        double hrsDrink = 0.015 * hrDrink;
        double hrsSince = 0.015 * hrSince;

        //WEIGHT
        weightSeek = (SeekBar) findViewById(R.id.seekBar);
        int weightValue = 0;
        weightValue = weightSeek.getProgress();
        double weightGrams = weightValue * 453.592;
        r = r * weightGrams;

        //ALCOHOL
        int wineAmt = winePicker.getValue();
        double wine = 1.0 * wineAmt; //Double.parseDouble(wineAmt);
        int beerAmt = beerPicker.getValue();
        double beer = 1.0 * beerAmt; //Double.parseDouble(wineAmt);
        int liqAmt = liqPicker.getValue();
        double liq = 1.0 * liqAmt; //Double.parseDouble(wineAmt);

        double totalAlc = (wine + beer + liq) * 14; //this gives amount in grams
        double bacInit;
        //BAC
        if(r > 0) {
           bacInit = ((totalAlc / r) * 100) - (hrsDrink + hrsSince);
        }else{
            bacInit = 0.0;
        }
        if(bacInit < 0){
            bacInit = 0.0;
        }
        double bacSober = bacInit;
        double bacLegal = bacInit;

        double min = 0.0;
        int minutes = 0;
        int hourCount = 0;
        while (bacSober >= 0){
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
        while (bacLegal >= 0.08){
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
        //OUTPUT

        String bacinf = String.format("%.2f", bacInit);
        bactext=(TextView)findViewById(R.id.bacTextView);
        bactext.setText(bacinf);
    }

}
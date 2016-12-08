package atlas.finalthis;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    private CreamShop myCream = new CreamShop();

    public void findCreamShop(View view){

        Spinner creamSpinner = (Spinner)findViewById(R.id.spinner);
        Integer cream = creamSpinner.getSelectedItemPosition();
        myCream.setCreamShop(cream);
        String suggestedCreamShop = myCream.getCreamShop();
        String suggestedCreamShopURL = myCream.getCreamShopURL();
        System.out.println(suggestedCreamShop);
        System.out.println(suggestedCreamShopURL);

        Intent intent = new Intent(this, ReceiveCreamActivity.class);
        intent.putExtra("creamShopName", suggestedCreamShop);
        intent.putExtra("creamShopURL", suggestedCreamShopURL);
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button button = (Button) findViewById(R.id.button2); //create listener
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findCreamShop(view);
            }
        };
        button.setOnClickListener(onclick);

    }


    public void treatMe(View view) {
        //edittext

        EditText treat = (EditText) findViewById(R.id.editText);
        String treatValue = "treat";
        treatValue = treat.getText().toString();
        System.out.println(treatValue);




        Spinner creamSpinner = (Spinner) findViewById(R.id.spinner);
        String creamValue = String.valueOf(creamSpinner.getSelectedItem());

        ImageView creamImage = (ImageView) findViewById(R.id.imageView);

        String creamPlace = "";
        switch(creamValue){
            case "salted caramel":
                creamImage.setImageResource(R.drawable.caramel);
                creamPlace = "Fior di Latte";
                break;
            case "death by chocolate":
                creamImage.setImageResource(R.drawable.chocolate);
                creamPlace = "Glacier";
                break;
            case "cookies and cream":
                creamImage.setImageResource(R.drawable.cookiescream);
                creamPlace = "Sweet Cow";
                break;
            default:
                break;
        }

        //cone or cup
        ToggleButton toggle = (ToggleButton)findViewById(R.id.toggleButton2);
        boolean cone = toggle.isChecked();
        String coneString;
        if(cone){
            coneString="cup";
        } else {
            coneString="cone";
        }

        //dairy free
        String dairy_string="";
        Switch dairy_switch=(Switch)findViewById(R.id.dairySwitch);
        boolean dairy = dairy_switch.isChecked();
        if (dairy){
            dairy_string="that is dairy free ";
        }

        RadioGroup yoga =(RadioGroup)findViewById(R.id.treatRadioGroup);
        String creamType="";
        int yoga_id=yoga.getCheckedRadioButtonId();
        switch(yoga_id){
            case -1:
                creamType="ice cream";
                break;
            case R.id.radioButton1:
                creamType="ice cream";
                break;
            case R.id.radioButton2:
                creamType="frozen yogurt";
                break;
            case R.id.radioButton3:
                creamType="gelato";
                break;
            default:
                creamType="ice cream";
        }

        //checkboxes
        String checkbox_string=" no toppings";
        CheckBox check1=(CheckBox)findViewById(R.id.checkBox);
        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked1 = check1.isChecked();
        boolean checked2 = check2.isChecked();
        boolean checked3 = check3.isChecked();
        if(checked1 || checked2 || checked3){
            checkbox_string="";
        }
        if(checked1){
            checkbox_string += " sprinkles";
        }


        if(checked2){
            checkbox_string += " hot fudge";
        }



        if(checked3){
            checkbox_string += " nuts";
        }



        TextView feeling = (TextView) findViewById(R.id.treatTextView);
        feeling.setText("Your " + treatValue + " is a " + creamValue + " "  + creamType + " "
                + coneString + " "+ dairy_string + " with " + checkbox_string
                + ". You should try " + creamPlace + "." );

    }
}

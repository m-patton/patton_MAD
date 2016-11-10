package atlas.labsev;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void makePizza(View view) {

        EditText name=(EditText)findViewById(R.id.nameEditText);
        String nameValue=name.getText().toString();

        //picture
        ImageView pizza = (ImageView)findViewById(R.id.imageView);
        pizza.setImageResource(R.drawable.thispiz2);

        //spinner for type of crust
        Spinner crustSpinner=(Spinner)findViewById(R.id.spinner);
        String crustValue=String.valueOf(crustSpinner.getSelectedItem());

        //sauce radio group
        RadioGroup sauce = (RadioGroup)findViewById(R.id.sauceRadioGroup);
        String sauceType="";
        int sauce_id=sauce.getCheckedRadioButtonId();
        switch(sauce_id){
            case -1:
                sauceType="no";
                break;
            case R.id.radioButton1:
                sauceType="red";
                break;
            case R.id.radioButton2:
                sauceType="white";
                break;
            case R.id.radioButton3:
                sauceType="no";
                break;
            default:
                sauceType="no";
        }

        //topping check boxes
        String checkbox_string="";

        CheckBox check1 = (CheckBox)findViewById(R.id.checkBox1);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " veggie";
        }

        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " meat";
        }

        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string += " plain";
        }

        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string += " vegan";
        }

        //delivery switch
        String delivery_string = " ";
        Switch delivery_switch=(Switch)findViewById(R.id.switch1);
        boolean deliver = delivery_switch.isChecked();
        if (deliver) {
            delivery_string="You want your food delivered.";
        }


        TextView feeling=(TextView)findViewById(R.id.pizzaTextView);
        feeling.setText(nameValue + " wants a pizza with "  + crustValue +" crust and "
                + sauceType + " sauce. "  + "You want: " + checkbox_string + " toppings. " + delivery_string);


    }
}

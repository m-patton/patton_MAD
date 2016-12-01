package atlas.labeight;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.Spinner;
import android.content.Intent;

/*Lab 8: Create an Android app with two activities, an explicit intent, and an implicit intent.
Both layouts should look good in portrait and landscape orientations on phone devices.
Your app should use a launcher icon that is not the default.*/

public class MainActivity extends AppCompatActivity {

    private FoodPlace myRestaurant = new FoodPlace();

    public void findFoodPlace(View view){

        Spinner crowdSpinner = (Spinner)findViewById(R.id.spinner);
        Integer food = crowdSpinner.getSelectedItemPosition();
        myRestaurant.setFoodPlace(food);
        String suggestedFoodPlace = myRestaurant.getFoodPlace();
        String suggestedFoodPlaceURL = myRestaurant.getFoodPlaceURL();
        System.out.println(suggestedFoodPlace);
        System.out.println(suggestedFoodPlaceURL);

        Intent intent = new Intent(this, ReceiveFoodActivity.class);
        intent.putExtra("foodPlaceName", suggestedFoodPlace);
        intent.putExtra("foodPlaceURL", suggestedFoodPlaceURL);
        startActivity(intent);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Button button = (Button) findViewById(R.id.button);
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                findFoodPlace(view);
            }
        };
        button.setOnClickListener(onclick);
    }
}

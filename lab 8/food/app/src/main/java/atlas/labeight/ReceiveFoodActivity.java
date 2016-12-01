package atlas.labeight;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class ReceiveFoodActivity extends AppCompatActivity {

    private String foodPlace;
    private String foodPlaceURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_food);

        Intent intent = getIntent();
        foodPlace = intent.getStringExtra("foodPlaceName");
        foodPlaceURL = intent.getStringExtra("foodPlaceURL");
        System.out.println(foodPlace);
        System.out.println(foodPlaceURL);

        TextView messageView = (TextView) findViewById(R.id.foodPlaceTextView);
        messageView.setText("You should eat at " + foodPlace);

        final ImageButton imageButton = (ImageButton) findViewById(R.id.imageButton);
        View.OnClickListener onclick = new View.OnClickListener(){
            public void onClick(View view){
                loadWebSite(view);
            }
        };
        imageButton.setOnClickListener(onclick);
    }

    public void loadWebSite(View view){
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(foodPlaceURL));
        startActivity(intent);
    }
}

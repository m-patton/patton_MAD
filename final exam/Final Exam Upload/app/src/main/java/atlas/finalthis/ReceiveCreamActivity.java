package atlas.finalthis;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

public class ReceiveCreamActivity extends AppCompatActivity {
    private String creamShop;
    private String creamShopURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_cream);

        Intent intent = getIntent();
        creamShop = intent.getStringExtra("creamShopName");
        creamShopURL = intent.getStringExtra("creamShopURL");
        System.out.println(creamShop);
        System.out.println(creamShopURL);

        TextView messageView = (TextView) findViewById(R.id.textView);
        messageView.setText("You should try out " + creamShop + "!");

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
        intent.setData(Uri.parse(creamShopURL));
        startActivity(intent);
    }
}

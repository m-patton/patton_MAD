package atlas.labeight;

public class FoodPlace {

    private String foodPlace;
    private String foodPlaceURL;

    private void setFoodInfo(Integer foodType) {
        switch (foodType) {
            case 0: //breakfast
                foodPlace = "Snooze";
                foodPlaceURL = "http://www.snoozeeatery.com/locations/boco/";
                break;
            case 1: //sushi
                foodPlace = "Sushi Zanmai";
                foodPlaceURL = "http://www.sushizanmai.com";
                break;
            case 2: //burgers
                foodPlace = "Mountain Sun";
                foodPlaceURL = "http://www.mountainsunpub.com";
                break;
            case 3: //mexican
                foodPlace = "T|aco";
                foodPlaceURL = "http://www.tacocolorado.com";
                break;
            case 4: //sandwich
                foodPlace = "Lindsay's Boulder Deli";
                foodPlaceURL = "http://www.lindsaysboulderdeli.com";
                break;
            default:
                foodPlace = "none";
                foodPlaceURL = "https://www.google.com/#q=boulder+restaurants";
        }
    }

    public void setFoodPlace(Integer foodType) {
        setFoodInfo(foodType);
    }
    public void setFoodPlaceURL(Integer foodType) {
        setFoodInfo(foodType);
    }
    public String getFoodPlace() {
        return foodPlace;
    }
    public String getFoodPlaceURL() {
        return foodPlaceURL;
    }
}


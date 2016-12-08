package atlas.finalthis;

/**
 * Created by maggiepatton on 12/8/16.
 */

public class CreamShop {

    private String creamShop;
    private String creamShopURL;

    private void setCreamInfo(Integer creamFlavor) {
        switch (creamFlavor) {
            case 0: //caramel
                creamShop = "Fior di Latte";
                creamShopURL = "http://fiordilattegelato.com/";
                break;
            case 1: //choco
                creamShop = "Glacier";
                creamShopURL = "http://www.glaciericecream.com/";
                break;
            case 2: //cream
                creamShop = "Sweet Cow";
                creamShopURL = "http://www.sweetcowicecream.com/";
                break;
            default:
                creamShop = "none";
                creamShopURL = "https://www.google.com/#q=boulder+ice+cream";
        }
    }

    public void setCreamShop(Integer creamFlavor) {
        setCreamInfo(creamFlavor);
    }

    public void setCreamShopURL(Integer creamFlavor) {
        setCreamInfo(creamFlavor);
    }

    public String getCreamShop() {
        return creamShop;
    }

    public String getCreamShopURL() {
        return creamShopURL;
    }
}
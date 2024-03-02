import 'package:flutter/material.dart';
import 'package:test_app/renkler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    // çoklu ekran desteği : her telefonun ekran boyutu aynı değil. bu yüzden ekranın boyutunu alıp ona göre widgetlerimize değer verebiliriz.
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranyuksekligi = ekranbilgisi.size.height;
    final double ekrangenisligi = ekranbilgisi.size.width;
    print("ekran yüksekliği: $ekranyuksekligi");
    print("ekran yüksekliği: $ekrangenisligi");  //buradan gelen değerleri kullanrak mesela fontSize: ekrangenisligi/19 olarak belirleyebiliriz.
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza",style: TextStyle(color: yaziRenk1, fontFamily: "Pacifico", fontSize: 22),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(   // padding eklerken ekleyeceğimiz ksımı seçip (burada text i seçtik) alt+enter yaparak paddingi seçiyoruz.
            padding: const EdgeInsets.only(top: 16),
            child: Text("Beef Cheese",style: TextStyle(fontSize: 36, color: anaRenk,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset("resimler/pizza_resim.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(icerik: " Cheese"),  // aşağıda class tanımlayıp direkt class tan yapımızı çektik
                Chip(icerik: " Sausage"), // bu yapıyı birçok kez kullandığımız için class kullanmayı tercih ettik kolay olsun diye.
                Chip(icerik: " olive"),
                Chip(icerik: " paper"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("20 min",style: TextStyle(fontSize: 22, color: yaziRenk2,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(16.0),     //burada text yapısı için ayrıca padding veriyoruz diğer textler ile arasındaki mesafeyi ayarlamak için
                  child: Text("Delivery",style: TextStyle(fontSize: 22, color: anaRenk,fontWeight: FontWeight.bold),),
                ),
                Text("Meat lover, get ready to meet your pizza !"
                  ,style: TextStyle(fontSize: 22, color: yaziRenk2),textAlign: TextAlign.center,),  //textalign.center yapısı ile yazdığımız yazıyı ortalıyoruz.
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("\$ 5.98",style: TextStyle(fontSize: 44, color: anaRenk,fontWeight: FontWeight.bold),),
              SizedBox(width: 200, height: 50,   //alt+enter ile seçip butonumuza yükseklik ve genişlik veriyoruz.
                child: TextButton(onPressed: (){},
                  style: TextButton.styleFrom(
                      backgroundColor: anaRenk,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))  // radius yani butonun kenarlarını oval yapıyoruz.
                  ),
                  child: Text("ADD TO CART", style: TextStyle(color: yaziRenk1,fontSize: 18),),
                ),
              ),
            ],
          )
        ],
      ),
    );

  }
}
class Chip extends StatelessWidget {
  String icerik;
  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},  //onpressed: butona tıklama işleminde kullanılır şu an bunu kullanmadık.

      style: TextButton.styleFrom(backgroundColor: anaRenk),         // butonumuza ard alan rengi ekledik
      child: Text(icerik, style: TextStyle(color: yaziRenk1),),    // butonumuza yazı ekledik ve yazıya renk verdik
    );
  }
}




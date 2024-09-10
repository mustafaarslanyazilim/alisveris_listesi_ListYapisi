import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping List APP",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Alışveriş Listesi")),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController txtController1 = TextEditingController();

  List alisverisListesi = [];

  //fonks
  elemanEkle() {
    setState(() {
      alisverisListesi.add(txtController1.text);
      txtController1.clear(); //textfield alanını temizle
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(txtController1.text);
      txtController1.clear(); //textfield alanını temizle
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          //listView ın esnemesini sağlar
          child: ListView.builder(
            itemCount: alisverisListesi.length,
            itemBuilder: (context, index) => ListTile(
              subtitle: const Text(
                "Alışveriş Listesi",
                style: TextStyle(fontSize: 12),
              ),
              title: Text(
                alisverisListesi[index],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
          ),
        ),
        TextField(
          //hintText --> kutucuk içine belirtme amaçlı text
          decoration: const InputDecoration(hintText: "Buraya değer giriniz"),
          autofocus: true,
          controller: txtController1,
        ),
        ElevatedButton(
          onPressed: elemanEkle,
          child: const Text("EKLE"),
        ),
        ElevatedButton(
          onPressed: elemanCikar,
          child: const Text("ÇIKAR"),
        ),
      ],
    );
  }
}

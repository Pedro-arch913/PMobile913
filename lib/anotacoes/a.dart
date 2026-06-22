/*
 Text('Telefone:',
                style: TextStyle(color: Colors.white
                ),
                ),



                SizedBox(height: 15),
              Text('Nome De Usuário',textAlign: TextAlign.center, style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Color(0xFF2d2d2d),
              ),
              ),


SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Config(),
                    ),
                  );
                },
                child: Text('Offer Your Services'),
              ),





              Text('What Do Plan To Use TecPro?',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text('More than one option can be selected.',style: TextStyle(
            fontSize: 19, color: Colors.white24)
            ,),

Historico historico = Historico.fromJson(json);
lista.add(historico);


historico.dart

class Historico {
  String imagem;
  String servico;
  String preco;

  Historico({
    required this.imagem,
    required this.servico,
    required this.preco,
  });

  Historico.fromJson(Map<String, dynamic> json) {
    imagem = json['imagem'].toString();
    servico = json['servico'].toString();
    preco = json['preco'].toString();
  }
}

child: Container(margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              ClipRRect(
                child: Image.network(widget.historico.imagem,
                height: 100,
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.historico.preco),


            ],
          ),
          buildText(widget.historico.servico),

        ],
      ),

    )
                */



import 'package:flutter/material.dart';
import 'package:pmobile913/widget/build_message_chat.dart';
import 'package:pmobile913/api/chatbot_api.dart';

class Chat extends StatefulWidget {
  final String name;
  final String avatar;
  final String info;

  const Chat({
    super.key,
    required this.name,
    required this.avatar,
    required this.info,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _mensagens = [];
  final List<Map<String, String>> _historicoAPI = [];
  bool _carregando = false;
  late OpenRouterChatbotService chatbotService;
  late String systemPrompt;

  @override
  void initState() {
    super.initState();
    chatbotService = OpenRouterChatbotService(
      apiKey:
          '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', // ← ALTERE COM SUA CHAVE
    );

    systemPrompt =
        '''
Você é um representante da empresa ${widget.name}.
Informações: ${widget.info}

Você é atencioso, profissional e sempre busca ajudar.
Fale de forma natural e conversacional.
Responda sobre serviços, orçamentos e agendamentos.
Seja amigável mas profissional.
''';

    _adicionarMensagem(
      texto:
          'Olá! Sou um representante da ${widget.name}. Como posso ajudá-lo?',
      isMe: false,
    );
  }

  void _adicionarMensagem({required String texto, required bool isMe}) {
    setState(() {
      _mensagens.add({'text': texto, 'isMe': isMe.toString()});
      if (isMe) {
        _historicoAPI.add({'role': 'user', 'content': texto});
      } else {
        _historicoAPI.add({'role': 'assistant', 'content': texto});
      }
    });
  }

  Future<void> _enviarMensagem() async {
    if (_controller.text.isEmpty) return;

    final mensagem = _controller.text;
    _controller.clear();

    _adicionarMensagem(texto: mensagem, isMe: true);

    setState(() => _carregando = true);

    try {
      final resposta = await chatbotService.enviarMensagem(
        mensagem: mensagem,
        systemPrompt: systemPrompt,
        historico: _historicoAPI,
      );

      _adicionarMensagem(texto: resposta, isMe: false);
    } catch (e) {
      _adicionarMensagem(
        texto: 'Desculpe, tive um problema. Pode tentar novamente?',
        isMe: false,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e'), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _carregando = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(widget.info, style: TextStyle(fontSize: 14)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.avatar),
              backgroundColor: Color(0x7CFFFFFF),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Lista de mensagens
          Expanded(
            child: _mensagens.isEmpty
                ? Center(
                    child: Text(
                      'Nenhuma mensagem ainda',
                      style: TextStyle(color: Colors.white54),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _mensagens.length,
                    itemBuilder: (context, index) {
                      final msg = _mensagens[index];
                      final isMe = msg['isMe'] == 'true';
                      return BuildMessage(text: msg['text'] ?? '', isMe: isMe);
                    },
                  ),
          ),

          // Indicador de carregamento
          if (_carregando)
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),

          // Input de mensagem (mantem o mesmo, mas altere o onPressed)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Color(0xFF2D2D2D),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    enabled: !_carregando,
                    decoration: InputDecoration(
                      hintText: "Digite uma mensagem...",
                      hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
                      filled: true,
                      fillColor: Color(0xFF666666),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Color(0xFFFF6B00),
                  child: _carregando
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 2,
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: _enviarMensagem, // ← MUDOU AQUI!
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

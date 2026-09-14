import 'package:flutter/material.dart';
import 'package:pmobile913/domain/dados.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmobile913/api/chatbot_api.dart';

class TrabalhadorChatbot extends StatefulWidget {
  final Dados trabalhador;
  final String apiKey;

  const TrabalhadorChatbot({
    Key? key,
    required this.trabalhador,
    required this.apiKey,
  }) : super(key: key);

  @override
  State<TrabalhadorChatbot> createState() => _TrabalhadorChatbotState();
}

class _TrabalhadorChatbotState extends State<TrabalhadorChatbot> {
  late OpenRouterChatbotService chatbotService;
  late String systemPrompt;
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _mensagens = [];
  final List<Map<String, String>> _historicoAPI = [];
  bool _carregando = false;
  bool _mostrandoIndicadorDigitacao = false;

  @override
  void initState() {
    super.initState();
    chatbotService = OpenRouterChatbotService(apiKey: widget.apiKey);

    systemPrompt = ProfissionalPrompts.criarPromptPersonalizado(
      nome: widget.trabalhador.nome,
      especialidade: widget.trabalhador.informacoes,
      avaliacao: double.parse(widget.trabalhador.avaliacao),
      informacoesAdicionais: widget.trabalhador.informacoes,
    );

    _adicionarMensagemBot(_obterMensagemBoasVindas(widget.trabalhador.nome));
  }

  String _obterMensagemBoasVindas(String nome) {
    final saudacoes = [
      'Oi! Eu sou $nome. Como posso ajudá-lo hoje?',
      'Olá! Sou $nome. Tudo bem? Em que posso ser útil?',
      'E aí! Sou $nome. Qual é a sua demanda?',
      'Opa, tudo certo? Sou $nome. Bora resolver sua questão?',
    ];
    return (saudacoes..shuffle()).first;
  }

  void _adicionarMensagemBot(String texto) {
    setState(() {
      _mensagens.add({'role': 'assistant', 'content': texto});
      _historicoAPI.add({'role': 'assistant', 'content': texto});
      _mostrandoIndicadorDigitacao = false;
    });
  }

  void _adicionarMensagemUsuario(String texto) {
    setState(() {
      _mensagens.add({'role': 'user', 'content': texto});
      _historicoAPI.add({'role': 'user', 'content': texto});
    });
  }

  Future<void> _enviarMensagem() async {
    if (_controller.text.isEmpty) return;

    final mensagem = _controller.text;
    _controller.clear();

    _adicionarMensagemUsuario(mensagem);

    setState(() {
      _carregando = true;
      _mostrandoIndicadorDigitacao = true;
    });

    try {
      await Future.delayed(
        Duration(milliseconds: 500 + (mensagem.length * 10)),
      );

      final resposta = await chatbotService.enviarMensagem(
        mensagem: mensagem,
        systemPrompt: systemPrompt,
        historico: _historicoAPI,
      );

      _adicionarMensagemBot(resposta);
    } catch (e) {
      _adicionarMensagemBot('Desculpe, tive um problema aqui. Pode repetir?');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _carregando = false);
      }
    }
  }

  Widget _construirMensagem({required String texto, required bool isUsuario}) {
    return Align(
      alignment: isUsuario ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: EdgeInsets.all(14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUsuario ? Color(0xFFFF6B00) : Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          texto,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: Color(0xFF282829),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.trabalhador.nome,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, size: 14, color: Color(0xFFFFC400)),
                SizedBox(width: 4),
                Text(
                  widget.trabalhador.avaliacao,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.trabalhador.urlImagem),
              backgroundColor: Color(0xFF6F6F6F),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _mensagens.isEmpty
                ? Center(
                    child: Text(
                      'Comece uma conversa',
                      style: GoogleFonts.poppins(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    itemCount: _mensagens.length,
                    itemBuilder: (context, index) {
                      final msg = _mensagens[index];
                      return _construirMensagem(
                        texto: msg['content'] ?? '',
                        isUsuario: msg['role'] == 'user',
                      );
                    },
                  ),
          ),

          if (_mostrandoIndicadorDigitacao)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF2D2D2D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            3,
                            (i) => AnimatedContainer(
                              duration: Duration(milliseconds: 600),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.white54,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${widget.trabalhador.nome} está digitando...',
                        style: GoogleFonts.poppins(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          Container(
            color: Color(0xFF2D2D2D),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: GoogleFonts.poppins(color: Colors.white),
                    enabled: !_carregando,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      hintStyle: GoogleFonts.poppins(color: Colors.white54),
                      filled: true,
                      fillColor: Color(0xFF1F1F1F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Color(0xFFFF6B00),
                  radius: 24,
                  child: _carregando
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 2,
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.send),
                          color: Colors.white,
                          onPressed: _enviarMensagem,
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

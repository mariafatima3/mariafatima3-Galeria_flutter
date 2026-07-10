import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MeuAplicativoGaleria());
}

class MeuAplicativoGaleria extends StatelessWidget {
  const MeuAplicativoGaleria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Nativo - Galeria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const TelaGaleria(),
    );
  }
}

class TelaGaleria extends StatefulWidget {
  const TelaGaleria({super.key});

  @override
  State<TelaGaleria> createState() => _TelaGaleriaState();
}

class _TelaGaleriaState extends State<TelaGaleria> {
  final List<XFile> _imagensSelecionadas = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _selecionarImagens() async {
    try {
      final List<XFile> imagens = await _picker.pickMultiImage();
      if (imagens.isNotEmpty) {
        setState(() {
          _imagensSelecionadas.addAll(imagens);
        });
      }
    } catch (e) {
      debugPrint('Erro ao selecionar imagens: $e');
    }
  }

  void _removerImagem(int index) {
    setState(() {
      _imagensSelecionadas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Galeria'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _imagensSelecionadas.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Nenhuma imagem selecionada.\nClique no botão "+" para adicionar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _imagensSelecionadas.length,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          _imagensSelecionadas[index].name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _removerImagem(index),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(blurRadius: 2, color: Colors.black26)
                            ],
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selecionarImagens,
        tooltip: 'Selecionar Imagens',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

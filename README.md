# mariafatima3-Galeria_flutter

# Recursos Nativos em Flutter: Acesso à Galeria

Este projeto foi desenvolvido como parte da atividade prática de Recursos Nativos em Flutter. O objetivo principal é demonstrar o acesso ao armazenamento de mídia do dispositivo utilizando o pacote oficial `image_picker`.

## 👤 Integrante
* **Maria de Fátima de Araújo Sousa**

## 📱 Sobre o Aplicativo
O aplicativo simula uma galeria de fotos integrada em formato de grade (estilo Instagram). Ele permite que o usuário:
1. Clique no botão de ação flutuante (`FloatingActionButton`).
2. Acesse a galeria nativa do dispositivo com segurança.
3. Selecione imagens e as visualize organizadas em uma grade de 3 colunas na tela.

## 🗑️ Função Extra Adicionada: Remoção de Imagens
Como diferencial prático no desafio, foi implementada a funcionalidade de apagar mídias da tela:
* Ao clicar no ícone de lixeira vermelha (`Icons.delete`) posicionado sobre a imagem, o método `_removerImagem(index)` é acionado.
* O estado é atualizado via `setState`, removendo o item exato da lista e atualizando a grade instantaneamente.

## 📦 Pacotes Utilizados
* `image_picker`: Responsável pela comunicação assíncrona com o hardware do sistema operacional para abrir e selecionar mídias da galeria.
* `dart:io`: Utilizado para a manipulação e exibição dos arquivos de imagem (`File`) recuperados.

## 🛠️ Desafio Nativo (Permissões)
Para que este aplicativo funcione em um smartphone real fora do ambiente de testes, são necessárias as seguintes configurações de permissão:

* **Android (`AndroidManifest.xml`):**
```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
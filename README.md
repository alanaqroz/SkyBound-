<div align="center">

<img src="SkyBound/Assets.xcassets/AppIcon.appiconset/logoskybound.png" alt="SkyBound Logo" width="140" style="border-radius: 30px;" />

# SkyBound 🪐

**Registre suas conquistas. Celebre cada vitória.**

![Swift](https://img.shields.io/badge/Swift-5.0-orange?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-blue?style=for-the-badge&logo=apple&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-17.6+-black?style=for-the-badge&logo=apple&logoColor=white)
![SwiftData](https://img.shields.io/badge/SwiftData-purple?style=for-the-badge&logo=apple&logoColor=white)
![Architecture](https://img.shields.io/badge/MVVM-Architecture-9673D2?style=for-the-badge)

</div>

---

## Sobre o projeto

O **SkyBound** é um app iOS para registrar e celebrar suas conquistas pessoais. Cada vitória merece ser lembrada — seja grande ou pequena. Adicione uma foto, escreva sobre o momento e organize tudo por categoria. Porque todo voo começa com um passo.

---

## Funcionalidades

- 📸 **Registro com foto** — capture o momento da sua conquista com uma imagem
- 🗂️ **Categorias** — organize suas conquistas por tema com cores e ícones únicos
- 🔍 **Filtro por categoria** — encontre rapidamente o que procura
- ✏️ **Edição** — atualize título, descrição, foto e categoria quando quiser
- 🗑️ **Exclusão** — remova conquistas com um toque
- 🌙 **Dark Mode** — interface adaptada para modo claro e escuro
- 💾 **Persistência local** — tudo salvo no dispositivo com SwiftData

---

## Categorias

| Categoria | Ícone | Cor (Light) | Cor (Dark) |
|---|---|---|---|
| 💜 Saúde | `heart.fill` | Wisteria `#9673D2` | Subtle `#E2CEF3` |
| 📚 Estudos | `book.fill` | Thistle `#7D45C6` | Lilac `#CCAAE6` |
| 👤 Pessoal | `person.fill` | Mauve `#7E42AC` | Lavender `#A788DC` |
| 🏃 Fitness | `figure.run` | Orchid `#6B297C` | Wisteria `#9673D2` |
| 🎨 Criatividade | `paintbrush.fill` | Amethyst `#4F1176` | Thistle `#7D45C6` |

---

## Arquitetura

O projeto segue o padrão **MVVM** (Model-View-ViewModel):

```
SkyBound/
├── Model/
│   └── Conquista.swift            # Entidade SwiftData + enum Categoria
├── View/
│   ├── HomeView.swift             # Tela principal com filtros
│   ├── CardConquistaView.swift    # Card com badge de categoria
│   ├── ConquistaDetalheView.swift # Tela de detalhe
│   ├── SheetView.swift            # Criação e edição
│   ├── ContentView.swift
│   └── IntroView.swift
├── ViewModel/
│   └── ConquistasViewModel.swift  # Lógica de filtro e persistência
└── Helpers/
    └── ImagePicker.swift          # Bridge UIKit → SwiftUI
```

---

## Tecnologias

| Tecnologia | Uso |
|---|---|
| **SwiftUI** | Interface declarativa |
| **SwiftData** | Persistência local |
| **MVVM** | Arquitetura do projeto |
| **UIKit (ImagePicker)** | Acesso à galeria de fotos |
| **Xcode 16+** | File System Synchronized Groups |

---

## Como rodar

1. Clone o repositório
```bash
git clone https://github.com/alanaqroz/SkyBound-.git
```

2. Abra o arquivo `SkyBound.xcodeproj` no Xcode

3. Selecione um simulador ou dispositivo com **iOS 17.6+**

4. Rode com `⌘ + R`

> Não é necessário nenhuma dependência externa — o projeto usa apenas frameworks nativos da Apple.

---

##  Desenvolvido por

<div align="center">

Feito por **Alana Queiroz**

[![GitHub](https://img.shields.io/badge/GitHub-alanaqroz-181717?style=for-the-badge&logo=github)](https://github.com/alanaqroz)

</div>

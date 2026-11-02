# ONG Sementes do Amanhã

Projeto inicial do Projeto Integrador Extensionista II. A aplicação demonstra a comunicação de uma página Vanilla JavaScript com uma API Express, exibindo o estado do serviço e o horário recebido do backend.

## Tecnologias

- Vite+ e Vite
- JavaScript (Vanilla)
- Node.js
- Express
- dotenv

## Pré-requisitos

- Node.js 24.11 ou superior
- npm 11.13 ou superior
- Git

## Como executar

Clone o repositório e entre na pasta do projeto:

```bash
git clone https://github.com/manoelborborema/suaong.git
cd suaong
```

Instale as dependências:

```bash
npm install
```

Crie o arquivo `.env` a partir do exemplo. No PowerShell:

```powershell
Copy-Item .env.example .env
```

No macOS ou Linux:

```bash
cp .env.example .env
```

O arquivo define `PORT=3000` para a API Express. O `.env` é local e ignorado pelo Git; `.env.example` contém apenas a configuração não sensível necessária para iniciar o projeto.

Abra dois terminais na pasta `suaong`. No primeiro, inicie a API:

```bash
npm run api
```

No segundo, inicie a interface Vite+:

```bash
npm run dev
```

Acesse [http://localhost:5173](http://localhost:5173). Para verificar a API diretamente, acesse [http://localhost:3000/api/health](http://localhost:3000/api/health).

## Integração frontend e API

Ao carregar, a página faz uma requisição `GET /api/health`. O Vite encaminha caminhos `/api` para a porta configurada por `PORT` (ou para a porta padrão `3000`), preservando a rota. Assim, o navegador acessa a API pela mesma origem do frontend durante o desenvolvimento. A resposta inclui o status `ok` e um timestamp ISO gerado a cada chamada.

Se a API estiver parada ou retornar uma resposta inválida, a interface mostra uma mensagem de indisponibilidade sem interromper a página.

## Build de produção

```bash
npm run build
```

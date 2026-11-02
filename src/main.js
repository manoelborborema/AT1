import "./style.css";

document.querySelector("#app").innerHTML = `
  <main class="page-shell">
    <p class="eyebrow">Projeto Integrador Extensionista II</p>
    <h1>ONG Sementes do Amanhã</h1>
    <p class="intro">Cultivando oportunidades e fortalecendo nossa comunidade.</p>
    <section class="health-card" aria-labelledby="health-title">
      <div class="health-card__icon" aria-hidden="true">✳</div>
      <div>
        <h2 id="health-title">Conexão com a API</h2>
        <p id="api-status" class="api-status" role="status" aria-live="polite">Verificando comunicação...</p>
        <p id="api-time" class="api-time"></p>
        <p id="api-error" class="api-error" role="alert" hidden></p>
      </div>
    </section>
    <footer>Uma iniciativa de cuidado, presença e transformação.</footer>
  </main>
`;

const statusElement = document.querySelector("#api-status");
const timestampElement = document.querySelector("#api-time");
const errorElement = document.querySelector("#api-error");

async function checkApiHealth() {
  try {
    const response = await fetch("/api/health");
    if (!response.ok) throw new Error(`A API respondeu com o código ${response.status}.`);

    const health = await response.json();
    if (health.status !== "ok" || !health.timestamp) {
      throw new Error("A resposta da API está em um formato inesperado.");
    }

    statusElement.textContent = `Status da API: ${health.status}`;
    statusElement.dataset.state = "ok";
    timestampElement.textContent = `Última verificação: ${new Date(health.timestamp).toLocaleString("pt-BR")}`;
  } catch (error) {
    statusElement.textContent = "Status da API: indisponível";
    statusElement.dataset.state = "error";
    errorElement.hidden = false;
    errorElement.textContent =
      error instanceof Error
        ? `Não foi possível conectar à API. ${error.message}`
        : "Não foi possível conectar à API. Tente novamente em instantes.";
  }
}

checkApiHealth();

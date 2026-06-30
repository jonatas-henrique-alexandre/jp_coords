# 📍 jp_coords - Captura Rápida de Coordenadas

Um script otimizado para servidores FiveM que facilita e acelera o processo de captura de coordenadas para desenvolvedores e administradores.

Esqueça a necessidade de digitar comandos repetitivos ou copiar dados linha por linha no console (F8). Com o **jp_coords**, você ativa o modo de captura, anda pelo mapa e registra múltiplas coordenadas apenas pressionando uma tecla.

Preview: https://youtu.be/PW_smek3JCA

## 🚀 Características

- **Interface Limpa:** Utiliza a TextUI nativa do `ox_lib` para exibir as instruções na tela.
- **Captura Rápida:** Registre coordenadas instantaneamente ao pressionar a tecla `E` (configurável).
- **Multi-Formatação Automática:** Salva a mesma coordenada simultaneamente em formatos `vec3`, `vec4` e tabelas (`table_vec3`, `table_vec4`), prontos para copiar e colar em qualquer script.
- **Integração com Discord:** Envia as coordenadas capturadas diretamente para um ou mais canais do Discord via Webhook, formatadas em blocos de código Lua.
- **Salvamento Local:** Injeta os dados capturados automaticamente em um arquivo `.txt` dentro da própria pasta do script.
- **Segurança:** Sistema de permissões integrado via `ox_lib` para garantir que apenas administradores acessem o comando.
- **Otimizado:** Consumo de **0.00ms** (resmon) quando inativo.

## 📦 Dependências

- [ox_lib](https://github.com/overextended/ox_lib) (Obrigatório para interface e sistema de comandos)

## 🛠️ Instalação

1. Faça o download deste repositório ou clone usando o Git.
2. Extraia a pasta `jp_coords` e coloque-a dentro da pasta `resources` (ou subpasta de sua preferência) do seu servidor.
3. Certifique-se de que o arquivo `coordenadas.txt` existe e está vazio dentro da pasta do script.
4. Adicione a seguinte linha no seu `server.cfg`, garantindo que inicie **após** o `ox_lib`:

```cfg
ensure jp_coords
```

## ⚙️ Configuração

Toda a personalização é feita no arquivo `config.lua`. Você não precisa mexer no código principal para adaptar o script ao seu servidor.

```lua
Config.CommandName = 'pegarvec'          -- Comando para ativar/desativar
Config.AdminGroup = 'group.admin'        -- Grupo com permissão para usar
Config.KeyToPress = 38                   -- Tecla de captura (Padrão: 38 / E)
Config.SaveFile = 'coordenadas.txt'      -- Arquivo de salvamento local

-- Adicione seus links de Webhook do Discord aqui:
Config.Webhooks = {
    'SEU_LINK_WEBHOOK_AQUI',
}
```

## 💻 Como Usar

1. No jogo, abra o console (F8) ou o chat e digite o comando configurado (padrão: `pegarvec`).
2. Uma notificação da interface aparecerá na tela indicando que o modo está **ATIVADO**.
3. Caminhe até o local desejado e pressione a tecla **E**.
4. Uma caixa de texto se abrirá. Você pode digitar um nome para o local (ex.: `praca_central`) ou deixar em branco.
5. Pressione **Enter**. Os dados serão salvos no arquivo `.txt` e enviados para o Discord.
6. Repita o processo quantas vezes quiser.
7. Para sair do modo de captura, digite o comando `pegarvec` novamente.

## 📄 Exemplo de Saída (Output)

```lua
name = 'forumdrive',
coords = vec3(-168.07, -1662.80, 33.31),
coords = vec4(-168.07, -1662.80, 33.31, 137.50),
table_vec3 = { x = -168.07, y = -1662.80, z = 33.31 },
table_vec4 = { x = -168.07, y = -1662.80, z = 33.31, w = 137.50 },
```

---

**Desenvolvido para a comunidade FiveM.** Sinta-se à vontade para fazer forks, sugerir melhorias via Pull Requests ou relatar problemas na aba de Issues.

-- Função para enviar a mensagem para todos os webhooks configurados
local function SendToDiscord(textoFormatado)
    -- Verifica se existem webhooks configurados
    if not Config.Webhooks or #Config.Webhooks == 0 then return end

    -- Estrutura visual da mensagem no Discord (Embed)
    local embed = {
        {
            ["color"] = 3447003, -- Cor azulzinha na lateral
            ["title"] = "📍 Nova Coordenada Multi-Formatada",
            ["description"] = "```lua\n" .. textoFormatado .. "```",
            ["footer"] = {
                ["text"] = "Sistema jp_coords",
            },
        }
    }

    -- Laço de repetição para enviar para TODOS os links listados no Config
    for _, webhookLink in ipairs(Config.Webhooks) do
        -- Validação para garantir que é um link válido
        if webhookLink ~= "" and string.find(webhookLink, "http") then
            PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({
                username = "Bot de Coordenadas", 
                embeds = embed
            }), { ['Content-Type'] = 'application/json' })
        end
    end
end

-- Cria o comando restrito para administradores baseado no Config
lib.addCommand(Config.CommandName, {
    help = 'Ativar/Desativar modo de captura rápida de coordenadas',
    restricted = Config.AdminGroup
}, function(source, args, raw)
    TriggerClientEvent('jp_coords:toggleMode', source)
end)

-- Recebe os dados do client, formata em múltiplos estilos, salva no arquivo e envia pro Discord
RegisterNetEvent('jp_coords:saveCoords', function(data)
    local src = source

    local name = data.name
    local x, y, z, w = data.x, data.y, data.z, data.w

    -- Monta a string contendo TODAS as variações solicitadas de forma automática
    local formattedString = string.format(
        "name = '%s',\n" ..
        "coords = vec3(%.2f, %.2f, %.2f),\n" ..
        "coords = vec4(%.2f, %.2f, %.2f, %.2f),\n" ..
        "table_vec3 = { x = %.2f, y = %.2f, z = %.2f },\n" ..
        "table_vec4 = { x = %.2f, y = %.2f, z = %.2f, w = %.2f },\n",
        name, 
        x, y, z, 
        x, y, z, w, 
        x, y, z, 
        x, y, z, w
    )

    -- 1. Salva no TXT local dentro da pasta do script
    local resourceName = GetCurrentResourceName()
    local currentFileContent = LoadResourceFile(resourceName, Config.SaveFile) or ""
    
    -- Evita criar uma linha em branco no topo se o arquivo estiver totalmente vazio
    local newContent = currentFileContent == "" and formattedString or currentFileContent .. "\n" .. formattedString
    SaveResourceFile(resourceName, Config.SaveFile, newContent, -1)

    -- 2. Envia para os canais do Discord configurados
    SendToDiscord(formattedString)

    -- Avisa o admin na tela que salvou com sucesso
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Salvo com sucesso!',
        description = 'Todos os formatos salvos no TXT e Discord.',
        type = 'success'
    })
end)
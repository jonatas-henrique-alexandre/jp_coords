Config = {}

-- ==========================================
-- CONFIGURAÇÕES GERAIS
-- ==========================================
Config.CommandName = 'pegarvec'          -- Nome do comando (usado no F8 ou chat)
Config.AdminGroup = 'group.admin'        -- Permissão necessária (padrão ox/qbox)
Config.KeyToPress = 38                   -- Tecla para capturar (38 = E)
Config.SaveFile = 'coordenadas.txt'      -- Nome do arquivo onde será salvo

-- ==========================================
-- CONFIGURAÇÕES DE DISCORD WEBHOOKS
-- ==========================================
-- Adicione quantos links quiser abaixo. 
-- Se não quiser usar temporariamente, basta deixar a tabela vazia: Config.Webhooks = {}
Config.Webhooks = {
    'https://discord.com/api/webhooks/1418197845525135440/xTdhfgcTtW3sruheQ7tI1mElwnHP-MWMRzsPhpvZeihHqQve1fbQbzXTmVocyiR3SvSb',
    -- 'COLOQUE_SEU_LINK_DO_WEBHOOK_AQUI_2',
    -- 'COLOQUE_SEU_LINK_DO_WEBHOOK_AQUI_3',
}

-- ==========================================
-- CONFIGURAÇÕES DA INTERFACE (TEXT UI)
-- ==========================================
Config.UI = {
    Position = 'left-center', -- Posição: 'right-center', 'left-center', 'top-center'
    Icon = 'map-location-dot',
    Text = '📍 **MODO CAPTURA ATIVADO**\n\nVá até o local desejado e\npressione **[ E ]** para salvar.\n\n*Digite o comando novamente para sair.*'
}

-- ==========================================
-- CONFIGURAÇÕES DO MENU DE INPUT (OX_LIB)
-- ==========================================
Config.Input = {
    Title = 'Registrar Coordenada',
    Label = 'Nome do local (deixe em branco se não quiser nome):',
    Placeholder = 'Ex: praca_central'
}
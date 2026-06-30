local isCaptureModeActive = false

-- Função que inicia o "escutador" de teclas
local function StartCaptureThread()
    CreateThread(function()
        while isCaptureModeActive do
            Wait(0)
            
            -- Se apertar a tecla E (Config.KeyToPress)
            if IsControlJustReleased(0, Config.KeyToPress) then
                -- Esconde o TextUI rapidinho pra não sobrepor a janela de input
                lib.hideTextUI()
                
                -- Abre o input do ox_lib
                local input = lib.inputDialog(Config.Input.Title, {
                    {type = 'input', label = Config.Input.Label, placeholder = Config.Input.Placeholder}
                })

                -- Se o jogador não cancelar o menu (apertar ESC)
                if input then
                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    local locName = input[1] or "" 

                    -- Dispara os dados pro servidor (AGORA COM O NOME CORRETO JP_COORDS)
                    TriggerServerEvent('jp_coords:saveCoords', {
                        name = locName,
                        x = coords.x,
                        y = coords.y,
                        z = coords.z,
                        w = heading
                    })
                end

                -- Se o modo continuar ativo, volta a exibir o TextUI na tela
                if isCaptureModeActive then
                    lib.showTextUI(Config.UI.Text, {
                        position = Config.UI.Position,
                        icon = Config.UI.Icon
                    })
                end
            end
        end
    end)
end

-- Evento que recebe o comando do servidor e alterna o status
RegisterNetEvent('jp_coords:toggleMode', function()
    isCaptureModeActive = not isCaptureModeActive

    if isCaptureModeActive then
        lib.showTextUI(Config.UI.Text, {
            position = Config.UI.Position,
            icon = Config.UI.Icon
        })
        StartCaptureThread()
        lib.notify({title = 'Sistema de Coordenadas', description = 'Modo de captura ATIVADO.', type = 'success'})
    else
        lib.hideTextUI()
        lib.notify({title = 'Sistema de Coordenadas', description = 'Modo de captura DESATIVADO.', type = 'error'})
    end
end)
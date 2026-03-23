local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local g = self.view
    local params = event.params or {}

    local cx = display.contentCenterX
    local cy = display.contentCenterY

    display.setDefault("background", 0, 0.1, 0.2)

    --------------------------------------------------
    -- UI
    --------------------------------------------------
    display.newText(g, "Diagnóstico Médico", cx, 70, native.systemFontBold, 22)

    local caja = display.newRoundedRect(g, cx, cy, 300, 200, 15)
    caja:setFillColor(0, 0.3, 0.5, 0.8)

    local resultado = display.newText({
        parent = g,
        text = "",
        x = cx,
        y = cy,
        width = 260,
        font = native.systemFont,
        fontSize = 16,
        align = "center"
    })

    --------------------------------------------------
    -- 🔥 LEER VARIABLES GUARDADAS
    --------------------------------------------------
    local sintoma = params.sintoma
    local presionAlta = composer.getVariable("presionAlta")
    local oxigenoBajo = composer.getVariable("oxigenoBajo")

    --------------------------------------------------
    -- LÓGICA INTELIGENTE
    --------------------------------------------------
    local diagnostico = ""
    local recomendacion = ""

    if sintoma == "mareo" then
        
        if presionAlta and oxigenoBajo then
            diagnostico = "Riesgo crítico"
            recomendacion = "Reducir profundidad y administrar oxígeno urgente."
        elseif presionAlta then
            diagnostico = "Narcosis por nitrógeno"
            recomendacion = "Reducir profundidad."
        elseif oxigenoBajo then
            diagnostico = "Hipoxia leve"
            recomendacion = "Administrar oxígeno."
        else
            diagnostico = "Mareo leve"
            recomendacion = "Descanso."
        end

    elseif sintoma == "dolor" then

        if presionAlta and oxigenoBajo then
            diagnostico = "Descompresión grave"
            recomendacion = "Oxígeno y ascenso controlado."
        elseif presionAlta then
            diagnostico = "Posible descompresión"
            recomendacion = "Reposo y oxígeno."
        else
            diagnostico = "Dolor muscular"
            recomendacion = "Reposo."
        end

    elseif sintoma == "respirar" then

        if oxigenoBajo and presionAlta then
            diagnostico = "Fallo respiratorio crítico"
            recomendacion = "Evacuación inmediata."
        elseif oxigenoBajo then
            diagnostico = "Hipoxia"
            recomendacion = "Administrar oxígeno."
        elseif presionAlta then
            diagnostico = "Dificultad por presión"
            recomendacion = "Reducir profundidad."
        else
            diagnostico = "Normal"
            recomendacion = "Monitoreo."
        end
    end

    --------------------------------------------------
    -- MOSTRAR RESULTADO
    --------------------------------------------------
    resultado.text =
        "Diagnóstico:\n" .. diagnostico .. "\n\n" ..
        "Recomendación:\n" .. recomendacion

    --------------------------------------------------
    -- BOTÓN VOLVER
    --------------------------------------------------
    local backBtn = display.newRoundedRect(g, cx, cy + 170, 200, 45, 12)
    backBtn:setFillColor(0.8, 0.2, 0.2)

    display.newText(g, "Volver", cx, cy + 170, native.systemFontBold, 16)

    backBtn:addEventListener("tap", function()
        composer.gotoScene("menu", {effect="slideRight", time=400})
    end)
end

scene:addEventListener("create", scene)
return scene
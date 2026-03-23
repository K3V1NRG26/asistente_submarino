local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
    local g = self.view
    local cx = display.contentCenterX
    local cy = display.contentCenterY

    --------------------------------------------------
    -- FONDO
    --------------------------------------------------
    local fondo = display.newImageRect(g, "fondo.png",
        display.actualContentWidth,
        display.actualContentHeight)
    fondo.x = cx
    fondo.y = cy

    --------------------------------------------------
    -- TÍTULO
    --------------------------------------------------
    display.newText(g, "Asistente Médico Submarino", cx, 70, native.systemFontBold, 20)

    --------------------------------------------------
    -- VARIABLES
    --------------------------------------------------
    local presionAlta = false
    local oxigenoBajo = false

    --------------------------------------------------
    -- BOTONES DE CONDICIÓN
    --------------------------------------------------
    local btnPresion = display.newText(g, "Presión alta: NO", cx, cy - 80, native.systemFontBold, 16)
    local btnOxigeno = display.newText(g, "Oxígeno bajo: NO", cx, cy - 40, native.systemFontBold, 16)

    btnPresion:addEventListener("tap", function()
        presionAlta = not presionAlta
        btnPresion.text = "Presión alta: " .. (presionAlta and "SI" or "NO")
    end)

    btnOxigeno:addEventListener("tap", function()
        oxigenoBajo = not oxigenoBajo
        btnOxigeno.text = "Oxígeno bajo: " .. (oxigenoBajo and "SI" or "NO")
    end)

    --------------------------------------------------
    -- FUNCIÓN BOTÓN
    --------------------------------------------------
    local function crearBoton(texto, y, sintoma)
        local btn = display.newRoundedRect(g, cx, y, 260, 50, 12)
        btn:setFillColor(0, 0, 0, 0.6)

        display.newText(g, texto, cx, y, native.systemFontBold, 16)

        btn:addEventListener("tap", function()
            -- 🔥 GUARDAR VARIABLES GLOBALMENTE
            composer.setVariable("presionAlta", presionAlta)
            composer.setVariable("oxigenoBajo", oxigenoBajo)

            composer.gotoScene("diagnostico", {
                effect = "slideLeft",
                time = 400,
                params = {
                    sintoma = sintoma
                }
            })
        end)
    end

    --------------------------------------------------
    -- BOTONES
    --------------------------------------------------
    crearBoton("Mareo intenso", cy + 40, "mareo")
    crearBoton("Dolor articular", cy + 110, "dolor")
    crearBoton("Dificultad para respirar", cy + 180, "respirar")
end

scene:addEventListener("create", scene)
return scene
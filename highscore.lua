
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------


-- print( screenWidth .. screenHeight)

-- "scene:create()"
function scene:create( event )  
    local screenWidth, screenHeight = display.contentWidth, display.contentHeight
    local screenCenter = { x = screenWidth / 2, y = screenHeight / 2 }
    local GRID_WIDTH = 6
    local GRID_HEIGHT = 6
    local CELL_WIDTH = screenWidth / GRID_WIDTH * 5 / 6
    local CELL_HEIGHT = screenHeight / GRID_HEIGHT * 2 / 3
    local OFFSET_WIDTH = screenWidth * 1 / 12
    local OFFSET_HEIGHT = screenHeight * 1 / 6
    local CIRCLE_RADIUS = CELL_WIDTH / 2
    local sceneGroup = self.view
    local highscoreVal = 0
    local path = system.pathForFile( "highscore.txt", system.DocumentsDirectory )

        -- Open the file handle
        local file, errorString = io.open( path, "r" )

        if not file then
            -- Error occurred; output the cause
            print( "File error: " .. errorString )
        else
            local contents = file:read( "*a" )
            if contents == "" then
                --file:write( score )
            else
                highscoreVal = contents
            end
            -- Close the file handle
            io.close( file )
        end


    local corridor = display.newImageRect( "assets/corridor.png", 720, 1280 )
    corridor.x = screenWidth / 2
    corridor.y = screenHeight / 2
    sceneGroup:insert(corridor)
    local backButton = display.newRoundedRect( screenCenter.x, screenCenter.y+400, 350, 150 ,20)
    backButton.tapListener = function(event)
        composer.gotoScene("start")
    end
    backButton:setFillColor(0,0,0)
    sceneGroup:insert(backButton)
    local titleText = display.newText({x=screenCenter.x , y=screenCenter.y -300, text="HIGH SCORE" ,fontSize=90,font=native.systemFontBold})
    local titleText2 = display.newText({x=screenCenter.x , y=screenCenter.y - 100 , text=highscoreVal,fontSize=90,font=native.systemFontBold})
    sceneGroup:insert(titleText2)
    sceneGroup:insert(titleText)
    local backText = display.newText({x=screenCenter.x , y=screenCenter.y +400, text="BACK" ,fontSize=50,font=native.systemFontBold})
    backText:setFillColor(1,1,1)
    sceneGroup:insert(backText)
    backButton:addEventListener( "tap", backButton.tapListener)
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: back timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
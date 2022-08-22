;SOT ANIT AFK SOFTWARE PRO V2 PLUS - 31b4
;if u r sot dev PLEASE fix hitreg :D
#Usehook
;GUI config
Gui, Color, cd5c27
Gui, Add, Button, x10 y10 gStart_Button, start
Gui, Add, Button, x60 y10 gStop_Button, stop
Gui, Show, w500 h500,SoT Anti AFK Software Pro V2 Plus
AntiAFKActive := False ;status of anti afk
Return

GuiClose:
    ExitApp
;END GUI config


Start_Button:
    Gui, Color, 7dca5c
    Start_Anti_AFK()
    
return
Stop_Button:
    Gui, Color, cd5c27
    Stop()
return
;SHORTCUTS---------------------
g:: ;pause
    Send, g
    Stop()

return

h:: ;start
    Start_Anti_AFK()
return
;-------------------------------

Start_Anti_AFK(){
    global AntiAFKActive := True
    loop {
        global AntiAFKActive ;HIBAAAAAAAAAAAAAAAA
        if(AntiAFKActive){
            if(CheckSotRunning() && CheckSotActive()){
                Jump()
                Sleep, 75
            }
        }
        else{
            return
        }
        Sleep, 1000
    
    }
    Return
}


;FUNCTIONS-------------------------
Jump(){
    Send, {Space Down}
    sleep, 50
    Send, {Space Up}
    return
}


CheckSotRunning(){
    Process, Exist, SoTGame.exe
    If (!ErrorLevel = 0) {
        Return True ; running
    } else {
        Return False ; not running   
    }
}

CheckSotActive(){
    WinGetTitle, active_window_title, A
    If (active_window_title = "Sea of Thieves") {
         Return True ;active
    } else {
        Return False ;inactive
    }
}
Stop(){
    global AntiAFKActive := False
}


;---------------------------------------











j::ExitApp ;Full stop
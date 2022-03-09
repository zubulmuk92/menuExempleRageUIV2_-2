Citizen.CreateThread(function()

    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,166) then
            menu()
        end
    end

end)

function menu()

    local etat=true
    local IndexList=1

    local menuTestNumero2 = RageUI.CreateMenu("Titre","sous-titre")

    RageUI.Visible(menuTestNumero2, not RageUI.Visible(menuTestNumero2))

    while menuTestNumero2 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menuTestNumero2,true,true,true,function()
        
            RageUI.List("Titre liste : ", {"Exemple1","Exemple2","Exemple3"}, IndexList,nil,{},true,{
                onListChange= function(Index,Item)
                    IndexList=Index
                end,
                onSelected = function(Index, Item)
                    print(Index)
                    print(Item)

                end
            })

            RageUI.Separator("")

            RageUI.Checkbox("Titre Checkbox",nil, etat,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    etat = Checked
                    if etat==true then
                        print("La checkbox est en true")
                    else
                        print("La checkbox est en false")
                    end
                end
            end)
        
        end, function()
        end)

        if not RageUI.Visible(menuTestNumero2) then
            menuTestNumero2=RMenu:DeleteType("Titre", true)
        end

    end

end
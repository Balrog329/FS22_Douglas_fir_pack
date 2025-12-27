-- DouglasRandomDeath.lua
-- Mortalité aléatoire des Douglas au passage du stade 9 → 10

DouglasRandomDeath = {}
DouglasRandomDeath.checkedTrees = {} -- pour ne pas traiter plusieurs fois le même arbre

-- Hook sur la fonction growTree de TreeGrowthSystem
function DouglasRandomDeath:loadMap(name)
    if g_currentMission == nil or g_currentMission.treeGrowthSystem == nil then
        print("TreeGrowthSystem non trouvé, DouglasRandomDeath désactivé")
        return
    end

    local growthSystem = g_currentMission.treeGrowthSystem

    -- Sauvegarde de l'ancienne fonction
    self.oldGrowTree = growthSystem.growTree

    -- Redéfinition de growTree
    growthSystem.growTree = function(manager, tree, ...)
        -- Vérifie si c'est un Douglas vivant au stade 9
        if tree.treeType == "DOUGLASFIR" and tree.growthStateI == 9 and not DouglasRandomDeath.checkedTrees[tree] then
            DouglasRandomDeath.checkedTrees[tree] = true

            local chance = math.random(1, 100)
            if chance <= 90 then
                -- 10% : passe en Douglas mort
                tree.treeType = "DRYDOUGLAS"      -- name défini dans mapTrees.xml
                tree.growthStateI = 3              -- stade correspondant au début de drydouglas
                print("Douglas mort généré au passage du stade 9")
            else
                -- 90% : continue vers le stade 10
                tree.growthStateI = 10
                print("Douglas survit et passe au stade 10")
            end
        end

        -- Appelle le comportement normal
        return DouglasRandomDeath.oldGrowTree(manager, tree, ...)
    end

    print("Hook DouglasRandomDeath installé")
end

addModEventListener(DouglasRandomDeath)











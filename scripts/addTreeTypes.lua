<<<<<<< HEAD
-- LP and BMP

addTreeTypes = {}

local modDir = g_currentModDirectory
local modName = g_currentModName

function addTreeTypes.loadDefaultTypes(self, superFunc, missionInfo, baseDirectory)
    -- Call the original function to load default tree types
    superFunc(self, missionInfo, baseDirectory)

    -- Set maxNumTrees to 45000
    g_treePlantManager.maxNumTrees = 45000
    Logging.info("[addTreeTypes] Set maxNumTrees to 45000")

    -- Load the custom tree types XML file
    local xmlFile = loadXMLFile("treeTypes", modDir .. "maps_treeTypes.xml")
    g_treePlantManager:loadTreeTypes(xmlFile, missionInfo, modDir, false)

    -- Clean up
    delete(xmlFile)
end

=======
-- LP and BMP

addTreeTypes = {}

local modDir = g_currentModDirectory
local modName = g_currentModName

function addTreeTypes.loadDefaultTypes(self, superFunc, missionInfo, baseDirectory)
    -- Call the original function to load default tree types
    superFunc(self, missionInfo, baseDirectory)

    -- Set maxNumTrees to 45000
    g_treePlantManager.maxNumTrees = 45000
    Logging.info("[addTreeTypes] Set maxNumTrees to 45000")

    -- Load the custom tree types XML file
    local xmlFile = loadXMLFile("treeTypes", modDir .. "maps_treeTypes.xml")
    g_treePlantManager:loadTreeTypes(xmlFile, missionInfo, modDir, false)

    -- Clean up
    delete(xmlFile)
end

>>>>>>> 44bf5fb (latest version)
TreePlantManager.loadDefaultTypes = Utils.overwrittenFunction(TreePlantManager.loadDefaultTypes, addTreeTypes.loadDefaultTypes)
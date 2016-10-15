-- file : config.lua
local module = {}

module.SSID = {}
module.SSID["Surveillance"] = "approved"
--module.SSID["ApprovedFood"] = "60softgels"
--module.SSID["SKY1C13D"] = "WVYWUYPR"

module.HOST = "iot.eclipse.org"  
module.PORT = 1883 
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"  
return module  

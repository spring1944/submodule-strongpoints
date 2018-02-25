local moduleInfo = {
	name = "strongpoints",
	desc = "strongpoints core",
	author = "PepeAmpere",
	date = "2018-01-28",
	license = "MIT",
}

listOfStrongpoints = {}

local strongpoints = {
	
	-- @description Creates new strongpoint
	-- @argument strongpointID [key] Unique key of given strongpoint. Can be unitID, but it is not necessary.
	-- @argument strongpointData [table] Definition table containing all parameters of new strongpoint
	["Add"] = function(strongpointID, strongpointData)
		listOfStrongpoints[strongpointID] = {}
		return strongpoints.Update(strongpointID, strongpointData)
	end,	
	
	-- @description Returns number of items in strongpoints table
	["Count"] = function()
		return tableExt.Length(listOfStrongpoints)
	end,
	
	-- @description Returns number of items in strongpoints table
	["GetAll"] = function()
		return listOfStrongpoints
	end,
	
	-- @description Update all parameters of the strongpoint
	-- @argument strongpointID [key] Unique key of given strongpoint. Can be unitID, but it is not necessary.
	-- @argument strongpointData [table] Table with all parameters to update for given one strongpoint
	["Update"] = function(strongpointID, strongpointData)
		for k,v in pairs (strongpointData) do
			listOfStrongpoints[strongpointID][k] = v
		end
		return listOfStrongpoints
	end,
	
	-- @description Update one parameter of given strongpoint
	-- @argument strongpointID [key] Unique key of given strongpoint. Can be unitID, but it is not necessary.
	-- @argument parameterName [string] Name of the parameter, key to the parameters tableExt
	-- @argument newValue [anything] New value of the parameter
	["UpdateParameter"] = function(strongpointID, parameterName, newValue)
		listOfStrongpoints[strongpointID][parameterName] = newValue
		return listOfStrongpoints
	end,
	
	-- @description Remove on strongpoint based on passed ID
	-- @argument strongpointID [key] Unique key of given strongpoint. Can be unitID, but it is not necessary.
	["Remove"] = function(strongpointID)
		listOfStrongpoints[strongpointID] = nil
		return listOfStrongpoints
	end,
}

return strongpoints


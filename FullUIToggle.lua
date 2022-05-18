FullUIToggle = {};

-- Debug mode --
local debugMode = false;

-- Global runtime variables --
local uiIsHidden = false;
local originalUnitNameOwnState = nil;
local originalUnitNameNPCState = nil;
local originalUnitNamePlayerState = nil;

function FullUIToggle.Toggle()
    if (uiIsHidden == false) then
        Debug("Hiding UI.");
        UIParent:Hide();
        RememberUnitnamestates();
        uiIsHidden = true;
    else
        Debug("Showing UI.");
        UIParent:Show();
        RestoreUnitNameStates();
        uiIsHidden = false;
    end
end

function RememberUnitnamestates()
    originalUnitNameOwnState = GetCVar("UnitNameOwn");
    originalUnitNameNPCState = GetCVar("UnitNameNPC");
    originalUnitNamePlayerState = GetCVar("UnitNamePlayer");
    SetCVar("UnitNameOwn", 0);
    SetCVar("UnitNameNPC", 0);
    SetCVar("UnitNamePlayer", 0);
    Debug("Saved state of UnitNameOwn (" .. originalUnitNameOwnState .. ") and set it to 0.");
    Debug("Saved state of UnitNameNPC (" .. originalUnitNameNPCState .. ") and set it to 0.");
    Debug("Saved state of UnitNamePlayer (" .. originalUnitNamePlayerState .. ") and set it to 0.");
end

function RestoreUnitNameStates()
    SetCVar("UnitNameOwn", originalUnitNameOwnState);
    SetCVar("UnitNameNPC", originalUnitNameOwnState);
    SetCVar("UnitNamePlayer", originalUnitNameOwnState);
    Debug("Restored state of UnitNameOwn (" .. originalUnitNameOwnState .. ").");
    Debug("Restored state of UnitNameNPC (" .. originalUnitNameNPCState .. ").");
    Debug("Restored state of UnitNamePlayer (" .. originalUnitNamePlayerState .. ").");
end

function Debug(text)
    if (debugMode) then
        DEFAULT_CHAT_FRAME:AddMessage("[FUIT] " .. text, 1, 1, 1);
    end
end

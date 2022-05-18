FullUIToggle = {};

-- Debug mode --
local debugMode = true;

-- Global runtime variables --
local uiIsHidden = false;
local originalUnitNameOwnState = nil;
local originalUnitNameNPCState = nil;
local originalUnitNamePlayerState = nil;

function FullUIToggle.Toggle()
    if (uiIsHidden == false) then
        FullUIToggle.Debug("Hiding UI.");
        UIParent:Hide();
        FullUIToggle.RememberUnitnamestates();
        uiIsHidden = true;
    else
        FullUIToggle.Debug("Showing UI.");
        UIParent:Show();
        FullUIToggle.RestoreUnitNameStates();
        uiIsHidden = false;
    end
end

function FullUIToggle.RememberUnitnamestates()
    originalUnitNameOwnState = GetCVar("UnitNameOwn");
    originalUnitNameNPCState = GetCVar("UnitNameNPC");
    originalUnitNamePlayerState = GetCVar("UnitNamePlayer");
    SetCVar("UnitNameOwn", 0);
    SetCVar("UnitNameNPC", 0);
    SetCVar("UnitNamePlayer", 0);
    FullUIToggle.Debug("Saved state of UnitNameOwn (" .. originalUnitNameOwnState .. ") and set it to 0.");
    FullUIToggle.Debug("Saved state of UnitNameNPC (" .. originalUnitNameNPCState .. ") and set it to 0.");
    FullUIToggle.Debug("Saved state of UnitNamePlayer (" .. originalUnitNamePlayerState .. ") and set it to 0.");
end

function FullUIToggle.RestoreUnitNameStates()
    SetCVar("UnitNameOwn", originalUnitNameOwnState);
    SetCVar("UnitNameNPC", originalUnitNameNPCState);
    SetCVar("UnitNamePlayer", originalUnitNamePlayerState);
    FullUIToggle.Debug("Restored state of UnitNameOwn (" .. originalUnitNameOwnState .. ").");
    FullUIToggle.Debug("Restored state of UnitNameNPC (" .. originalUnitNameNPCState .. ").");
    FullUIToggle.Debug("Restored state of UnitNamePlayer (" .. originalUnitNamePlayerState .. ").");
end

function FullUIToggle.Debug(text)
    if (debugMode) then
        DEFAULT_CHAT_FRAME:AddMessage("[FUIT] " .. text, 1, 1, 1);
    end
end

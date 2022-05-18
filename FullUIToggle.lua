-- Debug mode --
DebugMode = false;

-- Global runtime variables --
UiIsHidden = false;
OriginalUnitNameOwnState = nil;
OriginalUnitNameNPCState = nil;
OriginalUnitNamePlayerState = nil;


function Toggle()
    if (UiIsHidden == false) then
        Debug("Hiding UI.");
        UIParent:Hide();
        RememberUnitnamestates();
        UiIsHidden = true;
    else
        Debug("Showing UI.");
        UIParent:Show();
        RestoreUnitNameStates();
        UiIsHidden = false;
    end
end

function RememberUnitnamestates()
    OriginalUnitNameOwnState = GetCVar("UnitNameOwn");
    OriginalUnitNameNPCState = GetCVar("UnitNameNPC");
    OriginalUnitNamePlayerState = GetCVar("UnitNamePlayer");
    SetCVar("UnitNameOwn", 0);
    SetCVar("UnitNameNPC", 0);
    SetCVar("UnitNamePlayer", 0);
    Debug("Saved state of UnitNameOwn (" .. OriginalUnitNameOwnState .. ") and set it to 0.");
    Debug("Saved state of UnitNameNPC (" .. OriginalUnitNameNPCState .. ") and set it to 0.");
    Debug("Saved state of UnitNamePlayer (" .. OriginalUnitNamePlayerState .. ") and set it to 0.");
end

function RestoreUnitNameStates()
    SetCVar("UnitNameOwn", OriginalUnitNameOwnState);
    SetCVar("UnitNameNPC", OriginalUnitNameOwnState);
    SetCVar("UnitNamePlayer", OriginalUnitNameOwnState);
    Debug("Restored state of UnitNameOwn (" .. OriginalUnitNameOwnState .. ").");
    Debug("Restored state of UnitNameNPC (" .. OriginalUnitNameNPCState .. ").");
    Debug("Restored state of UnitNamePlayer (" .. OriginalUnitNamePlayerState .. ").");
end

function Debug(text)
    if (DebugMode) then
        DEFAULT_CHAT_FRAME:AddMessage("[FUIT] " .. text, 1, 1, 1);
    end
end

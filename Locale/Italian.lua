local AS, ASL = unpack(AddOnSkins)

function AS:UpdateLocale_itIT()
	ASL.DataText.ToggleEmbed = 'Alterna Integrazione' -- Hopefully right
	ASL.DataText.LeftClick = 'Left Click to Show'
	ASL.DataText.RightClick = 'Right Click to Hide'

	ASL.EmbedSystem.ToggleLeftChat = "Alterna Pannello Sinistro della Chat"
	ASL.EmbedSystem.ToggleRightChat = "Alterna Pannello Destro della Chat"
	ASL.EmbedSystem.ToggleEmbed = "Alterna Integrazione dell AddOn"
	ASL.EmbedSystem.ToggleOptions = "Alterna Customizzazioni/Opzioni Aggiuntive"

	ASL.OptionsPanel.SkinDesc = "Abilita/Disabilita questa customizzazione."
	ASL.OptionsPanel.EmbedDesc = "Abilita/Disabilita questa integrazione."
	ASL.OptionsPanel.OptionDesc = "Abilita/Disabilita questa opzione."

	-- Config Interface
	ASL["AddOn Skins"] = "Aspetto degli AddOn";
	ASL["Blizzard Skins"] = "Aspetto Blizzard";
	ASL["BossMod Options"] = "Opzioni DBM"
	ASL["DBM|VEM Font"] = "Carattere";
	ASL["DBM|VEM Font Size"] = "Dimensione";
	ASL["DBM|VEM Font Flag"] = "Contorno";
	ASL["None"] = "Nessuno";
	ASL["OUTLINE"] = "Normale";
	ASL["THICKOUTLINE"] = "Spesso";
	ASL["MONOCHROME"] = "Monocromatico";
	ASL["MONOCHROMEOUTLINE"] = "Monocromatico spesso";
	ASL["DBM|VEM Half-bar Skin"] = "Mezza Barra DBM";
	ASL["DBM Transparent Radar"] = "DBM Transparent Radar"
	ASL["BigWigs Half-Bar"] = "Mezza Barra BigWigs";
	ASL["Embed Settings"] = "Impostazioni di Integrazione"
	ASL["Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS"] = "Impostazioni per controllare l'integrazione degli AddOn:\n\nIntegrazioni Disponibili: alDamageMeter | Omen | Skada | Recount | TinyDPS";
	ASL["Single Embed System"] = "Integrazione Singola";
	ASL["Embed for Main Panel"] = "Integrazione per il Pannello Principale";
	ASL["Dual Embed System"] = "Integrazione Doppia";
	ASL["Embed for Left Window"] = "Integrazione per la Finestra di Sinistra";
	ASL["Embed for Right Window"] = "Integrazione per la Finestra di Destra";
	ASL["Embed Left Window Width"] = "Larghezza dell'Integrazione per la Finestra di Sinistra";
	ASL["Out of Combat (Hide)"] = "Fuori dal Combattimento (Nascondi)";
	ASL["Attach SexyCD to action bar"] = "Fissa SexyCD alla barra delle azioni";
	ASL["Attach CoolLine to action bar"] = "Fissa CoolLine alla barra delle azioni";
	ASL["Embed Transparancy"] = "Integrazione Trasparente";
	ASL["Embed Below Top Tab"] = "Integra sotto la scheda superiore";
	ASL["Recount Backdrop"] = "Sfondo Recount";
	ASL["Skada Backdrop"] = "Sfondo Skada";
	ASL["Omen Backdrop"] = "Sfondo Omen";
	ASL["WeakAura AuraBar"] = "Barra Aura di Weak Aura";
	ASL["Auction House"] = "Casa d'Aste";
	ASL["FAQ's"] = "FAQ";
	ASL["DBM/VEM Half-Bar Skin Spacing looks wrong. How can I fix it?"] = "Lo spazio dell'aspetto Mezza Barra di DBM/VEM non è visualizzato correttamente. Come posso aggiustarlo?";
	ASL["To use the DBM/VEM Half-Bar skin. You must change the DBM/VEM Options. Offset Y needs to be at least 15."] = "Per visualizzare correttamente l'aspetto Mezza Barra di DBM/VEM devi cambiare le relative Opzioni.\nL'Offset Y deve essere impostato almeno su 15.";
	ASL["Credits"] = "Crediti";
	ASL["Credits:"] = "Crediti:";
	ASL["About/Help"] = "About/Aiuto";
	ASL["This is where you can find out more of AddOnSkins."] = "Qui è dove puoi trovare ulteriori informazioni su AddOnSkins.";
	ASL["Download Link"] = "Collegamento per il Download";
	ASL["Changelog Link"] = "Collegamento del Changelog";
	ASL["GitLab Link / Report Errors"] = "Collegamento GitLab / Segnalazione Errori";
	ASL["Available Skins / Skin Requests"] = "Aspetti Disponibili / Richieste";
	ASL["Version"] = "Versione";
	ASL["Left Click to Show"] = "Clic sinistro per mostrare";
	ASL["Right Click to Hide"] = "Clic destro per nascondere";
	ASL["Left Click:"] = "Clic sinistro:";
	ASL["Right Click:"] = "Clic destro:";
	ASL["Conflict System: Please remove '%s' from your 'World of Warcraft\\Interface\\AddOns\\' directory."] = "Conflitto di Sistema: Sei pregato di rimuovere '%s' dalla cartella 'World of Warcraft\\Interface\\AddOns\\'.";

	ASL["Skin Template"] = "Skin Template"
	ASL["Hide Chat Frame"] = "Hide Chat Frame"
	ASL["Embed OoC Delay"] = "Embed OoC Delay"
	ASL['Reset Settings'] = 'Reset Settings'
	ASL["WeakAura Cooldowns"] = "WeakAura Cooldowns"
	ASL["Embed into Right Chat Panel"] = "Embed into Right Chat Panel"
	ASL["Parchment"] = "Parchment"
	ASL["Enable Skin Debugging"] = "Enable Skin Debugging"
end
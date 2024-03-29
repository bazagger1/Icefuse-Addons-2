--[[
Server Name: ▌ Icefuse.net ▌ DarkRP 100k Start ▌ Bitminers-Slots-Unbox ▌
Server IP:   208.103.169.42:27015
File Path:   addons/[server]_blue_atm/lua/batm_translation.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

BATM = BATM or {}
BATM.Lang = {}


--Edit the values after the table indexs, see example below
--Example BATM.Lang["Select an account."] = "Sélectionnez un compte."

BATM.Lang["$"] = "$"
BATM.Lang["Select an account."] = "Select an account."
BATM.Lang["Personal"] = "Personal"
BATM.Lang["Account"] = "Account"
BATM.Lang["My Group Account"] = "My Group Account"
BATM.Lang["Other Group Accounts"] = "Other Group Accounts"
BATM.Lang["Select a user to add."] = "Select a user to add."
BATM.Lang["Previous"] = "Previous"
BATM.Lang["Next"] = "Next"
BATM.Lang["Deposit"] = "Deposit"
BATM.Lang["Enter Amount"] = "Enter Amount"
BATM.Lang["Deposit Complete"] = "Deposit Complete"
BATM.Lang["Transfer Complete."] = "Transfer Complete."
BATM.Lang["Withdrawal Complete."] = "Withdrawal Complete."
BATM.Lang["Request failed, check chat."] = "Request failed, check chat."
BATM.Lang["What would you like to do?"] = "What would you like to do?"
BATM.Lang["History"] = "History"
BATM.Lang["Withdraw"] = "Withdraw"
BATM.Lang["Members"] = "Members"
BATM.Lang["Press 'E' to access your account."] = "Press 'E' to access your account."
BATM.Lang["Loading..."] = "Loading..."
BATM.Lang["Kick User"] = "Kick User"
BATM.Lang["Add User"] = "Add User"
BATM.Lang["Transfer"] = "Transfer"
BATM.Lang["Offline User"] = "Offline User"
BATM.Lang["Transfer funds to"] = "Transfer funds to"
BATM.Lang["Done"] = "Done"
BATM.Lang["Enter Users"] = "Enter Users"
BATM.Lang["SteamID64"] = "SteamID64"
BATM.Lang["Enter SteamID64"] = "Enter SteamID64"
BATM.Lang["% Interest"] = "% Interest"
BATM.Lang["% interest! You will next get interest in 15 minutes!"] = "% interest! You will next get interest in 15 minutes!"
BATM.Lang["[ATM] You just got "] = "[ATM] You just got "
BATM.Lang["[ATM] Incorrect data..."] = "[ATM] Incorrect data..."
BATM.Lang["[ATM] You are not a member of this group..."] = "[ATM] You are not a member of this group..."
BATM.Lang["[ATM] You don't have that much money!"] = "[ATM] You don't have that much money!"
BATM.Lang["Deposit from account owner"] = "Deposit from account owner"
BATM.Lang["[ATM] You don't have permission to do this..."] = "[ATM] You don't have permission to do this..."
BATM.Lang["[ATM] You're sending to many requests! Please wait..."] = "[ATM] You're sending to many requests! Please wait..."
BATM.Lang["[ATM] That person does not have an account set up!"] = "[ATM] That person does not have an account set up!"
BATM.Lang["[ATM] "] = "[ATM] "
BATM.Lang["[ATM] Invalid player..."] = "[ATM] Invalid player..."
BATM.Lang["[ATM] Oh no! Something went wrong, please try again!"] = "[ATM] Oh no! Something went wrong, please try again!"
BATM.Lang["[ATM] Blue's atms have been saved for the map "] = "[ATM] Blue's atms have been saved for the map "
BATM.Lang["[ATM] You do not have permission to perform this action, please contact an admin."] = "[ATM] You do not have permission to perform this action, please contact an admin."
BATM.Lang["[ATM] You're sesion has ended as you took too long to interact!"] = "[ATM] You're sesion has ended as you took too long to interact!"
BATM.Lang["[ATM] You're sesion has ended as you are to far away from the machine!"] = "[ATM] You're sesion has ended as you are to far away from the machine!"
BATM.Lang["[ATM] Someone is already using this ATM"] = "[ATM] Someone is already using this ATM"
BATM.Lang["[ATM] You are already using anouther ATM!"] = "[ATM] You are already using anouther ATM!"
BATM.Lang["Press 'E' to set up!"] = "Press 'E' to set up!"
BATM.Lang["Enter Price"] = "Enter Price"
BATM.Lang["Enter Title"] = "Enter Title"
BATM.Lang["Enter Description"] = "Enter Description"
BATM.Lang["Submit"] = "Submit"
BATM.Lang["Seller : "] = "Seller : "
BATM.Lang["Purchase"] = "Purchase"
BATM.Lang["[ATM] The owner has not yet set up this device"] = "[ATM] The owner has not yet set up this device"
BATM.Lang["[ATM] An unknown error has occured."] = "[ATM] An unknown error has occured."
BATM.Lang["[ATM] You must have a title"] = "[ATM] You must have a title"
BATM.Lang["[ATM] You must have a description"] = "[ATM] You must have a description"
BATM.Lang["[ATM] Invalid number..."] = "[ATM] Invalid number..."
BATM.Lang["[ATM] Nice try buddy :)"] = "[ATM] Nice try buddy :)" --This is when the atm detects someone is trying to cheat :)
BATM.Lang["[ATM] Number to large"] = "[ATM] Number to large"
BATM.Lang["[ATM] Info Updated"] = "[ATM] Info Updated"
BATM.Lang["[ATM] An unknown error has occured, open a support ticket please."] = "[ATM] An unknown error has occured, open a support ticket please."
BATM.Lang["Purchase to "] = "Purchase to "
BATM.Lang["Purchase from "] = "Purchase from "
BATM.Lang["[ATM] Purchase Succesfull"] = "[ATM] Purchase Succesfull"
BATM.Lang["[ATM] Purchase received from "] = "[ATM] Purchase received from "
BATM.Lang["Refund from a corrupt transaction."] = "Refund from a corrupt transaction."
BATM.Lang["[ATM] The owner of this device does not have a valid account, this can happen if they leave the server and their entity is still here."] = "[ATM] The owner of this device does not have a valid account, this can happen if they leave the server and their entity is still here."
BATM.Lang["[ATM] You don't have enougth money in your bank to do this."] = "[ATM] You don't have enougth money in your bank to do this."
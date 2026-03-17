DPLCs_Knight: mappingsTable
	mappingsTableEntry.w	DPLCs_Knight_0
	mappingsTableEntry.w	DPLCs_Knight_1
	mappingsTableEntry.w	DPLCs_Knight_2

DPLCs_Knight_0:	dplcHeader
DPLCs_Knight_0_End

DPLCs_Knight_1:	dplcHeader
 dplcEntry $10, 0
 dplcEntry $10, $10
 dplcEntry $A, $20
DPLCs_Knight_1_End

DPLCs_Knight_2:	dplcHeader
 dplcEntry $10, $2A
 dplcEntry $10, $3A
 dplcEntry 5, $4A
DPLCs_Knight_2_End

	even
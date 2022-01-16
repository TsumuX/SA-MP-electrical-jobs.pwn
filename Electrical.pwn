//Job Pln Khusus Inferno By Atsumu/TsumuX
//Discord:Atsumu#3891
#include <a_samp>
#include  <zcmd>
#if defined FILTERSCRIPT
#define COLOR_YELLOW ffff00
#define COLOR_RED FF000FF

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Job Pln By Atsumu");//hapus w santet
	print("--------------------------------------\n");
	return 1;
}

new timer_perbaikilistrik[MAX_PLAYERS];

enum pInfo
{
	pPln,pPln2,pPln3,pPln4
};
new PlayerInfo[MAX_PLAYERS][pInfo];

public OnGameModeInit()
{
	CreatePickup(19134, 23, -2521.1887,-624.6504,132.7828, 0);
 	Create3DTextLabel(" /masuk", 0xFFFF00AA, -2521.1887,-624.6504,132.7828, 20.0, 0);
	CreatePickup(19134, 23, -2535.3291,-688.6619,139.3203, 0);
 	Create3DTextLabel(" /keluar", 0xFFFF00AA, -2535.3291,-688.6619,139.3203, 20.0, 0);
	Create3DTextLabel(" /perbaiki1", 0xFFFF00AA, -2528.9832,-699.3498,139.3203, 20.0, 0);
	Create3DTextLabel(" /perbaiki2", 0xFFFF00AA, -2528.9875,-703.6187,139.3203, 20.0, 0);
	Create3DTextLabel(" /perbaiki3", 0xFFFF00AA, -2528.8499,-708.0728,139.3203, 20.0, 0);
	Create3DTextLabel("/kerjapln & /selesai", 0x1E90FFFF,-2527.3401,-620.5685,132.7171, 20.0, 0);
    CreatePickup(1275, 23,-2527.3401,-620.5685,132.7171, 0);
	Create3DTextLabel("/ambilperalatan", 0x1E90FFFF,-2529.3232,-620.5971,132.7176, 20.0, 0);
    CreatePickup(1275, 23,-2529.3232,-620.5971,132.7176, 0);
    return 1;
}
epublic: PerbaikiListrik(playerid)
{
	TogglePlayerControllableEx(playerid, 1);
	ClearAnimations(playerid);
	TogglePlayerControllableEx(playerid, 1);
    return 1;
}
CMD:perbaiki3(playerid, params[])
{
  	if(PlayerInfo[playerid][pPln] == 0)return SendClientMessage(playerid, COLOR_YELLOW, "Anda Belum Bekerja");
	if(PlayerInfo[playerid][pPln4] == 1) return SendClientMessage(playerid, COLOR_YELLOW, "Anda Sudah Memperbaiki Listrik Disini");
	if(PlayerInfo[playerid][pPln3] == 0) return SendClientMessage(playerid, COLOR_RED, "ANDA BELUM SELESAI MEMPERBAIKI LISTRIK");
	if(!IsPlayerInRangeOfPoint(playerid, 5.0,-2528.8499,-708.0728,139.3203))
 	{
	SendClientMessage(playerid, COLOR_YELLOW, "Anda Tidak Di Tempat Pln");
	}
	else
	{
 	TogglePlayerControllableEx(playerid, 0);
	timer_perbaikilistrik[playerid] = SetTimerEx("PerbaikiListrik", 5000, false, "d", playerid);
 	SetPVarInt(playerid, "fRobBank", 1);
  	ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, 1, 0, 0, 0, 0, 1);
	PlayerInfo[playerid][pPln4] = 0;
    PlayerInfo[playerid][pPln3] = 0;
	SetPlayerGPS(playerid, -2528.8499,-708.0728,139.3203, 3.0);
	SendClientMessage(playerid, COLOR_YELLOW, "Silahkan Selesaikan Pekerjaan Anda Diluar");
	SendClientMessage(playerid, COLOR_YELLOW, "Atau Lanjutkan Ke Tempat Pertama");
	GivePlayerMoney(playerid, 5000);
    PlayerInfo[playerid][pCash] += 5000;
    OnPlayerUpdateAccountsPer(playerid, "pCash", PlayerInfo[playerid][pCash]);

    }
    return 1;
}
CMD:perbaiki2(playerid, params[])
{
	if(PlayerInfo[playerid][pPln] == 0)return SendClientMessage(playerid, COLOR_YELLOW, "Anda Belum Bekerja");
	if(PlayerInfo[playerid][pPln3] == 1) return SendClientMessage(playerid, COLOR_YELLOW, "Anda Sudah Memperbaiki Listrik Disini");
	if(PlayerInfo[playerid][pPln2] == 0) return SendClientMessage(playerid, COLOR_RED, "ANDA BELUM SELESAI MEMPERBAIKI LISTRIK");
 	if(!IsPlayerInRangeOfPoint(playerid, 5.0, -2528.9875,-703.6187,139.3203))
 	{
	SendClientMessage(playerid, COLOR_YELLOW, "Anda Tidak Di Tempat Pln");
  	}
	else
	{
	TogglePlayerControllableEx(playerid, 0);
 	timer_perbaikilistrik[playerid] = SetTimerEx("PerbaikiListrik", 5000, false, "d", playerid);
  	SetPVarInt(playerid, "fRobBank", 1);
   	ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, 1, 0, 0, 0, 0, 1);

	PlayerInfo[playerid][pPln3] = 1;
 	PlayerInfo[playerid][pPln2] = 0;
	SetPlayerGPS(playerid, -2528.9832,-699.3498,139.3203, 3.0);
	SendClientMessage(playerid, COLOR_YELLOW, "Silahkan Memperbaiki Listrik Selanjutnya");

	}
    return 1;
}
CMD:perbaiki1(playerid, params[])
{
	if(PlayerInfo[playerid][pPln] == 0)return SendClientMessage(playerid, COLOR_YELLOW, "Anda Belum Bekerja");
	if(PlayerInfo[playerid][pPln2] == 1) return SendClientMessage(playerid, COLOR_YELLOW, "Anda Sudah Memperbaiki Listrik Disini");
  	if(!IsPlayerInRangeOfPoint(playerid, 5.0, -2528.9832,-699.3498,139.3203))
  	{
 	SendClientMessage(playerid, COLOR_YELLOW, "Anda Tidak Di Tempat Pln");
  	}
 	else
 	{
  	TogglePlayerControllableEx(playerid, 0);
   	timer_perbaikilistrik[playerid] = SetTimerEx("PerbaikiListrik", 5000, false, "d", playerid);
    SetPVarInt(playerid, "fRobBank", 1);
    ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, 1, 0, 0, 0, 0, 1);
	PlayerInfo[playerid][pPln2] = 1;
	SetPlayerGPS(playerid, -2528.9875,-703.6187,139.3203, 3.0);
	SendClientMessage(playerid, COLOR_YELLOW, "Silahkan Memperbaiki Listrik Selanjutnya");
 	}
	return 1;
}
CMD:keluar(playerid, params[])
{
 if(IsPlayerInRangeOfPoint(playerid,5.0,-2535.3291,-688.6619,139.3203))
	SetPlayerPos(playerid, -2521.1887,-624.6504,132.7828);
}
CMD:masuk(playerid, params[])
{
   if(IsPlayerInRangeOfPoint(playerid,5.0,-2521.1887,-624.6504,132.7828))
	SetPlayerPos(playerid, -2535.2183,-689.1140,139.3203);
}
CMD:selesai(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 15.0, -2527.3401,-620.5685,132.7171))
	SetPlayerSkin(playerid, GetPVarInt(playerid, "old_skin"));
	SendClientMessage(playerid, COLOR_GREY, "Anda menyelesaikan hari kerja.");
	RemovePlayerAttachedObject(playerid, 2);
	RemovePlayerAttachedObject(playerid, 0);
	PlayerInfo[playerid][pPln] =0;
    return 1;
}
CMD:ambilperalatan(playerid, params[])
{

	if(PlayerInfo[playerid][pPln] == 0)
	{
	SendClientMessage(playerid, COLOR_YELLOW, "Anda Tidak Kerja");
  	}
	else
	{
	if(IsPlayerInRangeOfPoint(playerid, 15.0, -2529.3232,-620.5971,132.7176))
	SendClientMessage(playerid, COLOR_YELLOW, "Anda Berhasil Mengambil Peralatan Dan Pelindung");
	SetPlayerAttachedObject(playerid, 1, 373, 1, 0.259999, -0.004999, -0.164999, 68.000000, 25.500000, 35.000000, 1.000000, 1.000000, 1.000000);
	}
	return 1;
}
CMD:kerjapln(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 15.0, -2527.3401,-620.5685,132.7171))

	SetPVarInt(playerid, "old_skin", GetPlayerSkin(playerid));
 	SetPlayerSkin (playerid, 27);
 	GameTextForPlayer(playerid, "~w~~r~Anda Menjadi Pekerja Pln~n~~h~~w~~h~", 15000, 4);
	PlayerInfo[playerid][pPln] = 2;

	return 1;

}

class DynMusicMutator extends HXMutator
config (DynMusic);

var() string BattleEnterMsg, BattleExitMsg;

function PostBeginPlay ()
{
	Level.Game.BaseMutator.AddMutator (Self);
	SetTimer(5, True);
	super.PostBeginPlay();
}

function Timer()
{
	local HXHuman P;
	local DynMusicActor DA;
	local bool bFound;
	local Pawn APawn;
	 for(APawn = level.PawnList; APawn != none; APawn = APawn.nextPawn){
		if(APawn.bIsPlayer){
			bFound = False;
			P = HXHuman(APawn);

			if(P != None){
				foreach AllActors(class'DynMusicActor', DA){
					if(DA.Watcher == P)
						bFound=True;
				}
				
				
				if(!bFound){
					DA = Spawn(class'DynMusicActor',,,P.Location);
					DA.Watcher = P;
					DA.DM = Self;
					DA.SetTimer(1, True);
					Log("Dynamic music attached.");
				}
			}
		}
	}
	
}

defaultproperties
{
}

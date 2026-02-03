use Exercici6;
select Passatger.DNI, Passatger.Nom, Passatger.Cognom, Vols.NumVol, Vols.Orgien, Vols.Desti, Reserva.Import
from Passatger, Vols, Reserva
where Passatger.ID=Reserva.Passatger_ID and Vols.ID=Reserva.Vols_ID
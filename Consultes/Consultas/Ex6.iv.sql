use Exercici6;
select Passatger.Nom, Passatger.Cognom, Reserva.ID, Reserva.Import
from Passatger, Reserva, Vols
where Passatger.ID=Reserva.Passatger_ID and Vols.ID=Reserva.ID and Vols.DataSortida like "6-5-2022"
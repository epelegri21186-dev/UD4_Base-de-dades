use Exercici6;
select distinct count(*)
from Vols, Reserva
where Vols.ID=Reserva.Vols_ID;
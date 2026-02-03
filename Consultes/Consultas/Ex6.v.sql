use Exercici6;
select count(Avions.Capacitat)
from Avions, Vols
where Vols.ID=Avions_ID

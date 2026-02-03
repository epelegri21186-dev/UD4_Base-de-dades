use Exercici6;
select Avions.Model,Avions.Fabricant, Avions.Capacitat, Vols.Orgien, Vols.Desti, Vols.DataArribada, Vols.DataSortida
from Avions, Vols
where Avions.ID=Vols.Avions_ID and Avions.Fabricant like "%45"
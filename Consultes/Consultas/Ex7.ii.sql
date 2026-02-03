use Exercici7;
select Tiquet.NumFactura, Tiquet.Data, Tiquet.Hora, Venedor.Nom, Venedor.Cognom, Tiquet.Total
from Tiquet, Venedor, LiniaTiquet, Producte
where Producte.ID=LiniaTiquet.Producte_ID and Tiquet.ID=LiniaTiquet.Tiquet_ID and Venedor.ID=Tiquet.Venedor_ID and Producte.Nom like "%flor"
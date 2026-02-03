use Exercici7;
select count(LiniaTiquet.ID) as "Numero lineas"
from LiniaTiquet, Tiquet, Venedor
where Tiquet.ID=LiniaTiquet.Tiquet_ID and Tiquet.Venedor_ID=Venedor.ID and Venedor.Nom like "%o"
use Exercici4;
select *
from Client, Polisa, TiposPolissa, Venedor
where Client.ID = Polisa.Client_ID and Venedor.ID=Polisa.Venedor_ID and TiposPolissa.ID=Polisa.TiposPolissa_ID
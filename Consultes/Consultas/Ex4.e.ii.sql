use Exercici4;
select Polisa.Numero, TiposPolissa.Nom, Client.ID, Client.Cognom, Client.Nom
from Polisa, TiposPolissa, Client
where Client.ID=Polisa.Client_ID and TiposPolissa.ID=Polisa.TiposPolissa_ID and TiposPolissa.Nom like "Cosa"; 
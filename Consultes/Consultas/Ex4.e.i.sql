use Exercici4;
select count(*)
from Client, Polisa
where Client. ID=Polisa.Client_ID and Client.Nom like "%Cosa";
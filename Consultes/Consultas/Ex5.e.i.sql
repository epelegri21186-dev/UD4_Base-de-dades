use Exercici5;
select Cita.Dia, Cita.Hora, Client.Nom, Vehicle.Marca, TipusVehicle.Nom
from Client, Vehicle, TipusVehicle, Cita
where Cita.Vehicle_ID = Vehicle.ID and Client.ID=Vehicle.Client_ID and TipusVehicle.ID = Vehicle.TipusVehicle_ID and Cita.Dia > "10/5/2022"
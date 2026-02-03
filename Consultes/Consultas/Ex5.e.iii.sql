use Exercici5;
select *
from Cita, Client, TipusVehicle, Vehicle
where Cita.Vehicle_ID = Vehicle.ID and Client.ID=Vehicle.Client_ID and TipusVehicle.ID = Vehicle.TipusVehicle_ID;
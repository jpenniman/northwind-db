#:package Npgsql@10.0.2

using Npgsql;

var files = Directory.GetFiles("../employee_photos","enhanced_*.png");
foreach (var file in files)
{
    var photo = File.ReadAllBytes(file);
    var employeeId = Path.GetFileNameWithoutExtension(file).Split('_')[1];
    await using var cn = new NpgsqlConnection(args[0]);
    await using var cmd = new NpgsqlCommand("update employees set photo = :photo where employee_id = :employeeid", cn);
    cmd.Parameters.Add(":photo", NpgsqlTypes.NpgsqlDbType.Bytea).Value = photo;
    cmd.Parameters.Add(":employeeid", NpgsqlTypes.NpgsqlDbType.Integer).Value = int.Parse(employeeId);
    await cn.OpenAsync();
    await cmd.ExecuteNonQueryAsync();
}
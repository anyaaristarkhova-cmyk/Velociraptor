SELECT *
FROM monitoring(
    client_id="server",
    artifact="Custom.Server.Lab10AlertMonitor",
    start_time=now() - 10800
)
LIMIT 20

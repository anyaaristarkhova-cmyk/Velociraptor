SELECT
    Pid,
    Laddr.IP AS LocalIP,
    Laddr.Port AS LocalPort,
    Raddr.IP AS RemoteIP,
    Raddr.Port AS RemotePort,
    Status,
    timestamp(epoch=now()) AS DetectedAt
FROM netstat()
WHERE Status =~ "^(ESTAB|ESTABLISHED)$"
  AND Raddr.Port >= 49152
  AND Raddr.Port <= 65535
  AND Raddr.IP != "127.0.0.1"

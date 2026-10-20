LET Recent <= timestamp(epoch=now() - 86400)

SELECT
    OSPath,
    Name,
    Size,
    Btime AS Created,
    Mtime AS Modified
FROM glob(
    globs=[
        "C:/Users/*/AppData/Local/Temp/*.{exe,com,scr,ps1}",
        "C:/Windows/Temp/*.{exe,com,scr,ps1}"
    ],
    accessor="file"
)
WHERE NOT IsDir
  AND Btime > Recent

SELECT COUNT(*) AS FISH_COUNT
FROM FISH_INFO I, FISH_NAME_INFO N
WHERE I.FISH_TYPE = N.FISH_TYPE AND N.FISH_NAME IN ('BASS','SNAPPER')
-- https://leetcode.com/problems/count-artist-occurrences-on-spotify-ranking-list/

select artist, count(id) as occurrences
  from Spotify
 group by artist
 order by occurrences desc, artist;
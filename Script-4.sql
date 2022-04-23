
select genrename, count(artist_id) artist_q from genre g
join artistgenre a on g.id  = a.genre_id 
group by genrename ;

select albumname, count(trackname) from album a 
join track t on a.id = t.albumid 
where yearalbum between 1990 and 2000
group  by albumname ;


select albumname, avg(trackduration) from album a 
join track t on a.id = t.albumid 
group by albumname ;


select "name" from artist a
where name not in (
	select albumname from album a 
	join artistalbum a3  on a.id = a3.artist_id 
	where yearalbum = 1991
	group  by albumname);


select collectoinname from collectoin c 
join trackcollection t on c.id = t.collectoin_id 
join track t2 on t.track_id  = t2.id 
join album a on t2.albumid = a.id  
join artistalbum a2 on a.id = a2.album_id 
join artist a3 on a2.artist_id = a3.id  
where name  = 'Limp Bizkit';



select collectoinname, g.genrename, g.id  from collectoin c 
join trackcollection t on c.id = t.collectoin_id 
join track t2 on t.track_id  = t2.id 
join album a on t2.albumid = a.id
join artistalbum a2 on a.id = a2.album_id 
join artist a3 on a2.artist_id = a3.id 
join artistgenre a4 on a3.id = a4.artist_id 
join genre g on a4.genre_id = g.id
where g.id > 0
group by g.genrename, collectoinname, g.id ;


select collectoinname, a4.artist_id  from collectoin c 
join trackcollection t on c.id = t.collectoin_id 
join track t2 on t.track_id  = t2.id 
join album a on t2.albumid = a.id
join artistalbum a2 on a.id = a2.album_id 
join artist a3 on a2.artist_id = a3.id 
join artistgenre a4 on a3.id = a4.artist_id 
--join genre g on a4.genre_id = g.id
where a4.artist_id  > 0
group by  collectoinname, a4.artist_id ;


select trackname from track t 
join trackcollection t2 on t.id = t2.collectoin_id 
join collectoin c on t2.id = c.id 
where trackname not in (
	select collectoinname from collectoin c2 
	join trackcollection t3 on c2.id = t3.track_id
	join track t4 on t3.id = t4.id)
	group by trackname ;


select name, trackduration from artist a 
join artistalbum a2 on a.id = a2.id 
join album a3 on a2.id = a3.id 
join track t on a3.id = t.albumid 
where trackduration  in (
	select max(trackduration) from track t2 );



with new_table as (select albumname, count(track.id) as cnt
from track
join album on track.albumid = album.id
group by albumname)
select albumname, cnt from new_table
where cnt = (select min(cnt) from new_table);





/*
 * Erj.: 1
 */

	SELECT * FROM PUBLIC.MOVIES;

/*
 * Erj.: 2
 */

	SELECT * FROM PUBLIC.GENRES;

/*
 * Erj.: 3
 */

	SELECT STUDIO_NAME 
	FROM PUBLIC.STUDIOS 
	WHERE STUDIO_ACTIVE = 1;

/*
 * Erj.: 4
 */

	SELECT MEMBER_NAME 
	FROM PUBLIC.MEMBERS 
	ORDER BY MEMBER_DISCHARGE_DATE DESC 
	LIMIT 20;

/*
 * Erj.: 5
 */

	SELECT MOVIE_DURATION, COUNT(*) AS FRECUENCIA 
	FROM PUBLIC.MOVIES 
	GROUP BY MOVIE_DURATION 
	ORDER BY FRECUENCIA DESC
	LIMIT 20;

/*
 * Erj.: 6
 */

	SELECT MOVIE_NAME, MOVIE_LAUNCH_DATE
	FROM PUBLIC.MOVIES
	WHERE YEAR(MOVIE_LAUNCH_DATE) >= 2000
	AND MOVIE_NAME LIKE 'A%'
	ORDER BY MOVIE_LAUNCH_DATE;

/*
 * Erj.: 7
 */
	
	SELECT ACTOR_NAME, ACTOR_BIRTH_DATE
	FROM PUBLIC.ACTORS
	WHERE MONTH(ACTOR_BIRTH_DATE) = 6;

/*
 * Erj.: 8
 */
	
	SELECT ACTOR_NAME, ACTOR_BIRTH_DATE
	FROM PUBLIC.ACTORS
	WHERE MONTH(ACTOR_BIRTH_DATE) != 6
	AND ACTOR_DEAD_DATE IS NULL;
	
/*
 * Erj.: 9
 */

	SELECT DIRECTOR_NAME, (YEAR(CURDATE()) - YEAR(DIRECTOR_BIRTH_DATE)) AS EDAD
	FROM PUBLIC.DIRECTORS
	WHERE (YEAR(CURDATE()) - YEAR(DIRECTOR_BIRTH_DATE)) <= 50
	AND DIRECTOR_DEAD_DATE IS NULL;

/*
 * Erj.: 10
 */

	SELECT ACTOR_NAME, (YEAR(CURDATE()) - YEAR(ACTOR_BIRTH_DATE)) AS EDAD, ACTOR_DEAD_DATE
	FROM PUBLIC.ACTORS
	WHERE (YEAR(CURDATE()) - YEAR(ACTOR_BIRTH_DATE)) <= 50
	AND ACTOR_DEAD_DATE IS NOT NULL;

/*
 * Erj.: 11
 */

	SELECT DIRECTOR_NAME
	FROM PUBLIC.DIRECTORS
	WHERE (YEAR(CURDATE()) - YEAR(DIRECTOR_BIRTH_DATE)) <= 40
	AND DIRECTOR_DEAD_DATE IS NULL;

/*
 * Erj.: 12
 */

	SELECT AVG(YEAR(CURDATE()) - YEAR(DIRECTOR_BIRTH_DATE)) AS EDAD
	FROM PUBLIC.DIRECTORS
	WHERE DIRECTOR_DEAD_DATE IS NULL;

/*
 * Erj.: 13
 */

	SELECT AVG(YEAR(CURDATE()) - YEAR(ACTOR_BIRTH_DATE)) AS EDAD
	FROM PUBLIC.ACTORS
	WHERE ACTOR_DEAD_DATE IS NOT NULL;

/*
 * Erj.: 14
 */

	SELECT MOV.MOVIE_NAME, S.STUDIO_NAME
	FROM PUBLIC.MOVIES MOV
	JOIN PUBLIC.STUDIOS S ON MOV.STUDIO_ID = S.STUDIO_ID;

/*
 * Erj.: 15
 */

	SELECT MEMBER_NAME, MEMBER_RENTAL_DATE, MOVIE_NAME
	FROM PUBLIC.MEMBERS MEM
	JOIN PUBLIC.MEMBERS_MOVIE_RENTAL RENT ON MEM.MEMBER_ID = RENT.MEMBER_ID
	JOIN PUBLIC.MOVIES MOV ON MOV.MOVIE_ID = RENT.MOVIE_ID
	WHERE YEAR(MEMBER_RENTAL_DATE) BETWEEN 2010 AND 2015;

/*
 * Erj.: 16
 */

	SELECT NATIONALITY_NAME, COUNT(MOVIE_ID) AS NUM_MOVIES
	FROM PUBLIC.NATIONALITIES NAT
	JOIN PUBLIC.MOVIES MOV ON MOV.NATIONALITY_ID = NAT.NATIONALITY_ID
	GROUP BY NATIONALITY_NAME;

/*
 * Erj.: 17
 */

	SELECT MOVIE_NAME, GENRE_NAME
	FROM PUBLIC.MOVIES MOV
	JOIN PUBLIC.GENRES GEN ON GEN.GENRE_ID = MOV.GENRE_ID
	WHERE GENRE_NAME = 'Documentary';

/*
 * Erj.: 18
 */

 	SELECT MOVIE_NAME, DIRECTOR_NAME, DIRECTOR_BIRTH_DATE, DIRECTOR_DEAD_DATE
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.DIRECTORS DIC ON DIC.DIRECTOR_ID = MOV.DIRECTOR_ID
 	WHERE YEAR(DIRECTOR_BIRTH_DATE) >= 1980
 	AND DIRECTOR_DEAD_DATE IS NULL;

/*
 * Erj.: 19
 */

	SELECT MEMBER_NAME, DIRECTOR_NAME, DIRECTOR_BIRTH_PLACE
	FROM PUBLIC.MEMBERS MEM
	JOIN PUBLIC.DIRECTORS DIC ON MEM.MEMBER_TOWN = DIC.DIRECTOR_BIRTH_PLACE
	WHERE MEM.MEMBER_TOWN IS NOT NULL
	AND DIC.DIRECTOR_BIRTH_PLACE IS NOT NULL;

/*
 * Erj.: 20
 */
 
 	SELECT MOVIE_NAME, YEAR(MOVIE_LAUNCH_DATE) AS YEAR, STUDIO_ACTIVE
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.STUDIOS S ON S.STUDIO_ID = MOV.STUDIO_ID
 	WHERE STUDIO_ACTIVE = 0;
 
/*
 * Erj.: 21
 */

	SELECT MOVIE_NAME, MEMBER_RENTAL_DATE
	FROM PUBLIC.MOVIES MOV
	JOIN PUBLIC.MEMBERS_MOVIE_RENTAL MMR ON MMR.MOVIE_ID = MOV.MOVIE_ID
	ORDER BY MEMBER_RENTAL_DATE DESC
	LIMIT 10;
 
 /*
 * Erj.: 22
 */
 
 	SELECT DIRECTOR_NAME, COUNT(MOVIE_ID) AS NUM_MOVIES
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID
 	WHERE MOVIE_LAUNCH_DATE < DATEADD(YEAR, 41, DIRECTOR_BIRTH_DATE)
 	GROUP BY DIC.DIRECTOR_ID, DIRECTOR_NAME 
 	ORDER BY DIRECTOR_NAME;
 
 /*
 * Erj.: 23
 */
 
 	SELECT DIRECTOR_NAME, AVG(MOVIE_DURATION) AS MEDIA_DURATION
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID 
 	GROUP BY DIC.DIRECTOR_ID, DIRECTOR_NAME 
 	ORDER BY DIRECTOR_NAME;
 
 /*
 * Erj.: 24
 */
 
 	SELECT MOVIE_NAME, MOVIE_DURATION, MEMBER_RENTAL_DATE
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.MEMBERS_MOVIE_RENTAL MMR ON MOV.MOVIE_ID = MMR.MOVIE_ID 
 	WHERE MEMBER_RENTAL_DATE BETWEEN DATE_SUB('2019-01-25', INTERVAL 2 YEAR) AND '2019-01-25'
 	ORDER BY MOVIE_DURATION ASC
 	LIMIT 1;
 
 ---------------------------------------------------------
 
 /*
 * Erj.: 25
 */
 
 	SELECT DIRECTOR_NAME, COUNT(MOV.MOVIE_ID) AS NUM
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID
 	WHERE MOVIE_LAUNCH_DATE BETWEEN '1960-01-01' AND '1989-12-31'
 	AND MOVIE_NAME LIKE '%The%'
 	GROUP BY DIC.DIRECTOR_ID, DIRECTOR_NAME
 	ORDER BY DIRECTOR_NAME;
 
 /*
 * Erj.: 26
 */
 
 	SELECT MOVIE_NAME, NATIONALITY_NAME, DIRECTOR_NAME
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID
 	JOIN PUBLIC.NATIONALITIES NAT ON MOV.NATIONALITY_ID = NAT.NATIONALITY_ID
 	ORDER BY MOVIE_NAME;
 
 /*
 * Erj.: 27
 */
 
 	SELECT MOVIE_NAME, ACTOR_NAME
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.MOVIES_ACTORS MA ON MOV.MOVIE_ID = MA.MOVIE_ID
 	JOIN PUBLIC.ACTORS ACT ON MA.ACTOR_ID = ACT.ACTOR_ID
 	ORDER BY MOVIE_NAME, ACTOR_NAME;
 
 /*
 * Erj.: 28
 */
 
	 SELECT DIRECTOR_NAME, COUNT(MMR.MOVIE_ID) AS NUM_RENTS
	 FROM PUBLIC.MEMBERS_MOVIE_RENTAL MMR
	 JOIN PUBLIC.MOVIES MOV ON MMR.MOVIE_ID =MOV.MOVIE_ID
	 JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID
	 GROUP BY DIC.DIRECTOR_ID, DIRECTOR_NAME
	 ORDER BY NUM_RENTS DESC
	 LIMIT 1;
 
 /*
 * Erj.: 29
 */
 
 	SELECT STUDIO_NAME, COUNT(AWARD_ID) AS TOTAL_AWARDS
 	FROM PUBLIC.MOVIES MOV
 	JOIN PUBLIC.STUDIOS S ON MOV.STUDIO_ID = S.STUDIO_ID
 	JOIN PUBLIC.AWARDS AW ON MOV.MOVIE_ID = AW.MOVIE_ID 
 	GROUP BY S.STUDIO_ID, STUDIO_NAME
 	ORDER BY TOTAL_AWARDS DESC;
 
 /*
 * Erj.: 30
 */
 
	SELECT ACTOR_NAME, COUNT(AWARD_ID) AS NUMERO_NOMINACIONES
	FROM PUBLIC.MOVIES MOV
	JOIN PUBLIC.MOVIES_ACTORS MA ON MOV.MOVIE_ID = MA.MOVIE_ID
	JOIN PUBLIC.ACTORS ACT ON MA.ACTOR_ID = ACT.ACTOR_ID
	JOIN PUBLIC.AWARDS AW ON MOV.MOVIE_ID = AW.MOVIE_ID
	WHERE AWARD_WIN = 0
	GROUP BY ACTOR_NAME;
	
/*
 * Erj.: 31
 */	
	
	SELECT COUNT(DISTINCT ACT.ACTOR_ID) AS ACTOR, COUNT(DISTINCT DIC.DIRECTOR_ID) AS DIRECTORS
	FROM PUBLIC.MOVIES MOV
	JOIN PUBLIC.STUDIOS S ON MOV.STUDIO_ID = S.STUDIO_ID
	LEFT JOIN PUBLIC.MOVIES_ACTORS MA ON MOV.MOVIE_ID = MA.MOVIE_ID
	LEFT JOIN PUBLIC.ACTORS ACT ON MA.ACTOR_ID = ACT.ACTOR_ID
	LEFT JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID
	WHERE STUDIO_ACTIVE = 0;


	
/*
 * Erj.: 32
 */	
	
	SELECT MEMBER_NAME, MEMBER_TOWN, MEMBER_PHONE
	FROM PUBLIC.MEMBERS MEM
	JOIN PUBLIC.MEMBERS_MOVIE_RENTAL MMR ON MEM.MEMBER_ID = MMR.MEMBER_ID
	JOIN PUBLIC.MOVIES MOV ON MMR.MOVIE_ID = MOV.MOVIE_ID
	JOIN PUBLIC.AWARDS AW ON MOV.MOVIE_ID = AW.MOVIE_ID
	WHERE 
  		(SELECT COUNT(AWARD_NOMINATION) FROM PUBLIC.AWARDS AW WHERE AW.MOVIE_ID = MOV.MOVIE_ID) > 150
  		AND 
  		(SELECT COUNT(AWARD_WIN) FROM PUBLIC.AWARDS WHERE AW.MOVIE_ID = MOV.MOVIE_ID) < 50;
	
/*
 * Erj.: 33
 */	
  	
  	SELECT MOVIE_NAME, DIRECTOR_NAME, MOVIE_LAUNCH_DATE, DIRECTOR_DEAD_DATE
	FROM PUBLIC.MOVIES MOV
	JOIN PUBLIC.DIRECTORS DIC ON MOV.DIRECTOR_ID = DIC.DIRECTOR_ID
	WHERE MOVIE_LAUNCH_DATE > DIRECTOR_DEAD_DATE;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 
 
 
 
 
 

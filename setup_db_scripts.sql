CREATE TABLE USER(
    id INT PRIMARY KEY NOT NULL,
    username VARCHAR ( 50 ) NOT NULL,
    password VARCHAR ( 50 ) NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP
);

CREATE TABLE ANIME(
    id INT PRIMARY KEY NOT NULL,
    kitsu_id INT NOT NULL,
);

CREATE TABLE MANGA(
    id INT PRIMARY KEY NOT NULL,
    kitsu_id INT NOT NULL,
);

CREATE TABLE CHARACTER(
    id INT PRIMARY KEY NOT NULL,
    kitsu_id INT NOT NULL,
);

CREATE TABLE LIST(
    id INT PRIMARY KEY NOT NULL,
    title VARCHAR ( 50 ) NOT NULL,
    if_character BOOLEAN NOT NULL,
    user_id INT REFERENCES USER (id)
);

CREATE TABLE RATING(
    id INT PRIMARY KEY NOT NULL,
    score NUMERIC,
    description TEXT,
    user_id INT REFERENCES USER (id)
);

CREATE TABLE POST(
    id INT PRIMARY KEY NOT NULL,
    description TEXT,
    user_id INT REFERENCES USER (id)
);

CREATE TABLE FOLLOW(
    user_id INT REFERENCES USER (id),
    following_id INT REFERENCES USER (id),
    PRIMARY KEY (user_id, following_id)
);

CREATE TABLE RATING_ANIME(
    rating_id REFERENCES RATING (id),
    anime_id REFERENCES ANIME (id),
    PRIMARY KEY (rating_id, anime_id)
);

CREATE TABLE RATING_CHARACTER(
    rating_id REFERENCES RATING (id),
    character_id REFERENCES CHARACTER (id),
    PRIMARY KEY (rating_id, character_id)
);

CREATE TABLE RATING_MANGA(
    rating_id REFERENCES RATING (id),
    manga_id REFERENCES MANGA (id),
    PRIMARY KEY (rating_id, manga_id)
);

CREATE TABLE ANIME_LIST(
    list_id REFERENCES LIST (id),
    anime_id REFERENCES ANIME (id),
    PRIMARY KEY (list_id, anime_id)
);

CREATE TABLE MANGA_LIST(
    manga_id REFERENCES MANGA (id),
    list_id REFERENCES LIST (id),
    PRIMARY KEY (manga_id, list_id)
);

CREATE TABLE CHARACTER_LIST(
    character_id REFERENCES CHARACTER (id),
    list_id REFERENCES LIST (id),
    PRIMARY KEY (list_id, character_id)
);

CREATE TABLE CHARACTER_ANIME(
    character_id REFERENCES CHARACTER (id),
    anime_id REFERENCES ANIME (id),
    PRIMARY KEY (anime_id, character_id)
);

CREATE TABLE CHARACTER_MANGA(
    character_id REFERENCES CHARACTER (id),
    manga_id REFERENCES MANGA (id),
    PRIMARY KEY (manga_id, character_id)
);

CREATE TABLE POST_MANGA(
    post_id REFERENCES POST (id),
    manga_id REFERENCES MANGA (id),
    PRIMARY KEY (manga_id, post_id)
);

CREATE TABLE POST_ANIME(
    post_id REFERENCES POST (id),
    anime_id REFERENCES ANIME (id),
    PRIMARY KEY (anime_id, post_id)
);
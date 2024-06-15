--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 307, 308, 4, 2, 2018, 'Final');
INSERT INTO public.games VALUES (2, 309, 310, 2, 0, 2018, 'Third Place');
INSERT INTO public.games VALUES (3, 308, 310, 2, 1, 2018, 'Semi-Final');
INSERT INTO public.games VALUES (4, 307, 309, 1, 0, 2018, 'Semi-Final');
INSERT INTO public.games VALUES (5, 308, 311, 3, 2, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (6, 310, 312, 2, 0, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (7, 309, 313, 2, 1, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (8, 307, 314, 2, 0, 2018, 'Quarter-Final');
INSERT INTO public.games VALUES (9, 310, 315, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (10, 312, 316, 1, 0, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (11, 309, 317, 3, 2, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (12, 313, 318, 2, 0, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (13, 308, 319, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (14, 311, 320, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (15, 314, 321, 2, 1, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (16, 307, 322, 4, 3, 2018, 'Eighth-Final');
INSERT INTO public.games VALUES (17, 323, 322, 1, 0, 2014, 'Final');
INSERT INTO public.games VALUES (18, 324, 313, 3, 0, 2014, 'Third Place');
INSERT INTO public.games VALUES (19, 322, 324, 1, 0, 2014, 'Semi-Final');
INSERT INTO public.games VALUES (20, 323, 313, 7, 1, 2014, 'Semi-Final');
INSERT INTO public.games VALUES (21, 324, 325, 1, 0, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (22, 322, 309, 1, 0, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (23, 313, 315, 2, 1, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (24, 323, 307, 1, 0, 2014, 'Quarter-Final');
INSERT INTO public.games VALUES (25, 313, 326, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (26, 315, 314, 2, 0, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (27, 307, 327, 2, 0, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (28, 323, 328, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (29, 324, 318, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (30, 325, 329, 2, 1, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (31, 322, 316, 1, 0, 2014, 'Eighth-Final');
INSERT INTO public.games VALUES (32, 309, 330, 2, 1, 2014, 'Eighth-Final');


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (307, 'France');
INSERT INTO public.teams VALUES (308, 'Croatia');
INSERT INTO public.teams VALUES (309, 'Belgium');
INSERT INTO public.teams VALUES (310, 'England');
INSERT INTO public.teams VALUES (311, 'Russia');
INSERT INTO public.teams VALUES (312, 'Sweden');
INSERT INTO public.teams VALUES (313, 'Brazil');
INSERT INTO public.teams VALUES (314, 'Uruguay');
INSERT INTO public.teams VALUES (315, 'Colombia');
INSERT INTO public.teams VALUES (316, 'Switzerland');
INSERT INTO public.teams VALUES (317, 'Japan');
INSERT INTO public.teams VALUES (318, 'Mexico');
INSERT INTO public.teams VALUES (319, 'Denmark');
INSERT INTO public.teams VALUES (320, 'Spain');
INSERT INTO public.teams VALUES (321, 'Portugal');
INSERT INTO public.teams VALUES (322, 'Argentina');
INSERT INTO public.teams VALUES (323, 'Germany');
INSERT INTO public.teams VALUES (324, 'Netherlands');
INSERT INTO public.teams VALUES (325, 'Costa Rica');
INSERT INTO public.teams VALUES (326, 'Chile');
INSERT INTO public.teams VALUES (327, 'Nigeria');
INSERT INTO public.teams VALUES (328, 'Algeria');
INSERT INTO public.teams VALUES (329, 'Greece');
INSERT INTO public.teams VALUES (330, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 330, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


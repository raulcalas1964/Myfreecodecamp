--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    alto integer,
    ancho integer,
    peso numeric(12,2),
    notes text,
    active boolean,
    islife boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    alto integer,
    ancho integer,
    peso numeric(12,2),
    notes text,
    active boolean,
    islife boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    alto integer,
    ancho integer,
    peso numeric(12,2),
    notes text,
    active boolean,
    islife boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    alto integer,
    ancho integer,
    peso numeric(12,2),
    notes text,
    active boolean,
    islife boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: steroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.steroids (
    steroids_id integer NOT NULL,
    name character varying(40) NOT NULL,
    islife boolean
);


ALTER TABLE public.steroids OWNER TO freecodecamp;

--
-- Name: steroids_steroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.steroids_steroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steroids_steroids_id_seq OWNER TO freecodecamp;

--
-- Name: steroids_steroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.steroids_steroids_id_seq OWNED BY public.steroids.steroids_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: steroids steroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.steroids ALTER COLUMN steroids_id SET DEFAULT nextval('public.steroids_steroids_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.galaxy VALUES (2, 'bdromeda', 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.galaxy VALUES (3, 'cdromeda', 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.galaxy VALUES (4, 'edromeda', 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.galaxy VALUES (5, 'fdromeda', 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.galaxy VALUES (6, 'gdromeda', 1, 1, 1.10, 'Notes', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Luna', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (4, 'Luna1', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (5, 'Luna2', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (6, 'Luna3', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (7, 'Luna4', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (8, 'Luna5', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (9, 'Luna6', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (10, 'Luna7', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (11, 'Luna8', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (12, 'Luna10', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (13, 'Luna11', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (14, 'Luna12', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (15, 'Luna13', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (16, 'Luna14', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (17, 'Luna15', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (18, 'Luna16', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (19, 'Luna17', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (20, 'Luna18', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (21, 'Luna19', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.moon VALUES (22, 'Luna20', 3, 1, 1, 1.10, 'Notes', true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Tierra', 2, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (4, 'Saturno', 2, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (6, 'Venus', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (7, 'Juno', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (8, 'Mercurio', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (9, 'Martes', 3, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (10, 'Aries', 4, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (11, 'Urano', 4, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (13, 'Xenus', 5, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (14, 'Delfus', 6, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.planet VALUES (15, 'Heros', 7, 1, 1, 1.10, 'Notes', true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'star1', 1, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.star VALUES (3, 'star2', 1, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.star VALUES (4, 'star3', 1, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.star VALUES (5, 'star4', 1, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.star VALUES (6, 'star5', 1, 1, 1, 1.10, 'Notes', true, true);
INSERT INTO public.star VALUES (7, 'star6', 1, 1, 1, 1.10, 'Notes', true, true);


--
-- Data for Name: steroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.steroids VALUES (1, 'SteroidBlue', true);
INSERT INTO public.steroids VALUES (2, 'SteroidRed', true);
INSERT INTO public.steroids VALUES (3, 'SteroidGreen', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: steroids_steroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.steroids_steroids_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: steroids steroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.steroids
    ADD CONSTRAINT steroids_name_key UNIQUE (name);


--
-- Name: steroids steroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.steroids
    ADD CONSTRAINT steroids_pkey PRIMARY KEY (steroids_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

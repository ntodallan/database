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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    distance numeric,
    diameter numeric,
    no_of_stars integer,
    near_earth boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_details; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_details (
    galaxy_details_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    right_ascension numeric,
    declination numeric,
    magnitude numeric
);


ALTER TABLE public.galaxy_details OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter numeric,
    mass numeric,
    orbital_period numeric,
    distance numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    star_id integer,
    distance numeric,
    orbital_period numeric,
    mass numeric,
    radius numeric,
    temperature numeric,
    no_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text NOT NULL,
    distance numeric,
    mass numeric,
    temperature numeric,
    luminosity numeric,
    galaxy_id integer,
    star_type boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky', 'spiral', 0, 0.1, 200, true);
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'spiral', 2.54, 0.2, 100, true);
INSERT INTO public.galaxy VALUES (3, 'whirlpool galaxy', 'spiral', 27, 0.1, 100, true);
INSERT INTO public.galaxy VALUES (4, 'm87', 'elliptical', 40, 0.12, 100, false);
INSERT INTO public.galaxy VALUES (6, 'fornax', 'dwarf', 0.5, 0.03, 0, true);
INSERT INTO public.galaxy VALUES (7, 'sagittarius', 'dwarf', 0.08, 0.01, 0, true);
INSERT INTO public.galaxy VALUES (5, 'ic1101', 'irregular', 1000, 0.1, 100, false);
INSERT INTO public.galaxy VALUES (8, 'cygnus', 'radio', 600, 0.1, 100, false);


--
-- Data for Name: galaxy_details; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_details VALUES (1, 'milky', 1, 17.7611, -29.0078, -22.0);
INSERT INTO public.galaxy_details VALUES (2, 'andromeda', 2, 10.6846, 41.2691, 3.4);
INSERT INTO public.galaxy_details VALUES (3, 'whirlpool', 3, 13.3972, 47.1953, 8.1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 3476, 7.35, 27.3, 3844);
INSERT INTO public.moon VALUES (2, 'lo', 5, 3643, 8.93, 1.77, 426);
INSERT INTO public.moon VALUES (3, 'europa', 5, 3130, 4.87, 3.55, 671);
INSERT INTO public.moon VALUES (4, 'titan', 5, 5150, 1.35, 15.95, 1222);
INSERT INTO public.moon VALUES (5, 'rhea', 5, 1529, 2.32, 4.54, 327);
INSERT INTO public.moon VALUES (6, 'dione', 5, 1123, 1.10, 2.74, 378);
INSERT INTO public.moon VALUES (7, 'tethys', 5, 1060, 7.53, 1.89, 295);
INSERT INTO public.moon VALUES (8, 'enceladus', 5, 504, 1.08, 1.37, 238);
INSERT INTO public.moon VALUES (9, 'miranda', 6, 472, 6.47, 3.43, 129);
INSERT INTO public.moon VALUES (10, 'umberiel', 6, 1186, 1.03, 4.14, 266);
INSERT INTO public.moon VALUES (11, 'titania', 6, 1610, 3.44, 8.71, 336);
INSERT INTO public.moon VALUES (12, 'ariel', 6, 1158, 1.32, 2.52, 191);
INSERT INTO public.moon VALUES (13, 'oberon', 6, 1548, 3.05, 13.74, 583);
INSERT INTO public.moon VALUES (14, 'triton', 13, 2707, 2.14, 5.88, 354.8);
INSERT INTO public.moon VALUES (15, 'proteus', 13, 416, 4.06, 1.12, 117.6);
INSERT INTO public.moon VALUES (16, 'nereid', 13, 335, 2.35, 360.2, 5513);
INSERT INTO public.moon VALUES (17, 'phobos', 2, 22, 1.08, 0.32, 9.377);
INSERT INTO public.moon VALUES (18, 'deimos', 2, 12, 2.45, 1.26, 23.46);
INSERT INTO public.moon VALUES (19, 'charon', 10, 1212, 1.52, 6.39, 19.64);
INSERT INTO public.moon VALUES (20, 'styx', 10, 8, 7.5, 0.25, 17.536);
INSERT INTO public.moon VALUES (21, 'nix', 10, 48, 1.3, 2.53, 48.7);
INSERT INTO public.moon VALUES (22, 'hydra', 10, 61, 1.6, 3.10, 64.7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'terrestrial', 1, 1, 356.28, 1, 1, 15, 2);
INSERT INTO public.planet VALUES (2, 'mars', 'terrestrial', 1, 1.52, 687, 0.107, 0.53, -67, 2);
INSERT INTO public.planet VALUES (3, 'jupiter', 'gas_gaint', 2, 5.2, 4333, 318, 11.2, -150, 4);
INSERT INTO public.planet VALUES (4, 'kepler_452b', 'super_earth', 3, 1.63, 385, 5, 1.6, 0, 0);
INSERT INTO public.planet VALUES (5, 'saturn', 'gas_gaint', 2, 9.5, 10759, 95, 9.4, -178, 5);
INSERT INTO public.planet VALUES (6, 'uranus', 'gas_gaint', 2, 19.2, 30687, 14.5, 3.9, -216, 5);
INSERT INTO public.planet VALUES (7, 'hd_209458b', 'hot_jupiter', 3, 0.047, 3.5, 0.7, 1.4, 1000, 0);
INSERT INTO public.planet VALUES (8, 'trappist', 'earth_sized', 3, 0.044, 6.1, 0.9, 1, 230, 0);
INSERT INTO public.planet VALUES (9, 'mercury', 'terrestrial', 1, 0.39, 87.97, 0.055, 0.38, 173, 0);
INSERT INTO public.planet VALUES (10, 'pluto', 'dwarf', 4, 39.5, 1.5, 0.0022, 0.19, -233, 4);
INSERT INTO public.planet VALUES (11, 'eris', 'dwarf', 4, 37.8, 2.3, 0.0028, 0.19, -233, 0);
INSERT INTO public.planet VALUES (12, 'ceres', 'dwarf', 4, 2.88, 4.6, 0.00016, 0.075, -105, 0);
INSERT INTO public.planet VALUES (13, 'venus', 'terrestrial', 1, 0.72, 224.7, 0.815, 0.95, 462, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'main_sequence', 0, 1.0, 5778, 1.0, 1, true);
INSERT INTO public.star VALUES (2, 'proxima_centauri', 'red_dwarf', 4.24, 0.12, 3042, 0.0016, 2, NULL);
INSERT INTO public.star VALUES (3, 'sirius', 'main_sequence', 8.6, 2.1, 9400, 25.4, 3, true);
INSERT INTO public.star VALUES (4, 'betelgeuse', 'supergaint', 640, 18, 3500, 100000, 4, false);
INSERT INTO public.star VALUES (5, 'antares', 'supergaint', 600, 15, 3400, 1000, 5, false);
INSERT INTO public.star VALUES (6, 'cygnus', 'neutron', 260, 1.4, 700000, 0.001, 6, NULL);
INSERT INTO public.star VALUES (7, 'delta_cephei', 'cepheid', 1000, 4.5, 5500, 2000, 7, NULL);


--
-- Name: galaxy_details galaxy_details_galaxy_details_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details
    ADD CONSTRAINT galaxy_details_galaxy_details_id_key UNIQUE (galaxy_details_id);


--
-- Name: galaxy_details galaxy_details_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details
    ADD CONSTRAINT galaxy_details_pkey PRIMARY KEY (galaxy_details_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy_details fk_galaxy_details; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_details
    ADD CONSTRAINT fk_galaxy_details FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


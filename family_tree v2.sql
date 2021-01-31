--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name character varying(100),
    surname character varying(100)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person_relation_to; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_relation_to (
    id integer NOT NULL,
    id_relation integer,
    id_person integer,
    to_id_person integer
);


ALTER TABLE public.person_relation_to OWNER TO postgres;

--
-- Name: person_relation_to_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_relation_to_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_relation_to_id_seq OWNER TO postgres;

--
-- Name: person_relation_to_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_relation_to_id_seq OWNED BY public.person_relation_to.id;


--
-- Name: relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relation (
    id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.relation OWNER TO postgres;

--
-- Name: relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relation_id_seq OWNER TO postgres;

--
-- Name: relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relation_id_seq OWNED BY public.relation.id;


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: person_relation_to id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_relation_to ALTER COLUMN id SET DEFAULT nextval('public.person_relation_to_id_seq'::regclass);


--
-- Name: relation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation ALTER COLUMN id SET DEFAULT nextval('public.relation_id_seq'::regclass);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, name, surname) FROM stdin;
\.


--
-- Data for Name: person_relation_to; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_relation_to (id, id_relation, id_person, to_id_person) FROM stdin;
\.


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relation (id, name) FROM stdin;
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 7, true);


--
-- Name: person_relation_to_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_relation_to_id_seq', 6, true);


--
-- Name: relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relation_id_seq', 9, true);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_relation_to person_relation_to_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_relation_to
    ADD CONSTRAINT person_relation_to_pkey PRIMARY KEY (id);


--
-- Name: relation relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (id);


--
-- Name: person_relation_to person_relation_to_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_relation_to
    ADD CONSTRAINT person_relation_to_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.person(id);


--
-- Name: person_relation_to person_relation_to_id_relation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_relation_to
    ADD CONSTRAINT person_relation_to_id_relation_fkey FOREIGN KEY (id_relation) REFERENCES public.relation(id);


--
-- Name: person_relation_to person_relation_to_to_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_relation_to
    ADD CONSTRAINT person_relation_to_to_id_person_fkey FOREIGN KEY (to_id_person) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--


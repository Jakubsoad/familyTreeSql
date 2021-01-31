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
-- Name: persons_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons_relations (
    id integer NOT NULL,
    id_relation_1st_to_2nd integer,
    id_relation_2nd_to_1st integer,
    id_person_1st integer,
    id_person_2nd integer
);


ALTER TABLE public.persons_relations OWNER TO postgres;

--
-- Name: persons_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_relations_id_seq OWNER TO postgres;

--
-- Name: persons_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_relations_id_seq OWNED BY public.persons_relations.id;


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
-- Name: persons_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_relations ALTER COLUMN id SET DEFAULT nextval('public.persons_relations_id_seq'::regclass);


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
-- Data for Name: persons_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons_relations (id, id_relation_1st_to_2nd, id_relation_2nd_to_1st, id_person_1st, id_person_2nd) FROM stdin;
\.


--
-- Data for Name: relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relation (id, name) FROM stdin;
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 1, false);


--
-- Name: persons_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_relations_id_seq', 1, false);


--
-- Name: relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relation_id_seq', 1, false);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: persons_relations persons_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_relations
    ADD CONSTRAINT persons_relations_pkey PRIMARY KEY (id);


--
-- Name: relation relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (id);


--
-- Name: persons_relations persons_relations_id_person_1st_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_relations
    ADD CONSTRAINT persons_relations_id_person_1st_fkey FOREIGN KEY (id_person_1st) REFERENCES public.person(id);


--
-- Name: persons_relations persons_relations_id_person_2nd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_relations
    ADD CONSTRAINT persons_relations_id_person_2nd_fkey FOREIGN KEY (id_person_2nd) REFERENCES public.person(id);


--
-- Name: persons_relations persons_relations_id_relation_1st_to_2nd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_relations
    ADD CONSTRAINT persons_relations_id_relation_1st_to_2nd_fkey FOREIGN KEY (id_relation_1st_to_2nd) REFERENCES public.relation(id);


--
-- Name: persons_relations persons_relations_id_relation_2nd_to_1st_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_relations
    ADD CONSTRAINT persons_relations_id_relation_2nd_to_1st_fkey FOREIGN KEY (id_relation_2nd_to_1st) REFERENCES public.relation(id);


--
-- PostgreSQL database dump complete
--


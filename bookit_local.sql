--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17rc1

-- Started on 2025-10-31 13:25:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 222 (class 1259 OID 33358)
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    experience_id integer NOT NULL,
    slot_id integer NOT NULL,
    user_name character varying(150) NOT NULL,
    user_email character varying(200) NOT NULL,
    seats_booked integer DEFAULT 1 NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    promo_code character varying(50),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33357)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 221
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- TOC entry 218 (class 1259 OID 33330)
-- Name: experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    image_url text,
    base_price numeric(10,2) DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.experiences OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33329)
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experiences_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 217
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;


--
-- TOC entry 224 (class 1259 OID 33377)
-- Name: promo_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promo_codes (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    discount_percent integer,
    flat_discount numeric(10,2),
    max_uses integer,
    used_count integer DEFAULT 0,
    expires_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.promo_codes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33376)
-- Name: promo_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promo_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promo_codes_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 223
-- Name: promo_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promo_codes_id_seq OWNED BY public.promo_codes.id;


--
-- TOC entry 220 (class 1259 OID 33341)
-- Name: slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slots (
    id integer NOT NULL,
    experience_id integer NOT NULL,
    slot_date date NOT NULL,
    available_seats integer DEFAULT 0 NOT NULL,
    price numeric(10,2) DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.slots OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33340)
-- Name: slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slots_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 219
-- Name: slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slots_id_seq OWNED BY public.slots.id;


--
-- TOC entry 226 (class 1259 OID 33388)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(20) DEFAULT 'user'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33387)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4723 (class 2604 OID 33361)
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 33333)
-- Name: experiences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 33380)
-- Name: promo_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_codes ALTER COLUMN id SET DEFAULT nextval('public.promo_codes_id_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 33344)
-- Name: slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots ALTER COLUMN id SET DEFAULT nextval('public.slots_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 33391)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4901 (class 0 OID 33358)
-- Dependencies: 222
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, experience_id, slot_id, user_name, user_email, seats_booked, total_amount, promo_code, created_at) FROM stdin;
1	1	1	Raj Dubey	raj@example.com	2	45.00	SAVE10	2025-10-30 17:55:25.847544
2	2	3	raju don	rjadi@gmail.com	1	40.00	\N	2025-10-30 22:33:55.609419
3	1	1	Roshni Dubey	roshni@example.com	2	50.00	\N	2025-10-30 23:25:40.148059
4	2	3	Baby	rajdu@gmail.com	1	40.00	\N	2025-10-30 23:35:09.794718
5	3	4	rajdu	rajdunu5@gmail.com	1	30.00	\N	2025-10-31 00:45:28.96913
6	6	8	raj baba	raj@gmail.com	1	0.00	FLAT100	2025-10-31 12:23:53.990445
7	3	4	RAJ don	raj@gmail.com	1	27.00	SAVE10	2025-10-31 12:25:11.989437
\.


--
-- TOC entry 4897 (class 0 OID 33330)
-- Dependencies: 218
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experiences (id, title, description, image_url, base_price, created_at) FROM stdin;
1	Sunset Kayak Tour	Enjoy an evening kayak tour with a beautiful sunset.	https://i.ibb.co/gFRgtt5w/Whats-App-Image-2025-10-31-at-11-32-50.jpg	25.00	2025-10-30 17:51:27.660219
2	City Food Walk	Explore the best local bites with a friendly guide.	https://i.ibb.co/b5hz8CqS/Whats-App-Image-2025-10-31-at-11-32-50-1.jpg	40.00	2025-10-30 17:51:27.660219
3	Mountain Hike	A moderate hike with great views and picnic.	https://i.ibb.co/DJvXVRh/Whats-App-Image-2025-10-31-at-12-12-39.jpg	30.00	2025-10-30 17:51:27.660219
4	River Rafting Adventure	Experience the thrill of white-water rafting with professional guides and scenic views.	https://i.ibb.co/nN0gfZmx/Whats-App-Image-2025-10-31-at-11-46-58-1.jpg	80.00	2025-10-31 12:20:35.485176
5	Desert Jeep Safari	Ride through the golden dunes on a thrilling jeep adventure. Evening includes BBQ and live music.	https://i.ibb.co/kgdfrc0R/Whats-App-Image-2025-10-31-at-11-46-59.jpg	250.00	2025-10-31 12:20:35.485176
6	Temple Visit Tour	A peaceful day exploring ancient temples, rituals, and cultural heritage.	https://i.ibb.co/chxw3Zst/Whats-App-Image-2025-10-31-at-11-46-58.jpg	40.00	2025-10-31 12:20:35.485176
\.


--
-- TOC entry 4903 (class 0 OID 33377)
-- Dependencies: 224
-- Data for Name: promo_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promo_codes (id, code, discount_percent, flat_discount, max_uses, used_count, expires_at, created_at) FROM stdin;
2	FLAT100	\N	100.00	\N	1	\N	2025-10-30 17:51:27.660219
1	SAVE10	10	\N	\N	2	\N	2025-10-30 17:51:27.660219
\.


--
-- TOC entry 4899 (class 0 OID 33341)
-- Dependencies: 220
-- Data for Name: slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slots (id, experience_id, slot_date, available_seats, price, created_at) FROM stdin;
2	1	2025-11-03	8	25.00	2025-10-30 17:51:27.660219
1	1	2025-11-02	6	25.00	2025-10-30 17:51:27.660219
3	2	2025-11-01	10	40.00	2025-10-30 17:51:27.660219
5	4	2025-11-05	10	90.00	2025-10-31 12:22:25.192647
6	4	2025-11-10	8	90.00	2025-10-31 12:22:25.192647
7	6	2025-11-06	20	45.00	2025-10-31 12:22:25.192647
9	5	2025-11-08	12	120.00	2025-10-31 12:22:25.192647
10	5	2025-11-15	10	120.00	2025-10-31 12:22:25.192647
8	6	2025-11-12	14	45.00	2025-10-31 12:22:25.192647
4	3	2025-11-04	13	30.00	2025-10-30 17:51:27.660219
\.


--
-- TOC entry 4905 (class 0 OID 33388)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role, created_at) FROM stdin;
1	raj	rajhdu@gmail.com	$2b$10$iOVgv2vlINEQgQMo8KqOj..mHPsDU4tBcAlaCp0H3or1s/hGoVN5C	user	2025-10-30 22:55:28.902163
2	Raju Hero	hello@gmail.com	$2b$10$piZw02E.M9GtsxtYRt26W.267M2Rdc0V5EDwBH8wL6UJLryuTEtz.	user	2025-10-30 23:33:45.581568
\.


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 221
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 7, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 217
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experiences_id_seq', 6, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 223
-- Name: promo_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promo_codes_id_seq', 2, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 219
-- Name: slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slots_id_seq', 10, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4739 (class 2606 OID 33365)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 33339)
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 33386)
-- Name: promo_codes promo_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_codes
    ADD CONSTRAINT promo_codes_code_key UNIQUE (code);


--
-- TOC entry 4743 (class 2606 OID 33384)
-- Name: promo_codes promo_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promo_codes
    ADD CONSTRAINT promo_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 33351)
-- Name: slots slots_experience_id_slot_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_experience_id_slot_date_key UNIQUE (experience_id, slot_date);


--
-- TOC entry 4737 (class 2606 OID 33349)
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 33397)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4747 (class 2606 OID 33395)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 33366)
-- Name: bookings bookings_experience_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_experience_id_fkey FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


--
-- TOC entry 4750 (class 2606 OID 33371)
-- Name: bookings bookings_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_slot_id_fkey FOREIGN KEY (slot_id) REFERENCES public.slots(id) ON DELETE CASCADE;


--
-- TOC entry 4748 (class 2606 OID 33352)
-- Name: slots slots_experience_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slots
    ADD CONSTRAINT slots_experience_id_fkey FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON DELETE CASCADE;


-- Completed on 2025-10-31 13:25:01

--
-- PostgreSQL database dump complete
--


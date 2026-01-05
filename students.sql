--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (25, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (26, 'Web Programming');
INSERT INTO public.courses VALUES (27, 'Database Systems');
INSERT INTO public.courses VALUES (28, 'Computer Networks');
INSERT INTO public.courses VALUES (29, 'SQL');
INSERT INTO public.courses VALUES (30, 'Machine Learning');
INSERT INTO public.courses VALUES (31, 'Computer Systems');
INSERT INTO public.courses VALUES (32, 'Web Applications');
INSERT INTO public.courses VALUES (33, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (34, 'Python');
INSERT INTO public.courses VALUES (35, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (36, 'Calculus');
INSERT INTO public.courses VALUES (37, 'Game Architecture');
INSERT INTO public.courses VALUES (38, 'Algorithms');
INSERT INTO public.courses VALUES (39, 'UNIX');
INSERT INTO public.courses VALUES (40, 'Server Administration');
INSERT INTO public.courses VALUES (41, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (39, 'Database Administration');
INSERT INTO public.majors VALUES (40, 'Web Development');
INSERT INTO public.majors VALUES (41, 'Data Science');
INSERT INTO public.majors VALUES (42, 'Network Engineering');
INSERT INTO public.majors VALUES (43, 'Computer Programming');
INSERT INTO public.majors VALUES (44, 'Game Design');
INSERT INTO public.majors VALUES (45, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (39, 25);
INSERT INTO public.majors_courses VALUES (40, 26);
INSERT INTO public.majors_courses VALUES (39, 27);
INSERT INTO public.majors_courses VALUES (41, 25);
INSERT INTO public.majors_courses VALUES (42, 28);
INSERT INTO public.majors_courses VALUES (39, 29);
INSERT INTO public.majors_courses VALUES (41, 30);
INSERT INTO public.majors_courses VALUES (42, 31);
INSERT INTO public.majors_courses VALUES (43, 28);
INSERT INTO public.majors_courses VALUES (39, 32);
INSERT INTO public.majors_courses VALUES (44, 33);
INSERT INTO public.majors_courses VALUES (41, 34);
INSERT INTO public.majors_courses VALUES (43, 35);
INSERT INTO public.majors_courses VALUES (45, 31);
INSERT INTO public.majors_courses VALUES (44, 36);
INSERT INTO public.majors_courses VALUES (40, 25);
INSERT INTO public.majors_courses VALUES (41, 36);
INSERT INTO public.majors_courses VALUES (40, 35);
INSERT INTO public.majors_courses VALUES (44, 37);
INSERT INTO public.majors_courses VALUES (45, 28);
INSERT INTO public.majors_courses VALUES (44, 38);
INSERT INTO public.majors_courses VALUES (45, 39);
INSERT INTO public.majors_courses VALUES (45, 40);
INSERT INTO public.majors_courses VALUES (43, 31);
INSERT INTO public.majors_courses VALUES (43, 34);
INSERT INTO public.majors_courses VALUES (42, 41);
INSERT INTO public.majors_courses VALUES (40, 32);
INSERT INTO public.majors_courses VALUES (42, 38);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (7, 'Rhea', 'Kellems', 39, 2.5);
INSERT INTO public.students VALUES (8, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (9, 'Kimberly', 'Whitley', 40, 3.8);
INSERT INTO public.students VALUES (10, 'Jimmy', 'Felipe', 39, 3.7);
INSERT INTO public.students VALUES (11, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (12, 'Casares', 'Hijo', 44, 4.0);
INSERT INTO public.students VALUES (13, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (14, 'Sterling', 'Boss', 44, 3.9);
INSERT INTO public.students VALUES (15, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (16, 'Kaija', 'Uronen', 44, 3.7);
INSERT INTO public.students VALUES (17, 'Faye', 'Conn', 44, 2.1);
INSERT INTO public.students VALUES (18, 'Efren', 'Reilly', 40, 3.9);
INSERT INTO public.students VALUES (19, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (20, 'Maxine', 'Hagenes', 39, 2.9);
INSERT INTO public.students VALUES (21, 'Larry', 'Saunders', 41, 2.2);
INSERT INTO public.students VALUES (22, 'Karl', 'Kuhar', 40, NULL);
INSERT INTO public.students VALUES (23, 'Lieke', 'Hazenveld', 44, 3.5);
INSERT INTO public.students VALUES (24, 'Obie', 'Hilpert', 40, NULL);
INSERT INTO public.students VALUES (25, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (26, 'Nathan', 'Turner', 39, 3.3);
INSERT INTO public.students VALUES (27, 'Gerald', 'Osiki', 41, 2.2);
INSERT INTO public.students VALUES (28, 'Vanya', 'Hassanah', 44, 4.0);
INSERT INTO public.students VALUES (29, 'Roxelana', 'Florescu', 39, 3.2);
INSERT INTO public.students VALUES (30, 'Helene', 'Parker', 41, 3.4);
INSERT INTO public.students VALUES (31, 'Mariana', 'Russel', 40, 1.8);
INSERT INTO public.students VALUES (32, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (33, 'Mehdi', 'Vandenberghe', 39, 1.9);
INSERT INTO public.students VALUES (34, 'Dejon', 'Howell', 40, 4.0);
INSERT INTO public.students VALUES (35, 'Aliya', 'Gulgowski', 45, 2.6);
INSERT INTO public.students VALUES (36, 'Ana', 'Tupajic', 41, 3.1);
INSERT INTO public.students VALUES (37, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 41, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 45, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 37, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (course_id, major_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: balita; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.balita (
    id bigint NOT NULL,
    nik character varying(255) NOT NULL,
    users_id integer NOT NULL,
    kota_id integer NOT NULL,
    nama_balita character varying(255) NOT NULL,
    tanggal_lahir date NOT NULL,
    jenis_kelamin character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT balita_jenis_kelamin_check CHECK (((jenis_kelamin)::text = ANY ((ARRAY['Laki-laki'::character varying, 'Perempuan'::character varying])::text[])))
);


ALTER TABLE public.balita OWNER TO root;

--
-- Name: balita_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.balita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.balita_id_seq OWNER TO root;

--
-- Name: balita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.balita_id_seq OWNED BY public.balita.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO root;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO root;

--
-- Name: data_geo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_geo (
    id bigint NOT NULL,
    tahun_id integer NOT NULL,
    kota_id integer NOT NULL,
    prevalensi_stunting double precision NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.data_geo OWNER TO root;

--
-- Name: data_geo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.data_geo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_geo_id_seq OWNER TO root;

--
-- Name: data_geo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.data_geo_id_seq OWNED BY public.data_geo.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO root;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO root;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO root;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO root;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: kota; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.kota (
    id bigint NOT NULL,
    kode_kota character varying(255) NOT NULL,
    nama_kota character varying(255) NOT NULL,
    kode_negara character varying(255) NOT NULL,
    nama_negara character varying(255) NOT NULL,
    kode_provinsi character varying(255) NOT NULL,
    nama_provinsi character varying(255) NOT NULL,
    shape_leng double precision NOT NULL,
    shape_area double precision NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.kota OWNER TO root;

--
-- Name: kota_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.kota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kota_id_seq OWNER TO root;

--
-- Name: kota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.kota_id_seq OWNED BY public.kota.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO root;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO root;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO root;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO root;

--
-- Name: pengukuran_gizi; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.pengukuran_gizi (
    id bigint NOT NULL,
    balita_id integer NOT NULL,
    tanggal_pengukuran date NOT NULL,
    umur_bulan integer NOT NULL,
    berat_badan double precision NOT NULL,
    tinggi_badan double precision NOT NULL,
    lingkar_lengan double precision NOT NULL,
    z_score_bb_u double precision NOT NULL,
    z_score_tb_u double precision NOT NULL,
    z_score_bb_tb double precision NOT NULL,
    status_gizi character varying(255) NOT NULL,
    petugas character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pengukuran_gizi_status_gizi_check CHECK (((status_gizi)::text = ANY ((ARRAY['Normal'::character varying, 'Gizi Buruk'::character varying])::text[])))
);


ALTER TABLE public.pengukuran_gizi OWNER TO root;

--
-- Name: pengukuran_gizi_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.pengukuran_gizi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pengukuran_gizi_id_seq OWNER TO root;

--
-- Name: pengukuran_gizi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.pengukuran_gizi_id_seq OWNED BY public.pengukuran_gizi.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO root;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: posyandu; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.posyandu (
    id bigint NOT NULL,
    kota_id integer NOT NULL,
    jumlah_posyandu integer NOT NULL,
    status character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT posyandu_status_check CHECK (((status)::text = ANY ((ARRAY['Aktif'::character varying, 'Tidak Aktif'::character varying])::text[])))
);


ALTER TABLE public.posyandu OWNER TO root;

--
-- Name: posyandu_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.posyandu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posyandu_id_seq OWNER TO root;

--
-- Name: posyandu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.posyandu_id_seq OWNED BY public.posyandu.id;


--
-- Name: rekap_tahunan_gizi; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.rekap_tahunan_gizi (
    id bigint NOT NULL,
    pengukuran_gizi_id integer NOT NULL,
    kota character varying(255) NOT NULL,
    tahun integer NOT NULL,
    jumlah_pengukuran integer NOT NULL,
    rata_berat_badan double precision NOT NULL,
    rata_tinggi_badan double precision NOT NULL,
    rata_lingkaran_badan double precision NOT NULL,
    rata_z_score_bb_u double precision NOT NULL,
    rata_z_score_tb_u double precision NOT NULL,
    rata_z_score_bb_tb double precision NOT NULL,
    status_gizi_tahunan character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.rekap_tahunan_gizi OWNER TO root;

--
-- Name: rekap_tahunan_gizi_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.rekap_tahunan_gizi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rekap_tahunan_gizi_id_seq OWNER TO root;

--
-- Name: rekap_tahunan_gizi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.rekap_tahunan_gizi_id_seq OWNED BY public.rekap_tahunan_gizi.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO root;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO root;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO root;

--
-- Name: tahun; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tahun (
    id bigint NOT NULL,
    tahun integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tahun OWNER TO root;

--
-- Name: tahun_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tahun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tahun_id_seq OWNER TO root;

--
-- Name: tahun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.tahun_id_seq OWNED BY public.tahun.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nik character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: balita id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.balita ALTER COLUMN id SET DEFAULT nextval('public.balita_id_seq'::regclass);


--
-- Name: data_geo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_geo ALTER COLUMN id SET DEFAULT nextval('public.data_geo_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: kota id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.kota ALTER COLUMN id SET DEFAULT nextval('public.kota_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pengukuran_gizi id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pengukuran_gizi ALTER COLUMN id SET DEFAULT nextval('public.pengukuran_gizi_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: posyandu id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.posyandu ALTER COLUMN id SET DEFAULT nextval('public.posyandu_id_seq'::regclass);


--
-- Name: rekap_tahunan_gizi id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rekap_tahunan_gizi ALTER COLUMN id SET DEFAULT nextval('public.rekap_tahunan_gizi_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: tahun id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tahun ALTER COLUMN id SET DEFAULT nextval('public.tahun_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: balita; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.balita (id, nik, users_id, kota_id, nama_balita, tanggal_lahir, jenis_kelamin, deleted_at, created_at, updated_at) FROM stdin;
1	3322121828222	3	17	Jonathan Leonardo	2025-05-13	Laki-laki	\N	2025-05-13 10:27:23	2025-05-13 10:27:23
3	3322121828221	3	17	Jonathan Fransisco	2025-05-13	Laki-laki	\N	2025-05-13 15:59:47	2025-05-13 15:59:47
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cache (key, value, expiration) FROM stdin;
laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer	i:1747199575;	1747199575
laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3	i:1;	1747199575
laravel_cache_spatie.permission.cache	a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:42:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"view_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:13:"view_any_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:11:"create_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:11:"update_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:11:"delete_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:15:"delete_any_role";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:9:"view_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:13:"view_any_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:11:"create_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:11:"update_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:12:"restore_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:16:"restore_any_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:14:"replicate_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:12:"reorder_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:11:"delete_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:15:"delete_any_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:17:"force_delete_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:21:"force_delete_any_user";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:15:"view_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:19:"view_any_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:20;a:4:{s:1:"a";i:21;s:1:"b";s:17:"create_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:21;a:4:{s:1:"a";i:22;s:1:"b";s:17:"update_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:22;a:4:{s:1:"a";i:23;s:1:"b";s:18:"restore_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:23;a:4:{s:1:"a";i:24;s:1:"b";s:22:"restore_any_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:24;a:4:{s:1:"a";i:25;s:1:"b";s:20:"replicate_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:25;a:4:{s:1:"a";i:26;s:1:"b";s:18:"reorder_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:26;a:4:{s:1:"a";i:27;s:1:"b";s:17:"delete_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:27;a:4:{s:1:"a";i:28;s:1:"b";s:21:"delete_any_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:28;a:4:{s:1:"a";i:29;s:1:"b";s:23:"force_delete_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:29;a:4:{s:1:"a";i:30;s:1:"b";s:27:"force_delete_any_penyebaran";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:2;i:1;i:1;}}i:30;a:4:{s:1:"a";i:31;s:1:"b";s:9:"view_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:31;a:4:{s:1:"a";i:32;s:1:"b";s:13:"view_any_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:32;a:4:{s:1:"a";i:33;s:1:"b";s:11:"create_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:33;a:4:{s:1:"a";i:34;s:1:"b";s:11:"update_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:34;a:4:{s:1:"a";i:35;s:1:"b";s:12:"restore_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:35;a:4:{s:1:"a";i:36;s:1:"b";s:16:"restore_any_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:36;a:4:{s:1:"a";i:37;s:1:"b";s:14:"replicate_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:37;a:4:{s:1:"a";i:38;s:1:"b";s:12:"reorder_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:38;a:4:{s:1:"a";i:39;s:1:"b";s:11:"delete_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:39;a:4:{s:1:"a";i:40;s:1:"b";s:15:"delete_any_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:40;a:4:{s:1:"a";i:41;s:1:"b";s:17:"force_delete_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:41;a:4:{s:1:"a";i:42;s:1:"b";s:21:"force_delete_any_kota";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:2:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:11:"super_admin";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:5:"Admin";s:1:"c";s:3:"web";}}}	1747211961
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: data_geo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_geo (id, tahun_id, kota_id, prevalensi_stunting, deleted_at, created_at, updated_at) FROM stdin;
1	1	24	17.9	\N	\N	\N
2	1	29	21.6	\N	\N	\N
3	1	32	16.8	\N	\N	\N
4	1	13	23.3	\N	\N	\N
5	1	19	15.9	\N	\N	\N
6	1	33	15.7	\N	\N	\N
7	1	5	28.1	\N	\N	\N
8	1	14	22.3	\N	\N	\N
9	1	10	20.7	\N	\N	\N
10	1	20	15.8	\N	\N	\N
11	1	31	20	\N	\N	\N
12	1	3	14	\N	\N	\N
13	1	28	16.2	\N	\N	\N
14	1	21	18.8	\N	\N	\N
15	1	16	9.6	\N	\N	\N
16	1	25	21.5	\N	\N	\N
17	1	8	18.7	\N	\N	\N
18	1	17	20.6	\N	\N	\N
19	1	7	17.6	\N	\N	\N
20	1	30	25	\N	\N	\N
21	1	6	25.5	\N	\N	\N
22	1	4	16.4	\N	\N	\N
23	1	22	20.5	\N	\N	\N
24	1	34	21.2	\N	\N	\N
25	1	35	21.7	\N	\N	\N
26	1	15	19.5	\N	\N	\N
27	1	27	24.7	\N	\N	\N
28	1	16	28	\N	\N	\N
29	1	11	26.3	\N	\N	\N
30	1	2	13.3	\N	\N	\N
31	1	12	20.4	\N	\N	\N
32	1	1	15.2	\N	\N	\N
33	1	26	21.3	\N	\N	\N
34	1	9	20.6	\N	\N	\N
35	1	23	23.9	\N	\N	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: kota; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.kota (id, kode_kota, nama_kota, kode_negara, nama_negara, kode_provinsi, nama_provinsi, shape_leng, shape_area, deleted_at, created_at, updated_at) FROM stdin;
1	ID3328	Tegal	ID	Indonesia	ID33	Jawa Tengah	0.12313117321	0.00068931294	\N	\N	\N
2	ID3314	Sragen	ID	Indonesia	ID33	Jawa Tengah	0.11231127474	0.00041184886	\N	\N	\N
3	ID3305	Kebumen	ID	Indonesia	ID33	Jawa Tengah	0.12935410402	0.00052488266	\N	\N	\N
4	ID3308	Magelang	ID	Indonesia	ID33	Jawa Tengah	0.10810104415	0.0004486972	\N	\N	\N
5	ID3301	Cilacap	ID	Indonesia	ID33	Jawa Tengah	0.17064554662	0.00076896924	\N	\N	\N
6	ID3319	Kudus	ID	Indonesia	ID33	Jawa Tengah	0.03344017923	3.092585e-05	\N	\N	\N
7	ID3372	Kota Surakarta	ID	Indonesia	ID33	Jawa Tengah	0.02501042578	2.931005e-05	\N	\N	\N
8	ID3373	Kota Salatiga	ID	Indonesia	ID33	Jawa Tengah	0.07120876359	0.00011107271	\N	\N	\N
9	ID3312	Wonogiri	ID	Indonesia	ID33	Jawa Tengah	0.10901921611	0.0003361859	\N	\N	\N
10	ID3315	Grobogan	ID	Indonesia	ID33	Jawa Tengah	0.07097870024	0.00020721143	\N	\N	\N
11	ID3322	Semarang	ID	Indonesia	ID33	Jawa Tengah	0.2002263497	0.00099363874	\N	\N	\N
12	ID3311	Sukoharjo	ID	Indonesia	ID33	Jawa Tengah	0.08731022757	0.00020591023	\N	\N	\N
13	ID3316	Blora	ID	Indonesia	ID33	Jawa Tengah	0.09541110675	0.00023342745	\N	\N	\N
14	ID3321	Demak	ID	Indonesia	ID33	Jawa Tengah	0.118938236	0.0004006249	\N	\N	\N
15	ID3303	Purbalingga	ID	Indonesia	ID33	Jawa Tengah	0.12964348548	0.00036317074	\N	\N	\N
16	ID3371	Kota Magelang	ID	Indonesia	ID33	Jawa Tengah	0.05995496741	9.251196e-05	\N	\N	\N
17	ID3374	Kota Semarang	ID	Indonesia	ID33	Jawa Tengah	0.07899529688	0.00022098097	\N	\N	\N
18	ID3317	Rembang	ID	Indonesia	ID33	Jawa Tengah	0.06699675288	0.00014386788	\N	\N	\N
19	ID3309	Boyolali	ID	Indonesia	ID33	Jawa Tengah	0.07324415954	0.00022911363	\N	\N	\N
20	ID3320	Jepara	ID	Indonesia	ID33	Jawa Tengah	0.09562266483	0.00026613554	\N	\N	\N
21	ID3310	Klaten	ID	Indonesia	ID33	Jawa Tengah	0.0445927682	7.646453e-05	\N	\N	\N
22	ID3318	Pati	ID	Indonesia	ID33	Jawa Tengah	0.13909341776	0.00030895403	\N	\N	\N
23	ID3307	Wonosobo	ID	Indonesia	ID33	Jawa Tengah	0.07298952384	0.00018722246	\N	\N	\N
24	ID3304	Banjarnegara	ID	Indonesia	ID33	Jawa Tengah	0.08469793567	0.00027510349	\N	\N	\N
25	ID3375	Kota Pekalongan	ID	Indonesia	ID33	Jawa Tengah	0.05853614323	0.00012167749	\N	\N	\N
26	ID3323	Temanggung	ID	Indonesia	ID33	Jawa Tengah	0.12784639594	0.00059306025	\N	\N	\N
27	ID3306	Purworejo	ID	Indonesia	ID33	Jawa Tengah	0.04809597128	0.00012212593	\N	\N	\N
28	ID3324	Kendal	ID	Indonesia	ID33	Jawa Tengah	0.06874383931	0.00017201839	\N	\N	\N
29	ID3302	Banyumas	ID	Indonesia	ID33	Jawa Tengah	0.11830990925	0.00069859182	\N	\N	\N
30	ID3376	Kota Tegal	ID	Indonesia	ID33	Jawa Tengah	0.05053024646	6.93511e-05	\N	\N	\N
31	ID3313	Karanganyar	ID	Indonesia	ID33	Jawa Tengah	0.1152428913	0.00022880526	\N	\N	\N
32	ID3325	Batang	ID	Indonesia	ID33	Jawa Tengah	0.06615910047	0.00019077998	\N	\N	\N
33	ID3329	Brebes	ID	Indonesia	ID33	Jawa Tengah	0.25305976838	0.00149191962	\N	\N	\N
34	ID3326	Pekalongan	ID	Indonesia	ID33	Jawa Tengah	0.08056880748	0.00019970555	\N	\N	\N
35	ID3327	Pemalang	ID	Indonesia	ID33	Jawa Tengah	0.07878594291	0.00019514963	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
69	2025_05_13_034952_create_data_geos_table	13
71	2025_05_13_033334_create_balitas_table	14
72	2025_05_13_050942_create_posyandus_table	15
77	2025_05_13_145734_create_personal_access_tokens_table	18
80	0001_01_01_000000_create_users_table	19
82	2025_05_14_051925_create_notifications_table	20
35	0001_01_01_000001_create_cache_table	1
36	0001_01_01_000002_create_jobs_table	1
37	2025_05_12_134100_create_permission_tables	2
60	2025_05_13_035000_create_tahuns_table	9
61	2025_05_13_034531_create_kotas_table	10
64	2025_05_13_051620_create_pengukuran_gizis_table	10
65	2025_05_13_052322_create_rekap_tahunan_gizis_table	10
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	8
2	App\\Models\\User	9
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: pengukuran_gizi; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.pengukuran_gizi (id, balita_id, tanggal_pengukuran, umur_bulan, berat_badan, tinggi_badan, lingkar_lengan, z_score_bb_u, z_score_tb_u, z_score_bb_tb, status_gizi, petugas, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	view_role	web	2025-05-13 03:08:37	2025-05-13 03:08:37
2	view_any_role	web	2025-05-13 03:08:37	2025-05-13 03:08:37
3	create_role	web	2025-05-13 03:08:37	2025-05-13 03:08:37
4	update_role	web	2025-05-13 03:08:37	2025-05-13 03:08:37
5	delete_role	web	2025-05-13 03:08:37	2025-05-13 03:08:37
6	delete_any_role	web	2025-05-13 03:08:37	2025-05-13 03:08:37
7	view_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
8	view_any_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
9	create_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
10	update_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
11	restore_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
12	restore_any_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
13	replicate_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
14	reorder_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
15	delete_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
16	delete_any_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
17	force_delete_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
18	force_delete_any_user	web	2025-05-13 03:08:37	2025-05-13 03:08:37
19	view_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
20	view_any_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
21	create_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
22	update_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
23	restore_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
24	restore_any_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
25	replicate_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
26	reorder_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
27	delete_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
28	delete_any_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
29	force_delete_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
30	force_delete_any_penyebaran	web	2025-05-13 08:38:55	2025-05-13 08:38:55
31	view_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
32	view_any_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
33	create_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
34	update_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
35	restore_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
36	restore_any_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
37	replicate_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
38	reorder_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
39	delete_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
40	delete_any_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
41	force_delete_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
42	force_delete_any_kota	web	2025-05-13 08:39:20	2025-05-13 08:39:20
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: posyandu; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.posyandu (id, kota_id, jumlah_posyandu, status, deleted_at, created_at, updated_at) FROM stdin;
1	35	90	Aktif	\N	2025-05-13 14:32:30	2025-05-13 14:32:30
\.


--
-- Data for Name: rekap_tahunan_gizi; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.rekap_tahunan_gizi (id, pengukuran_gizi_id, kota, tahun, jumlah_pengukuran, rata_berat_badan, rata_tinggi_badan, rata_lingkaran_badan, rata_z_score_bb_u, rata_z_score_tb_u, rata_z_score_bb_tb, status_gizi_tahunan, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
30	2
7	2
8	2
9	2
10	2
14	2
18	2
17	2
13	2
12	2
16	2
15	2
11	2
31	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	super_admin	web	2025-05-13 03:06:40	2025-05-13 03:06:40
2	Admin	web	2025-05-13 08:38:55	2025-05-13 08:38:55
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
uQ5rcggy1HSOwpbIGCWJyXrIePbwupAeM3Az40QG	8	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZjBoWVlkcDZNZkNWRnQ4T3RtUHB4ckh1UmdVck56OXJHSmlaVGtHWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9rb3RhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiQvYU9IOGxPY0ppdS92Sk9IT1lXZ2YuclZzNkx6bklZZC95SEFiUXFHNzhzRjJhdGRNbnR5NiI7fQ==	1747200257
\.


--
-- Data for Name: tahun; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tahun (id, tahun, created_at, updated_at) FROM stdin;
1	2021	2025-05-13 14:19:42	2025-05-13 14:19:42
2	2022	2025-05-13 14:19:46	2025-05-13 14:19:46
3	2023	2025-05-13 14:19:49	2025-05-13 14:19:49
4	2024	2025-05-13 14:19:52	2025-05-13 14:19:52
5	2025	2025-05-13 14:19:55	2025-05-13 14:19:55
6	2026	2025-05-13 14:19:58	2025-05-13 14:19:58
8	2027	2025-05-13 14:21:14	2025-05-13 14:21:14
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, nik, name, email, email_verified_at, password, deleted_at, remember_token, created_at, updated_at) FROM stdin;
3	3322892715913	Salwa Fitriyatunnisa	salwafitriya@gmail.com	2025-05-12 09:31:04	$2y$12$Xkv4IA.Ft4wTbeMLZb130uDvLKm8eDlpLGik0paJQpzLEwEu5mjBm	\N	9m4ey9ZkRJ	2025-05-12 09:31:04	2025-05-12 09:31:04
4	3322121828189	John Doe	johndoe@gmail.com	\N	$2y$12$UJgN28luO2DRVDVkC6QISOc2hY.SEOh.RgKSXhEE8g3.WKHnmXux.	\N	\N	2025-05-12 09:32:08	2025-05-12 09:32:08
2	3322892715638	Muhammad Rayhan Maulanan Anas	rayhanzz772@gmail.com	2025-05-12 00:00:00	$2y$12$KumrLZtreRn9FeaqX6hR9OBHhe37ONYrttcdlTgLikh0DCbZkq3IO	\N	XMrk5Zp68V	2025-05-12 09:31:04	2025-05-12 13:55:53
8	3322892715621	Dinas Kesehatan	dinkes@gmail.com	2025-05-13 00:00:00	$2y$12$/aOH8lOcJiu/vJOHOYWgf.rVs6LznIYd/yHAbQqG78sF2atdMnty6	\N	\N	2025-05-13 03:15:46	2025-05-13 03:15:46
1	3322892717251	Rais Hannan Rizanto	rizantohannan@gmail.com	2025-05-12 00:00:00	$2y$12$M28Hao4c/AMgk15uzBYc6eBG8RyRJPnzJYPB2ga1TyyeqG83eFGHG	\N	3fNKAJFMJ4rrYZLKk6y4JuS2lxQuZnv8bhPRRSrCyfCWDTOfFsew1dTnO3N3	2025-05-12 09:31:03	2025-05-13 03:17:38
9	3321827632517	Posyandu	posyandu@gmail.com	2025-05-13 00:00:00	$2y$12$Gompt/P23KpJlx44R4rdlO2Tm3PtY380hR6ceHjEVEfvXM9ee3Wf2	\N	\N	2025-05-13 08:41:20	2025-05-13 08:41:20
\.


--
-- Name: balita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.balita_id_seq', 3, true);


--
-- Name: data_geo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.data_geo_id_seq', 35, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: kota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.kota_id_seq', 35, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 82, true);


--
-- Name: pengukuran_gizi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.pengukuran_gizi_id_seq', 1, false);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.permissions_id_seq', 42, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: posyandu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.posyandu_id_seq', 1, true);


--
-- Name: rekap_tahunan_gizi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.rekap_tahunan_gizi_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: tahun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tahun_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: balita balita_nik_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.balita
    ADD CONSTRAINT balita_nik_unique UNIQUE (nik);


--
-- Name: balita balita_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.balita
    ADD CONSTRAINT balita_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: data_geo data_geo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_geo
    ADD CONSTRAINT data_geo_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: kota kota_kode_kota_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.kota
    ADD CONSTRAINT kota_kode_kota_unique UNIQUE (kode_kota);


--
-- Name: kota kota_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.kota
    ADD CONSTRAINT kota_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: pengukuran_gizi pengukuran_gizi_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.pengukuran_gizi
    ADD CONSTRAINT pengukuran_gizi_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: posyandu posyandu_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.posyandu
    ADD CONSTRAINT posyandu_pkey PRIMARY KEY (id);


--
-- Name: rekap_tahunan_gizi rekap_tahunan_gizi_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rekap_tahunan_gizi
    ADD CONSTRAINT rekap_tahunan_gizi_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: tahun tahun_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tahun
    ADD CONSTRAINT tahun_pkey PRIMARY KEY (id);


--
-- Name: tahun tahun_tahun_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tahun
    ADD CONSTRAINT tahun_tahun_unique UNIQUE (tahun);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_nik_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nik_unique UNIQUE (nik);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: balita balita_kota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.balita
    ADD CONSTRAINT balita_kota_id_foreign FOREIGN KEY (kota_id) REFERENCES public.kota(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_geo data_geo_kota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_geo
    ADD CONSTRAINT data_geo_kota_id_foreign FOREIGN KEY (kota_id) REFERENCES public.kota(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_geo data_geo_tahun_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_geo
    ADD CONSTRAINT data_geo_tahun_id_foreign FOREIGN KEY (tahun_id) REFERENCES public.tahun(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: posyandu posyandu_kota_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.posyandu
    ADD CONSTRAINT posyandu_kota_id_foreign FOREIGN KEY (kota_id) REFERENCES public.kota(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rekap_tahunan_gizi rekap_tahunan_gizi_pengukuran_gizi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.rekap_tahunan_gizi
    ADD CONSTRAINT rekap_tahunan_gizi_pengukuran_gizi_id_foreign FOREIGN KEY (pengukuran_gizi_id) REFERENCES public.pengukuran_gizi(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


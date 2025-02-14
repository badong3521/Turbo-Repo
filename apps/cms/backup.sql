--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2

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

--
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;


ALTER SCHEMA pgagent OWNER TO postgres;

--
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: benefits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benefits (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    logo uuid,
    content text
);


ALTER TABLE public.benefits OWNER TO postgres;

--
-- Name: benefits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benefits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.benefits_id_seq OWNER TO postgres;

--
-- Name: benefits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benefits_id_seq OWNED BY public.benefits.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title text,
    content text,
    tags json,
    author integer,
    slug character varying(255) DEFAULT NULL::character varying,
    logo uuid,
    intro text
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    title character varying(255) DEFAULT NULL::character varying,
    address character varying(255) DEFAULT NULL::character varying,
    tel character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: companies_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies_links (
    id integer NOT NULL,
    companies_id integer,
    links_id integer
);


ALTER TABLE public.companies_links OWNER TO postgres;

--
-- Name: companies_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.companies_links_id_seq OWNER TO postgres;

--
-- Name: companies_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_links_id_seq OWNED BY public.companies_links.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO postgres;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO postgres;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO postgres;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO postgres;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_versions OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: footers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footers (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.footers OWNER TO postgres;

--
-- Name: footers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footers_id_seq OWNER TO postgres;

--
-- Name: footers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footers_id_seq OWNED BY public.footers.id;


--
-- Name: footers_links_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footers_links_group (
    id integer NOT NULL,
    footers_id integer,
    links_group_id integer
);


ALTER TABLE public.footers_links_group OWNER TO postgres;

--
-- Name: footers_links_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footers_links_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footers_links_group_id_seq OWNER TO postgres;

--
-- Name: footers_links_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footers_links_group_id_seq OWNED BY public.footers_links_group.id;


--
-- Name: job_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_categories (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    description text
);


ALTER TABLE public.job_categories OWNER TO postgres;

--
-- Name: job_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_categories_id_seq OWNER TO postgres;

--
-- Name: job_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_categories_id_seq OWNED BY public.job_categories.id;


--
-- Name: job_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_locations (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.job_locations OWNER TO postgres;

--
-- Name: job_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_locations_id_seq OWNER TO postgres;

--
-- Name: job_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_locations_id_seq OWNED BY public.job_locations.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    description text,
    intro text,
    link integer,
    logo uuid,
    category integer,
    location integer
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: jp_about; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_about (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    image uuid
);


ALTER TABLE public.jp_about OWNER TO postgres;

--
-- Name: jp_about_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_about_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_about_id_seq OWNER TO postgres;

--
-- Name: jp_about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_about_id_seq OWNED BY public.jp_about.id;


--
-- Name: jp_about_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_about_item (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    main_text character varying(255),
    hover_text character varying(255),
    image_src uuid,
    icon_src uuid,
    linkto integer
);


ALTER TABLE public.jp_about_item OWNER TO postgres;

--
-- Name: jp_about_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_about_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_about_item_id_seq OWNER TO postgres;

--
-- Name: jp_about_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_about_item_id_seq OWNED BY public.jp_about_item.id;


--
-- Name: jp_about_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_about_text (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    linkto integer
);


ALTER TABLE public.jp_about_text OWNER TO postgres;

--
-- Name: jp_about_text_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_about_text_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_about_text_id_seq OWNER TO postgres;

--
-- Name: jp_about_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_about_text_id_seq OWNED BY public.jp_about_text.id;


--
-- Name: jp_carousel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_carousel (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    alt character varying(255) DEFAULT 'Image'::character varying,
    image uuid
);


ALTER TABLE public.jp_carousel OWNER TO postgres;

--
-- Name: jp_carousel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_carousel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_carousel_id_seq OWNER TO postgres;

--
-- Name: jp_carousel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_carousel_id_seq OWNED BY public.jp_carousel.id;


--
-- Name: jp_develop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_develop (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    description character varying(255),
    url integer,
    image uuid
);


ALTER TABLE public.jp_develop OWNER TO postgres;

--
-- Name: jp_develop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_develop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_develop_id_seq OWNER TO postgres;

--
-- Name: jp_develop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_develop_id_seq OWNED BY public.jp_develop.id;


--
-- Name: jp_marquee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_marquee (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    alt character varying(255) DEFAULT 'Image'::character varying,
    catetory character varying(255) DEFAULT 'transaction'::character varying,
    image uuid
);


ALTER TABLE public.jp_marquee OWNER TO postgres;

--
-- Name: jp_marquee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_marquee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_marquee_id_seq OWNER TO postgres;

--
-- Name: jp_marquee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_marquee_id_seq OWNED BY public.jp_marquee.id;


--
-- Name: jp_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_news (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    date date,
    description character varying(255),
    url integer
);


ALTER TABLE public.jp_news OWNER TO postgres;

--
-- Name: jp_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_news_id_seq OWNER TO postgres;

--
-- Name: jp_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_news_id_seq OWNED BY public.jp_news.id;


--
-- Name: jp_techstack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_techstack (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255)
);


ALTER TABLE public.jp_techstack OWNER TO postgres;

--
-- Name: jp_techstack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_techstack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_techstack_id_seq OWNER TO postgres;

--
-- Name: jp_techstack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_techstack_id_seq OWNED BY public.jp_techstack.id;


--
-- Name: jp_techstack_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jp_techstack_image (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'published'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    linkto integer,
    image uuid,
    alt character varying(255) DEFAULT 'image'::character varying
);


ALTER TABLE public.jp_techstack_image OWNER TO postgres;

--
-- Name: jp_techstack_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jp_techstack_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jp_techstack_image_id_seq OWNER TO postgres;

--
-- Name: jp_techstack_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jp_techstack_image_id_seq OWNED BY public.jp_techstack_image.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.links (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    label character varying(255) DEFAULT NULL::character varying,
    url character varying(255) DEFAULT NULL::character varying,
    slug character varying(255) DEFAULT NULL::character varying,
    is_relative boolean DEFAULT false
);


ALTER TABLE public.links OWNER TO postgres;

--
-- Name: links_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.links_group (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.links_group OWNER TO postgres;

--
-- Name: links_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.links_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.links_group_id_seq OWNER TO postgres;

--
-- Name: links_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.links_group_id_seq OWNED BY public.links_group.id;


--
-- Name: links_group_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.links_group_links (
    id integer NOT NULL,
    links_group_id integer,
    links_id integer
);


ALTER TABLE public.links_group_links OWNER TO postgres;

--
-- Name: links_group_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.links_group_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.links_group_links_id_seq OWNER TO postgres;

--
-- Name: links_group_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.links_group_links_id_seq OWNED BY public.links_group_links.id;


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.links_id_seq OWNER TO postgres;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: navigations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    language character varying(255) DEFAULT 'vn'::character varying,
    url integer
);


ALTER TABLE public.navigations OWNER TO postgres;

--
-- Name: navigations_children; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_children (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    language character varying(255),
    url integer
);


ALTER TABLE public.navigations_children OWNER TO postgres;

--
-- Name: navigations_children_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_children_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_children_id_seq OWNER TO postgres;

--
-- Name: navigations_children_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_children_id_seq OWNED BY public.navigations_children.id;


--
-- Name: navigations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_id_seq OWNER TO postgres;

--
-- Name: navigations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_id_seq OWNED BY public.navigations.id;


--
-- Name: navigations_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_links (
    id integer NOT NULL,
    navigations_id integer,
    links_id integer
);


ALTER TABLE public.navigations_links OWNER TO postgres;

--
-- Name: navigations_links_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_links_1 (
    id integer NOT NULL,
    navigations_id integer,
    links_id integer
);


ALTER TABLE public.navigations_links_1 OWNER TO postgres;

--
-- Name: navigations_links_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_links_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_links_1_id_seq OWNER TO postgres;

--
-- Name: navigations_links_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_links_1_id_seq OWNED BY public.navigations_links_1.id;


--
-- Name: navigations_links_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_links_2 (
    id integer NOT NULL,
    navigations_id integer,
    links_id integer,
    sort integer
);


ALTER TABLE public.navigations_links_2 OWNER TO postgres;

--
-- Name: navigations_links_2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_links_2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_links_2_id_seq OWNER TO postgres;

--
-- Name: navigations_links_2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_links_2_id_seq OWNED BY public.navigations_links_2.id;


--
-- Name: navigations_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_links_id_seq OWNER TO postgres;

--
-- Name: navigations_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_links_id_seq OWNED BY public.navigations_links.id;


--
-- Name: navigations_navigations_children; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.navigations_navigations_children (
    id integer NOT NULL,
    navigations_id integer,
    navigations_children_id integer
);


ALTER TABLE public.navigations_navigations_children OWNER TO postgres;

--
-- Name: navigations_navigations_children_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.navigations_navigations_children_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.navigations_navigations_children_id_seq OWNER TO postgres;

--
-- Name: navigations_navigations_children_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.navigations_navigations_children_id_seq OWNED BY public.navigations_navigations_children.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    content text,
    slug character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    logo uuid,
    link integer
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_id_seq OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    content text,
    link integer,
    language character varying(255) DEFAULT 'vn'::character varying,
    image uuid,
    reverse boolean
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    username character varying(255) DEFAULT NULL::character varying,
    logo uuid,
    email character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
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
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: benefits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits ALTER COLUMN id SET DEFAULT nextval('public.benefits_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: companies_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies_links ALTER COLUMN id SET DEFAULT nextval('public.companies_links_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: footers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers ALTER COLUMN id SET DEFAULT nextval('public.footers_id_seq'::regclass);


--
-- Name: footers_links_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_links_group ALTER COLUMN id SET DEFAULT nextval('public.footers_links_group_id_seq'::regclass);


--
-- Name: job_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_categories ALTER COLUMN id SET DEFAULT nextval('public.job_categories_id_seq'::regclass);


--
-- Name: job_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_locations ALTER COLUMN id SET DEFAULT nextval('public.job_locations_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: jp_about id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about ALTER COLUMN id SET DEFAULT nextval('public.jp_about_id_seq'::regclass);


--
-- Name: jp_about_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item ALTER COLUMN id SET DEFAULT nextval('public.jp_about_item_id_seq'::regclass);


--
-- Name: jp_about_text id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_text ALTER COLUMN id SET DEFAULT nextval('public.jp_about_text_id_seq'::regclass);


--
-- Name: jp_carousel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_carousel ALTER COLUMN id SET DEFAULT nextval('public.jp_carousel_id_seq'::regclass);


--
-- Name: jp_develop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_develop ALTER COLUMN id SET DEFAULT nextval('public.jp_develop_id_seq'::regclass);


--
-- Name: jp_marquee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_marquee ALTER COLUMN id SET DEFAULT nextval('public.jp_marquee_id_seq'::regclass);


--
-- Name: jp_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_news ALTER COLUMN id SET DEFAULT nextval('public.jp_news_id_seq'::regclass);


--
-- Name: jp_techstack id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack ALTER COLUMN id SET DEFAULT nextval('public.jp_techstack_id_seq'::regclass);


--
-- Name: jp_techstack_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack_image ALTER COLUMN id SET DEFAULT nextval('public.jp_techstack_image_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: links_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group ALTER COLUMN id SET DEFAULT nextval('public.links_group_id_seq'::regclass);


--
-- Name: links_group_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group_links ALTER COLUMN id SET DEFAULT nextval('public.links_group_links_id_seq'::regclass);


--
-- Name: navigations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations ALTER COLUMN id SET DEFAULT nextval('public.navigations_id_seq'::regclass);


--
-- Name: navigations_children id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_children ALTER COLUMN id SET DEFAULT nextval('public.navigations_children_id_seq'::regclass);


--
-- Name: navigations_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links ALTER COLUMN id SET DEFAULT nextval('public.navigations_links_id_seq'::regclass);


--
-- Name: navigations_links_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_1 ALTER COLUMN id SET DEFAULT nextval('public.navigations_links_1_id_seq'::regclass);


--
-- Name: navigations_links_2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_2 ALTER COLUMN id SET DEFAULT nextval('public.navigations_links_2_id_seq'::regclass);


--
-- Name: navigations_navigations_children id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_navigations_children ALTER COLUMN id SET DEFAULT nextval('public.navigations_navigations_children_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: benefits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benefits (id, status, sort, user_created, date_created, user_updated, date_updated, logo, content) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:32:15.588+00	\N	\N	cb987abf-208b-41e3-9b87-c2420a3e1a0a	Thưởng hiệu quả công việc thưởng dự án thưởng doanh thu.
2	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:33:18.987+00	\N	\N	73689631-f58a-4057-96b2-3bb6e2e9a9ce	Khám sức khỏe định kỳ 1 lần/năm.
3	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:34:03.218+00	\N	\N	39b2b652-446a-4681-9cd0-cc0ec69a5da3	Cơ hội đi onsite tại Nhật Bản.
4	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:34:27.977+00	\N	\N	454bee48-48de-4989-85ce-942a6b6e503a	Giờ làm việc: 8h00 đến 17h00 từ thứ Hai đến thứ Sáu.
5	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:34:45.171+00	\N	\N	4c9a3fa0-fd37-4686-99e7-1690950f0bce	Tham gia các khóa đào tạo miễn phí về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.
6	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:35:12.692+00	\N	\N	101941d8-0184-4826-9019-5737a2f86988	Cơ hội thăng tiến nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.
7	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:35:25.921+00	\N	\N	fa452bfb-01e0-470f-9da2-81fe3a9c62ee	Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.
8	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:35:47.537+00	\N	\N	3b293c74-baed-4a1a-a97b-11b8b35820ba	Có chế độ làm việc Remote cho các nhân viên xuất sắc.
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, status, user_created, date_created, user_updated, date_updated, title, content, tags, author, slug, logo, intro) FROM stdin;
4	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 02:16:32.775+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:37:31.998+00	What is SEO? Popular SEO Models 2023 - 2024	To help develop your brand, increase sales, and enhance online interaction, mastering SEO is essential. So what is SEO? Let's explore this topic with me in this article.\n\n## What is SEO?\nSEO (Search Engine Optimization) is the process of optimizing a website to improve its position on search engines like Google, Bing, and Yahoo. The goal of SEO is to increase organic traffic and improve the website's visibility in search results.\n\n## Is SEO Difficult?\nSEO can be complex and requires knowledge and skills. However, with the right understanding and approach, you can effectively apply SEO to your website.\n\n## Should You Hire an SEO Expert?\nHiring an SEO expert can be beneficial if you lack the knowledge and skills needed to implement SEO. An expert can help you develop an effective SEO strategy and execute optimization measures, thereby optimizing costs and project implementation time.\n\n## The Role of SEO in Online Marketing\nSEO plays a crucial role in online marketing by making your website stand out and attracting a large number of potential customers. When a website is well-optimized, it can rank higher in search results, creating opportunities to increase traffic, boost sales, and build a strong brand.\n\n## Important SEO Factors\nSEO, short for "Search Engine Optimization," is the process of optimizing a website to improve its position in search engine results. To achieve the best results in SEO, you need to pay attention to the following factors:\n\n### SEO-Friendly Titles and Content\nSEO-friendly titles and content are crucial factors in attracting both users and search engines. Titles should be compelling, contain relevant keywords, and the page description should summarize the main content of the page.\n\n### Keywords\nKeywords are the words or phrases that users type into search engines. Ensuring that your website is optimized for the right keywords can help increase visibility and drive more organic traffic.\n\n### Internal and External Links\nInternal links are links from one page within your website to another page on the same site. This helps increase the discoverability of subpages within the website. External links are links from other websites to your site. High-quality external links can improve your website's credibility and trustworthiness.\n\n### Page Load Speed\nPage load speed is a crucial factor in SEO. Websites with faster load times tend to attract and retain users better. Search engines also value this and may rank your website higher in search results. Therefore, always prioritize optimizing website speed to help your site grow better.\n\n### User Experience\nUser experience is an increasingly important factor in SEO. Websites need to provide a good experience for users, including content arrangement, ease of use, and page load time. This helps increase traffic and keeps users on your site longer.\n\n## Popular SEO Models\nIn the field of SEO, there are several popular SEO models used to optimize search engines. Below are some important models:\n\n- **On-page SEO:** Optimizing on-page factors like keywords, content, title tags, and page structure.\n- **Off-page SEO:** Building links and optimizing external factors like backlinks from other sites, social media, and online advertising.\n- **Technical SEO:** Optimizing technical factors such as sitemaps, robots.txt, canonical tags, and page load speed.\n- **Content SEO:** Creating quality, engaging content and optimizing keywords to attract traffic and improve rankings in search results.\n- **Other SEO Models:** EEAT SEO model, Silo SEO model, Link Wheel SEO model.\n\n## Conclusion\nSEO is a critical component of online marketing. Through this article, we have explored what SEO is, popular SEO models, and upcoming SEO trends for 2023. Understanding and applying SEO principles and techniques can enhance visibility, increase traffic, and help build a strong brand on the Internet.	["#Web","#HTML","#Frontend"]	1	what-is-seo-popular-seo-models-2023-2024	7fc5f48c-6695-41be-b2c6-34ad603b8e95	SEO (Search Engine Optimization) is the process of optimizing a website to improve its position on search engines like Google, Bing, and Edge…
7	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:00:38.769+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:38:55.755+00	Introduction to Neural Network	# Transformer\n\n## Introduction\n\nWhy our brain can recognize different shape of handwritting of 3 ?<br>\nHow does our brain work ?\n![intro1.png](http://localhost:8055/assets/a118d056-c13e-45f1-b9e1-d43f8b8ba783)\n\nHow can we create a machine to recognize a handwritting picture (28x28 pixel), and classify it to a number in range of 0~9<br>\nWe will find out the answer by understanding what is neural-network ? and how does neural-network working ?<br>\nIn this blog we only talk about the most simple type of neural network - Multilayer Perceptron\n![intro1.png](http://localhost:8055/assets/59ac890d-f225-4fcf-906f-656f144e9fb6)\n\n## Key Concepts\n\n### What is neural network\n\nWhat are the neurons? How are they connected ?<br>\n![intro1.png](http://localhost:8055/assets/32081de6-c487-42ae-8842-b362e73cd3cd)\n\nNeuron: thing that holds a number. Specificly a number between 0 and 1.\n![intro1.png](http://localhost:8055/assets/4f6acb62-7226-4d27-bea6-22735b4c23f2)\n\nIn our task, the input picture will be divided into 28x28 = 784 neurons (784 pixels). Each pixel will be ranging from 0.0 for black pixel and 1.0 for white pixel. The number inside the neuron will be called <b>"Activation"</b>.\n![intro1.png](http://localhost:8055/assets/b2779a88-7add-47d4-99ce-97fdcd04b001)\n\nAll of the 784 neurons make up the first layer of our network<br>\nThe last layer have 10 neurons that represent the probability of the digit<br>\nThe middle layers are called hidden layers, that contain many neurons which define the logic how we can regconize and classify the handwritting number.\n![intro1.png](http://localhost:8055/assets/fc1b7a28-871a-4b0f-89cd-7f3fce45ed47)\n\nPattern of acitvations causes some very specific pattern in the next layers, and it continuous to the last layer\n![intro1.png](http://localhost:8055/assets/f1c6269c-a982-438c-a1bc-60a8dc92f891)\n\n### Why layers structure is reasonable\n\nLet's image how can we regconize the 9 digit. 9 digit have a loop up top and a line in the right.<br>\nThe digit 8 have 2 loops up and down\n![intro1.png](http://localhost:8055/assets/ae293aa2-e8a3-4a04-be09-f2d310053bd8)\n\nEach of the sub-components will be one neuron, and we detect that characteristic apppear or not in hidden layer\n![intro1.png](http://localhost:8055/assets/377d68e4-ce86-4a4a-83b2-dea9f532ce86)\n\nBut it is still hard to detect the loop, so we need to break it more detail parts\n![intro1.png](http://localhost:8055/assets/3fa4ba5e-57de-4e27-a8a4-1905ba4ca13a)\n\nThe idea of divided our neural network into several layers to break down high level abstract problem into lower level abstract problems\n![intro1.png](http://localhost:8055/assets/381127ac-9102-41b7-b07a-54b48bcd33fd)\n\n### Weight and bias\n\nWe use weight to calculate prediction for a subcomponent of the picture as below image. We multiple all activations of previous layers with weight to calculate next one activation in next layer. We do the same with other activations too.\n![intro1.png](http://localhost:8055/assets/dd817bce-fac7-4777-a217-c0459d98e0b5)\n\nActivation should be in range of (0,1), so we use sigmoid active function to normalize \n![intro1.png](http://localhost:8055/assets/56373b9f-a971-4096-abef-292196234ac8)\n\nWhy we need bias ?<br>\nBias will help us to define a threshold meaning how much of value of activation will meaningful enough with result\n![intro1.png](http://localhost:8055/assets/31452ea4-942a-412f-b5d0-0b21460a45d6)\n\n![intro1.png](http://localhost:8055/assets/f76d89c0-8111-489a-988a-9ebdc4289336)\n\nLet's calculate the parameters of our model\n![intro1.png](http://localhost:8055/assets/124358fc-6194-4582-b125-f261659e3bfa)\n\n![intro1.png](http://localhost:8055/assets/cf02cc3f-320e-41e4-bb6b-eb6f8f54834e)\n\nOur mission is to find the weight and bias using large amount of data\n![intro1.png](http://localhost:8055/assets/bb592087-181f-4c71-870e-ec9cc2528415)\n\n### Learning & Gradient descent\n\nSo how can we calculate the best weight and bias ?<br>\nWe will start the model with the random, then so many predict will wrong, so we can learn from that wrong prediction to improve our model (weight and bias). That is called training.\n![intro1.png](http://localhost:8055/assets/fa41b29b-c083-480d-854c-190a68efd8f2)\n\nHow does we running the test ?<br>\nWe use a groundtruth test data and calculate for the result\n![intro1.png](http://localhost:8055/assets/80b791a7-66a0-4e82-908b-39e43a6b0b2a)\n\nHow we calculate the cost of different ? The most popular cost function is MSE (Mean Square Error) or Cross-entropy loss\n![intro1.png](http://localhost:8055/assets/14f4478b-a411-43f4-a88a-ed9e7db222d6)\n\nMSE (Mean Square Error) formular\n$$\nMSE =  \\frac{{1}}{2N}  \\sum_{i}^{N} ( \\widehat{y_i} -y_i)^2 \\quad\n$$\n\nCross-entropy loss formular\n$$\nL = -\\frac{1}{N} \\sum_{n=1}^{N} \\sum_{i=1}^{C} y_{i,n} \\log(\\hat{y}_{i,n})\n$$\n\n### Backpropagation\nMain concept\n- Feedforward : the most basic form of neural network architecture. In a feedforward network, information flows in one direction, from the input layer to the output layer, without any loops or cycles. Each layer in the network processes the input data and passes it to the next layer until the final output is produced. (*Detail calculation is mention in 2.3)\n- Backpropagation : an algorithm used to train feedforward neural networks. It is a critical component of the training process, enabling the network to adjust its weights and biases to minimize the difference between predicted outputs and actual target values.\n  \nLet say the cost function (the cost of different) is C, the negative gradient of this cost function is -ΔC. We will train the feedforward neural network as follow step:\n- Use an input feedfoward in the neural network with weight and bias at that time and calculate the output\n- Use calculated output and ground trust result to calculate cost function (MSE)\n- Use cost difference value (C(wo,w1,...,wn, b1, b2,...,bm)) to calculate negative gradient of each weight and bias -ΔC(wo,w1,...,wn, b1, b2,...,bm)\n- Use negative gradient of each weight and bias to calculate new weight and bias by adding weight and bias with -ΔC(wo,w1,...,wn, b1, b2,...,bm)\n- Start the next feedfoward step\n\nBy doing above loop the cost function value will be smaller meaning that the precious of model is getting higher.\n![intro1.png](http://localhost:8055/assets/158f2701-8915-4fed-a79d-ab03692d7aac)\n\nPlease watch this video for more detail of calculation <br>\n[Backpropagation](https://www.youtube.com/watch?v=tIeHLnjs5U8&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=4)\n\n# Conclusion\n\n1. **Neural Network Structure:**\n   - Neural networks recognize and classify complex patterns, such as handwritten digits, through a layered approach that processes input data.\n\n2. **Multilayer Perceptron Model:**\n   - This model breaks down intricate visual patterns into simpler components, enhancing the machine's ability to interpret various handwriting styles.\n\n3. **Training and Optimization:**\n   - Weights and biases are optimized using training and backpropagation, which adjusts the model to minimize errors and improve accuracy.\n\n4. **Brain Function Emulation:**\n   - By emulating the brain’s ability to analyze visual information, neural networks offer a powerful tool for automated recognition and classification tasks.\n\n# Additional Resources\n\n- [3Blue1Brown youtube video](https://www.youtube.com/watch?v=aircAruvnKk&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=1)\n- [Backpropagation](https://www.youtube.com/watch?v=tIeHLnjs5U8&list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi&index=4)\n\n# About the Author\n    Nguyen Quang Huy\n    Without dreams to chase, life becomes mundane.	["#AI"]	6	introduction-to-neural-network	7437ecfd-00bf-49f1-a87c-f04fb615b404	Why our brain can recognize different shape of handwritting of 3 ?How does our brain work ?\n\nHow can we create a machine to recognize a handwritting picture (28x28 pixel), and classify it to a number in range of 0~9\nWe will find out the answer by understanding what is neural-network ? and how does neural-network working ?\nIn this blog we only talk about the most simple type of neural network - Multilayer Perceptron
12	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:47:14.526+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:42:25.521+00	Event Loop	In JavaScript, everything operates on a single thread, which makes handling asynchronous tasks like function calls and API requests a significant challenge. The event loop is a crucial mechanism that coordinates all activities and ensures that your JavaScript application remains smooth and uninterrupted.\n\nSo, what is the Event Loop?\n\n### JavaScript is a single-threaded language.\n\nJavaScript is a single-threaded language, meaning it executes one task at a time.\n\n→ This presents a major limitation when you need to handle asynchronous tasks such as API calls, manipulating the DOM, handling events, and so on.\n\n### What is Event Loop?\n\nThe event loop is a mechanism that helps manage the execution of asynchronous tasks (such as callbacks, promises, async/await), ensuring they are processed in the correct order.\n\n![Untitled](http://localhost:8055/assets/67b70096-3d63-48da-bedf-00123b5e1523)\n\n- **Call Stack:** JavaScript uses the call stack to keep track of the functions that are currently being executed. It operates on a FILO (First In Last Out) principle.\n- **Callback Queue:** Asynchronous operations, such as I/O operations or timers, are handled by the browser or Node.js runtime. When these operations are completed, the corresponding functions (callbacks) are placed into the callback queue.\n- **Microtask Queue:**  The queue with higher priority than the task queue. This queue is for:\n    - Callbacks for handling Promises (then(callback), catch(callback), and finally(callback))\n    - Executing async functions after the `await` keyword\n    - Callbacks for MutationObserver\n    - Callbacks for `queueMicrotask`\n\n### The process of the Event Loop\n\nThe event loop works by continuously checking if the call stack is empty. If it is, it takes a task from the task queue and pushes it onto the call stack for execution. This ensures that tasks are executed in the designated order without interrupting the main operation of the application.\n\n### Example\n\n```bash\nconsole.log("Start");\n\nsetTimeout(() => {\n  console.log("Inside setTimeout");\n}, 2000);\n\nconsole.log("End");\n\n```\n\nWhen running, "Start" will be printed first. Then, "End" will be printed immediately. After 2 seconds, "Inside setTimeout" will be printed.\n\n**Event Loop** ensures that although there is a delay (2 seconds), JavaScript continues to execute the following code without being blocked by the `setTimeout` function.\n\n### Conclusion\n\nUnderstanding the Event Loop, Task Queue, and Microtask Queue\n\nThe Event Loop coordinates the execution of tasks, prioritizing the Microtask Queue to ensure that promises and related operations are resolved quickly before moving on to tasks in the Task Queue.\n\nRefs:\n\nhttps://www.lydiahallie.com/blog/event-loop\n\nhttps://www.geeksforgeeks.org/what-is-an-event-loop-in-javascript/\n\n https://youtu.be/eiC58R16hb8?si=Fqt3r6jrLpziEGRJ	["#JavaScript"]	3	event-loop	ce628487-076e-40e3-9060-34dd65e5b991	In JavaScript, everything operates on a single thread, which makes handling asynchronous tasks like function calls and API requests a significant challenge. The event loop is a crucial mechanism that coordinates all activities and ensures that your JavaScript application remains smooth and uninterrupted.
1	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 02:06:14.344+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:26:38.653+00	Azure Machine Learning - Part1: Introduction	## Introduction\nHiện nay, các giải pháp machine learning đang được áp dụng vào cuộc sống để xử lí rất nhiều bài toán ở nhiều mảng khác nhau. Với các nhánh được phát triển từ machine learning như deep learning hay reinforce learning, việc đơn giản hóa công việc thiết lập môi trường, tính toán tài nguyên, sẽ giúp người dùng tập trung vào mục đích chính là cách giải quyết bài toán. Dựa vào nhu cầu đó, kết hợp với hạ tầng cloud, một số nhà cung cấp đã đưa ra một số bộ giải pháp cho phép người dùng thao tác trên hạ tầng của các nhà cung cấp. Loạt bài sau đây sẽ giới thiệu về Azure Machine Learning - một bộ giải pháp về machine learning do Microsoft phát triển.\n\n## Overview\n\n### Azure Machine Learning là gì?\n\nTrước tiên, cùng xem định nghĩa của Microsoft về Azure Machine Learning (viết tắt là AzureML):\n\n> Azure Machine Learning is a cloud service for accelerating and managing the machine learning project lifecycle. Machine learning professionals, data scientists, and engineers can use it in their day-to-day workflows: Train and deploy models, and manage MLOps.\n> \n> \n> You can create a model in Azure Machine Learning or use a model built from an open-source platform, such as Pytorch, TensorFlow, or scikit-learn. MLOps tools help you monitor, retrain, and redeploy models.\n> \n\nTạm dịch:\n\n> Azure Machine Learning là một dịch vụ cloud dùng để hỗ trợ và quản lí vòng đời của dự án machine leaning. Các chuyên gia Machine Learning, nhà khoa học dữ liệu và các kỹ sư có thể sử dụng AzureML trong các công việc hàng ngày của họ: Train và deploy các model và quản lí thông qua MLOps.\nModel trong AzureML có thể được tạo thủ công hoặc sử dụng các model được xây dựng từ các nền tảng open-source như Pytorch, TensorFlow hay sciit-learn. Các công cụ MLOps giúp người dùng theo dõi, train lại và deploy lại các model.\n> \n\nNói cách ngắn gọn, Azure Machine Learning là một môi trường dùng để quản lí, train và deploy các dự án machine learning.\n\n\n## Key Concepts\n\n## Các ưu điểm / nhược điểm của Azure Machine Learning\n\nAzure Machine Learning chạy trên hạ tầng cloud của Azure, nên sẽ có những ưu điểm của các dịch vụ cloud, đồng thời sẽ có thêm một số ưu điểm khác.\n\n- Tạo một môi trường chung giữa các thành viên trong một nhóm có thể tham gia xây dựng và triển khai dự án ở khắp mọi nơi, không bị giới hạn khoảng cách địa lí.\n- Tài nguyên hạ tầng (CPU, RAM, GPU,…) được quản lí việc sử dụng thông qua giao diện. Do hạ tầng sử dụng là cloud, nên việc scale (thêm, giảm tài nguyên) sẽ đơn giản và nhanh hơn rất nhiều so với việc tự triển khai hạ tầng.\n- Đảm bảo sự bảo mật, cũng như các tính năng quản lí được tích hợp sẵn.\n- Các môi trường dành riêng cho AzureML được xây dựng và có thể sử dụng bởi người dùng cho các dự án cụ thể.\n![1_AzureML-Image.png](http://localhost:8055/assets/50f915af-bd2d-4eab-aa92-bcf94a7383f7)\n\n*Các image ubuntu trên Microsoft Artifact Registry, trong đó có các image CPU base và GPU base*\n\n- Cung cấp rất nhiều giao diện để thao tác với dự án, từ giao diện Azure Machine Learning studio, SDK cho code như Python SDK, CLI thông qua Azure CLI (ml Extension) hoặc qua REST API của Azure Resource Manager.\n- Có thể tích hợp với các dịch vụ trên Azure như:\n    - Azure Container Registry, Azure Key Vault, Azure Virtual Network,… để tăng tính bảo mật.\n    - Azure Synapse Analytics để xử lí và stream data bằng Spark.\n    - Azure Arc để chạy các dịch vụ Azure trên môi trường Kubernetes.\n    - Lưu trữ dữ liệu trên database như Azure SQL Database hoặc storage trên Azure Storage Blobs.\n    - Deploy Machine Learning application trên Azure App Service.\n- Sử dụng các model được tạo trên các framework phổ biến như PyTorch, TensorFlow, scikit-learn, XGBoost, LightGBM,… và đồng thời hỗ trợ ngôn ngữ R và .NET framework.\n- Tích hợp với các công cụ có sẵn trên Azure Machine Learning, việc deploy model lên môi trường thực tế được tự động hóa qua MLOps, endpoints,…\n\n![2_Model-Lifecycle.png](http://localhost:8055/assets/a27d5026-ff71-4da4-9b64-afde2466108b)\n\n*Một lifecycle của một model Machine Learning, Azure Machine Learning hỗ trợ tích hợp trên toàn bộ các step*\n\nTuy nhiên, Azure Machine Learning cũng có những nhược điểm:\n\n- Chi phí không rõ ràng như cách triển khai hạ tầng tại chỗ (on-premies): Với cách triển khai tại chỗ, các chi phí sử dụng có thể được tính toán chính xác hơn so với các mô hình triển khai trên cloud. Với Azure Machine Learning, chi phí sử dụng chính là chi phí sử dụng các tài nguyên tính toán (compute). Tuy nhiên, nếu như sử dụng các dịch vụ đi kèm trên Azure (Như Azure Storage Account), chi phí sử dụng dịch vụ đó sẽ được tính riêng. Với các cách tính Pay as you go (Thanh toán chi phí cho chỉ thời gian và nhu cầu tài nguyên người dùng sử dụng), hoặc các cách thanh toán có cam kết sử dụng (Saving Plan, Reservation), chi phí có thể được giảm bớt, nhưng cũng có thể lên rất lớn nếu người dùng sử dụng sơ suất.\n\n![3_Notices.png](http://localhost:8055/assets/eb839c85-2d49-4781-9373-e9fb689730e1)\n\n*Cảnh báo của Microsoft về chi phí khi sử dụng Azure Machine Learning.*\n\n- Cần phải làm quen với giao diện của Azure Machine Learning studio, cũng như các giao diện khác như SDK hay CLI đối với người mới sử dụng.\n\n## Người dùng nào nên sử dụng Azure Machine Learning\n\nVới những đặc điểm cũng như ưu điểm, nhược điểm của Azure Machine Learning, chúng ta có thể tạm thời đưa ra những người dùng nên sử dụng Azure Machine Learning như sau:\n\n- Data scientist muốn tập trung vào công việc xử lí dữ liệu, thay vì phải tự thiết lập thủ công pipeline, với sự hỗ trợ của Azure Machine Learning giúp việc cài đặt workflow đơn giản hơn.\n- Ngược lại, devops có thể tham gia vào quá trình cài đặt cùng với data scientist thông qua Azure Machine Learning, hỗ trợ data scientist trong suốt quá trình xử lí dữ liệu như chuẩn bị data, thiết lập các công cụ và tài nguyên để train model, đưa ra kết quả…\n- Người dùng đã làm quen với các dịch vụ trên Azure, việc tích hợp các quá trình xử lí dữ liệu sẽ đơn giản hơn do Azure Machine Learning có thể tích hợp với các dịch vụ trên Azure. Tương tự, các dịch vụ Azure muốn sử dụng machine learning vào một phần công việc đều có thể sử dụng Azure Machine Learning.\n\n\n## Implementation\n\n### Tạo môi trường Azure Machine Learning\n\nKhi bắt đầu một dự án trên Azure Machine Learning, trước tiên cần tạo một Azure Machine Learning workspace:\n\n![4_Create-Workspace.png](http://localhost:8055/assets/9459ab45-19a9-4d18-bf5b-8cb58e3af512)\n\nNhập các thông tin cần thiết để tạo một workspace mới:\n\n![5_Example-Creation.png](http://localhost:8055/assets/e120d511-2bab-4fa9-a693-ade0f1d0164a)\n\nSau khi tạo thành công, chúng ta sẽ có giao diện Azure Machine Learning Studio như sau:\n\n![6_AzureML-UI.png](http://localhost:8055/assets/08253957-08a3-4201-a39f-0a810e4c691d)\n\n\n## Conclusion\n\nAzure phát triển Azure Machine Learning, một giải pháp dành riêng cho mục đích đơn giản hóa việc train và deploy các model machine learning. Ngoài ra, một số nhà cung cấp cloud khác cũng đưa ra những giải pháp Machine learning as a service (MLaaS) tương tự như Amazon Machine Learning, Google AI Platform hay IBM Watson Machine Learning.\n\nPhần tiếp theo, chúng ta sẽ tìm hiểu về các thành phần trong một Workspace Azure Machine Learning thông qua giao diện trên Azure Machine Learning Studio.\n\n\n## References\n\n- [https://learn.microsoft.com/en-us/azure/machine-learning/overview-what-is-azure-machine-learning?view=azureml-api-2](https://learn.microsoft.com/en-us/azure/machine-learning/overview-what-is-azure-machine-learning?view=azureml-api-2)	["#AI","#Azure"]	10	azure-machine-learning-part1-introduction	766d53bb-c138-45e2-9994-1108543f69fc	Hiện nay, các giải pháp machine learning đang được áp dụng vào cuộc sống để xử lí rất nhiều bài toán ở nhiều mảng khác nhau. Với các nhánh được phát triển từ machine learning như deep learning hay reinforce learning, việc đơn giản hóa công việc thiết lập môi trường, tính toán tài nguyên, sẽ giúp người dùng tập trung vào mục đích chính là cách giải quyết bài toán. Dựa vào nhu cầu đó, kết hợp với hạ tầng cloud, một số nhà cung cấp đã đưa ra một số bộ giải pháp cho phép người dùng thao tác trên hạ tầng của các nhà cung cấp. Loạt bài sau đây sẽ giới thiệu về Azure Machine Learning - một bộ giải pháp về machine learning do Microsoft phát triển.
2	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 02:09:49.116+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:35:33.684+00	Azure Static Web App	## Web app\n\nVới kiến trúc phổ biến là tách riêng phần backend API và frontend UI, mỗi phần thường sẽ đc deploy trên các server (hay cụm server) khác nhau để đảm bảo tính tách biệt và cung cấp khả năng scale riêng biệt từng phần. Khái **web application** (gọi ngắn là web app) không phân biệt giữa frontend hay backend, mà nó chỉ chung chung là những application chạy trên nền web. _(hiểu đơn giản hơn, nó là bất kì service gì được host trên cloud và được expose ra 1 network, tương tác qua lại bằng HTTP)\n\nKhi deploy một frontend app, ta tiến hành bundle asset (\\*) và tạo 1 con proxy server. Trong đó, proxy server có 3 nhiệm vụ chính:\n\n- Serve static asset\n- Lưu trữ/tương tác với các service bên thứ 3 mà cần đăng ký các secret/credential\n- Proxy tới backend API (như vậy sẽ giúp backend API có thể chạy private ở mạng kín mà không cần expose ra ngoài internet)\n\n_(_) Asset bundling: frontend có thể được code bởi rất nhiều framework như React, Angular, Vue, etc. Nhưng dù có dùng framework gì đi chăng nữa thì output cuối cùng vẫn là html, css và js. Quá trình bundle gồm việc compile code từ framework thành code js thuần túy, ngoài ra cũng sẽ minify code (làm code nhỏ hơn bằng việc xóa các khoảng trắng, thay thế tên biến thành kí tự ngắn).\\*\n\nNhư vậy, nếu một frontend app không cần sử dụng tới các secret/credential bên thứ 3 hay backend API vốn dĩ đã được expose ra ngoài Internet, thì sự tồn tại của 1 proxy server là không cần thiết. Thay vào đó, ta có thể bundle sẵn frontend app rồi host phần bundle dưới dạng static asset, cực kì đơn giản và tiết kiệm chi phí.\n\n## Host web app như static asset\n\nĐể host một frontend app dưới dạng static asset, trước hết, ta thực hiện bundle. Mọi framework đều đã có config sẵn cho việc này, trong nhiều trường hợp, ta chỉ cần điền biến environment variable và chạy `npm run build`. Tuy nhiên, ta vẫn có thể tự build bằng các công cụ phổ biến như [esbuild](<[https://esbuild.github.io/](https://esbuild.github.io/)>)\n\nKết quả phần build thường sẽ như sau:\n\n```jsx\n/project-root\n  /src\n  /build\n    abc123.js\n    xyz123.css\n    index.html\n```\n\nSau khi có file bundle, ta sẽ upload lên (Azure Blob Storage)[[https://azure.microsoft.com/en-us/products/storage/blobs](https://azure.microsoft.com/en-us/products/storage/blobs)] và expose `index.html` ra public. Như vậy là gần xong.\n\nTuy nhiên, chỉ như trên thì sẽ không support được việc routing trên frontend app, để workaround thì có vài giải pháp:\n\n- Bundle mỗi route thành 1 trang html (như vậy thì sẽ không đáp ứng được các ứng dụng SPA)\n- Sử dụng hash router (không được support bởi các trình duyệt cũ và ảnh hưởng đến SEO)\n\nSẽ rất tuyệt vời nếu tồn tại 1 serivce có khả năng xử lý phần routing này.\n\n## Deploy với Azure Static Web App\n\n[Azure Static Web App]([Azure Static Web Apps – App Service | Microsoft Azure](https://azure.microsoft.com/en-us/products/app-service/static)) (SWA) là giải pháp tối ưu cho việc host frontend app dưới dạng static. Ngoài xử lý routing, dịch vụ này cũng tích hợp CDN cũng như nhiều công cụ khác cho việc phát triển như CICD, extension, etc.\n\nCó 3 cách để sử dụng SWA\n\n- Sử dụng [VS Code](https://learn.microsoft.com/en-us/azure/static-web-apps/getting-started?tabs=vanilla-javascript)\n- Thông qua [Azure portal](https://learn.microsoft.com/en-us/azure/static-web-apps/get-started-portal?tabs=vanilla-javascript&pivots=github)\n- Thông qua [SWA CLI](https://azure.github.io/static-web-apps-cli/)\n\n_Bài tới: Guide: Deploy web app sử dụng SWA CLI_\n	["#Python","#Azure"]	4	azure-static-web-app	fae66963-b714-45f7-8d37-275170c948a2	Với kiến trúc phổ biến là tách riêng phần backend API và frontend UI, mỗi phần thường sẽ đc deploy trên các server (hay cụm server) khác nhau để đảm bảo tính tách biệt và cung cấp khả năng scale riêng biệt từng phần. Khái **web application** (gọi ngắn là web app) không phân biệt giữa frontend hay backend, mà nó chỉ chung chung là những application chạy trên nền web. _(hiểu đơn giản hơn, nó là bất kì service gì được host trên cloud và được expose ra 1 network, tương tác qua lại bằng HTTP)
3	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 02:13:24.652+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:36:51.223+00	Azure AI-900: Microsoft Azure AI Fundamentals - Part 1: AI Overview	## Overview\n> - Azure boasts 200+ services, with a focus on 20+ AI-related ones.\n> - The exam evaluates AI understanding and decision-making, while the course aids in selecting the right AI services for specific scenarios. \n## Introduction to AI\n### What is AI?\n>Simply put, AI is software that imitates human behaviors and capabilities. Key workloads include:\n> - `Machine learning` - This is often the foundation for an AI system, and is the way we "teach" a computer model to make predictions and draw conclusions from data.\n> - `Computer vision` - Capabilities within AI to interpret the world visually through cameras, video, and images.\n> - `Natural language processing` - Capabilities within AI for a computer to interpret written or spoken language, and respond in kind.\n> - `Document intelligence` - Capabilities within AI that deal with managing, processing, and using high volumes of data found in forms and documents.\n> - `Knowledge mining` - Capabilities within AI to extract information from large volumes of often unstructured data to create a searchable knowledge store.\n> - `Generative AI` - Capabilities within AI that create original content in a variety of formats including natural language, image, code, and more. \n\n### Types of AI\n> - `Strong artificial intelligence (or general AI)`: Intelligence of machine = Intelligence of human \n>   => We are far away from achieving this! (Estimates: few decades to never)\n> - `Narrow AI (or weak AI)`: Focuses on specific task\n\n### Responsible AI\n> - `Fairness`: AI systems should treat all people fairly\n> - `Reliability and safety`: AI systems should perform reliably and safely\n> - `Privacy and security`: AI systems should be secure and respect privacy\n> - `Inclusiveness`: AI systems should empower everyone and engage people\n> - `Transparency`: AI systems should be understandable\n> - `Accountability`: People should be accountable for AI systems\n\n## Introduction to Machine Learning\n### Machine learning\n> Machine learning has its origins in statistics and mathematical modeling of data. The fundamental idea of machine learning is to use data from past observations to predict unknown outcomes or values.\n\n### Type of machine learning\n> There are multiple types of machine learning, and you must apply the appropriate type depending on what you're trying to predict. A breakdown of common types of machine learning is shown in the following diagram.\n\n![01_machine_learning_types.png](http://localhost:8055/assets/8c927b2b-2620-4d08-acab-5329bb7e787d)\n\n> 1. Supervised machine learning: Supervised machine learning uses labeled training data to teach models the relationship between features and labels, enabling predictions for new data based on past observations.\n> - `Regression`: Regression is a form of supervised machine learning in which the label predicted by the model is a numeric value.\n> - `Classification`: Classification is a form of supervised machine learning in which the label represents a categorization, or class. There are two common classification scenarios\n>   - `Binary classification`: In binary classification, the label determines whether the observed item is (or isn't) an instance of a specific class. Or put another way, binary classification models predict one of two mutually exclusive outcomes\n>   - `Multiclass classification`: Multiclass classification extends binary classification to predict a label that represents one of multiple possible classes\n> 2. Unsupervised machine learning: Unsupervised machine learning operates without labeled data, focusing on understanding relationships between features within the training dataset.\n> - `Clustering`: . A clustering algorithm identifies similarities between observations based on their features, and groups them into discrete clusters\n> 3. `Deep learning`: Deep learning mimics human brain learning by employing artificial neural networks. These networks replicate biological neuron activity through mathematical functions, distinguishing it as an advanced subset of machine learning\n\n## Azure AI services\n### AI services on the Azure platform\n> - Azure AI services are AI capabilities that can be built into web or mobile applications, in a way that's straightforward to implement. These AI services include image recognition, natural language processing, speech, AI-powered search, and more.\n> - Azure AI services are based on three principles that dramatically improve speed-to-market:\n>   - `Prebuilt and ready to use`: Azure AI services are a portfolio of services, with capabilities suitable for use cases across sectors and industries.\n>   - `Accessed through APIs`: Developers can access AI services through REST APIs, client libraries, or integrate them with tools.\n>   - `Available on Azure`: AI services are cloud-based and accessed through Azure resource. \n\n### Azure AI service resources\n> There are two types of AI service resources: multi-service or single-service. Your development requirements and how you want costs to be billed determine the types of resources you need.\n> - `Multi-service resource`: a resource created in the Azure portal that provides access to multiple Azure AI services with a single key and endpoint. When you use an Azure AI services resource, all your AI services are billed together.\n> - `Single-service resources`: a resource created in the Azure portal that provides access to a single Azure AI service. Each Azure AI service has a unique key and endpoint. These resources might be used when you only require one AI service or want to see cost information separately.\n\n### Azure Machine Learning\n> Microsoft Azure Machine Learning is a cloud service for training, deploying, and managing machine learning models. It's designed to be used by data scientists, software engineers, devops professionals, and others to manage the end-to-end lifecycle of machine learning projects, including:\n> - Exploring data and preparing it for modeling.\n> - Training and evaluating machine learning models.\n> - Registering and managing trained models.\n> - Deploying trained models for use by applications and services.\n> - Reviewing and applying responsible AI principles and practices.\n\n#### Azure Machine Learning workspace\n> The core requirement for Azure Machine Learning is an Azure Machine Learning workspace, set up within an Azure subscription. Additional resources such as storage accounts, container registries, and virtual machines are automatically generated as necessary to support the workspace.\n\n![02_azure_portal.png](http://localhost:8055/assets/5b559c98-8455-4538-908c-06d4901e26b7)\n\n#### Azure Machine Learning studio\n> In Azure Machine Learning studio, you can (among other things):\n> - Import and explore data.\n> - Create and use compute resources.\n> - Run code in notebooks.\n> - Use visual tools to create jobs and pipelines.\n> - Use automated machine learning to train models.\n> - View details of trained models, including evaluation metrics, responsible AI information, and training parameters.\n> - Deploy trained models for on-request and batch inferencing.\n> - Import and manage models from a comprehensive model catalog.\n\n![03_azure_ml_studio.png](http://localhost:8055/assets/7ab3852f-d583-42d1-9c4b-76af25a2b170)\n\n# References\n- [Exam AI-900: Microsoft Azure AI Fundamentals](https://learn.microsoft.com/en-us/credentials/certifications/exams/ai-900/)\n- [Study guide for Exam AI-900: Microsoft Azure AI Fundamentals](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-900)\n- [Microsoft Azure AI Fundamentals: AI Overview](https://learn.microsoft.com/en-us/training/paths/get-started-with-artificial-intelligence-on-azure/)\n	["#Azure","#AI"]	9	azure-ai-900-microsoft-azure-ai-fundamentals-part-1-ai-overview	70688d1b-da57-49da-b5c1-60b7d326863c	Computer vision` - Capabilities within AI to interpret the world visually through cameras, video, and images.
5	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 02:18:21.821+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:37:56.644+00	Azure App Service 230s Limitation	- Azure App Service has a limit when processing long-running tasks: 230 seconds ([source](https://learn.microsoft.com/en-us/troubleshoot/azure/app-service/web-apps-performance-faqs#why-does-my-request-time-out-after-230-seconds)). This means that if we rely solely on Azure App Service (e.g., a backend HTTP API) and the processing logic exceeds this limit, we cannot track whether the task will succeed. By default, it will fail, and the task will stop.\n\n![AppService230s-01-2.png](http://localhost:8055/assets/f34334d1-92b3-46e1-8891-c13858114ff2)\n\n- Azure Functions with HTTP triggers have the same time limit because both Azure Functions and Azure App Service applications share the same Azure Load Balancer layer in front.\n- Assume that the processing time for a task (referred to as Task A) is 500 seconds. When a service or user (referred to as User U) calls Azure App Service at `/api/task/A`, how can we handle this limitation? Below are some ideas and corresponding architectures.\n1. **Idea 1:** Split Task A into smaller tasks (Task A1 - 100s, Task A2 - 80s, etc.) and use the Chain of Responsibility pattern to handle the tasks at the calling layer, U.\n    \n    ![AppService230s-02.png]![](http://localhost:8055/assets/b24a17ad-237e-49f4-b294-ef3a985377f7)\n    \n    > Note: The Chain of Responsibility pattern is similar to other concepts like pipelines.\n    > \n    \n    **Pros and Cons:**\n    \n    - **Pros:**\n        - Minimal changes to the logic of Task A are required; you only need to split Task A into subtasks.\n    - **Cons:**\n        - The task must be split into subtasks, which can be difficult with complex logic.\n        - The output of each subtask needs to be stored somewhere (either in layer U or in storage like an Azure Storage Account).\n        - If the execution time of some subtasks cannot be accurately estimated, this approach may not work. For example, if a subtask occasionally takes 300 seconds, it will fail at that subtask, preventing the process from completing.\n2. **Idea 2:** Move Task A to an Azure Function and use Durable Functions: [Durable Functions Overview](https://learn.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-overview).\n    \n    In the article above, we can consider the following patterns:\n    \n    - **Pattern #1: Function Chaining.** This pattern is similar to Idea 1, but we don't need it here because Durable Functions are not subject to the 230-second limitation.\n    - **Pattern #3: Async HTTP APIs.** This pattern triggers the task through an HTTP API and returns a response before Task A is completed. The status of Task A can be checked through another HTTP API.\n        \n        ![AppService230s-03.drawio.png](http://localhost:8055/assets/c90b9493-94c2-46d4-8abc-6f63e8a62983)\n        \n    \n    **Pros and Cons:**\n    \n    - **Pattern #1** has the same pros and cons as Idea 1.\n    - **Pattern #3:**\n        - **Pros:**\n            - No need to change the logic of Task A.\n        - **Cons:**\n            - Requires migrating from Azure App Service to Azure Functions.\n            - Requires implementing an API to check the task's status.\n3. **Idea 3:** Move Task A to a consumer of a Message Queue-like tool (e.g., Azure Event Hubs, RabbitMQ, Kafka, etc.).\n    \n    ![AppService230s-04.drawio.png](http://localhost:8055/assets/5fb4a667-e723-4ee2-9636-64284fb5ccb8)\n    \n    **Pros and Cons:**\n    \n    - **Pros:**\n        - We can easily track which events have been processed, which were successful, and which failed.\n        - Scalable: If the logic of Task A changes, or if we need to process many long or short tasks in addition to Task A, we can easily implement these without changing the infrastructure.\n    - **Cons:**\n        - With Azure Event Hubs, monitoring the cost of Event Hubs is necessary.\n        - With RabbitMQ or Kafka, at least one dedicated virtual machine is required, along with the setup on that virtual machine.\n4. **Idea 4:** Move all API logic and the web server to a virtual machine.\n    \n    ![AppService230s-05.drawio.png](http://localhost:8055/assets/b749c7d3-4cbd-4b6d-a1d0-59b3436d7314)\n    \n    **Pros and Cons:**\n    \n    - **Pros:**\n        - This approach can run without Azure Load Balancer, meaning it does not have a timeout limit.\n    - **Cons:**\n        - Requires setting up a web server on the virtual machine.\n        - No domain is provided by default; you will need to manually assign a domain to the public IP of the virtual machine.\n        - The cost is higher than using Azure App Service.\n        - If the virtual machine fails due to an error, high availability is not provided by default, unlike Azure App Service. Enabling protections like Scale Sets or Availability Zones will incur additional costs.\n5. In addition to the four ideas above, there are some other approaches, but they come with significant limitations:\n    - Use technologies like `background_task` in FastAPI or fork a thread and ignore the timeout. In this case, the timeout will still be returned to the client, but Task A will continue processing. The problem with this approach is that we cannot monitor the status of Task A.\n    - Use Azure WebJobs. However, it has limitations, such as poor support for certain stacks (e.g., Python, Linux) and a smaller community compared to Azure Functions.	["#Azure"]	10	azure-app-service-230s-limitation	2ba3fe4f-3ee9-4dc0-b7ba-1ae8d3ef1054	Azure App Service has a limit when processing long-running tasks: 230 seconds.\n\nThis means that if we rely solely on Azure App Service (e.g., a backend HTTP API) and the processing logic exceeds this limit, we cannot track whether the task will succeed. By default, it will fail, and the task will stop.
6	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 02:31:38.829+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:38:25.363+00	Azure Machine Learning - Part2: Computer VIsion	## Fundamentals of Computer Vision\n> Computer vision is one of the core areas of artificial intelligence (AI), and focuses on creating solutions that enable AI application to `see` the world and make sense of it.\n\n### Images and image processing\n#### Images as pixel arrays\n> - To a computer, an image is an array of numeric `pixel` values. For example, consider the following array: \n```python\n0   0   0   0   0   0   0  \n0   0   0   0   0   0   0\n0   0  255 255 255  0   0\n0   0  255 255 255  0   0\n0   0  255 255 255  0   0\n0   0   0   0   0   0   0\n0   0   0   0   0   0   0\n```\n> - This array represents a 7x7 pixel image, defining its `resolution`.\n> - Pixels range from 0 (black) to 255 (white) in the array. The resulting image is grayscale.\n\n![01_gray_img](http://localhost:8055/assets/073c27f7-6c7b-455b-8113-10b54a7360c8)\n\n> - Grayscale images use a 2D array of pixel values, while most digital images are RGB, consisting of three layers representing red, green, and blue color channels. \n> - For a color image, three channels of pixel values would maintain the same square shape as the grayscale example.\n```python\nRed:\n 150  150  150  150  150  150  150  \n 150  150  150  150  150  150  150\n 150  150  255  255  255  150  150\n 150  150  255  255  255  150  150\n 150  150  255  255  255  150  150\n 150  150  150  150  150  150  150\n 150  150  150  150  150  150  150\n\nGreen:\n 0    0    0    0    0    0    0          \n 0    0    0    0    0    0    0\n 0    0   255  255  255   0    0\n 0    0   255  255  255   0    0\n 0    0   255  255  255   0    0\n 0    0    0    0    0    0    0\n 0    0    0    0    0    0    0\n\nBlue:\n 255  255  255  255  255  255  255  \n 255  255  255  255  255  255  255\n 255  255   0    0    0   255  255\n 255  255   0    0    0   255  255\n 255  255   0    0    0   255  255\n 255  255  255  255  255  255  255\n 255  255  255  255  255  255  255\n```\n\n> - Here's the resulting image with:\n>   - The purple sqaures are represented by the combination `Red:150 - Green:0 - Blue:255`\n>   - The yellow sqaures are represented by the combination `Red:255 - Green:255 - Blue:0`\n\n![02_RGB_img](http://localhost:8055/assets/5f85d56b-be42-459f-adef-b918f58f5280)\n\n#### Using filters to process images\n> - `Filters`: Alter pixel values and create visual effects\n> - `Filter kernels`: A filter consists of one or more arrays of pixel values. For instance, a 3x3 kernal can define a filter\n```python\n-1 -1 -1 \n-1  8 -1 \n-1 -1 -1\n```\n> - The kernel is `convolved` across the image, calculating a weighted sum for each 3x3 patch of pixels and assigning the result to a new image.\n> - Let's start with the grayscale image we explored previously:\n```python\n0   0   0   0   0   0   0  \n0   0   0   0   0   0   0\n0   0  255 255 255  0   0\n0   0  255 255 255  0   0\n0   0  255 255 255  0   0\n0   0   0   0   0   0   0\n0   0   0   0   0   0   0\n```\n> - First, we apply the filter kernel to the top left patch of the image, multiplying each pixel value by the corresponding weight value in the kernel and adding the results:\n```python\n(0 x -1) + (0 x -1) + (0 x -1) +\n(0 x -1) + (0 x 8) + (0 x -1) +\n(0 x -1) + (0 x -1) + (255 x -1) = -255\n```\n> - The result (-255) becomes the first value in a new array. Then we move the filter kernel along one pixel to the right and repeat the operation\n\n![03_filter.gif](http://localhost:8055/assets/34174156-836d-4798-8d61-faf5dbe56b31)\n\n> The resulting array represents a transformed image where the filter has highlighted the edges of shapes, effectively altering the original image. For instance:\n\n| Original Image | Filtered Image |\n| --- | --- |\n| ![04_banana_grayscale.png](http://localhost:8055/assets/91a82185-aa07-4506-bd35-2d4949181d92) | ![05_laplace.png](http://localhost:8055/assets/32343267-666f-4ecc-a3d6-45382832ac51) |\n\n> - Filters like the Laplace filter (used in the example) highlight edges by assigning high weights to edge pixels.\n> - Convolutional filtering enables various effects like blurring, sharpening, and color inversion by using different filter types\n\n\n### Machine learning for computer vision\n> - Computer vision aims to `extract meaning` or actionable insights `from images` by `training model` on `large datasets`.\n> - These models `learn to recognize features and patterns` in images, enabling them to understand and interpret visual data effectively.\n\n#### Convolutional neural networks (CNNs)\n> - Convolutional Neural Networks (CNNs) are common machine learning model architectures for computer vision.\n> - CNNs use `filters to extract numeric feature` maps from images. These feature values are then `fed into a deep learning model` to `generate label predictions`.\n> - The following diagram illustrates how a CNN for an image classification model works:\n\n![06_CNNs.png](http://localhost:8055/assets/f1921e5f-7ce4-4e1d-86a0-817447ebd818)\n> 1. Training data with known labels (e.g., 0: apple, 1: banana, 2: orange) is used to train the CNN. \n> 2. During training, `multiple filter layers extract features` from images. Initially, `filter kernels start with random weights`, producing numeric arrays called feature maps.\n> 3. Feature maps are flattened into a single-dimensional array of feature values. \n> 4. These feature values are inputted into a fully connected neural network. \n> 5. The output layer of the neural network uses a softmax function to produce probability values for each class (e.g., [0.2, 0.5, 0.3]).\n\n- The model calculates `loss` by comparing predicted and actual class scores. \n- Weights in the fully connected neural network and filter kernels in feature extraction layers are adjusted to minimize this loss.\n- The training iterates over multiple `epochs` until optimal weights are learned.\n- Afterward, these weights are saved, enabling the model to predict labels for new images with unknown labels.\n\n\n#### Multi-modal models\n> - Multi-modal models are trained on captioned images without fixed labels.\n> - An image encoder extracts features from images based on pixel values\n> - Text embeddings from a language encoder are combined with image features.\n> - The model captures relationships between natural language token embeddings and image features.\n> - The overall model encapsulates relationships between natural language token embeddings and image features, as shown here:\n\n![07_multi_modal_model.png](http://localhost:8055/assets/b3cfbeb0-bb21-41d2-ae53-04f0e6a6d077)\n\n> - `The Microsoft Florence` model is just such a model\n> - Florence as a foundation model for adaptive models that perform: \n>   - `Image classification`: Identifying to which category an image belongs.\n>   - `Object detection`: Locating individual objects within an image.\n>   - `Captioning`: Generating appropriate descriptions of images.\n>   - `Tagging`: Compiling a list of relevant text tags for an image.\n> - Multi-modal models like Florence are at the cutting edge of computer vision and AI in general, and are expected to drive advances in the kinds of solution that AI makes possible.\n\n![08_florence-model.png](http://localhost:8055/assets/ce6f6b83-75b7-42b1-87a2-301b6a46f415)\n\n### Azure AI Vision\n\n> - Microsoft's Azure AI Vision service offers prebuilt and customizable computer vision models built on the Florence foundation model, providing diverse capabilities. It enables the rapid creation of sophisticated computer vision solutions.\n> - To use Azure AI Vision, first create a resource in your Azure subscription from the available resource types. You can use either of the following resource types:\n>   - `Azure AI Vision`: A specific resource for the Azure AI Vision service. Use this resource type if you don't intend to use any other Azure AI services, or if you want to track utilization and costs for your Azure AI Vision resource separately.\n>   - `Azure AI services`: A general resource that includes Azure AI Vision along with many other Azure AI services; such as Azure AI Language, Azure AI Custom Vision, Azure AI Translator, and others. Use this resource type if you plan to use multiple AI services and want to simplify administration and development.\n> - `Azure AI Vision` offers various image analysis capabilities, including:\n>   - Optical character recognition (OCR) - extracting text from images.\n>   - Generating captions and descriptions of images.\n>   - Detection of thousands of common objects in images.\n>   - Tagging visual features in images\n> - If built-in models aren't enough, train a custom model for *image classification* or *object detection* using pre-trained foundation models, needing only a few training images.\n\n\n## Fundamentals of Facial Recognition\n\nFace detection and analysis uses AI algorithms to locate and analyze human faces in images or videos.\n\n### Face detection, Face analysis and Facial recognition\n\n- `Face detection`: Involves identifying face regions in an image by returning bounding box coordinates\n\n    Example:\n    ![09_face_detection_example]![](http://localhost:8055/assets/d63cc9d7-58e2-4a0e-8ae1-9d68b47f8015)\n\n- `Face analysis`: Facial features like the nose, eyes, and lips can train machine learning models to extract additional information.\n\n    Example:\n    ![10_face_analysis_example]![](http://localhost:8055/assets/216b39c5-4809-4e06-a1c3-a046b768d657)\n\n- `Facial recognition`: \n  - Facial recognition trains a model using multiple images of an individual to identify them in new images based on facial features. \n  - Facial recognition, when used responsibly, enhances efficiency, security, and customer experiences.\n\n    Example:\n    ![11_facial_recognition_example](http://localhost:8055/assets/f7a31c13-1cef-450b-a3e4-19aa2d554a67)\n\n### Azure AI Face\n\nMicrosoft Azure offers several AI services for face detection and analysis:\n\n- `Azure AI Vision`: Provides face detection and basic analysis, like bounding box coordinates.\n- `Azure AI Video Indexer`: Detects and identifies faces in videos.\n- `Azure AI Face`: Offers the most comprehensive facial analysis, including detection, recognition, and analysis.\n\n\n## Fundamentals of optical character recognition (OCR)\n\n- Machines can read text in images, like road signs or chalkboards, using optical character recognition (OCR), which converts words in images into machine-readable text.\n\n- OCR, built on machine learning, recognizes text by identifying shapes as letters or symbols. Modern OCR models can now detect and read both `printed` and `handwritten` text in images `line-by-line` and `word-by-word`.\n\n  Examples:\n  ![12_ocr_example_1](http://localhost:8055/assets/2f86ab0a-a23a-49eb-a932-4a13eea9781a)\n  ![13_orc_example_2](http://localhost:8055/assets/0b517074-007a-495e-bcf0-1e3d05a48a69)\n\n\n# References\n- [Exam AI-900: Microsoft Azure AI Fundamentals](https://learn.microsoft.com/en-us/credentials/certifications/exams/ai-900/)\n- [Study guide for Exam AI-900: Microsoft Azure AI Fundamentals](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-900)\n- [Microsoft Azure AI Fundamentals: Computer Vision](https://learn.microsoft.com/en-us/training/paths/explore-computer-vision-microsoft-azure/)\n	["#Azure","#AI"]	9	azure-machine-learning-part2-computer-vision	627c0f34-a3e2-449b-b46e-1b443bea6936	Computer vision is one of the core areas of artificial intelligence (AI), and focuses on creating solutions that enable AI application to `see` the world and make sense of it.
8	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:05:00.351+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:40:20.058+00	Semantic Router	# Semantic Router\n## Introduction\n\nSemantic Router is a cutting-edge technology designed to expedite decision-making processes within Large Language Models (LLMs) and AI agents. By leveraging the power of semantic vector spaces, it efficiently routes requests based on their semantic meaning, significantly outperforming traditional methods in terms of speed and accuracy.\n\n## Key Concepts\n\n![img/architect.png](http://localhost:8055/assets/dbb95118-4e16-41ee-b51d-9399c53a4b6b)\n\n### How it Works\n- **Vector Embeddings**: Semantic Router converts text or other data into numerical representations known as embeddings. These embeddings capture the semantic meaning of the data.\n- **Semantic Space**: Embeddings are placed in a high-dimensional semantic space where semantically similar data points are closer together.\n- **Routing Decisions**: When a new request arrives, its embedding is calculated and compared to the embeddings of pre-defined routes. The closest match determines the appropriate action or response.\n\n### Key Benefits\n\n  - **Speed**: Semantic Router makes decisions in milliseconds, dramatically improving LLM response times.\n  - **Efficiency**: By avoiding slow LLM generations for routing, it optimizes resource utilization.\n  - **Scalability**: Handles large numbers of routes and complex decision-making scenarios.\n  - **Accuracy**: Delivers accurate routing based on semantic understanding.\n  - **Flexibility**: Integrates with various LLM and vector database providers.\n\n### Use Cases\n\n  - **AI Agents**: Efficiently routes user requests to appropriate tools or actions.\n  - **Chatbots**: Quickly determines the intent of user queries.\n  - **Recommendation Systems**: Suggests relevant products or content based on user preferences.\n  - **Content Moderation**: Filters content based on predefined categories.\n\n## Implementation\n\n```python\nfrom semantic_router import Route\nimport os\nfrom getpass import getpass\nfrom semantic_router.encoders import OpenAIEncoder\nfrom semantic_router.layer import RouteLayer\n\nos.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")\nencoder = OpenAIEncoder()\n\npolitics = Route(\n    name="politics",\n    utterances=[\n        "isn't politics the best thing ever",\n        "why don't you tell me about your political opinions",\n        "don't you just love the president",\n        "don't you just hate the president",\n        "they're going to destroy this country!",\n        "they will save the country!",\n    ],\n)\n\nchitchat = Route(\n    name="chitchat",\n    utterances=[\n        "how's the weather today?",\n        "how are things going?",\n        "lovely weather today",\n        "the weather is horrendous",\n        "let's go to the chippy",\n    ],\n)\n\nroutes = [politics, chitchat]\nrl = RouteLayer(encoder=encoder, routes=routes)\n```\n\nLet's test the Semantic Router with some queries:\n``` python\n\nrl("don't you love politics?")\n```\n\noutput:\n\n```\nRouteChoice(name='politics', function_call=None, similarity_score=None)\n```\n\n``` python\nrl("how's the weather today?")\n```\n\nOutput:\n\n```\nRouteChoice(name='chitchat', function_call=None, similarity_score=None)\n```\n\nWhat if we send a query that is unrelated to our existing Route objects?\n``` python\n\nrl("I'm interested in learning about llama 2") \n\n```\nIt will output:\n\n```\nRouteChoice(name=None, function_call=None, similarity_score=None)\n```\n\n## Conclusion\n\nSemantic Router is a valuable tool for building efficient and intelligent AI systems. By harnessing the power of semantic understanding, it accelerates decision-making and enhances overall performance.\n\n## Additional Resources\n\n- [Git repo aurelio-labs/semantic-router](https://github.com/aurelio-labs/semantic-router)\n- [Another Get-Rich-Quick Scheme Using LLMs, RAG, Semantic Routing & Prompts Driven Feedback](https://pub.towardsai.net/another-get-rich-quick-scheme-using-llms-rag-semantic-routing-prompts-driven-feedback-5b43e2b6661a)\n- [Smarter Chatbots: How Semantic Routing Prevents the Unwanted](https://medium.com/marvelous-mlops/smarter-chatbots-how-semantic-routing-prevents-the-unwanted-be31f34a7df6)	["#AI","#Python"]	8	semantic-router	e7c1f483-a262-4c9f-ba22-5b5f9116516e	Semantic Router is a cutting-edge technology designed to expedite decision-making processes within Large Language Models (LLMs) and AI agents. By leveraging the power of semantic vector spaces, it efficiently routes requests based on their semantic meaning, significantly outperforming traditional methods in terms of speed and accuracy.
13	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:50:14.223+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:42:44.961+00	Higher Order Functions	# Higher Order Functions in JavaScript\n\n## Introduction\n\nIn JavaScript, the concept of higher-order functions is a cornerstone of functional programming, offering powerful ways to work with functions. Understanding and utilizing higher-order functions can significantly enhance the flexibility and readability of your code. In this blog, we'll explore what higher-order functions are, why they are useful, and how to use them effectively.\n\n## What Are Higher-Order Functions?\n\nA higher-order function is a function that either takes another function as an argument or returns a function as its result. In JavaScript, functions are first-class citizens, meaning they can be passed around and used just like any other value, such as strings or numbers. This flexibility allows us to create functions that operate on other functions.\n\nExample:\n\n![image.png](http://localhost:8055/assets/f3ca77a4-5c5a-4977-b892-2751e0c34ee0)\n\nIn this example, `higherOrderFunction` takes `sayHello` as a callback and calls it. The callback is executed within the context of the higher-order function, allowing us to add additional behavior before and after the callback is called.\n\n## Why Use Higher-Order Functions?\n\nHigher-order functions provide several key advantages:\n\n- **Code Reusability:** By abstracting common patterns into higher-order functions, you can reuse these functions with different callbacks, reducing code duplication.\n- **Modularity:** Higher-order functions enable you to create modular and composable code. You can break down complex logic into smaller, reusable functions that can be combined in various ways.\n- **Flexibility:** Since functions are first-class citizens in JavaScript, you can pass different functions to a higher-order function, making your code more adaptable and easier to maintain.\n\n## Common Examples of Higher-Order Functions\n\nJavaScript provides several built-in higher-order functions that you may already be familiar with:\n\n- **Array.prototype.map():** Applies a function to each element of an array and returns a new array with the results.\n\n![image.png](http://localhost:8055/assets/8b67d5f7-59ed-4273-80f5-d7a41c8f3c38)\n\n\n- **Array.prototype.filter():** Creates a new array with elements that pass a test provided by a callback function.\n\n![image.png](http://localhost:8055/assets/72225418-e039-4314-a781-797c70b4fdad)\n\n\n- **Array.prototype.reduce():** Applies a function against an accumulator and each element in the array (from left to right) to reduce it to a single value.\n    \n![image.png](http://localhost:8055/assets/46e39cc0-09c3-4f1d-ad7e-f9f1b255f02f)\n    \n\n## Creating Your Own Higher-Order Functions\n\nCreating custom higher-order functions is straightforward. Here's an example of a simple higher-order function that returns a function:\n\n![image.png](http://localhost:8055/assets/2a2ffaa2-88ad-4516-8ff2-558c7bc665b9)\n\nIn this example, `createMultiplier` is a higher-order function that returns a new function tailored to multiply a given number by the specified multiplier.\n\n## Conclusion\n\nHigher-order functions are a powerful feature of JavaScript that allows you to write more concise, readable, and reusable code. By understanding and applying higher-order functions, you can take full advantage of the functional programming capabilities in JavaScript, making your code more modular and easier to maintain.\n\nSo next time you're writing JavaScript, consider how higher-order functions can help you simplify your logic and create more elegant solutions!	["#JavaScript"]	7	higher-order-functions	6a0c462e-2959-4a4c-98c9-07e1ba42bb63	In JavaScript, the concept of higher-order functions is a cornerstone of functional programming, offering powerful ways to work with functions. Understanding and utilizing higher-order functions can significantly enhance the flexibility and readability of your code. In this blog, we'll explore what higher-order functions are, why they are useful, and how to use them effectively.
14	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:54:29.462+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:43:22.481+00	RAGAS- Cách đánh giá một mô hình RAG	## Introduction\n\nRAG là viết tắt của Retrieval-Augmented Generation, dịch sang tiếng Việt có thể hiểu là mô hình tạo sinh tăng cường dựa trên kết quả truy xuất. Đây là một kỹ thuật tiên tiến trong lĩnh vực xử lý ngôn ngữ tự nhiên (NLP), kết hợp ưu điểm của các mô hình ngôn ngữ lớn (LLM) với hệ thống truy xuất thông tin.\n\n## Key Concepts\n\nRAG được ứng dụng rất nhiều  trong các chatbot nội bộ, assitant  với rất nhiều  lợi điểm về độ chính xác,  dễ triển khai . Để đánh giá một câu trả lời của chatbot  thường là chủ quan theo quan điểm của từng người, có người gật gù chỉ xem trọng ý tưởng, có người yêu cầu không chỉ nội dung  mà cách hành văn cũng phải rõ ràng, không “lan man”, “lạc đề” hallucination ( rất dễ gặp trong các câu trả  lời của chatGPT, hay các mô hình LLM khác).\n\n### Tại sao lại cần RAGAS\n\nTrong các dự án cụ thể, quan điểm __“nên sử dụng cái gì để đánh giá RAG ”__ có xu hướng bị bỏ qua . Bản thân việc đánh giá cũng có xu hướng bị bỏ qua. Tuy nhiên với các khách hàng "khó tính" yêu cầu cao ,cũng như bản thân chúng ta cũng __cần các chỉ số có thể  cân đo đong đếm được để đánh giá sự cải thiện câu trả lời khi tinh chỉnh mô hình, dữ liệu__, đó là lý do RAGAS ra đời.\n\n\n### RAGAS là gì\n\nLà viết tắt của Retrieval Augmented Generation Assessment, Như chúng ta đã biết RAG gồm 2 phần Retrieval(truy vấn lấy ra các context chứa dữ liệu cần thiết để trả lời) và Generation(Sinh ra câu trả lời dựa trên dữ liệu + Prompt)\t. \nhttps://docs.ragas.io/en/latest/concepts/metrics/index.html\n\n## Các chỉ số đánh giá mô hình RAG bằng RAGAS \nTrước hết chúng ta cần 1 số định nghĩa\n1.Context : Là các đoạn văn hay các chunk kết quả của quá trình truy vấn ( Retrieval)\n2.Câu hỏi: là câu hỏi của người dùng\n3.prompt: ở đây là system prompt ( để phân biệt với user prompt)\n4.câu trả lời: Câu trả lời cuối cùng sinh ra bởi chatbot.\n\nCác chỉ số đánh giá mô hình RAG bằng RAGAS \n| **Chỉ số**                                      | **Đối tượng đánh giá** | **Mục đích**                                                                                                                                                        | **Thông tin sử dụng để đánh giá**              | **Điểm số, cách xem**                          |\n|-------------------------------------------------|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|------------------------------------------------|\n| **Faithfulness (độ trung thực)**                | Generation             | Đánh giá xem câu trả lời được tạo có thể được bắt nguồn từ context được tham chiếu hay không                                                                        | Câu trả lời, context                          | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Answer Relevancy (mức độ liên quan)**         | Generation             | Đánh giá mức độ liên quan của câu trả lời được tạo ra với câu hỏi ban đầu                                                                                           | Câu trả lời, câu hỏi ban đầu                 | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Context Recall (độ tái hiện context)**        | Retrieval              | Đo lường mức độ liên quan của context tham chiếu với ground truth                                                                                                   | Context, ground truth                        | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Context Precision (độ chính xác của context)**| Retrieval              | Đánh giá mức độ xếp hạng của context có các yếu tố liên quan đến câu hỏi và được đánh thứ tự cao trong danh sách các context tham chiếu hay không                   | Câu hỏi ban đầu                              | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Context Entities Recall (độ tái hiện thực thể trong context)** | Context | Thước đo về khả năng tái hiện context dựa trên số lượng entities có mặt trong cả ground truth và context so với số lượng entities chỉ có trong ground truth        | Context, ground truth                        | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Answer Semantic Similarity (độ tương đồng ngữ nghĩa)** | Toàn bộ pipeline | Đánh giá mức độ giống nhau về mặt ngữ nghĩa giữa câu trả lời được tạo ra và ground truth                                                                           | Câu trả lời, ground truth                    | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Answer Correctness (độ chính xác câu trả lời)** | Toàn bộ pipeline      | Đo độ chính xác của Câu trả lời và ground truth                                                                                                                    | Câu trả lời, ground truth                    | Từ 0 ～1, càng cao mô hình càng tốt            |\n| **Aspect Critique (điểm phê bình)**             | Toàn bộ pipeline       | Đánh giá nội dung gửi dựa trên các khía cạnh được xác định trước, chẳng hạn như tính không độc hại                                                                  | Câu trả lời, điểm chuẩn được quy định        |                                                |\n| **Summarization Score (điểm tóm tắt)**          | Toàn bộ pipeline       | Thước đo mức độ tóm tắt nắm bắt thông tin quan trọng từ ngữ cảnh bằng cách tóm tắt document, sau đó sinh ra các câu hỏi và trả lời dựa trên nội dung tóm tắt       | Câu trả lời                                  | Từ 0 ～1, càng cao mô hình càng tốt            |\n\nThông thường người ta hay sử dụng __4 tiêu chí đầu tiên để đánh giá__ ,trong đó 3 tiêu chí 1. Faithfulnesss、2. Answer relevancy、3. Context precision  __không cần ground truth__ vẫn có thể tính toán ra được ( __cái này quan trọng vì không phải khi nào cũng có đủ effort để tạo ground truth__). Các chỉ số được __tính toán bằng cách thông qua LLM để parser câu trả lời để trích xuất content và entities hoặc embedding thành vector rồi tính toán__ theo các công thức, cụ thể có thể tham khảo ở  document và  source code https://github.com/explodinggradients/ragas/tree/main/src/ragas/metrics\n\n\n## Implementation\n\nChúng ta có thể dùng ragas thông qua langchain:\n\n```python\nfrom ragas.langchain.evalchain import RagasEvaluatorChain\nfrom ragas.metrics import (\n    faithfulness,\n    answer_relevancy,\n    context_precision,\n    context_recall,\n)\n\n# create evaluation chains\nfaithfulness_chain = RagasEvaluatorChain(metric=faithfulness)\nanswer_rel_chain = RagasEvaluatorChain(metric=answer_relevancy)\ncontext_rel_chain = RagasEvaluatorChain(metric=context_precision)\ncontext_recall_chain = RagasEvaluatorChain(metric=context_recall)\n\n```\nĐầu tiên ta tạo 1 QA chat bot theo mô hình RAG:\n```python\nfrom langchain_community.document_loaders import TextLoader\nfrom langchain.indexes import VectorstoreIndexCreator\nfrom langchain.chains import RetrievalQA\nfrom langchain_openai import ChatOpenAI\n\nloader = TextLoader("./nyc_wikipedia/nyc_text.txt")\nindex = VectorstoreIndexCreator().from_loaders([loader])\n\n\nllm = ChatOpenAI(temperature=0)\nqa_chain = RetrievalQA.from_chain_type(\n    llm,\n    retriever=index.vectorstore.as_retriever(),\n    return_source_documents=True,\n)\n\n```\nCuối cùng chúng ta lấy kết quả câu trả lời của QA chat bot trên và dùng hàm đã định nghĩa ở trên để tính ra chỉ số , ở đây là context_recall_chain \n\n```python\nquestion = "How did New York City get its name?"\nresult = qa_chain({"query": question})\ntính toán chỉ số\neval_result = context_recall_chain(result)\n\n```\n## Conclusion\n\nAzure Open AI và Azure AI Search cũng hỗ trợ tính toán chỉ số Ragas .\nChúng ta có thể lấy kết quả đánh giá của LLM mục tiêu bằng cách ghi lại System Prompt, câu hỏi và câu trả lời mong đợi (ground truth) cho LLM mục tiêu vào tệp Excel và tải nó lên hệ thống này để chạy batch.\nViệc đánh giá sẽ được thực hiện trên mô-đun tạo (Azure Open AI) và mô-đun tìm kiếm (Azure AI Search). Mỗi mục được đánh giá với số điểm từ 0 đến 1.\n\n\n![markdown](http://localhost:8055/assets/6f65eca5-d151-41d5-bd08-df7d02d8a6ee)\n\n\n## Additional Resources\n\n- https://github.com/explodinggradients/ragas/tree/main/src/ragas/metrics\n- https://docs.ragas.io/en/latest/concepts/metrics/index.html\n\nDataImpact tập trung vào ứng dụng những công nghệ mới nhất vào các bài toán cụ thể của khách hàng ở những điểm cốt lõi nhất. Điều đó mang lại những trải nghiệm rất phê với những anh em muốn tìm hiểu công nghệ học thật và làm thật, hãy join với chúng tôi để cùng khám phá nhé. https://dataimpact.vn/	["#AI","#ChatGPT"]	2	ragas-cach-danh-gia-mot-mo-hinh-rag	8fc4dbd0-4d44-43a6-99ff-def508959edd	RAG là viết tắt của Retrieval-Augmented Generation, dịch sang tiếng Việt có thể hiểu là mô hình tạo sinh tăng cường dựa trên kết quả truy xuất. Đây là một kỹ thuật tiên tiến trong lĩnh vực xử lý ngôn ngữ tự nhiên (NLP), kết hợp ưu điểm của các mô hình ngôn ngữ lớn (LLM) với hệ thống truy xuất thông tin.
15	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:56:02.598+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:43:43.226+00	Improve Python code performance with asyncio	When our python code becomed slow, it is common that we try to improve the performance by using another algorithm or even use multi threading for that.\nHowever, just by changing the code to run in asynchronous, in some case is the most simple and straight forward solution. This time, let's look at a specific problem below and see how we can achieve a sweet speed with some simple changes.\n\nThe problem:\n\n> Calling 3 API endpoints continiously.\n> Assuming each API requires 2 seconds until completion.\n> The code will requires about 6 seconds to finish.\n\nThe solution:\n\n- One solution is to apply concurrency, create 3 threads to call API in parallel. Very do-able, but managing threads is complex and we still need to wait for about 2 seconds before doing anything else.\n\n- Another solution is to use async, which will only dispatch the API calls. It won't wait until all API calls complete. Instead, the code keeps executing further and will be notified when API calls completed.\n\nNow, we will take a look at how the problem will be solve with the later approach - using async.\n\n## Creating a dummy server\n\n`time.sleep` may sufficient as an example. But let's create a server to make this more real.\n\nFirst, spawn an virtualenv and add some depencencies quickly.\n\n$ python -m virtualenv venv\n$ source venv/bin/activate\n$ pip install fastapi\n\n\nThen, create a simple server.\n\n```python\n# server.py\nimport time\nfrom fastapi import FastAPI\n\n\napp = FastAPI()\n\n@app.get("/ping")\ndef ping():\n    time.sleep(2)\n    return "pong"  # It just response a simple text after 2s of waiting\n```\n\nFinally, run the server.\n\n```bash\n$ fastapi dev server.py\n```\n\nWe now have a dummy server for playing around.\n\n## Fetch API sync\n\nLet's stimulate the problem of sync code.\n\nFirst, let's launch up Python cli and create some requests.\n\n```python\nimport time\nimport requests\n\n\ndef run_in_sync():\n    s = time.perf_counter()  # Spawn a time tracker\n    for i in range(3):  # Call API 3 times\n        print(requests.get("http://localhost:8000/ping).text)\n    print(time.perf_counter() - s)\n\nrun_in_sync()\nprint("doing other things")\n```\n\nRun the code and we will get.\n\n```bash\n$ "pong"\n$ "pong"\n$ "pong"\n$ 6.031\n$ "doing other things"\n```\n\nCould you see that we need to wait for 6s before we can do other thing? Yes, absolutely a waste, our computer just waiting for API to fetch until it can do other thing. So literally, it could be so much faster just by ... do not wait anymore. Let's see how we can achieve this in async way.\n\n## The async solution\n\nAll async functionalities are provided in `asyncio` module. Let's import it and quickly scratch some code.\n\n```python\nimport asyncio\nimport time\n\n\nasync def run_in_async():\n    s = time.perf_counter()  # Again, spawn a time tracker\n    loop = asyncio.get_event_loop()\n    for i in range(3):\n        print((await loop.run_in_executor(None, requests.get, 'http://localhost:8000/ping')).text)\n    print(time.perf_counter() - s)\n\nasyncio.run(run_async())\nprint("do other thing")\n```\n\nAnd here is the result.\n\n```bash\n$ "doing other things"\n$ "pong"\n$ "pong"\n$ "pong"\n$ 2.017\n```\n\nInteresting right?\n\n- The code does not wait for API at all! It just do other thing while the API is fetching\n- The code will resume the logic after API calls are finished, which is `print(time.perf_counter() - s)`\n- The API calls are dispatched at a same time and response back the latest is about 2s. In another word, it does not matter how many API calls we make, the wait time won't increase by that, but determined by the slowest API call.\n\n## Conclution\n\nThe power of async relies on its character that it does not wait, at all. So as long as a task is not necessary to run in sync mode (probably I/O related). We can always use async to easily gain some performance.\n\nHowever, it is also necessary to remind that. For the task that is sync in its nature, such as file processing. Using async will increase complexity of our code (as you can see that the async code is a little bit more complicated than the sync one) without gaining any performance.\n\nNowadays, cloud developing becomes popular, so mostly small services are communicating with each other over the network. Therefore, async, naturally becomes more and more popular, as how convinient as it is.\n\nThank you for reading!\n	["#Python"]	4	improve-python-code-performance-with-asyncio	37f1699d-3f01-406c-bbfc-f120f9e1ec95	When our python code becomed slow, it is common that we try to improve the performance by using another algorithm or even use multi threading for that. However, just by changing the code to run in asynchronous, in some case is the most simple and straight forward solution. This time, let's look at a specific problem below and see how we can achieve a sweet speed with some simple changes.
16	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:09:00.601+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:44:06.41+00	Autogen	# Autogen\n\n# What is autogen\n\nAutoGen is an open-source programming framework for building AI agents and facilitating cooperation among multiple agents to solve tasks. AutoGen aims to provide an easy-to-use and flexible framework for accelerating development and research on agentic AI, like PyTorch for Deep Learning. It offers features such as agents that can converse with other agents, LLM and tool use support, autonomous and human-in-the-loop workflows, and multi-agent conversation patterns.\n\n![image.png](http://localhost:8055/assets/959a1911-4025-450f-91fe-8b1ad7f49896)\n\n# Main Features\n\n- AutoGen enables building next-gen LLM applications based on [**multi-agent conversations**](https://microsoft.github.io/autogen/0.2/docs/Use-Cases/agent_chat) with minimal effort. It simplifies the orchestration, automation, and optimization of a complex LLM workflow. It maximizes the performance of LLM models and overcomes their weaknesses.\n- It supports [**diverse conversation patterns**](https://microsoft.github.io/autogen/0.2/docs/Use-Cases/agent_chat#supporting-diverse-conversation-patterns) for complex workflows. With customizable and conversable agents, developers can use AutoGen to build a wide range of conversation patterns concerning conversation autonomy, the number of agents, and agent conversation topology.\n- It provides a collection of working systems with different complexities. These systems span a [**wide range of applications**](https://microsoft.github.io/autogen/0.2/docs/Use-Cases/agent_chat#diverse-applications-implemented-with-autogen) from various domains and complexities. This demonstrates how AutoGen can easily support diverse conversation patterns.\n\n# Install Autogen\n\nAutoGen requires **Python version >= 3.8, < 3.13**. It can be installed from pip:\n\n```python\npip install autogen-agentchat~=0.2\n```\n\n# Agents\n\nIn AutoGen, an agent is an entity that can send and receive messages to and from other agents in its environment. An agent can be powered by models (such as a large language model like GPT-4), code executors (such as an IPython kernel), human, or a combination of these and other pluggable and customizable components.\n\n![image.png](http://localhost:8055/assets/6e81ab6b-130a-4727-ba8c-67bcb9eb9b4e)\n\nLLMs, for example, enable agents to converse in natural languages and transform between structured and unstructured text. The following example shows a `ConversableAgent` with a GPT-4 LLM switched on and other components switched off:\n\n```python\nimport os\n\nfrom autogen import ConversableAgent\n\nagent = ConversableAgent(\n    "chatbot",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ.get("OPENAI_API_KEY")}]},\n    code_execution_config=False,  # Turn off code execution, by default it is off.\n    function_map=None,  # No registered functions, by default it is None.\n    human_input_mode="NEVER",  # Never ask for human input.\n)\n```\n\nYou can ask this agent to generate a response to a question using the `generate_reply` method:\n\n```python\nreply = agent.generate_reply(messages=[{"content": "Tell me a joke.", "role": "user"}])\nprint(reply)\n```\n\n```python\nSure, here's a light-hearted joke for you:\n\nWhy don't scientists trust atoms?\n\nBecause they make up everything!\n```\n\n# Roles and Conversations\n\nIn AutoGen, you can assign roles to agents and have them participate in conversations or chat with each other. A conversation is a sequence of messages exchanged between agents. You can then use these conversations to make progress on a task. For example, in the example below, we assign different roles to two agents by setting their `system_message`.\n\n```python\ncathy = ConversableAgent(\n    "cathy",\n    system_message="Your name is Cathy and you are a part of a duo of comedians.",\n    llm_config={"config_list": [{"model": "gpt-4", "temperature": 0.9, "api_key": os.environ.get("OPENAI_API_KEY")}]},\n    human_input_mode="NEVER",  # Never ask for human input.\n)\n\njoe = ConversableAgent(\n    "joe",\n    system_message="Your name is Joe and you are a part of a duo of comedians.",\n    llm_config={"config_list": [{"model": "gpt-4", "temperature": 0.7, "api_key": os.environ.get("OPENAI_API_KEY")}]},\n    human_input_mode="NEVER",  # Never ask for human input.\n)\n```\n\nNow that we have two comedian agents, we can ask them to start a comedy show. This can be done using the `initiate_chat` method. We set the `max_turns` to 2 to keep the conversation short.\n\n```python\nresult = joe.initiate_chat(cathy, message="Cathy, tell me a joke.", max_turns=2)\n```\n\n```python\njoe (to cathy):\n\nCathy, tell me a joke.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nSure, here's one for you:\n\nWhy don't scientists trust atoms?\n\nBecause they make up everything!\n\n--------------------------------------------------------------------------------\njoe (to cathy):\n\nHaha, that's a good one, Cathy! Okay, my turn. \n\nWhy don't we ever tell secrets on a farm?\n\nBecause the potatoes have eyes, the corn has ears, and the beans stalk.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nHaha, that's a great one! A farm is definitely not the place for secrets. Okay, my turn again. \n\nWhy couldn't the bicycle stand up by itself?\n\nBecause it was two-tired!\n\n--------------------------------------------------------------------------------\n```\n\n# Chat Termination\n\n## Parameters in initiate_chat\n\nIf we increase `max_turns` to say `3` notice the conversation takes more rounds to terminate:\n\n```python\nresult = joe.initiate_chat(\n    cathy, message="Cathy, tell me a joke.", max_turns=3\n)  # increase the number of max turns before termination\n```\n\n```python\njoe (to cathy):\n\nCathy, tell me a joke.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nSure, here's one for you:\n\nWhy don't scientists trust atoms?\n\nBecause they make up everything!\n\n--------------------------------------------------------------------------------\njoe (to cathy):\n\nHaha, that's a good one, Cathy! Okay, my turn. \n\nWhy don't we ever tell secrets on a farm?\n\nBecause the potatoes have eyes, the corn has ears, and the beans stalk.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nHaha, that's a great one! A farm is definitely not the place for secrets. Okay, my turn again. \n\nWhy couldn't the bicycle stand up by itself?\n\nBecause it was two-tired!\n\n--------------------------------------------------------------------------------\njoe (to cathy):\n\nHaha, that's a wheely good one, Cathy!\n\nWhy did the golfer bring two pairs of pants?\n\nIn case he got a hole in one!\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nHaha, that's a perfect swing of a joke!\n\nWhy did the scarecrow win an award?\n\nBecause he was outstanding in his field!\n\n--------------------------------------------------------------------------------\n```\n\n## Agent-triggered termination\n\n### Using max_consecutive_auto_reply\n\nIn the example below lets set `max_consecutive_auto_reply` to `1` and notice how this ensures that Joe only replies once.\n\n```python\njoe = ConversableAgent(\n    "joe",\n    system_message="Your name is Joe and you are a part of a duo of comedians.",\n    llm_config={"config_list": [{"model": "gpt-4", "temperature": 0.7, "api_key": os.environ.get("OPENAI_API_KEY")}]},\n    human_input_mode="NEVER",  # Never ask for human input.\n    max_consecutive_auto_reply=1,  # Limit the number of consecutive auto-replies.\n)\n\nresult = joe.initiate_chat(cathy, message="Cathy, tell me a joke.")\n```\n\n```python\njoe (to cathy):\n\nCathy, tell me a joke.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nSure, here's one for you:\n\nWhy don't scientists trust atoms?\n\nBecause they make up everything!\n\n--------------------------------------------------------------------------------\njoe (to cathy):\n\nHaha, that's a good one, Cathy! Okay, my turn. \n\nWhy don't we ever tell secrets on a farm?\n\nBecause the potatoes have eyes, the corn has ears, and the beans stalk.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nHaha, that's a great one! A farm is definitely not the place for secrets. Okay, my turn again. \n\nWhy couldn't the bicycle stand up by itself?\n\nBecause it was two-tired!\n\n--------------------------------------------------------------------------------\n```\n\n### Using is_termination_msg\n\nLet’s set the termination message to “GOOD BYE” and see how the conversation terminates.\n\n```python\njoe = ConversableAgent(\n    "joe",\n    system_message="Your name is Joe and you are a part of a duo of comedians.",\n    llm_config={"config_list": [{"model": "gpt-4", "temperature": 0.7, "api_key": os.environ.get("OPENAI_API_KEY")}]},\n    human_input_mode="NEVER",  # Never ask for human input.\n    is_termination_msg=lambda msg: "good bye" in msg["content"].lower(),\n)\n\nresult = joe.initiate_chat(cathy, message="Cathy, tell me a joke and then say the words GOOD BYE.")\n```\n\n```python\njoe (to cathy):\n\nCathy, tell me a joke and then say the words GOOD BYE.\n\n--------------------------------------------------------------------------------\ncathy (to joe):\n\nWhy don't scientists trust atoms?\n\nBecause they make up everything!\n\nGOOD BYE!\n\n--------------------------------------------------------------------------------\n```\n\n# Human in the Loop\n\nMany applications may require putting humans in-the-loop with agents. For example, to allow human feedback to steer agents in the right direction, specify goals, etc. In this chapter, we will show how AutoGen supports human intervention.\n\nIn AutoGen’s `ConversableAgent`, the human-in-the-loop component sits in front of the auto-reply components. It can intercept the incoming messages and decide whether to pass them to the auto-reply components or to provide human feedback. The figure below illustrates the design.\n\n![image.png](http://localhost:8055/assets/2d0fcd04-72de-46a4-a748-c5af24dabad2)\n\n## Human Input Modes\n\nCurrently AutoGen supports three modes for human input. The mode is specified through the `human_input_mode` argument of the `ConversableAgent`. The three modes are:\n\n1. `NEVER`: human input is never requested.\n2. `TERMINATE` (default): human input is only requested when a termination condition is met. Note that in this mode if the human chooses to intercept and reply, the conversation continues and the counter used by `max_consecutive_auto_reply` is reset.\n3. `ALWAYS`: human input is always requested and the human can choose to skip and trigger an auto-reply, intercept and provide feedback, or terminate the conversation. Note that in this mode termination based on `max_consecutive_auto_reply` is ignored.\n\n## Human Input Mode = NEVER\n\nHere is an example of using this mode to run a simple guess-a-number game between two agents, the termination message is set to check for the number that is the correct guess.\n\n```python\nimport os\n\nfrom autogen import ConversableAgent\n\nagent_with_number = ConversableAgent(\n    "agent_with_number",\n    system_message="You are playing a game of guess-my-number. You have the "\n    "number 53 in your mind, and I will try to guess it. "\n    "If I guess too high, say 'too high', if I guess too low, say 'too low'. ",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    is_termination_msg=lambda msg: "53" in msg["content"],  # terminate if the number is guessed by the other agent\n    human_input_mode="NEVER",  # never ask for human input\n)\n\nagent_guess_number = ConversableAgent(\n    "agent_guess_number",\n    system_message="I have a number in my mind, and you will try to guess it. "\n    "If I say 'too high', you should guess a lower number. If I say 'too low', "\n    "you should guess a higher number. ",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\nresult = agent_with_number.initiate_chat(\n    agent_guess_number,\n    message="I have a number between 1 and 100. Guess it!",\n)\n```\n\n```python\nagent_with_number (to agent_guess_number):\n\nI have a number between 1 and 100. Guess it!\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 50?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nToo low.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 75?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nToo high.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 63?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nToo high.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 57?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nToo high.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 54?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nToo high.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 52?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nToo low.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 53?\n\n--------------------------------------------------------------------------------\n```\n\n## Human Input Mode = ALWAYS\n\nIn this mode, human input is always requested and the human can choose to skip, intercept , or terminate the conversation. Let us see this mode in action by playing the same game as before with the agent with the number, but this time participating in the game as a human. We will be the agent that is guessing the number, and play against the agent with the number from before.\n\n```python\nhuman_proxy = ConversableAgent(\n    "human_proxy",\n    llm_config=False,  # no LLM used for human proxy\n    human_input_mode="ALWAYS",  # always ask for human input\n)\n\nresult = human_proxy.initiate_chat(\n    agent_with_number,  # this is the same agent with the number as before\n    message="10",\n)\n```\n\n```python\nhuman_proxy (to agent_with_number):\n\n10\n\n--------------------------------------------------------------------------------\nagent_with_number (to human_proxy):\n\nToo low.\n\n--------------------------------------------------------------------------------\nhuman_proxy (to agent_with_number):\n\n79\n\n--------------------------------------------------------------------------------\nagent_with_number (to human_proxy):\n\nToo high.\n\n--------------------------------------------------------------------------------\nhuman_proxy (to agent_with_number):\n\n76\n\n--------------------------------------------------------------------------------\nagent_with_number (to human_proxy):\n\nToo high.\n\n--------------------------------------------------------------------------------\nhuman_proxy (to agent_with_number):\n\nI give up\n\n--------------------------------------------------------------------------------\nagent_with_number (to human_proxy):\n\nThat's okay! The number I was thinking of was 53.\n\n--------------------------------------------------------------------------------\n```\n\n## Human Input Mode = TERMINATE\n\nIn this mode, human input is only requested when a termination condition is met. **If the human chooses to intercept and reply, the counter will be reset**; if the human chooses to skip, the automatic reply mechanism will be used; if the human chooses to terminate, the conversation will be terminated.\n\n```python\nagent_with_number = ConversableAgent(\n    "agent_with_number",\n    system_message="You are playing a game of guess-my-number. "\n    "In the first game, you have the "\n    "number 53 in your mind, and I will try to guess it. "\n    "If I guess too high, say 'too high', if I guess too low, say 'too low'. ",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    max_consecutive_auto_reply=1,  # maximum number of consecutive auto-replies before asking for human input\n    is_termination_msg=lambda msg: "53" in msg["content"],  # terminate if the number is guessed by the other agent\n    human_input_mode="TERMINATE",  # ask for human input until the game is terminated\n)\n\nagent_guess_number = ConversableAgent(\n    "agent_guess_number",\n    system_message="I have a number in my mind, and you will try to guess it. "\n    "If I say 'too high', you should guess a lower number. If I say 'too low', "\n    "you should guess a higher number. ",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\nresult = agent_with_number.initiate_chat(\n    agent_guess_number,\n    message="I have a number between 1 and 100. Guess it!",\n)\n```\n\n```python\nagent_with_number (to agent_guess_number):\n\nI have a number between 1 and 100. Guess it!\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 50?\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nagent_with_number (to agent_guess_number):\n\nToo low.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 75?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nIt is too high my friend. \n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 60?\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nagent_with_number (to agent_guess_number):\n\nToo high.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 55?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nstill too high, but you are very close.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 52?\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nagent_with_number (to agent_guess_number):\n\nToo low.\n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 54?\n\n--------------------------------------------------------------------------------\nagent_with_number (to agent_guess_number):\n\nAlmost there! \n\n--------------------------------------------------------------------------------\nagent_guess_number (to agent_with_number):\n\nIs it 53?\n\n--------------------------------------------------------------------------------\n```\n\nEach time after one auto-reply from the agent with the number, the human was asked to provide feedback. Once the human provided feedback, the counter was reset. The conversation was terminated after the agent correctly guessed “53”.\n\n# Code Executors\n\nIn AutoGen, a code executor is a component that takes input messages (e.g., those containing code blocks), performs execution, and outputs messages with the results. AutoGen provides two types of built-in code executors, one is command line code executor, which runs code in a command line environment such as a UNIX shell, and the other is Jupyter executor, which runs code in an interactive [**Jupyter kernel**](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels).\n\nFor each type of executor, AutoGen provides two ways to execute code: locally and in a Docker container. One way is to execute code directly in the same host platform where AutoGen is running, i.e., the local operating system. It is for development and testing, but it is not ideal for production as LLM can generate arbitrary code. The other way is to execute code in a Docker container. The table below shows the combinations of code executors and execution environments.\n\n| Code Executor (`autogen.coding`) | Environment | Platform |\n| --- | --- | --- |\n| [**`LocalCommandLineCodeExecutor`**](https://microsoft.github.io/autogen/0.2/docs/reference/coding/local_commandline_code_executor#localcommandlinecodeexecutor) | Shell | Local |\n| [**`DockerCommandLineCodeExecutor`**](https://microsoft.github.io/autogen/0.2/docs/reference/coding/docker_commandline_code_executor#dockercommandlinecodeexecutor) | Shell | Docker |\n| [**`jupyter.JupyterCodeExecutor`**](https://microsoft.github.io/autogen/0.2/docs/reference/coding/jupyter/jupyter_code_executor#jupytercodeexecutor) | Jupyter Kernel (e.g., python3) | Local/Docker |\n\nIn this blog, we will focus on the command line code executors. For the Jupyter code executor, please refer to the topic page for [**Jupyter Code Executor**](https://microsoft.github.io/autogen/0.2/docs/topics/code-execution/jupyter-code-executor).\n\n## Local Execution\n\nUpon receiving a message with a code block, the local command line code executor first writes the code block to a code file, then starts a new subprocess to execute the code file. The executor reads the console output of the code execution and sends it back as a reply message.\n\n![image.png](http://localhost:8055/assets/11d1b09a-7742-4931-8ec5-f6699a2ab3f5)\n\nHere is an example of using the code executor to run a Python code block that prints a random number. First we create an agent with the code executor that uses a temporary directory to store the code files. We specify `human_input_mode="ALWAYS"` to manually validate the safety of the the code being executed.\n\n```python\nimport tempfile\n\nfrom autogen import ConversableAgent\nfrom autogen.coding import LocalCommandLineCodeExecutor\n\ntemp_dir = tempfile.TemporaryDirectory()\n\nexecutor = LocalCommandLineCodeExecutor(\n    timeout=10,  # Timeout for each code execution in seconds.\n    work_dir=temp_dir.name,  # Use the temporary directory to store the code files.\n)\n\ncode_executor_agent = ConversableAgent(\n    "code_executor_agent",\n    llm_config=False,  # Turn off LLM for this agent.\n    code_execution_config={"executor": executor},  # Use the local command line code executor.\n    human_input_mode="ALWAYS",  # Always take human input for this agent for safety.\n)\n```\n\n````python\nmessage_with_code_block = """This is a message with code block.\nThe code block is below:\n```python\nimport numpy as np\nimport matplotlib.pyplot as plt\nx = np.random.randint(0, 100, 100)\ny = np.random.randint(0, 100, 100)\nplt.scatter(x, y)\nplt.savefig('scatter.png')\nprint('Scatter plot saved to scatter.png')\n```\nThis is the end of the message.\n"""\n\nreply = code_executor_agent.generate_reply(messages=[{"role": "user", "content": message_with_code_block}])\nprint(reply)\n````\n\nDuring the generation of response, a human input is requested to give an opportunity to intercept the code execution. In this case, we choose to continue the execution, and the agent’s reply contains the output of the code execution.\n\n```python\n\n>>>>>>>> NO HUMAN INPUT RECEIVED.\n\n>>>>>>>> USING AUTO REPLY...\n\n>>>>>>>> EXECUTING CODE BLOCK (inferred language is python)...\nexitcode: 0 (execution succeeded)\nCode output: \nScatter plot saved to scatter.png\n```\n\n## Docker Execution\n\nTo mitigate the security risk of running LLM-generated code locally, we can use the docker command line code executor ([**`autogen.coding.DockerCommandLineCodeExecutor`**](https://microsoft.github.io/autogen/0.2/docs/reference/coding/docker_commandline_code_executor#dockercommandlinecodeexecutor)) to execute code in a docker container. This way, the generated code can only access resources that are explicitly given to it.\n\n![image.png](http://localhost:8055/assets/970740b9-9ef7-4210-a04d-8c0881a5407a)\n\nSimilar to the local command line code executor, the docker executor extracts code blocks from input messages, writes them to code files. For each code file, it starts a docker container to execute the code file, and reads the console output of the code execution.\n\nTo use docker execution, you need to [**install Docker**](https://docs.docker.com/engine/install/) on your machine. Once you have Docker installed and running, you can set up your code executor agent as follow:\n\n```python\nfrom autogen.coding import DockerCommandLineCodeExecutor\n\ntemp_dir = tempfile.TemporaryDirectory()\n\nexecutor = DockerCommandLineCodeExecutor(\n    image="python:3.12-slim",  # Execute code using the given docker image name.\n    timeout=10,  # Timeout for each code execution in seconds.\n    work_dir=temp_dir.name,  # Use the temporary directory to store the code files.\n)\n\ncode_executor_agent_using_docker = ConversableAgent(\n    "code_executor_agent_docker",\n    llm_config=False,  # Turn off LLM for this agent.\n    code_execution_config={"executor": executor},  # Use the docker command line code executor.\n    human_input_mode="ALWAYS",  # Always take human input for this agent for safety.\n)\n\n```\n\n## Use Code Execution in Conversation\n\nWriting and executing code is necessary for many tasks such as data analysis, machine learning, and mathematical modeling. In AutoGen, coding can be a conversation between a code writer agent and a code executor agent, mirroring the interaction between a programmer and a code interpreter.\n\n![image.png](http://localhost:8055/assets/df09520e-4d1a-4955-b6d3-a1a834234457)\n\nThe code writer agent can be powered by an LLM such as GPT-4 with code-writing capability. And the code executor agent is powered by a code executor.\n\nThe following is an agent with a code writer role specified using `system_message`. The system message contains important instruction on how to use the code executor in the code executor agent.\n\n```python\ncode_writer_system_message = """You are a helpful AI assistant.\nSolve tasks using your coding and language skills.\nIn the following cases, suggest python code (in a python coding block) or shell script (in a sh coding block) for the user to execute.\n1. When you need to collect info, use the code to output the info you need, for example, browse or search the web, download/read a file, print the content of a webpage or a file, get the current date/time, check the operating system. After sufficient info is printed and the task is ready to be solved based on your language skill, you can solve the task by yourself.\n2. When you need to perform some task with code, use the code to perform the task and output the result. Finish the task smartly.\nSolve the task step by step if you need to. If a plan is not provided, explain your plan first. Be clear which step uses code, and which step uses your language skill.\nWhen using code, you must indicate the script type in the code block. The user cannot provide any other feedback or perform any other action beyond executing the code you suggest. The user can't modify your code. So do not suggest incomplete code which requires users to modify. Don't use a code block if it's not intended to be executed by the user.\nIf you want the user to save the code in a file before executing it, put # filename: <filename> inside the code block as the first line. Don't include multiple code blocks in one response. Do not ask users to copy and paste the result. Instead, use 'print' function for the output when relevant. Check the execution result returned by the user.\nIf the result indicates there is an error, fix the error and output the code again. Suggest the full code instead of partial code or code changes. If the error can't be fixed or if the task is not solved even after the code is executed successfully, analyze the problem, revisit your assumption, collect additional info you need, and think of a different approach to try.\nWhen you find an answer, verify the answer carefully. Include verifiable evidence in your response if possible.\nReply 'TERMINATE' in the end when everything is done.\n"""\n\ncode_writer_agent = ConversableAgent(\n    "code_writer_agent",\n    system_message=code_writer_system_message,\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    code_execution_config=False,  # Turn off code execution for this agent.\n)\n```\n\n```python\nchat_result = code_executor_agent.initiate_chat(\n    code_writer_agent,\n    message="Write Python code to calculate the 14th Fibonacci number.",\n)\n```\n\n````python\ncode_executor_agent (to code_writer_agent):\n\nWrite Python code to calculate the 14th Fibonacci number.\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\ncode_writer_agent (to code_executor_agent):\n\nSure, here is a Python code snippet to calculate the 14th Fibonacci number. The Fibonacci series is a sequence of numbers in which each number is the sum of the two preceding ones, usually starting with 0 and 1.\n\n```python\ndef fibonacci(n):\n    if(n <= 0):\n        return "Input should be a positive integer."\n    elif(n == 1):\n        return 0\n    elif(n == 2):\n        return 1\n    else:\n        fib = [0, 1]\n        for i in range(2, n):\n            fib.append(fib[i-1] + fib[i-2])\n        return fib[n-1]\n\nprint(fibonacci(14))\n```\n\nThis Python code defines a function `fibonacci(n)` which computes the n-th Fibonacci number. The function uses a list `fib` to store the Fibonacci numbers as they are computed, and then returns the (n-1)-th element as the n-th Fibonacci number due to zero-indexing in Python lists.\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> NO HUMAN INPUT RECEIVED.\n\n>>>>>>>> USING AUTO REPLY...\n\n>>>>>>>> EXECUTING CODE BLOCK (inferred language is python)...\ncode_executor_agent (to code_writer_agent):\n\nexitcode: 0 (execution succeeded)\nCode output: \n233\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\ncode_writer_agent (to code_executor_agent):\n\nGreat, the execution was successful and the 14th Fibonacci number is 233. The sequence goes as follows: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233... and so on, where each number is the sum of the previous two. Therefore, the 14th number in the Fibonacci series is 233. \n\nI hope this meets your expectations. If you have any other concerns or need further computations, feel free to ask.\n\nTERMINATE\n\n--------------------------------------------------------------------------------\n````\n\n# Tool Use\n\nTools are pre-defined functions that agents can use. Instead of writing arbitrary code, agents can call tools to perform actions, such as searching the web, performing calculations, reading files, or calling remote APIs. Because you can control what tools are available to an agent, you can control what actions an agent can perform.\n\n## Creating Tools\n\nTools can be created as regular Python functions. For example, let’s create a calculator tool which can only perform a single operation at a time.\n\n```python\nfrom typing import Annotated, Literal\n\nOperator = Literal["+", "-", "*", "/"]\n\ndef calculator(a: int, b: int, operator: Annotated[Operator, "operator"]) -> int:\n    if operator == "+":\n        return a + b\n    elif operator == "-":\n        return a - b\n    elif operator == "*":\n        return a * b\n    elif operator == "/":\n        return int(a / b)\n    else:\n        raise ValueError("Invalid operator")\n```\n\n## Registering Tools\n\nOnce you have created a tool, you can register it with the agents that are involved in conversation.\n\n```python\nimport os\n\nfrom autogen import ConversableAgent\n\nassistant = ConversableAgent(\n    name="Assistant",\n    system_message="You are a helpful AI assistant. "\n    "You can help with simple calculations. "\n    "Return 'TERMINATE' when the task is done.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n)\n\nuser_proxy = ConversableAgent(\n    name="User",\n    llm_config=False,\n    is_termination_msg=lambda msg: msg.get("content") is not None and "TERMINATE" in msg["content"],\n    human_input_mode="NEVER",\n)\n\nassistant.register_for_llm(name="calculator", description="A simple calculator")(calculator)\n\nuser_proxy.register_for_execution(name="calculator")(calculator)\n```\n\nIn the above code, we registered the `calculator` function as a tool with the assistant and user proxy agents. We also provide a name and a description for the tool for the assistant agent to understand its usage.\n\n> Always provide a clear and concise description for the tool as it helps the agent's underlying LLM to understand the tool's usage.\n> \n\nSimilar to code executors, a tool must be registered with at least two agents for it to be useful in conversation. The agent registered with the tool’s signature through [**`register_for_llm`**](https://microsoft.github.io/autogen/0.2/docs/reference/agentchat/conversable_agent#register_for_llm) can call the tool; the agent registered with the tool’s function object through [**`register_for_execution`**](https://microsoft.github.io/autogen/0.2/docs/reference/agentchat/conversable_agent#register_for_execution) can execute the tool’s function.\n\nAlternatively, you can use [**`autogen.register_function`**](https://microsoft.github.io/autogen/0.2/docs/reference/agentchat/conversable_agent#register_function-1) function to register a tool with both agents at once.\n\n```python\nfrom autogen import register_function\n\nregister_function(\n    calculator,\n    caller=assistant,  # The assistant agent can suggest calls to the calculator.\n    executor=user_proxy,  # The user proxy agent can execute the calculator calls.\n    name="calculator",  # By default, the function name is used as the tool name.\n    description="A simple calculator",  # A description of the tool.\n)\n```\n\n## Using Tool\n\nOnce the tool is registered, we can use it in conversation. In the code below, we ask the assistant to perform some arithmetic calculation using the `calculator` tool.\n\n```python\nchat_result = user_proxy.initiate_chat(assistant, message="What is (44232 + 13312 / (232 - 32)) * 5?")\n```\n\n```python\nUser (to Assistant):\n\nWhat is (44232 + 13312 / (232 - 32)) * 5?\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nAssistant (to User):\n\n***** Suggested tool call (call_4rElPoLggOYJmkUutbGaSTX1): calculator *****\nArguments: \n{\n  "a": 232,\n  "b": 32,\n  "operator": "-"\n}\n***************************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> EXECUTING FUNCTION calculator...\nUser (to Assistant):\n\nUser (to Assistant):\n\n***** Response from calling tool (call_4rElPoLggOYJmkUutbGaSTX1) *****\n200\n**********************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nAssistant (to User):\n\n***** Suggested tool call (call_SGtr8tK9A4iOCJGdCqkKR2Ov): calculator *****\nArguments: \n{\n  "a": 13312,\n  "b": 200,\n  "operator": "/"\n}\n***************************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> EXECUTING FUNCTION calculator...\nUser (to Assistant):\n\nUser (to Assistant):\n\n***** Response from calling tool (call_SGtr8tK9A4iOCJGdCqkKR2Ov) *****\n66\n**********************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nAssistant (to User):\n\n***** Suggested tool call (call_YsR95CM1Ice2GZ7ZoStYXI6M): calculator *****\nArguments: \n{\n  "a": 44232,\n  "b": 66,\n  "operator": "+"\n}\n***************************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> EXECUTING FUNCTION calculator...\nUser (to Assistant):\n\nUser (to Assistant):\n\n***** Response from calling tool (call_YsR95CM1Ice2GZ7ZoStYXI6M) *****\n44298\n**********************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nAssistant (to User):\n\n***** Suggested tool call (call_oqZn4rTjyvXYcmjAXkvVaJm1): calculator *****\nArguments: \n{\n  "a": 44298,\n  "b": 5,\n  "operator": "*"\n}\n***************************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> EXECUTING FUNCTION calculator...\nUser (to Assistant):\n\nUser (to Assistant):\n\n***** Response from calling tool (call_oqZn4rTjyvXYcmjAXkvVaJm1) *****\n221490\n**********************************************************************\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nAssistant (to User):\n\nThe result of the calculation is 221490. TERMINATE\n\n--------------------------------------------------------------------------------\n```\n\n# Conversation Patterns\n\n1. **Two-agent chat**: the simplest form of conversation pattern where two agents chat with each other.\n2. **Sequential chat**: a sequence of chats between two agents, chained together by a carryover mechanism, which brings the summary of the previous chat to the context of the next chat.\n3. **Group Chat**: a single chat involving more than two agents. An important question in group chat is: What agent should be next to speak? To support different scenarios, we provide different ways to organize agents in a group chat:\n    - We support several strategies to select the next agent: **round_robin**, **random**, **manual** (human selection), and **auto** (Default, using an LLM to decide).\n    - We provide a way to constrain the selection of the next speaker (See examples below).\n    - We allow you to pass in a function to customize the selection of the next speaker. With this feature, you can build a **StateFlow** model which allows a deterministic workflow among your agents. Please refer to this [**guide**](https://microsoft.github.io/autogen/0.2/docs/topics/groupchat/customized_speaker_selection) and this [**blog post**](https://microsoft.github.io/autogen/0.2/blog/2024/02/29/StateFlow) on StateFlow for more details.\n4. **Nested Chat**: package a workflow into a single agent for reuse in a larger workflow.\n\n## **Two-Agent Chat and Chat Result**\n\nTwo-agent chat is the simplest form of conversation pattern. We start a two-agent chat using the `initiate_chat` method of every `ConversableAgent` agent. We have already seen multiple examples of two-agent chats but we haven’t covered the details.\n\n![image.png](http://localhost:8055/assets/be3f697d-f755-460b-94a5-4ff10968140a)\n\nA two-agent chats takes two inputs: a message, which is a string provided by the caller; a context, which specifies various parameters of the chat. The sender agent uses its chat initializer method (i.e., `generate_init_message` method of `ConversableAgent`) to generate an initial message from the inputs, and sends it to the recipient agent to start the chat. The sender agent is the agent whose `initiate_chat` method is called, and the recipient agent is the other agent.\n\nOnce the chat terminates, the history of the chat is processed by a chat summarizer. The summarizer summarizes the chat history and calculates the token usage of the chat. You can configure the type of summary using the `summary_method` parameter of the `initiate_chat` method. By default, it is the last message of the chat (i.e., `summary_method='last_msg'`).\n\nExample:\n\n```python\nimport os\n\nfrom autogen import ConversableAgent\n\nstudent_agent = ConversableAgent(\n    name="Student_Agent",\n    system_message="You are a student willing to learn.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n)\nteacher_agent = ConversableAgent(\n    name="Teacher_Agent",\n    system_message="You are a math teacher.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n)\n\nchat_result = student_agent.initiate_chat(\n    teacher_agent,\n    message="What is triangle inequality?",\n    summary_method="reflection_with_llm",\n    max_turns=2,\n)\n```\n\n```python\nStudent_Agent (to Teacher_Agent):\n\nWhat is triangle inequality?\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nTeacher_Agent (to Student_Agent):\n\nTriangle inequality theorem is a fundamental principle in geometry that states that the sum of the lengths of any two sides of a triangle must always be greater than the length of the third side. In a triangle with sides of lengths a, b, and c, the theorem can be written as:\n\na + b > c\na + c > b\nb + c > a\n\nEach of these represents the condition for one specific side (a, b, or c). All must be true for a triangle to exist.\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nStudent_Agent (to Teacher_Agent):\n\nThank you for the explanation. This theorem helps in understanding the basic properties of a triangle. It can also be useful when solving geometric problems or proving other mathematical theorems. Can you give me an example of how we can use the triangle inequality theorem?\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> USING AUTO REPLY...\nTeacher_Agent (to Student_Agent):\n\nAbsolutely! Here's an example:\n\nSuppose you're given three line segments with lengths 10, 7, and 3 units. The question is: "Can these three line segments form a triangle?"\n\nTo answer this, you would use the triangle inequality theorem. Adding any two side lengths together should be greater than the third:\n\n- For sides 10 and 7: 10 + 7 = 17, which is larger than 3.\n- For sides 10 and 3: 10 + 3 = 13, which is larger than 7.\n- For sides 7 and 3: 7 + 3 = 10, which is equal to the length of the third side (10), but not greater.\n\nSo, these three lines cannot form a triangle, because not all pairs of sides satisfy the triangle inequality theorem.\n\n--------------------------------------------------------------------------------\n```\n\nLet’s see what the summary looks like. The summary is stored in the `chat_result` object of the type `ChatResult` that was returned by the `initiate_chat` method.\n\n```python\nprint(chat_result.summary)\n```\n\n```python\nThe triangle inequality theorem states that in a triangle, the sum of the lengths of any two sides must always be greater than the length of the third side. This principle is\nsignificant in geometry and is used in solving problems or proving theorems. For\ninstance, if given three line segments, you can determine if they can form a triangle\nusing this theorem.\n```\n\nIn the above example, the summary method is set to `reflection_with_llm` which takes a list of messages from the conversation and summarize them using a call to an LLM. The summary method first tries to use the recipient’s LLM, if it is not available then it uses the sender’s LLM. In this case the recipient is “Teacher_Agent” and the sender is “Student_Agent”. The input prompt for the LLM is the following default prompt:\n\n```python\nprint(ConversableAgent.DEFAULT_SUMMARY_PROMPT)\n```\n\n```python\nSummarize the takeaway from the conversation. Do not add any introductory phrases.\n```\n\nThere are some other useful information in the `ChatResult` object, including the conversation history, human input, and token cost.\nGet the chat history:\n```python\nimport pprint\n\npprint.pprint(chat_result.chat_history)\n```\n\n```python\n[{'content': 'What is triangle inequality?', 'role': 'assistant'},\n {'content': 'Triangle inequality theorem is a fundamental principle in '\n             'geometry that states that the sum of the lengths of any two '\n             'sides of a triangle must always be greater than the length of '\n             'the third side. In a triangle with sides of lengths a, b, and c, '\n             'the theorem can be written as:\\n'\n             '\\n'\n             'a + b > c\\n'\n             'a + c > b\\n'\n             'b + c > a\\n'\n             '\\n'\n             'Each of these represents the condition for one specific side (a, '\n             'b, or c). All must be true for a triangle to exist.',\n  'role': 'user'},\n {'content': 'Thank you for the explanation. This theorem helps in '\n             'understanding the basic properties of a triangle. It can also be '\n             'useful when solving geometric problems or proving other '\n             'mathematical theorems. Can you give me an example of how we can '\n             'use the triangle inequality theorem?',\n  'role': 'assistant'},\n {'content': "Absolutely! Here's an example:\\n"\n             '\\n'\n             "Suppose you're given three line segments with lengths 10, 7, and "\n             '3 units. The question is: "Can these three line segments form a '\n             'triangle?"\\n'\n             '\\n'\n             'To answer this, you would use the triangle inequality theorem. '\n             'Adding any two side lengths together should be greater than the '\n             'third:\\n'\n             '\\n'\n             '- For sides 10 and 7: 10 + 7 = 17, which is larger than 3.\\n'\n             '- For sides 10 and 3: 10 + 3 = 13, which is larger than 7.\\n'\n             '- For sides 7 and 3: 7 + 3 = 10, which is equal to the length of '\n             'the third side (10), but not greater.\\n'\n             '\\n'\n             'So, these three lines cannot form a triangle, because not all '\n             'pairs of sides satisfy the triangle inequality theorem.',\n  'role': 'user'}]\n```\nGet the cost of the chat:\n```python\npprint.pprint(chat_result.cost)\n```\n\n```python\n({'gpt-4-0613': {'completion_tokens': 399,\n                 'cost': 0.04521,\n                 'prompt_tokens': 709,\n                 'total_tokens': 1108},\n  'total_cost': 0.04521},\n {'total_cost': 0})\n```\n\n## Sequential Chats\n\nSequential Chats  is a sequence of chats between two agents, chained together by a mechanism called *carryover*, which brings the summary of the previous chat to the context of the next chat.\n\nThis pattern is useful for complex task that can be broken down into interdependent sub-tasks. The figure below illustrate how this pattern works.\n\n![image.png](http://localhost:8055/assets/88d5fc3b-4bc2-491a-9b8a-f17dc4e48dc1)\n\nIn this pattern, the a pair of agents first start a two-agent chat, then the summary of the conversation becomes a *carryover* for the next two-agent chat. The next chat passes the carryover to the `carryover` parameter of the context to generate its initial message.\n\nCarryover accumulates as the conversation moves forward, so each subsequent chat starts with all the carryovers from previous chats.\n\nThe figure above shows distinct recipient agents for all the chats, however, the recipient agents in the sequence are allowed to repeat.\n\nTo illustrate this pattern, let’s consider a simple example of arithmetic operator agents. One agent (called the “Number_Agent”) is responsible for coming up with a number, and other agents are responsible for performing a specific arithmetic operation on the number, e.g., add 1, multiply by 2, etc..\n\n```python\nnumber_agent = ConversableAgent(\n    name="Number_Agent",\n    system_message="You return me the numbers I give you, one number each line.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\nadder_agent = ConversableAgent(\n    name="Adder_Agent",\n    system_message="You add 1 to each number I give you and return me the new numbers, one number each line.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\nmultiplier_agent = ConversableAgent(\n    name="Multiplier_Agent",\n    system_message="You multiply each number I give you by 2 and return me the new numbers, one number each line.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\nsubtracter_agent = ConversableAgent(\n    name="Subtracter_Agent",\n    system_message="You subtract 1 from each number I give you and return me the new numbers, one number each line.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\ndivider_agent = ConversableAgent(\n    name="Divider_Agent",\n    system_message="You divide each number I give you by 2 and return me the new numbers, one number each line.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n```\n\nThe Number Agent chats with the first operator agent, then the second operator agent, and so on. After each chat, the last message in the conversation (i.e., the result of the arithmetic operation from the operator agent) is used as the summary of the chat. This is specified by the `summary_method` parameter. In the end we will have the result of the arithmetic operations\n\n```python\nchat_results = number_agent.initiate_chats(\n    [\n        {\n            "recipient": adder_agent,\n            "message": "14",\n            "max_turns": 2,\n            "summary_method": "last_msg",\n        },\n        {\n            "recipient": multiplier_agent,\n            "message": "These are my numbers",\n            "max_turns": 2,\n            "summary_method": "last_msg",\n        },\n        {\n            "recipient": subtracter_agent,\n            "message": "These are my numbers",\n            "max_turns": 2,\n            "summary_method": "last_msg",\n        },\n        {\n            "recipient": divider_agent,\n            "message": "These are my numbers",\n            "max_turns": 2,\n            "summary_method": "last_msg",\n        },\n    ]\n)\n```\n\n```python\n\n********************************************************************************\nStart a new chat with the following message: \n14\n\nWith the following carryover: \n\n********************************************************************************\nNumber_Agent (to Adder_Agent):\n\n14\n\n--------------------------------------------------------------------------------\nAdder_Agent (to Number_Agent):\n\n15\n\n--------------------------------------------------------------------------------\nNumber_Agent (to Adder_Agent):\n\n15\n\n--------------------------------------------------------------------------------\nAdder_Agent (to Number_Agent):\n\n16\n\n--------------------------------------------------------------------------------\n\n********************************************************************************\nStart a new chat with the following message: \nThese are my numbers\n\nWith the following carryover: \n16\n\n********************************************************************************\nNumber_Agent (to Multiplier_Agent):\n\nThese are my numbers\nContext: \n16\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to Number_Agent):\n\n32\n\n--------------------------------------------------------------------------------\nNumber_Agent (to Multiplier_Agent):\n\n32\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to Number_Agent):\n\n64\n\n--------------------------------------------------------------------------------\n\n********************************************************************************\nStart a new chat with the following message: \nThese are my numbers\n\nWith the following carryover: \n16\n64\n\n********************************************************************************\nNumber_Agent (to Subtracter_Agent):\n\nThese are my numbers\nContext: \n16\n64\n\n--------------------------------------------------------------------------------\nSubtracter_Agent (to Number_Agent):\n\n15\n63\n\n--------------------------------------------------------------------------------\nNumber_Agent (to Subtracter_Agent):\n\n15\n63\n\n--------------------------------------------------------------------------------\nSubtracter_Agent (to Number_Agent):\n\n14\n62\n\n--------------------------------------------------------------------------------\n\n********************************************************************************\nStart a new chat with the following message: \nThese are my numbers\n\nWith the following carryover: \n16\n64\n14\n62\n\n********************************************************************************\nNumber_Agent (to Divider_Agent):\n\nThese are my numbers\nContext: \n16\n64\n14\n62\n\n--------------------------------------------------------------------------------\nDivider_Agent (to Number_Agent):\n\n8\n32\n7\n31\n\n--------------------------------------------------------------------------------\nNumber_Agent (to Divider_Agent):\n\n8\n32\n7\n31\n\n--------------------------------------------------------------------------------\nDivider_Agent (to Number_Agent):\n\n4\n16\n3.5\n15.5\n\n--------------------------------------------------------------------------------\n```\n\nFirst thing to note is that the `initiate_chats` method takes a list of dictionaries, each dictionary contains the arguments for the `initiate_chat` method.\n\nSecond, each chat in the sequence has a maximum round of 2, as specified with the setting `max_turns=2`, which means each arithmetic operation is performed twice. So you can see in the first chat the number 14 becomes 15 and then 16, in the second chat the number 16 becomes 32 and then 64, and so on.\n\nThird, the carryover accumulates as the chats go on. In the second chat, the carryover is the summary of the first chat “16”. In the third chat, the carryover is the summary of the first and second chat, which is the list “16” and “64”, and both numbers are operated upon. In the forth and last chat, the carryover is the summary of all previous chats, which is the list “16”, “64”, “14” and “62”, and all of these numbers are operated upon.\n\nThe final note is that the `initiate_chats` method returns a list of `ChatResult` objects, one for each chat in the sequence.\n\n```python\nprint("First Chat Summary: ", chat_results[0].summary)\nprint("Second Chat Summary: ", chat_results[1].summary)\nprint("Third Chat Summary: ", chat_results[2].summary)\nprint("Fourth Chat Summary: ", chat_results[3].summary)\n```\n\n```python\nFirst Chat Summary:  16\nSecond Chat Summary:  64\nThird Chat Summary:  14\n62\nFourth Chat Summary:  4\n16\n3.5\n15.5\n```\n\n## Group Chat\n\nAutoGen provides a more general conversation pattern called group chat, which involves more than two agents. The core idea of group chat is that all agents contribute to a single conversation thread and share the same context. This is useful for tasks that require collaboration among multiple agents.\n\nThe figure below illustrates how group chat works.\n\n![image.png](http://localhost:8055/assets/d942bb68-c9be-4fff-a9e8-7981097650d9)\n\nA group chat is orchestrated by a special agent type `GroupChatManager`. In the first step of the group chat, the Group Chat Manager selects an agent to speak. Then, the selected agent speaks and the message is sent back to the Group Chat Manager, who **broadcasts** the message to all other agents in the group. This process repeats until the conversation stops.\n\nThe Group Chat Manager can use several strategies to select the next agent. Currently, the following strategies are supported:\n\n1. `round_robin`: The Group Chat Manager selects agents in a round-robin fashion based on the order of the agents provided.\n2. `random`: The Group Chat Manager selects agents randomly.\n3. `manual`: The Group Chat Manager selects agents by asking for human input.\n4. `auto`: The default strategy, which selects agents using the Group Chat Manager’s LLM.\n\nIn this example, we use the `auto` strategy to select the next agent. To help the Group Chat Manager select the next agent, we also set the `description` of the agents. Without the `description`, the Group Chat Manager will use the agents’ `system_message`, which may be not be the best choice.\n\n```python\nadder_agent.description = "Add 1 to each input number."\nmultiplier_agent.description = "Multiply each input number by 2."\nsubtracter_agent.description = "Subtract 1 from each input number."\ndivider_agent.description = "Divide each input number by 2."\nnumber_agent.description = "Return the numbers given."\n```\n\nWe first create a `GroupChat` object and provide the list of agents. If we were to use the `round_robin` strategy, this list would specify the order of the agents to be selected. We also initialize the group chat with an empty message list and a maximum round of 6, which means there will be at most 6 iterations of selecting a speaker, agent speaks and broadcasting message.\n\n```python\nfrom autogen import GroupChat\n\ngroup_chat = GroupChat(\n    agents=[adder_agent, multiplier_agent, subtracter_agent, divider_agent, number_agent],\n    messages=[],\n    max_round=6,\n)\n```\n\nNow we create a `GroupChatManager` object and provide the `GroupChat` object as input. We also need to specify the `llm_config` of the Group Chat Manager so it can use the LLM to select the next agent (the `auto` strategy).\n\n```python\nfrom autogen import GroupChatManager\n\ngroup_chat_manager = GroupChatManager(\n    groupchat=group_chat,\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n)\n```\n\nFinally, we have the Number Agent from before to start a two-agent chat with the Group Chat Manager, which runs the group chat internally and terminates the two-agent chat when the internal group chat is done. Because the Number Agent is selected to speak by us, it counts as the first round of the group chat.\n\n```python\nchat_result = number_agent.initiate_chat(\n    group_chat_manager,\n    message="My number is 3, I want to turn it into 13.",\n    summary_method="reflection_with_llm",\n)\n```\n\n```python\nNumber_Agent (to chat_manager):\n\nMy number is 3, I want to turn it into 13.\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to chat_manager):\n\n6\n\n--------------------------------------------------------------------------------\nAdder_Agent (to chat_manager):\n\n7\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to chat_manager):\n\n14\n\n--------------------------------------------------------------------------------\nSubtracter_Agent (to chat_manager):\n\n13\n\n--------------------------------------------------------------------------------\nNumber_Agent (to chat_manager):\n\n13\n\n--------------------------------------------------------------------------------\n```\n\nYou can see that the Number Agent is selected to speak first, then the Group Chat Manager selects the Multiplier Agent to speak, then the Adder Agent, and so on. The number is operated upon by each agent in the group chat, and the final result is 13.\n\nWe can take a look at the summary of the group chat, provided by the `ChatResult` object returned by the `initiate_chat` method.\n\n```python\nprint(chat_result.summary)\n```\n\n```python\nThe agents cooperatively manipulated the initial number (3) through multipliying,\nadding, and subtracting operations to reach the target number (13).\n```\n\n### Send Introductions\n\nIn the previous example, we set the `description` of the agents to help the Group Chat Manager select the next agent. This only helps the Group Chat Manager, however, does not help the participating agents to know about each other. Sometimes it is useful have each agent introduce themselves to other agents in the group chat. This can be done by setting the `send_introductions=True`.\n\n```python\ngroup_chat_with_introductions = GroupChat(\n    agents=[adder_agent, multiplier_agent, subtracter_agent, divider_agent, number_agent],\n    messages=[],\n    max_round=6,\n    send_introductions=True,\n)\n```\n\nUnder the hood, the Group Chat Manager sends a message containing the agents’ names and descriptions to all agents in the group chat before the group chat starts.\n\n### Constrained Speaker Selection\n\nGroup chat is a powerful conversation pattern, but it can be hard to control if the number of participating agents is large. AutoGen provides a way to constrain the selection of the next speaker by using the `allowed_or_disallowed_speaker_transitions` argument of the `GroupChat` class.\n\nThe `allowed_or_disallowed_speaker_transitions` argument is a dictionary that maps a given agent to a list of agents that can (or cannot) be selected to speak next. The `speaker_transitions_type` argument specifies whether the transitions are allowed or disallowed.\n\nHere is an example:\n\n```python\nallowed_transitions = {\n    number_agent: [adder_agent, number_agent],\n    adder_agent: [multiplier_agent, number_agent],\n    subtracter_agent: [divider_agent, number_agent],\n    multiplier_agent: [subtracter_agent, number_agent],\n    divider_agent: [adder_agent, number_agent],\n}\n```\n\nIn this example, the allowed transitions are specified for each agent. The Number Agent can be followed by the Adder Agent and the Number Agent, the Adder Agent can be followed by the Multiplier Agent and the Number Agent, and so on. Let’s put this into the group chat and see how it works. The `speaker_transitions_type` is set to `allowed` so the transitions are positive constraints.\n\n```python\nconstrained_graph_chat = GroupChat(\n    agents=[adder_agent, multiplier_agent, subtracter_agent, divider_agent, number_agent],\n    allowed_or_disallowed_speaker_transitions=allowed_transitions,\n    speaker_transitions_type="allowed",\n    messages=[],\n    max_round=12,\n    send_introductions=True,\n)\n\nconstrained_group_chat_manager = GroupChatManager(\n    groupchat=constrained_graph_chat,\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n)\n\nchat_result = number_agent.initiate_chat(\n    constrained_group_chat_manager,\n    message="My number is 3, I want to turn it into 10. Once I get to 10, keep it there.",\n    summary_method="reflection_with_llm",\n)\n```\n\n```python\nNumber_Agent (to chat_manager):\n\nMy number is 3, I want to turn it into 10. Once I get to 10, keep it there.\n\n--------------------------------------------------------------------------------\nAdder_Agent (to chat_manager):\n\n4\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to chat_manager):\n\n8\n\n--------------------------------------------------------------------------------\nSubtracter_Agent (to chat_manager):\n\n7\n\n--------------------------------------------------------------------------------\nDivider_Agent (to chat_manager):\n\n3.5\n\n--------------------------------------------------------------------------------\nAdder_Agent (to chat_manager):\n\n4.5\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to chat_manager):\n\n9\n\n--------------------------------------------------------------------------------\nSubtracter_Agent (to chat_manager):\n\n8\n\n--------------------------------------------------------------------------------\nDivider_Agent (to chat_manager):\n\n4\n\n--------------------------------------------------------------------------------\nAdder_Agent (to chat_manager):\n\n5\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to chat_manager):\n\n10\n\n--------------------------------------------------------------------------------\nNumber_Agent (to chat_manager):\n\n10\n\n--------------------------------------------------------------------------------\n```\n\n## Nested Chats\n\nThe previous conversations patterns (two-agent chat, sequential chat, and group chat) are useful for building complex workflows, however, they do not expose a single conversational interface, which is often needed for scenarios like question-answering bots and personal assistants. In some other cases, it is also useful to package a workflow into a single agent for reuse in a larger workflow. AutoGen provides a way to achieve this by using nested chats.\n\nNested chats is powered by the nested chats handler, which is a pluggable component of `ConversableAgent`. The figure below illustrates how the nested chats handler triggers a sequence of nested chats when a message is received.\n\n![image.png](http://localhost:8055/assets/dbf8fd73-ab09-4942-a64a-09590acf1d38)\n\nWhen a message comes in and passes the [**human-in-the-loop component**](https://microsoft.github.io/autogen/0.2/docs/tutorial/human-in-the-loop), the nested chats handler checks if the message should trigger a nested chat based on conditions specified by the user. If the conditions are met, the nested chats handler starts a sequence of nested chats specified using the sequential chats pattern. In each of the nested chats, the sender agent is always the same agent that triggered the nested chats. In the end, the nested chat handler uses the results of the nested chats to produce a response to the original message. By default, the nested chat handler uses the summary of the last chat as the response.\n\nHere is an example of using nested chats to build an arithmetic agent that packages arithmetic operations, code-based validation, and poetry into a single agent. This arithmetic agent takes a number transformation request like “turn number 3 into 13” and returns a poem that describes a transformation attempt.\n\nFirst we define the agents. We reuse the `group_chat_manager_with_intros` from previous example to orchestrate the arithmetic operations.\n\n```python\nimport tempfile\n\ntemp_dir = tempfile.gettempdir()\n\narithmetic_agent = ConversableAgent(\n    name="Arithmetic_Agent",\n    llm_config=False,\n    human_input_mode="ALWAYS",\n    code_execution_config={"use_docker": False, "work_dir": temp_dir},\n)\n\ncode_writer_agent = ConversableAgent(\n    name="Code_Writer_Agent",\n    system_message="You are a code writer. You write Python script in Markdown code blocks.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n\npoetry_agent = ConversableAgent(\n    name="Poetry_Agent",\n    system_message="You are an AI poet.",\n    llm_config={"config_list": [{"model": "gpt-4", "api_key": os.environ["OPENAI_API_KEY"]}]},\n    human_input_mode="NEVER",\n)\n```\n\nNow we define the nested chats using the sequential chat pattern. All the senders are always `artihmetic_agent`.\n\n```python\nnested_chats = [\n    {\n        "recipient": group_chat_manager_with_intros,\n        "summary_method": "reflection_with_llm",\n        "summary_prompt": "Summarize the sequence of operations used to turn " "the source number into target number.",\n    },\n    {\n        "recipient": code_writer_agent,\n        "message": "Write a Python script to verify the arithmetic operations is correct.",\n        "summary_method": "reflection_with_llm",\n    },\n    {\n        "recipient": poetry_agent,\n        "message": "Write a poem about it.",\n        "max_turns": 1,\n        "summary_method": "last_msg",\n    },\n]\n```\n\nNow we register the nested chats handler to the `arithmetic_agent` and set the conditions for triggering the nested chats.\n\n```python\narithmetic_agent.register_nested_chats(\n    nested_chats,\n    trigger=lambda sender: sender not in [group_chat_manager_with_intros, code_writer_agent, poetry_agent],\n)\n```\n\nFinally, we call `generate_reply` to get a response from the `arithmetic_agent` – this will trigger a sequence of nested chats and return the summary of the last nested chat as the response\n\n```python\nreply = arithmetic_agent.generate_reply(\n    messages=[{"role": "user", "content": "I have a number 3 and I want to turn it into 7."}]\n)\n```\n\n````python\n\n>>>>>>>> NO HUMAN INPUT RECEIVED.\n\n>>>>>>>> USING AUTO REPLY...\n\n********************************************************************************\nStart a new chat with the following message: \nI have a number 3 and I want to turn it into 7.\n\nWith the following carryover: \n\n********************************************************************************\nArithmetic_Agent (to chat_manager):\n\nI have a number 3 and I want to turn it into 7.\n\n--------------------------------------------------------------------------------\nAdder_Agent (to chat_manager):\n\nTo give you the result, I'll add 1 to the number you gave me. So your new number is 4.\n\n--------------------------------------------------------------------------------\nMultiplier_Agent (to chat_manager):\n\n8\n\n--------------------------------------------------------------------------------\nSubtracter_Agent (to chat_manager):\n\n7\n\n--------------------------------------------------------------------------------\nNumber_Agent (to chat_manager):\n\n7\n\n--------------------------------------------------------------------------------\nNumber_Agent (to chat_manager):\n\n7\n\n--------------------------------------------------------------------------------\n\n********************************************************************************\nStart a new chat with the following message: \nWrite a Python script to verify the arithmetic operations is correct.\n\nWith the following carryover: \nFirst, 1 was added to the initial number 3 to make it 4. Then it was multiplied by 2\nwhich resulted in 8. Finally, 1 was subtracted from 8 to reach the target number 7.\n\n********************************************************************************\nArithmetic_Agent (to Code_Writer_Agent):\n\nWrite a Python script to verify the arithmetic operations is correct.\nContext: \nFirst, 1 was added to the initial number 3 to make it 4. Then it was multiplied by 2\nwhich resulted in 8. Finally, 1 was subtracted from 8 to reach the target number 7.\n\n--------------------------------------------------------------------------------\nCode_Writer_Agent (to Arithmetic_Agent):\n\nHere is a Python script to verify the aforementioned arithmetic operations:\n\n```python\ninitial_number = 3\n\ninitial_number += 1\nassert initial_number == 4, "The first operation failed!"\n\ninitial_number *= 2\nassert initial_number == 8, "The second operation failed!"\n\ninitial_number -= 1\nassert initial_number == 7, "The final operation failed!"\n\nprint("All operations were carried out successfully!")\n```\nIn the script, the entire process is broken down into steps. The `assert` function is\nused to verify the result at every step. If any of the operations doesn't yield the\nexpected result, an `AssertionError` exception will be raised. If all operations pass,\nthe message "All operations were carried out successfully!" will be printed.\n\n--------------------------------------------------------------------------------\n\n>>>>>>>> NO HUMAN INPUT RECEIVED.\n\n>>>>>>>> USING AUTO REPLY...\n\n>>>>>>>> EXECUTING CODE BLOCK 0 (inferred language is python)...\nArithmetic_Agent (to Code_Writer_Agent):\n\nexitcode: 0 (execution succeeded)\nCode output: \nAll operations were carried out successfully!\n\n--------------------------------------------------------------------------------\nCode_Writer_Agent (to Arithmetic_Agent):\n\nCertainly, that means the python script was successful and every arithmetic operation performed correctly given the initial input and the steps performed.\n\n--------------------------------------------------------------------------------\n\n********************************************************************************\nStart a new chat with the following message: \nWrite a poem about it.\n\nWith the following carryover: \nFirst, 1 was added to the initial number 3 to make it 4. Then it was multiplied by 2 which resulted in 8. Finally, 1 was subtracted from 8 to reach the target number 7.\nThe Python script successfully performed and verified the arithmetic operations on the initial number provided. The steps included adding 1 to the initial number, multiplying the result by 2, and finally subtracting 1. The assert function was used to check the result at each step, and confirmed that all operations were carried out correctly.\n\n********************************************************************************\nArithmetic_Agent (to Poetry_Agent):\n\nWrite a poem about it.\nContext: \nFirst, 1 was added to the initial number 3 to make it 4. Then it was multiplied by 2 which resulted in 8. Finally, 1 was subtracted from 8 to reach the target number 7.\nThe Python script successfully performed and verified the arithmetic operations on the initial number provided. The steps included adding 1 to the initial number, multiplying the result by 2, and finally subtracting 1. The assert function was used to check the result at each step, and confirmed that all operations were carried out correctly.\n\n--------------------------------------------------------------------------------\nPoetry_Agent (to Arithmetic_Agent):\n\nFrom numbers, logic, pure mathematical creation,\nPonder this tale of numeric manipulation.\nIn the universe of Python where operations exist,\nA story of integers and functions persist.\n\nThree was the number from where we began,\nOblivious to the journey and its grandiosely plan.\nAdded with 1, the sum it adorned,\nA sweet quadruple in the dawn was formed.\n\nThe saga continued with a twist of the tale,\nThe four was multiplied, while the winds wail.\nThe duo of four unfolded its wings,\nAn octet presence in our midst it brings.\n\nThen enters subtraction, sly and clever,\nRemoving one to alter the endeavor.\nFrom eight, subtracted one in delight,\nTo finally bask in the glow of seven's light.\n\nEach operation, together they conspired,\nIn this tale of integers, creatively inspired.\nThrough life's equation, the script ran so free,\nAmidst the language of Python, a symphony, you see.\n\nTested with assert, cross-checked the chain,\nConfirming accuracy in program's domain.\nEach move calculated, each step so right,\nIn the maze of coding, found was the light. \n\nSuch is the tale, of numbers and operations, \nA dance among digits, logical iterations,\nJust another day, in this AI poet's life,\nCutting through ambiguity, like a razor-sharp knife.\n\n--------------------------------------------------------------------------------\n````\n\nNested chat is a powerful conversation pattern that allows you to package complex workflows into a single agent. You can hide [**tool usages**](https://microsoft.github.io/autogen/0.2/docs/tutorial/tool-use) within a single agent by having the tool-caller agent starts a nested chat with a tool-executor agent and then use the result of the nested chat to generate a response. \n\n# Conclusion\n\nAutoGen is a powerful and flexible framework for building AI agents and orchestrating multi-agent conversations. Its key features include:\n\n- Easy-to-use API for creating and managing agents\n- Support for various conversation patterns, including group chats and nested chats\n- Integration with LLMs and external tools\n- Human-in-the-loop capabilities\n- Customizable agent behaviors and workflows\n\nBy leveraging AutoGen, developers and researchers can rapidly prototype and deploy complex AI systems that involve multiple agents working together to solve tasks. The framework's versatility makes it suitable for a wide range of applications, from simple chatbots to sophisticated AI assistants and autonomous problem-solving systems.\n\nAs the field of AI continues to evolve, AutoGen provides a solid foundation for exploring and developing new agent-based AI applications, potentially revolutionizing how we interact with and utilize artificial intelligence in various domains.	["#AI"]	7	autogen	6c93c88a-0c10-41a2-9f99-67bb3faca022	What is autogen\nAutoGen is an open-source programming framework for building AI agents and facilitating cooperation among multiple agents to solve tasks. AutoGen aims to provide an easy-to-use and flexible framework for accelerating development and research on agentic AI, like PyTorch for Deep Learning. It offers features such as agents that can converse with other agents, LLM and tool use support, autonomous and human-in-the-loop workflows, and multi-agent conversation patterns.
9	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:28:00.113+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:40:38.538+00	Transformer	# Transformer\n\n## Introduction\n\nTransformer is introduced by "Attention is all you need" (Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Lukasz Kaiser, Illia Polosukhin).\nThe key concepy is only use Attention layer.\nUse Beam Search to predict next words form previous words.\nTransformer is created for language translation task.\n\nExample : \nInput :  This is a pencil\nOutput : Đây là một cái bút chì\n\n![01.png](http://localhost:8055/assets/b00d6511-b94f-4b9a-8372-334dc22f4a52)\n\nBefore Tranformer, we solve sentences generate problem by RNN model (seq-2-seq model)\n\n![02.png](http://localhost:8055/assets/3321b2af-c373-4162-bc0d-bda12737157e)\n\nThe simplest RNN model (translation model)\nThe simplest encoder-decoder model consists of two RNNs (LSTMs): one for the encoder and another for the decoder. Encoder RNN reads the source sentence, and the final state is used as the initial state of the decoder RNN. The hope is that the final encoder state "encodes" all information about the source, and the decoder can generate the target sentence based on this vector.\n![03.png](http://localhost:8055/assets/261fa160-0bf5-434d-83d5-a602ff5e4c30)\n\nRNN model with cross-attention (*Attention help model to focus on right words when translate a new word)\nAttention: At different steps, let a model "focus" on different parts of the input.\nAn attention mechanism is a part of a neural network. At each decoder step, it decides which source parts are more important. In this setting, the encoder does not have to compress the whole source into a single vector - it gives representations for all source tokens (for example, all RNN states instead of the last one).\n![04.png](http://localhost:8055/assets/c63d2fd8-e963-4918-9e73-aaeb05056489)\n\n## Transformer Architect\n\nBelow is the architect of Transformer. \nKey concept is Multihead Attention \nTransformer devided to 2 part: encoder (which supporting for output semantic meaning of sentences) and decoder (which is supporting to generate new sentences). BERT model is using encoder part, and GPT or other LLM is using decoer part of \n\n![05.png](http://localhost:8055/assets/414f5746-b45b-487f-983a-e41048711c72)\n\n### Word Embedding\n\n![06.png](http://localhost:8055/assets/5956c93d-1f27-4a27-897d-c4b77cedd78e)\n\n![07.png](http://localhost:8055/assets/68cb4850-8ee3-47e5-bdb2-974f9e7e552b)\n\n![08.png](http://localhost:8055/assets/152d2b34-895d-4220-8ace-6ea1c4fd02a9)\n\n![09.png](http://localhost:8055/assets/9ed65d38-59a8-4503-9558-9f8fcfbca645)\n\n### Positional Encoding\n\nIf we do not use Positional Encoding the 2 below sentences will be the same \n\nExample:\nThe cute cat is so fat\nThe fat cat is so cute\n\nPositional encodings are a clever solution to convey the position of words within a sequence to the Transformer model. Instead of relying solely on the sequential order of the words, these encodings are generated using a combination of sine and cosine functions.\n\nFormula of positional encoding\n![010.png](http://localhost:8055/assets/dd8a10d3-ad33-4e61-984b-1d0c92c9270f)\n\nHow positional encoding embedding and word embedding combine\n![11.png](http://localhost:8055/assets/bd8a77a3-c30b-43d2-9316-b1724901131b)\n\n*Why Add Instead of Concatenate?\n<em>1. Semantic Preservation: Word embeddings (WE) are responsible for encapsulating the semantic meaning of words. By adding positional embeddings to word embeddings rather than concatenating them, we ensure that the essence of the word’s meaning remains unadulterated. Concatenation could blur semantic clarity by intertwining position-related information with semantic content.\n2. Positional Insight: Positional embeddings (PE) weave the narrative of word order into the model’s understanding. They convey information about the position of a word within the sequence. Adding them enriches the word embeddings with the contextual understanding of the sequence’s structure.</em>\n\n### Multi-Head Attention\n\nMulti-Head Attention formular\n![12.png](http://localhost:8055/assets/f51e78ac-031f-4b7b-bbf0-9843cadc1568)\n\nWTF!! We can not understand \nLet see an example\n\nExample:\n- American shrew mole\n- One mole of carbon dioxide\n- Take a biopsy of the mole\n\nWord "mole" have different meaning (vector) when it in other sentences\n![13.png](http://localhost:8055/assets/d18c93d9-b82b-4c54-98f5-f5f4389d3e02)\n\nLet check another example. COnsider below sentence\n"A fluffy blue creature roamed the verdant forest"\n![14.png](http://localhost:8055/assets/266a25b3-1a5d-4011-8b69-3e419dc00505)\n\nThe meaning (vector) of the noun "creature" and "verdant" will change when it is appear in this sentence\n![15.png](http://localhost:8055/assets/866c9211-1e48-4029-93eb-800918a7e5c0)\n\nBut how,\nIt is start by asking an question "Any adjectives in front of me?"\nIt create a Query by mutiple "" word vector with Wq (a matrix) to make Qn\n![15.png](http://localhost:8055/assets/61dcade2-348c-4405-9441-9af26eddacc2)\n\nBy mutipling with Wq the word "Creature" can map from Embedding space to Query/Key space (only 128 dimensions)\n![15.png](http://localhost:8055/assets/34e21eef-e3ad-472d-a501-60c0e7364dbc)\n\nWith a question, we can receive some answers by mutiple word vector with Wk (a matrix) to make Kn (the Key)\n![15.png](http://localhost:8055/assets/f60725b3-90f7-4651-ab4e-daf129abb320)\n\nSame with Query, by mutipling with Wq the word "Fluffy", "Blue" can map from Embedding space to Query/Key space (only 128 dimensions)\nIn the Query/Key space query and key of words come closer\n![15.png](http://localhost:8055/assets/e9603e4c-f49a-40bb-9b31-2c60b4e04687)\n\nWe take the dot product of all pair of Query and Key in our sentence.\n![15.png](http://localhost:8055/assets/d72f3244-a8a6-46f5-9ea8-191b8092cdaa)\n\n![15.png](http://localhost:8055/assets/9b93d300-483d-4db8-b91a-4a34365197be)\n\nFinally, we want the Value vector to find the correct meaning (vector) of "Creature"\nso we multiple word "fluffy" with Wv to male Value vector\n![15.png](http://localhost:8055/assets/7718742e-d14d-4fdf-9d1e-a1510bf9644b)\n\n![15.png](http://localhost:8055/assets/3fbfda23-2926-48ee-9904-e8ff3f956e90)\n\nMulti-head attention is many layers of single head attention\n![15.png](http://localhost:8055/assets/37f19ceb-5af4-4186-a96f-cb8c298950a0)\n\n### Softmax\n\nSoftmax comes into play in various machine learning tasks, particularly those involving multi-class classification.\nIt gives the probability distribution of multiple classes, making the decision-making process straightforward and effective.\nThe Softmax function is a wonderful tool used predominantly in the field of machine learning and deep learning for converting a vector of numbers into a vector of probabilities.\n\n![15.png](http://localhost:8055/assets/22ecbe0e-8055-4466-93ba-3a1d8a35b8b2)\n\n\n## Calculate parameter of GPT3\n\nBelow is the parameter calculate in GPT3.\nOnly 57B parameters come from Multi-head Attention\nAlmost other parameters come from FeedForward Layer\n\n![15.png](http://localhost:8055/assets/37e9c23f-5f1c-48e4-ae0c-5b114c6734e4)\n\n## Conclusion\n\nOnly by learning from words next to, Tranformer model can understand the structure of sentences and further it can understand the context of the sentences used for training.\nBy adding more parameters to the model, and optimize model training and inference process. Tranformer have a high potential to help human creating AGI in future.\nSome strong points of Transformer:\n- Can process multyple worls parallel\n- Can learn from non-labled data\n- Can understand meaning of long text (which is the weak point of RNN)\n\n## Additional Resources\n\n- [Attention is All you need](https://arxiv.org/abs/1706.03762)\n- [Wikidocs.net](https://wikidocs.net/166649)\n- [3Blue1Brown youtube video](https://www.youtube.com/watch?v=eMlx5fFNoYc&t=152s)\n- [Medium : Demystifying Transformer Architecture: The Magic of Positional Encoding](https://medium.com/@waelrashwan/demystifying-transformer-architecture-the-magic-of-positional-encoding-5fe8154d4a64#:~:text=1.,the%20word's%20meaning%20remains%20unadulterated.)\n\n\n## About the Author\n\nNguyen Quang Huy \nWithout dreams to chase, life becomes mundane.	["#AI"]	6	transformer	911e7d64-2c9a-451c-8c24-4c4b2ca24e24	Transformer is introduced by "Attention is all you need" (Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Lukasz Kaiser, Illia Polosukhin).The key concepy is only use Attention layerUse Beam Search to predict next words form previous wordsTransformer is created for language translation task.
10	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:32:05.721+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:41:32.291+00	A Step-by-Step Guide to Building and Structuring CI/CD for Success	## Introduction\n\nIn this blog post, we will explore the essential steps to building and structuring a CI/CD pipeline. Whether you're starting from scratch or refining an existing pipeline, this guide will provide a comprehensive walkthrough to ensure your CI/CD process is both effective and scalable.\n![Pipeline Structure](http://localhost:8055/assets/464513bf-e16e-4155-98b2-d7049da29dd5)\n\n## Key Concepts\n\nBefore diving into the implementation, let's first understand some key concepts that form the foundation of CI/CD.\n\n### What is CI/CD?\n\nContinuous Integration (CI) and Continuous Deployment (CD) are practices that enable teams to deliver code changes more frequently and reliably. CI involves automating the integration of code changes, while CD focuses on the automation of releasing those changes to production.\n\n### Why CI/CD Matters\n\nImplementing CI/CD offers several benefits, including faster release cycles, improved code quality, and reduced deployment risks. It allows teams to focus on writing code and innovation rather than manual integration and deployment processes.\n\n## Implementation\n\nThis section will provide a step-by-step guide to setting up, structuring, and building a CI/CD pipeline from scratch.\n\n### Setting Up Your Environment\n\nBegin by setting up the necessary tools and environment. This includes choosing a version control system (e.g., Git), selecting a CI/CD platform (e.g., Jenkins, GitHub Actions), and ensuring you have a clean and organized project structure.\n\n```bash\n# Example command to initialize a Git repository\ngit init\n```\n\n### Structuring Your CI/CD Pipeline\n\nProperly structuring your pipeline is crucial for maintainability and scalability. A well-structured CI/CD pipeline should include stages for building, testing, and deploying your application.\n\n### Building the CI/CD Pipeline\n\nNow, let’s build the CI/CD pipeline step by step, focusing on both Continuous Integration and Continuous Deployment.\n\n#### Continuous Integration\nIn this stage, we'll configure the pipeline to automatically build and test your code with every commit. This ensures that any integration issues are identified early.\n\n```yaml\n# Example CI configuration\nstages:\n  - setup\n  - test\n  - build\n\n# Step 1: Setup Stage\nsetup:\n  stage: setup\n  image: python:3.9\n  script:\n    - echo "Installing dependencies..."\n    - pip install -r requirements.txt\n  artifacts:\n    paths:\n      - .venv/\n    cache:\n      key: ${CI_COMMIT_REF_SLUG}\n      paths:\n        - .venv/\n\n# Step 2: Test Stage\ntest:\n  stage: test\n  image: python:3.9\n  script:\n    - echo "Running tests..."\n    - pytest --junitxml=test-reports/report.xml\n  artifacts:\n    reports:\n      junit: test-reports/report.xml\n    paths:\n      - test-reports/\n  cache:\n    key: ${CI_COMMIT_REF_SLUG}\n    paths:\n      - .venv/\n      - test-reports/\n\n# Step 3: Build Stage\nbuild:\n  stage: build\n  image: python:3.9\n  script:\n    - echo "Building the application..."\n    - python setup.py sdist bdist_wheel\n  artifacts:\n    paths:\n      - dist/\n    expire_in: 1 week\n  cache:\n    key: ${CI_COMMIT_REF_SLUG}\n    paths:\n      - .venv/\n      - dist/\n\n```\n\n#### Continuous Deployment\nOnce the code passes all tests, it can be automatically deployed to the production environment. We’ll set up the pipeline to handle this deployment smoothly and securely.\n\n```yaml\nstages:\n  - deploy\n\n# Step 1: Deployment Stage\ndeploy:\n  stage: deploy\n  image: mcr.microsoft.com/azure-cli:latest\n  before_script:\n    - echo "Logging into Azure..."\n    - az login --service-principal -u $AZURE_CLIENT_ID \n    -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID\n    - az account set --subscription $AZURE_SUBSCRIPTION_ID\n  script:\n    - echo "Deploying the application to Azure..."\n    - az webapp up --name $AZURE_WEBAPP_NAME \n    --resource-group $AZURE_RESOURCE_GROUP \n    --plan $AZURE_APP_SERVICE_PLAN\n    - echo "Updating environment settings..."\n    - az webapp config appsettings set \n    --resource-group $AZURE_RESOURCE_GROUP\n    --name $AZURE_WEBAPP_NAME \n    --settings ENVIRONMENT=Production\n    - echo "Restarting the web app to apply changes..."\n    - az webapp restart --name $AZURE_WEBAPP_NAME \n    --resource-group $AZURE_RESOURCE_GROUP\n  environment:\n    name: production\n    url: https://$AZURE_WEBAPP_NAME.azurewebsites.net\n  only:\n    - main\n  when: on_success\n  artifacts:\n    paths:\n      - deploy-reports/\n    expire_in: 1 week\n\n```\n\n### Testing and Monitoring\nTesting and monitoring are critical components of a CI/CD pipeline that ensure the reliability, stability, and performance of your application. Implementing automated tests helps catch issues before they reach production, while continuous monitoring allows you to maintain the health of your application in a live environment.\n#### Testing \nAutomated testing is essential for verifying that your code changes do not introduce bugs or break existing functionality. Here are some key types of tests you should include in your CI/CD pipeline:\n1. **Unit Tests**: Automated testing is essential for verifying that your code changes do not introduce bugs or break existing functionality. Here are some key types of tests you should include in your CI/CD pipeline:\n\n    Example:\n    ```python\n    def test_addition():\n    assert add(2, 3) == 5\n    ```\n    In a CI/CD pipeline, unit tests can be executed automatically after the build stage using a testing framework like pytest for Python:\n    ```yaml\n    test:\n        stage: test\n        image: python:3.9\n        script:\n          - echo "Running unit tests..."\n          - pytest --junitxml=test-reports/report.xml\n        artifacts:\n          reports:\n            junit: test-reports/report.xml\n          paths:\n            - test-reports/\n    ```\n2. **Unit Tests**: Ensure that different parts of the application work together correctly.\n\n    Example:\n    ```python\n    def test_api_integration():\n    response = requests.get("https://api.example.com/data")\n    assert response.status_code == 200\n    ```\n    Integration tests can be added to your pipeline after unit tests:\n    ```yaml\n    integration_test:\n        stage: test\n        image: python:3.9\n        script:\n          - echo "Running integration tests..."\n          - pytest --junitxml=integration-test-reports/report.xml\n        artifacts:\n          reports:\n            junit: integration-test-reports/report.xml\n          paths:\n            - integration-test-reports/\n    ```\n\n#### Monitoring \nMonitoring your application in production is crucial for ensuring its continued performance and availability. There are several aspects to consider:\n\n1. **Application Performance Monitoring (APM)**: Tools like Azure Application Insights, New Relic, or Datadog can monitor the performance of your application, track response times, and detect bottlenecks.\n\n    Example using Azure Application Insights:\n\n    - **Setup**: Add Application Insights to your Azure Web App via the Azure Portal or using the Azure CLI:\n        ```bash\n        az webapp config appsettings set \n        --resource-group $AZURE_RESOURCE_GROUP \n        --name $AZURE_WEBAPP_NAME \n        --settings APPINSIGHTS_INSTRUMENTATIONKEY=$APPINSIGHTS_KEY\n        ```\n    - **Monitoring**: Configure alerts for response time thresholds, error rates, and other key metrics.\n\n2. **Logging**: Implement centralized logging to capture and analyze logs from your application. Azure Monitor Logs can be used for this purpose.\n\n    Example using Azure Monitor:\n\n    - **Setup**: Configure Azure Monitor to collect logs from your application and create log queries to filter and analyze data.\n        ```bash\n        az monitor log-analytics workspace create \n        --resource-group $AZURE_RESOURCE_GROUP \n        --workspace-name $LOG_ANALYTICS_WORKSPACE_NAME\n        ```\n    - **Monitoring**: Set up alerts based on specific log events, such as critical errors or application crashes.\n\n3. **Health Checks**: Regularly check the health of your application by pinging endpoints or using Azure's built-in health checks.\n\n    Example using Azure Traffic Manager for health checks:\n\n    - **Setup**: Configure health probes in Azure Traffic Manager to periodically check the health of your web app.\n        ```bash\n        az network traffic-manager profile create \n        --name $TRAFFIC_MANAGER_PROFILE \n        --resource-group $AZURE_RESOURCE_GROUP --routing-method Performance \n        --unique-dns-name $UNIQUE_DNS_NAME --monitor-path "/" \n        --monitor-protocol HTTP\n        ```\n    - **Monitoring**: Azure Traffic Manager will automatically reroute traffic if a health check fails, ensuring high availability.\n\n**Example Pipeline with Testing and Monitoring**\n\nHere’s how you might include testing and monitoring in your CI/CD pipeline:\n\n```yaml\nstages:\n  - setup\n  - test\n  - build\n  - deploy\n  - monitor\n\n# Testing Stage\ntest:\n  stage: test\n  image: python:3.9\n  script:\n    - echo "Running all tests..."\n    - pytest --junitxml=reports/unit-test-report.xml\n    - pytest --junitxml=reports/integration-test-report.xml\n    - pytest --junitxml=reports/e2e-test-report.xml\n  artifacts:\n    reports:\n      junit: reports/*.xml\n    paths:\n      - reports/\n\n# Deployment Stage\ndeploy:\n  stage: deploy\n  image: mcr.microsoft.com/azure-cli:latest\n  script:\n    - echo "Deploying the application to Azure..."\n    - az webapp up --name $AZURE_WEBAPP_NAME \n    --resource-group $AZURE_RESOURCE_GROUP --plan \n    $AZURE_APP_SERVICE_PLAN\n  environment:\n    name: production\n    url: https://$AZURE_WEBAPP_NAME.azurewebsites.net\n\n# Monitoring Stage\nmonitor:\n  stage: monitor\n  script:\n    - echo "Setting up monitoring..."\n    - az monitor log-analytics workspace create\n     --resource-group $AZURE_RESOURCE_GROUP \n     --workspace-name $LOG_ANALYTICS_WORKSPACE_NAME\n    - echo "Monitoring setup completed."\n```\n## Conclusion\nIn this post, we've walked through the process of building and structuring a CI/CD pipeline from scratch. By following these steps, you can achieve faster and more reliable software delivery. As you continue to refine your CI/CD processes, you'll see improvements in efficiency, code quality, and overall project success.\n\n## References\n\n- **[Azure DevOps Documentation](https://docs.microsoft.com/en-us/azure/devops/?view=azure-devops)**  \n  Comprehensive guide to using Azure DevOps for CI/CD, including pipelines, testing, and deployment.\n\n- **[GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)**  \n  Detailed documentation on setting up and managing CI/CD pipelines with GitLab.\n\n- **[Jenkins Documentation](https://www.jenkins.io/doc/)**  \n  Jenkins is an open-source automation server that provides hundreds of plugins to support building, deploying, and automating any project.\n\n- **[Continuous Integration and Continuous Delivery with GitHub Actions](https://docs.github.com/en/actions)**  \n  Learn how to automate your software workflows, including CI/CD, with GitHub Actions.\n\n- **[Azure Monitor Documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/overview)**  \n  A complete guide to setting up monitoring and alerting for Azure resources.\n\n- **[Azure Application Insights Documentation](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)**  \n  Learn how to monitor the performance and usage of your applications with Azure Application Insights.\n\n- **[Best Practices for Building CI/CD Pipelines](https://cloud.google.com/architecture/best-practices-ci-cd)**  \n  An in-depth look at best practices for implementing CI/CD pipelines across various platforms.\n\n	["#Azure"]	5	a-step-by-step-guide-to-building-and-structuring-ci-cd-for-success	fd24f589-292b-4769-9606-919c8a6c653e	In this blog post, we will explore the essential steps to building and structuring a CI/CD pipeline. Whether you're starting from scratch or refining an existing pipeline, this guide will provide a comprehensive walkthrough to ensure your CI/CD process is both effective and scalable.
11	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:39:53.771+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 04:41:53.682+00	Azure Data Factory	To stay competitive, businesses must seamlessly move,\ntransform, and manage data across various platforms. Azure Data Factory (ADF)\nis a robust cloud-based data integration service designed to meet these needs.\nADF enables you to create, schedule, and orchestrate data workflows at scale,\nsimplifying the process of extracting, transforming, and loading (ETL) data.\nThis guide offers an overview of ADF, detailing its key features and core\nconcepts, as well as providing a step-by-step guide on how to get started with\nADF in Azure.\n\n![1723713763120](http://localhost:8055/assets/a6487afe-d08b-474f-86e5-7468a8a55117)\n\n## Key Features of Azure Data Factory\n\n### Data Movement\n\nADF facilitates the seamless transfer of data across a wide range of supported data stores, whether they are cloud-based or on-premises. It offers a high-performance, secure, and reliable solution for data transfer.\n\n### Data Transformation\n\nADF enables you to execute complex data transformations through data flow activities within ADF or by utilising existing compute services such as Azure Databricks, Azure HDInsight, and Azure SQL Database.\n\n### Orchestration and Monitoring\n\nADF allows for the creation of complex workflows by chaining together data transformation activities. It provides comprehensive monitoring capabilities that enable you to visualise the progress of your data processing pipelines and diagnose issues effectively.\n\n### Integration with Other Azure Services\n\nADF integrates seamlessly with various Azure services, including Azure Storage, Azure SQL Database, Azure Synapse Analytics, and more. This tight integration simplifies end-to-end data processing workflows.\n\n### Flexible Scheduling\n\nYou can schedule your pipelines to run at specified times or trigger them based on events. This flexibility ensures that your data processing occurs at the right time and under the right conditions.\n\n## Key Concepts of Azure Data Factory\n\n* **Pipeline:** A pipeline is a logical grouping of activities that work together to perform a task. It helps manage the sequence and dependencies of various data processing steps. Think of a pipeline as a workflow that outlines how data moves and is processed from source to destination.\n* **Pipeline:** Activity: An activity is a single step within a pipeline. It can involve data movement, data transformation, or control actions. Examples include copying data from one location to another, transforming data using a mapping data flow, or running a stored procedure in a SQL database.\n* **Pipeline:** Dataset: A dataset represents the data structure within a data store. It defines the schema and location of the data you want to work with. Datasets are used in activities to specify input and output data.\n* **Pipeline:** Linked Service: A linked service provides the connection information needed for ADF to connect to external resources. It is similar to a connection string and can include credentials and other configuration details required to access data stores and compute resources.\n* **Pipeline:** Integration Runtime :The integration runtime (IR) is the compute infrastructure that ADF uses for data movement and dispatch activities. There are three types of integration runtimes: Azure IR, Self-hosted IR, and SSIS IR. Azure IR is fully managed and provides elastic scaling. Self-hosted IR allows connection to on-premises data sources. SSIS IR lets you run SSIS packages in a managed environment.\n* **Pipeline:** Trigger: A trigger defines when a pipeline execution is initiated. Triggers can be time-based (scheduled), fixed-size non-overlapping time intervals (tumbling window), or event-based, allowing pipelines to run at specific intervals or in response to events.\n* **Pipeline:** Parameters: Parameters pass external values into pipelines, datasets, linked services, and other ADF entities at runtime, allowing dynamic control over the behavior of pipelines and activities based on input values.\n* **Pipeline:** Variables: Variables store values within pipelines that can change during execution, providing a way to maintain state and pass information between activities.\n\n## Getting Started with Azure Data Factory\n\nCreating an Azure Data Factory involves several steps. Here’s a guide to get you started:\n\n### Step 1: Sign in to Azure\n1. Navigate to the Azure Portal.\n2. Sign in with your Azure account credentials. \n### Step 2: Create a New Data Factory \n1.\tIn the Azure portal, click on "Create a resource" in the upper left corner. \n2.\tIn the search box, type "Data Factory" and select it from the drop-down list. \n3.\tClick "Create." \n### Step 3: Configure the Data Factory \n1.\tOn the "Create Data Factory" page, provide the necessary details: \n2.\tSubscription: Select your Azure subscription. \n3.\tResource Group: Create a new resource group or select an existing one. \n4.\tRegion: Choose the Azure region for your Data Factory. \n5.\tName: Enter a unique name for your Data Factory. \n6.\tClick "Next: Git configuration." \n### Step 4: Configure Git Integration (Optional) \n1.\tIf you want to configure Git integration for version control, fill in the required details. Otherwise, skip this step by clicking "Next: Networking." \n### Step 5: Configure Networking \n1.\tOn the Networking tab, configure the networking settings if needed. Leave the default settings if you're unsure. \n2.\tClick "Next: Tags." \n### Step 6: Add Tags (Optional) \n1.\tTags are optional but can help organize your resources. Add any necessary tags. \n2.\tClick "Next: Review + create." \n### Step 7: Review and Create \n1.\tReview the settings you configured for your Data Factory. \n2.\tClick "Create" to provision the Data Factory. \n### Step 8: Access Your Data Factory \n1.\tOnce deployment is complete, navigate to the Resource Group where you created the Data Factory. \n2.\tClick on the Data Factory resource to open its dashboard. \n3.\tStart creating pipelines, datasets, linked services, and other components within your Data Factory. \n\n## Conclusion \nAzure Data Factory is a powerful tool for managing data workflows and integrating various data sources and destinations. Its rich feature set and flexible architecture make it an ideal choice for developers aiming to build scalable, reliable, and maintainable data processing solutions. By understanding the key concepts, you can effectively leverage ADF's capabilities to meet your data integration needs. 	\N	11	azure-data-factory	466b63d5-d046-4e65-9d09-67f652c6658f	To stay competitive, businesses must seamlessly move, transform, and manage data across various platforms. Azure Data Factory (ADF) is a robust cloud-based data integration service designed to meet these needs. ADF enables you to create, schedule, and orchestrate data workflows at scale, simplifying the process of extracting, transforming, and loading (ETL) data. This guide offers an overview of ADF, detailing its key features and core concepts, as well as providing a step-by-step guide on how to get started with ADF in Azure.
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, title, address, tel, email) FROM stdin;
1	Data Impact	Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	0976887530	HR@dataimpact.vn
\.


--
-- Data for Name: companies_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies_links (id, companies_id, links_id) FROM stdin;
1	1	10
2	1	11
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
49d9bbb0-0dce-4533-841a-59e9c228dc9a	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
2ecd2177-e8e3-478d-9ff2-ce4ec68db886	09f4ed23-891e-4672-ac58-0b54f4dfc69c	\N	bc75fb1b-af29-4ba4-8f8a-7d4c9261595d	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 05:00:35.368+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
1709	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.018+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	7701551a-80b0-48b4-9da7-bc7cea8bdec2	\N	http://localhost:8055
1710	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.021+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	ad58e314-2deb-4a69-85e5-7ea63e043691	\N	http://localhost:8055
1711	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.051+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d34afa1b-9431-4df0-8cb7-5e0e2a3621ed	\N	http://localhost:8055
1712	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.062+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9f75622f-5815-4986-909a-0d8af58bf7c0	\N	http://localhost:8055
1713	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.084+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4163551b-371b-4256-888f-c9e2924988a0	\N	http://localhost:8055
1714	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.085+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d83dcde1-2f9f-490b-b7b8-50c6353413bb	\N	http://localhost:8055
1715	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.936+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	de92ea69-8230-4b99-9ec6-3739df6effe1	\N	http://localhost:8055
1716	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.937+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a05da9d6-6101-43c8-9061-d8f80f1f30e7	\N	http://localhost:8055
1717	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.948+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	ad0a3b86-7ad6-4aa4-8691-ef2134df633b	\N	http://localhost:8055
1718	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.949+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	26814cd7-0381-4003-8c40-09b312834e74	\N	http://localhost:8055
1719	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.619+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d4627602-e266-454f-bfec-e50ce12d4e64	\N	http://localhost:8055
1720	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.63+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	549ce2e3-03f3-4621-98e4-14ce619ef01c	\N	http://localhost:8055
1721	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.648+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0f6d3f6c-d00b-460d-9ad1-dd419285b3d6	\N	http://localhost:8055
1722	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fcdb1c97-a2bc-4109-ab77-649037a19f0e	\N	http://localhost:8055
1723	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:17:25.283+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	5400aa1d-4303-49a5-971c-4db4ac2ce952	\N	http://localhost:8055
1724	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.32+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	2c9ae88d-dde2-4066-a352-491ec71dd805	\N	http://localhost:8055
1725	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.335+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	388720df-d81f-4887-a19c-29dcf1c3d7db	\N	http://localhost:8055
1726	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.369+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6b21841e-3b5a-4aed-9139-a50a5e716b76	\N	http://localhost:8055
1727	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.385+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	873ceb2a-72f4-4da6-b4a9-0a9dc978f046	\N	http://localhost:8055
1728	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.394+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b3f5281a-a99e-4814-8bc2-65c9a9027343	\N	http://localhost:8055
1729	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.4+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b1815bb8-6c29-4537-bc7f-790901d29b67	\N	http://localhost:8055
1730	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:16.602+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6c1634f5-1a38-413f-b838-ced9c6202235	\N	http://localhost:8055
1731	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.854+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	2c9ae88d-dde2-4066-a352-491ec71dd805	\N	http://localhost:8055
1732	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.855+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	388720df-d81f-4887-a19c-29dcf1c3d7db	\N	http://localhost:8055
1733	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.856+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6b21841e-3b5a-4aed-9139-a50a5e716b76	\N	http://localhost:8055
1734	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.857+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6c1634f5-1a38-413f-b838-ced9c6202235	\N	http://localhost:8055
1735	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.857+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	873ceb2a-72f4-4da6-b4a9-0a9dc978f046	\N	http://localhost:8055
1736	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.858+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b1815bb8-6c29-4537-bc7f-790901d29b67	\N	http://localhost:8055
2049	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:24:09.852+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
1737	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.859+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b3f5281a-a99e-4814-8bc2-65c9a9027343	\N	http://localhost:8055
1741	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.694+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9bd5e5b3-df48-4356-9951-a3f624eb4042	\N	http://localhost:8055
1746	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:08.092+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a0d21d1c-54ff-45e7-984f-591b8ae9be63	\N	http://localhost:8055
1749	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.483+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fbefceae-bb19-44cc-aa2b-7e176277639a	\N	http://localhost:8055
1738	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	7716cc3f-8c21-47ff-ac5f-ad7d2b864718	\N	http://localhost:8055
1739	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.667+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b25ba673-e5e1-4187-beec-ba8a3cfc76c7	\N	http://localhost:8055
1740	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.679+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	95a37fc0-645d-4d5e-8349-e727784abc24	\N	http://localhost:8055
1742	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.715+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0554f909-08d6-4fa1-8194-3dcb2d0fb2c7	\N	http://localhost:8055
1750	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.493+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	08f0dc33-94b4-4c53-8c98-e5adb3954a44	\N	http://localhost:8055
1751	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.513+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3a3ab399-08aa-47df-9740-96ba1319c000	\N	http://localhost:8055
1752	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.521+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c7d84063-d35e-4369-be6e-2c4c488e13ea	\N	http://localhost:8055
1753	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.831+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	15331689-8d96-46c4-8f5f-20ab35f8adb1	\N	http://localhost:8055
1755	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.877+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	29df87d8-1ac1-4386-b814-ffa951aa5bca	\N	http://localhost:8055
1756	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.294+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	2d280990-e1ac-4c49-9c59-73a439541ec8	\N	http://localhost:8055
1757	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.305+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	80b3a5b9-5051-498e-9d7a-a651226b6b04	\N	http://localhost:8055
1759	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.335+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a3aa6e44-9ada-4950-be23-88143059ecc6	\N	http://localhost:8055
1760	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.355+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	965b9bf2-a506-44a2-a04e-23f7d621b6ef	\N	http://localhost:8055
1764	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:33.049+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	61e1014d-d557-415c-848b-57c93d6c3107	\N	http://localhost:8055
1768	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:33.09+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3984281c-1bdd-490a-9f0a-c0d22b1e9d4d	\N	http://localhost:8055
1743	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.718+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d617e2d3-d26f-4562-b0c3-46e5bc068016	\N	http://localhost:8055
1744	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:08.04+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	be53a4c4-098a-45ea-91db-b6ae2669564a	\N	http://localhost:8055
1745	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:08.041+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f9f5e6bc-cfd0-4e48-b493-a0c307891ec1	\N	http://localhost:8055
1747	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.437+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b05090ee-719d-4d8a-9256-d6975a0ad377	\N	http://localhost:8055
1748	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.462+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	58a7a9de-2217-427c-b371-5201f5901778	\N	http://localhost:8055
1754	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.863+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0	\N	http://localhost:8055
1758	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.318+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fc99029a-d177-4d2b-b87e-0052c6bf00d9	\N	http://localhost:8055
1761	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.364+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	70226b1b-320c-4635-8701-ec36629ee48d	\N	http://localhost:8055
1762	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.635+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4d745ef1-47c9-4a7a-be10-fdd3538fbcb7	\N	http://localhost:8055
1763	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:33.034+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e2d61f86-ffb9-47ad-a944-653121e6f024	\N	http://localhost:8055
2656	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:19:16.368+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
1765	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:33.061+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f7fd38cc-e4ee-4bcc-9c7a-6d8c6e6d8b95	\N	http://localhost:8055
1766	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:33.072+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	8fc15695-313c-4fb4-b4e4-7e36692da213	\N	http://localhost:8055
1767	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:33.082+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6c863c97-67fe-43ba-bc89-99e946ab0aae	\N	http://localhost:8055
1769	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:25:27.737+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	1	\N	http://localhost:8055
1770	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:25:37.131+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	2	\N	http://localhost:8055
1771	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:25:45.836+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	3	\N	http://localhost:8055
1772	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:25:52.709+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	4	\N	http://localhost:8055
1773	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:26:01.34+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	5	\N	http://localhost:8055
1774	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:26:10.309+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	6	\N	http://localhost:8055
1775	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:26:16.428+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	7	\N	http://localhost:8055
1776	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:26:24.024+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	8	\N	http://localhost:8055
1777	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:26:35.262+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	9	\N	http://localhost:8055
1778	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:26:43.083+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	10	\N	http://localhost:8055
1779	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:27:11.534+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	1	\N	http://localhost:8055
1780	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:27:22.214+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	2	\N	http://localhost:8055
1781	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:27:27.949+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	3	\N	http://localhost:8055
1782	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:38:58.659+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
1783	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:39:39.222+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_roles	8f2d67e8-d0e2-40ef-bff0-d93b8ac59e42	\N	http://localhost:8055
1784	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:39:41.999+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_roles	0caa6e4e-0f93-4ce7-a444-8576f592cc5d	\N	http://localhost:8055
1785	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:39:44.798+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_roles	f91c7ac8-5e2e-4b1f-a233-9d6463f777f2	\N	http://localhost:8055
1786	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:39:48.025+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_roles	05124e9f-0e84-4b6f-895c-483485089291	\N	http://localhost:8055
1787	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:39:51.213+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_roles	724f63ad-85cb-4e9e-958f-077da6caf91c	\N	http://localhost:8055
1788	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:39:54.135+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_roles	5f9f9080-ebdb-42ad-89b1-7b0b005ef066	\N	http://localhost:8055
1789	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:40:06.654+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	7	\N	http://localhost:8055
1790	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:40:17.032+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	9	\N	http://localhost:8055
1791	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:40:28.535+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	8	\N	http://localhost:8055
1792	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 06:40:37.972+00	172.20.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	10	\N	http://localhost:8055
1793	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 07:44:20.451+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
1794	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 07:50:31.001+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	218	\N	http://localhost:8055
1795	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:04:33.554+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_news	5	\N	http://localhost:8055
1796	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:06:52.264+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	218	\N	http://localhost:8055
1797	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:07:36.054+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	218	\N	http://localhost:8055
1798	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.25+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	236	\N	http://localhost:8055
1799	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.256+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	237	\N	http://localhost:8055
1800	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.266+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	238	\N	http://localhost:8055
1801	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.272+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	239	\N	http://localhost:8055
1802	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.275+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	240	\N	http://localhost:8055
1803	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.278+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	241	\N	http://localhost:8055
1804	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:26.283+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	\N	http://localhost:8055
1805	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:11:53.585+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	242	\N	http://localhost:8055
1806	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:12:06.623+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	242	\N	http://localhost:8055
1809	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:21:35.236+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1e874b8a-04b6-4b9c-a5ba-749c38d8a004	\N	http://localhost:8055
1808	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:21:35.237+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3e2bd5e5-09da-4abd-89a4-ef410f87185b	\N	http://localhost:8055
1810	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:21:35.242+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	cfa88e35-2afb-4fd8-ab88-f3033b908f6e	\N	http://localhost:8055
1811	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.13+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	8d4ca320-cfdf-4005-a385-a2777b942890	\N	http://localhost:8055
1812	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.162+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d126a2a6-2b09-452a-9f3d-0a2491a1dbad	\N	http://localhost:8055
1813	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.204+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	118c67f9-a60f-4a62-bacc-b4700658d37a	\N	http://localhost:8055
1814	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.22+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	8cbce33a-dfcc-44cc-bee4-4479b488f307	\N	http://localhost:8055
1815	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.236+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e49bc8e4-b8f9-4517-b8d0-8c1d60aea537	\N	http://localhost:8055
1816	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.24+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3786ea60-385b-4738-a83e-dced7be6559b	\N	http://localhost:8055
1817	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:10.941+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6c863c97-67fe-43ba-bc89-99e946ab0aae	\N	http://localhost:8055
1818	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:10.943+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3984281c-1bdd-490a-9f0a-c0d22b1e9d4d	\N	http://localhost:8055
1819	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:10.943+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	8fc15695-313c-4fb4-b4e4-7e36692da213	\N	http://localhost:8055
1820	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.216+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0525446c-a58a-44f0-8cc9-d26fc03f96af	\N	http://localhost:8055
1821	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.226+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	bb161d17-d6a7-47a9-839b-9016d1a4eb3e	\N	http://localhost:8055
1822	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.259+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	339f955a-1a02-4429-be47-ab2a78631d8a	\N	http://localhost:8055
1823	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.28+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	74edc2e8-376a-403c-bb85-7face8a4191c	\N	http://localhost:8055
1824	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.291+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	137575ba-da54-4f43-9999-3d28590ed360	\N	http://localhost:8055
2261	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:00.905+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	260	\N	http://localhost:8055
2372	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.678+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2373	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.681+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2374	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2262	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:28.253+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stacks	\N	http://localhost:8055
2263	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.697+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	261	\N	http://localhost:8055
2264	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.699+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	262	\N	http://localhost:8055
2265	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.701+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	263	\N	http://localhost:8055
2266	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.704+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	264	\N	http://localhost:8055
2267	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.706+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	265	\N	http://localhost:8055
2268	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.708+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	266	\N	http://localhost:8055
2269	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:08:44.71+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2375	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.688+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2376	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.691+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2377	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.695+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2378	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.698+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2379	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.702+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2380	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.705+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2381	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.707+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2382	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.711+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2383	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.714+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2384	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.717+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2385	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.719+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2386	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.678+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2387	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.683+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2388	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.688+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2389	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.693+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2390	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.696+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2391	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.701+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2392	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.704+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2393	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.707+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2394	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.711+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2395	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.715+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2396	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.718+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2397	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.722+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2270	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:09:00.956+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	267	\N	http://localhost:8055
2398	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.725+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2399	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.729+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2400	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.732+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2401	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.735+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2402	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.738+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2403	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.741+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2404	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.745+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2405	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.748+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2406	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.751+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2407	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.76+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2408	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.765+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2409	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.771+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2410	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.776+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2411	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.78+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2412	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.784+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2413	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:41.787+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2414	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.827+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2271	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:18.991+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2272	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:18.996+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2273	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2274	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.005+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2275	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.009+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2276	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.012+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2277	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.015+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2278	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.019+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2279	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.023+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2280	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2281	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.031+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2282	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.035+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2283	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.04+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2284	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.044+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2285	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.048+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2286	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.051+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2287	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.055+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2288	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.058+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2289	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.062+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2290	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.065+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2291	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.069+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2292	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.074+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2293	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.078+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2294	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.081+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2295	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.084+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2296	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.089+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2297	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:19.093+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2415	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.833+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2416	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.843+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2417	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.858+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2418	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.872+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2298	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:23:56.219+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	268	\N	http://localhost:8055
2299	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:24:42.512+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	269	\N	http://localhost:8055
2419	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.881+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2420	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.884+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2421	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.887+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2422	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.891+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2423	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.894+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2424	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.898+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2425	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.904+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2426	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.907+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2427	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.91+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2428	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.914+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2429	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.917+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2430	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.919+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2431	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.922+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2432	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.926+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2433	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.93+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2434	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.933+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2435	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.935+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2436	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.938+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2437	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.941+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2438	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.944+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2439	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.947+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2440	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.95+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2441	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:45.953+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2300	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:26:16.801+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	270	\N	http://localhost:8055
2301	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:27:54.999+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	271	\N	http://localhost:8055
2018	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:38:50.868+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_news	5	\N	http://localhost:8055
2019	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:39:02.566+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	\N	http://localhost:8055
2020	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:40:10.708+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	161	\N	http://localhost:8055
2021	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:48:03.982+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	161	\N	http://localhost:8055
2022	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 09:00:07.16+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	1	\N	http://localhost:8055
2023	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 09:00:12.687+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	2	\N	http://localhost:8055
2024	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 09:00:17.994+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	3	\N	http://localhost:8055
2302	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:30:38.305+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	272	\N	http://localhost:8055
2303	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:30:38.428+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	273	\N	http://localhost:8055
2304	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:30:38.431+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2305	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:30:38.485+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	274	\N	http://localhost:8055
2306	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:30:38.606+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	275	\N	http://localhost:8055
2657	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:49:08.557+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	techstack	\N	http://localhost:8055
2658	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:49:13.08+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	techstack_image	\N	http://localhost:8055
2725	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:30.018+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	38	\N	http://localhost:8055
2746	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:09.689+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e18e80be-8571-4e5f-8de1-be3e83872cdd	\N	http://localhost:8055
2769	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:00.857+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	356	\N	http://localhost:8055
2770	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:27.835+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_folders	43574fa0-8ed5-446a-8122-7d962882ae83	\N	http://localhost:8055
2025	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 06:59:27.723+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2026	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:00:11.236+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations_links_2	10	\N	http://localhost:8055
2027	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:00:11.239+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	11	\N	http://localhost:8055
2028	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:00:51.755+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	11	\N	http://localhost:8055
2038	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:56.589+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	9	\N	http://localhost:8055
2050	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:52:14.745+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	214	\N	http://localhost:8055
2060	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:22:33.229+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2070	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:44:59.492+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	1	\N	http://localhost:8055
2085	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:51.451+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	2	\N	http://localhost:8055
2087	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:11:37.358+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2621	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:59:59.599+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	326	\N	http://localhost:8055
2659	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.717+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_image	\N	http://localhost:8055
2660	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.775+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2661	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.78+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2662	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.784+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2663	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.791+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2664	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.796+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2665	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.8+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2666	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.804+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2667	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.811+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2668	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.815+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2669	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.822+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2670	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.826+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2237	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.409+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2238	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.413+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2029	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:07:34.96+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	243	\N	http://localhost:8055
2671	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.833+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2672	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.839+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2673	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.848+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2674	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.859+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2675	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.867+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2676	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.881+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2033	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:08:42.094+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	4	\N	http://localhost:8055
2039	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:10:24.173+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	243	\N	http://localhost:8055
2051	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 02:13:14.866+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2061	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:23:28.909+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2072	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:08.936+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	2	\N	http://localhost:8055
2081	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:04:12.668+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2084	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:45.769+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	1	\N	http://localhost:8055
2086	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:55.376+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	3	\N	http://localhost:8055
2088	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:22:58.158+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2677	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.886+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2678	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.889+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2679	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.893+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2680	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.898+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2681	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.902+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2682	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.905+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2683	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.91+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2684	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.915+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2685	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:51:29.919+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2727	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:48.452+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	40	\N	http://localhost:8055
2747	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:23.832+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	46	\N	http://localhost:8055
2771	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d790625e-2b34-4832-a4ef-f85b67d3d097	\N	http://localhost:8055
2239	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.416+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2030	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:07:57.498+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	1	\N	http://localhost:8055
2041	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:11:43.182+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations_children	1	\N	http://localhost:8055
2044	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:12:10.166+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations_children	4	\N	http://localhost:8055
2052	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 08:20:45.626+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	245	\N	http://localhost:8055
2053	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 08:20:45.873+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	246	\N	http://localhost:8055
2054	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 08:21:59.657+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	1	\N	http://localhost:8055
2062	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:23:38.765+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	245	\N	http://localhost:8055
2073	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:19.083+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	3	\N	http://localhost:8055
2774	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.698+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42	\N	http://localhost:8055
2775	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:15:10.958+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	356	\N	http://localhost:8055
2076	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:41.751+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	6	\N	http://localhost:8055
2089	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:31:41.356+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	248	\N	http://localhost:8055
2686	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:52:43.316+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack	3	\N	http://localhost:8055
2687	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:52:50.26+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack	4	\N	http://localhost:8055
2688	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:18.652+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack	5	\N	http://localhost:8055
2689	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:25.768+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack	6	\N	http://localhost:8055
2196	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:54:57.07+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f9f5e6bc-cfd0-4e48-b493-a0c307891ec1	\N	http://localhost:8055
2229	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:05:27.532+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	259	\N	http://localhost:8055
2240	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.42+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2241	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.424+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2242	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.427+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2243	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.431+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2244	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.434+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2245	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.439+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2246	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.442+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2247	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.447+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2248	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.454+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2249	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.457+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2250	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.461+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2251	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.466+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2704	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:11.483+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	17	\N	http://localhost:8055
2031	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:08:05.413+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	2	\N	http://localhost:8055
2043	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:12:03.927+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations_children	3	\N	http://localhost:8055
2055	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 08:22:19.628+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	2	\N	http://localhost:8055
2063	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:40:38.369+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	248	\N	http://localhost:8055
2074	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:24.926+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	4	\N	http://localhost:8055
2079	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:03:03.647+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	9	\N	http://localhost:8055
2090	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:32:30.711+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	248	\N	http://localhost:8055
2152	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:21.4+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	258	\N	http://localhost:8055
2706	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:26.567+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	19	\N	http://localhost:8055
2709	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:57.898+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	22	\N	http://localhost:8055
2718	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:14.297+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	31	\N	http://localhost:8055
2153	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:39.921+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	258	\N	http://localhost:8055
2154	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.646+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2155	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.69+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2156	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.694+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2157	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.697+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2158	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.702+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2159	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.706+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2160	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.709+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2161	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.712+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2162	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.715+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2163	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.718+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2164	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.722+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2165	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.725+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2166	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.731+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2167	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.734+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2168	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.737+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2169	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.741+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2170	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.746+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2171	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.749+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2172	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.753+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2173	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.756+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2174	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.76+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2175	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.764+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2176	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.767+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stacks	\N	http://localhost:8055
2032	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:08:15.518+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	3	\N	http://localhost:8055
2045	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:04:06.641+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0bd72556-0cc5-48dd-bf9d-e307f55d8a2a	\N	http://localhost:8055
2046	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:04:12.867+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	4	\N	http://localhost:8055
2056	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 08:22:32.949+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	3	\N	http://localhost:8055
2064	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:12.485+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	248	\N	http://localhost:8055
2065	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:27.37+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	1	\N	http://localhost:8055
2075	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:32.287+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	5	\N	http://localhost:8055
2078	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:55.92+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	8	\N	http://localhost:8055
2091	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:46:55.121+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	186	\N	http://localhost:8055
2177	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.771+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stack_images_jp_tech_stack_images	\N	http://localhost:8055
2178	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.775+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2179	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.778+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2180	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.781+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2181	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.784+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2182	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:51:52.787+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stacks_jp_tech_stack_images	\N	http://localhost:8055
2629	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:06:58.495+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_image	\N	http://localhost:8055
2630	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:02.979+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2631	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.45+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	327	\N	http://localhost:8055
2632	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.453+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	328	\N	http://localhost:8055
2633	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.456+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	329	\N	http://localhost:8055
2634	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.459+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	330	\N	http://localhost:8055
2635	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.462+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	331	\N	http://localhost:8055
2636	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.465+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	332	\N	http://localhost:8055
2637	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:15.468+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2638	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.591+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	333	\N	http://localhost:8055
2639	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.595+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	334	\N	http://localhost:8055
2640	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.598+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	335	\N	http://localhost:8055
2641	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.602+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	336	\N	http://localhost:8055
2642	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.606+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	337	\N	http://localhost:8055
2643	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.608+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	338	\N	http://localhost:8055
2644	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:35.61+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_image	\N	http://localhost:8055
2690	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:39.835+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	3	\N	http://localhost:8055
2034	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:13.111+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	5	\N	http://localhost:8055
2036	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:37.321+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	7	\N	http://localhost:8055
2040	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:11:30.909+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	244	\N	http://localhost:8055
2042	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:11:54.032+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations_children	2	\N	http://localhost:8055
2047	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:04:16.851+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	4	\N	http://localhost:8055
2057	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 08:25:49.457+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2066	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:38.149+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	2	\N	http://localhost:8055
2067	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:43.014+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	3	\N	http://localhost:8055
2077	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:50.208+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	7	\N	http://localhost:8055
2080	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:03:08.47+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_marquee	10	\N	http://localhost:8055
2645	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:07:57.76+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	339	\N	http://localhost:8055
2646	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:08:03.474+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	339	\N	http://localhost:8055
2151	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:42.186+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	257	\N	http://localhost:8055
2647	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:08:23.839+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	340	\N	http://localhost:8055
2691	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:48.103+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	4	\N	http://localhost:8055
2694	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:12.746+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	7	\N	http://localhost:8055
2695	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:28.156+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	8	\N	http://localhost:8055
2696	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:39.737+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	9	\N	http://localhost:8055
2697	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:51.946+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	10	\N	http://localhost:8055
2699	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:10.771+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	12	\N	http://localhost:8055
2230	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.377+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2231	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.383+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2232	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.389+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2233	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.392+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2234	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.396+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2235	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.4+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2236	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.405+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2035	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:19.718+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	6	\N	http://localhost:8055
2037	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:48.654+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	navigations	8	\N	http://localhost:8055
2048	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:20:58.031+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_develop	4	\N	http://localhost:8055
2058	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:11:23.954+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	245	\N	http://localhost:8055
2059	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:20:03.013+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	247	\N	http://localhost:8055
2068	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:44:10.359+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	249	\N	http://localhost:8055
2069	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:44:41.199+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	249	\N	http://localhost:8055
2071	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:45:26.227+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	249	\N	http://localhost:8055
2082	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:08.388+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	250	\N	http://localhost:8055
2083	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:35.637+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	250	\N	http://localhost:8055
2702	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:55.107+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	15	\N	http://localhost:8055
2710	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:06.65+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	23	\N	http://localhost:8055
2713	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:30.657+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	26	\N	http://localhost:8055
2715	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:47.345+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	28	\N	http://localhost:8055
2716	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:56.178+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	29	\N	http://localhost:8055
2648	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:08:50.632+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	341	\N	http://localhost:8055
2649	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:09:03.709+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack	1	\N	http://localhost:8055
2650	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:09:12.287+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack	2	\N	http://localhost:8055
2651	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:10:40.015+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	342	\N	http://localhost:8055
2652	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:03.588+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	342	\N	http://localhost:8055
2143	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:49:58.093+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stack_images	\N	http://localhost:8055
2144	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.902+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	251	\N	http://localhost:8055
2145	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.907+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	252	\N	http://localhost:8055
2146	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.915+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	253	\N	http://localhost:8055
2147	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.921+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	254	\N	http://localhost:8055
2148	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.927+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	255	\N	http://localhost:8055
2149	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.941+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	256	\N	http://localhost:8055
2150	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 02:50:19.947+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2655	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:37.907+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	2	\N	http://localhost:8055
2692	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:57.386+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	5	\N	http://localhost:8055
2720	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:32.362+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	33	\N	http://localhost:8055
2734	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:52:44.159+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	36	\N	http://localhost:8055
2252	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.469+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stacks	\N	http://localhost:8055
2253	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.473+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stack_images_jp_tech_stack_images	\N	http://localhost:8055
2254	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.48+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2255	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.484+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2256	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.488+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2257	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.495+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2258	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:06:25.5+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stacks_jp_tech_stack_images	\N	http://localhost:8055
2259	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:07:12.998+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stack_images_jp_tech_stack_images	\N	http://localhost:8055
2260	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:07:22.88+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_tech_stacks_jp_tech_stack_images	\N	http://localhost:8055
2735	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:52:47.39+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	37	\N	http://localhost:8055
2748	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:34.204+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	47	\N	http://localhost:8055
2750	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 10:01:25.258+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	49	\N	http://localhost:8055
2752	login	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:09:54.695+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2772	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f5a958de-71c5-47cf-9c2e-423c9b45c686	\N	http://localhost:8055
2779	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:16:53.096+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	10	\N	http://localhost:8055
2653	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:22.086+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	1	\N	http://localhost:8055
2693	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:05.659+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	6	\N	http://localhost:8055
2698	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:02.531+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	11	\N	http://localhost:8055
2358	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.584+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2359	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.634+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2360	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.637+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2361	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.641+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2362	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.646+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2363	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.649+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2364	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.652+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2365	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.658+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2366	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.662+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2367	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.665+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2368	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.668+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2369	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.67+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2370	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.673+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2371	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 03:34:24.676+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2700	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:18.827+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	13	\N	http://localhost:8055
2701	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:47.426+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	14	\N	http://localhost:8055
2703	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:02.441+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	16	\N	http://localhost:8055
2736	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:52:50.315+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	38	\N	http://localhost:8055
2749	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:48.038+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	48	\N	http://localhost:8055
2751	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 10:17:26.438+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2753	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.727+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	344	\N	http://localhost:8055
2754	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.734+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	345	\N	http://localhost:8055
2755	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.739+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	346	\N	http://localhost:8055
2756	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.742+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	347	\N	http://localhost:8055
2757	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.745+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	348	\N	http://localhost:8055
2758	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.749+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	349	\N	http://localhost:8055
2759	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 02:10:29.754+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_about	\N	http://localhost:8055
2773	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.67+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	300cf124-dd15-4ebf-92d8-850e3e469e87	\N	http://localhost:8055
2780	login	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:35:22.048+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2781	login	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 06:50:19.137+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2442	login	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:44:01.048+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2444	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:57:50.679+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	276	\N	http://localhost:8055
2445	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.926+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	277	\N	http://localhost:8055
2446	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.93+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	278	\N	http://localhost:8055
2447	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.935+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	279	\N	http://localhost:8055
2448	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.939+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	280	\N	http://localhost:8055
2449	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.943+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	281	\N	http://localhost:8055
2450	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.946+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	282	\N	http://localhost:8055
2451	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:58:34.95+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	\N	http://localhost:8055
2453	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.013+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	284	\N	http://localhost:8055
2454	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.018+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	285	\N	http://localhost:8055
2455	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.02+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	286	\N	http://localhost:8055
2456	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.023+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	287	\N	http://localhost:8055
2457	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.026+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	288	\N	http://localhost:8055
2458	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.029+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	289	\N	http://localhost:8055
2459	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:44.032+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test1	\N	http://localhost:8055
2461	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:01:05.254+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	290	\N	http://localhost:8055
2464	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:03:10.65+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	291	\N	http://localhost:8055
2469	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:14:51.744+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	\N	http://localhost:8055
2471	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.876+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	293	\N	http://localhost:8055
2472	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.88+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	294	\N	http://localhost:8055
2473	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.884+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	295	\N	http://localhost:8055
2474	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.887+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	296	\N	http://localhost:8055
2475	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.89+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	297	\N	http://localhost:8055
2476	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.892+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	298	\N	http://localhost:8055
2477	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:08.895+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	techstack	\N	http://localhost:8055
2478	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:20.958+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	299	\N	http://localhost:8055
2481	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.797+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	300	\N	http://localhost:8055
2482	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.8+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	301	\N	http://localhost:8055
2483	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.803+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	302	\N	http://localhost:8055
2484	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.805+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	303	\N	http://localhost:8055
2443	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:44:14.227+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2452	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 06:59:24.868+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	283	\N	http://localhost:8055
2460	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:00:22.311+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	290	\N	http://localhost:8055
2465	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:03:44.085+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	292	\N	http://localhost:8055
2470	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:14:54.477+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test1	\N	http://localhost:8055
2485	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.81+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	304	\N	http://localhost:8055
2486	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.813+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	305	\N	http://localhost:8055
2487	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:15:55.816+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	techstack_image	\N	http://localhost:8055
2488	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:16:18.879+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	306	\N	http://localhost:8055
2489	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:16:29.316+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	306	\N	http://localhost:8055
2491	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:17:07.005+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	307	\N	http://localhost:8055
2495	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.916+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations	\N	http://localhost:8055
2496	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.93+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers	\N	http://localhost:8055
2497	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.936+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	benefits	\N	http://localhost:8055
2498	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.942+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	services	\N	http://localhost:8055
2499	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.947+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	partners	\N	http://localhost:8055
2500	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.951+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	blogs	\N	http://localhost:8055
2501	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.957+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jobs	\N	http://localhost:8055
2502	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.961+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_categories	\N	http://localhost:8055
2503	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.966+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	job_locations	\N	http://localhost:8055
2504	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.972+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	news	\N	http://localhost:8055
2505	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.976+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies	\N	http://localhost:8055
2506	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.984+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	companies_links	\N	http://localhost:8055
2507	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.989+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footers_links_group	\N	http://localhost:8055
2508	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:36.995+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links	\N	http://localhost:8055
2509	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.001+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group	\N	http://localhost:8055
2510	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.006+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	links_group_links	\N	http://localhost:8055
2511	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.012+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links	\N	http://localhost:8055
2512	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.017+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_1	\N	http://localhost:8055
2513	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.024+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_links_2	\N	http://localhost:8055
2514	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.028+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	users	\N	http://localhost:8055
2515	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.032+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	navigations_navigations_children	\N	http://localhost:8055
2516	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.038+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2517	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.042+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2518	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.046+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_carousel	\N	http://localhost:8055
2519	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.051+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_develop	\N	http://localhost:8055
2520	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.055+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_marquee	\N	http://localhost:8055
2521	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.059+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_news	\N	http://localhost:8055
2522	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.065+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2523	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.069+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	techstack	\N	http://localhost:8055
2524	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:25:37.073+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	techstack_image	\N	http://localhost:8055
2525	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:26:42.702+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	308	\N	http://localhost:8055
2526	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:27:30.468+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	309	\N	http://localhost:8055
2654	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:25.285+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	1	\N	http://localhost:8055
2705	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:18.874+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	18	\N	http://localhost:8055
2712	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:23.083+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	25	\N	http://localhost:8055
2717	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:04.026+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	30	\N	http://localhost:8055
2721	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:48.572+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	34	\N	http://localhost:8055
2729	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:05.217+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	42	\N	http://localhost:8055
2730	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:15.97+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	43	\N	http://localhost:8055
2733	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:13:46.065+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	343	\N	http://localhost:8055
2737	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:01.063+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	61e1014d-d557-415c-848b-57c93d6c3107	\N	http://localhost:8055
2738	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:01.071+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e2d61f86-ffb9-47ad-a944-653121e6f024	\N	http://localhost:8055
2739	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:01.072+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f7fd38cc-e4ee-4bcc-9c7a-6d8c6e6d8b95	\N	http://localhost:8055
2740	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:32.105+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	faee7ac0-6624-4041-880b-ceaed7f01b08	\N	http://localhost:8055
2760	delete	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:05:12.81+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_about	\N	http://localhost:8055
2761	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.618+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	350	\N	http://localhost:8055
2762	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.625+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	351	\N	http://localhost:8055
2763	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.63+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	352	\N	http://localhost:8055
2707	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:38.354+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	20	\N	http://localhost:8055
2708	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:47.475+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	21	\N	http://localhost:8055
2711	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:14.868+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	24	\N	http://localhost:8055
2714	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:39.371+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	27	\N	http://localhost:8055
2719	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:24.359+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	32	\N	http://localhost:8055
2722	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:57.507+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	35	\N	http://localhost:8055
2724	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:22.228+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	37	\N	http://localhost:8055
2726	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:39.921+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	39	\N	http://localhost:8055
2731	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:23.801+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	44	\N	http://localhost:8055
2741	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:32.106+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c1b62116-5f99-4b83-813b-39e46c1abd57	\N	http://localhost:8055
2743	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:54:02.499+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	faee7ac0-6624-4041-880b-ceaed7f01b08	\N	http://localhost:8055
2744	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:54:07.537+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f	\N	http://localhost:8055
2745	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:54:14.562+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0525446c-a58a-44f0-8cc9-d26fc03f96af	\N	http://localhost:8055
2764	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.635+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	353	\N	http://localhost:8055
2765	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.638+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	354	\N	http://localhost:8055
2766	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.641+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	355	\N	http://localhost:8055
2767	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:09:50.644+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_service	\N	http://localhost:8055
2776	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:16:15.628+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	7	\N	http://localhost:8055
2782	login	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 02:12:46.382+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2784	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:44:51.284+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	7	\N	http://localhost:8055
2786	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:45:08.397+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	9	\N	http://localhost:8055
2789	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:15:00.605+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6851820a-a8db-4ee9-ba8f-942c19d0e64b	\N	http://localhost:8055
2791	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:15:34.29+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_carousel	4	\N	http://localhost:8055
2800	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:58.84+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	364	\N	http://localhost:8055
2801	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:14.318+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	364	\N	http://localhost:8055
2802	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.643+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	365	\N	http://localhost:8055
2803	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.647+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	366	\N	http://localhost:8055
2804	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.653+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	367	\N	http://localhost:8055
2805	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	368	\N	http://localhost:8055
2806	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.66+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	369	\N	http://localhost:8055
2807	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.663+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	370	\N	http://localhost:8055
2808	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:03:59.667+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_about_item	\N	http://localhost:8055
2792	login	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 06:59:05.174+00	172.18.0.1	node	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	\N
2573	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:37:11.245+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_jp_teckstack_image	\N	http://localhost:8055
2574	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:47:46.281+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_teckstack_image	\N	http://localhost:8055
2575	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.377+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	310	\N	http://localhost:8055
2576	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.383+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	311	\N	http://localhost:8055
2577	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.387+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	312	\N	http://localhost:8055
2578	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.39+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	313	\N	http://localhost:8055
2579	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.393+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	314	\N	http://localhost:8055
2580	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.398+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	315	\N	http://localhost:8055
2581	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:01.401+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack_image	\N	http://localhost:8055
2582	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:22.86+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	316	\N	http://localhost:8055
2583	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:29.57+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	316	\N	http://localhost:8055
2584	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:48:50.302+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	317	\N	http://localhost:8055
2585	update	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:49:23.717+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	316	\N	http://localhost:8055
2586	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:50:04.646+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	318	\N	http://localhost:8055
2600	delete	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:42.857+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2601	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.317+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	319	\N	http://localhost:8055
2602	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.325+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	320	\N	http://localhost:8055
2603	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.328+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	321	\N	http://localhost:8055
2604	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.331+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	322	\N	http://localhost:8055
2605	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.335+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	323	\N	http://localhost:8055
2606	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.338+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	324	\N	http://localhost:8055
2607	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:57:56.34+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_techstack	\N	http://localhost:8055
2608	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 07:58:08.062+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	325	\N	http://localhost:8055
2723	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:06.943+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	36	\N	http://localhost:8055
2728	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:56.443+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	41	\N	http://localhost:8055
2732	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:31.489+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_techstack_image	45	\N	http://localhost:8055
2742	create	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:32.114+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	155d2f9f-cceb-4e88-9e30-50085c634366	\N	http://localhost:8055
2768	delete	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:10:38.331+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_service	\N	http://localhost:8055
2777	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:16:39.3+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	9	\N	http://localhost:8055
2778	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:16:46.48+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	8	\N	http://localhost:8055
2783	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:44:27.049+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	357	\N	http://localhost:8055
2785	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:44:56.452+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	8	\N	http://localhost:8055
2787	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:45:12.127+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	services	10	\N	http://localhost:8055
2788	login	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:08:05.692+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	f343a843-c75d-4970-b281-73ebb92fc718	\N	http://localhost:8055
2790	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:15:15.365+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6851820a-a8db-4ee9-ba8f-942c19d0e64b	\N	http://localhost:8055
2793	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.504+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	358	\N	http://localhost:8055
2794	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.512+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	359	\N	http://localhost:8055
2795	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.516+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	360	\N	http://localhost:8055
2796	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.519+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	361	\N	http://localhost:8055
2797	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.523+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	362	\N	http://localhost:8055
2798	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.526+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	363	\N	http://localhost:8055
2799	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:02:38.53+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_about	\N	http://localhost:8055
2809	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:05:00.421+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	371	\N	http://localhost:8055
2810	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:05:14.951+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	372	\N	http://localhost:8055
2811	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:06:15.601+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	373	\N	http://localhost:8055
2812	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:06:30.111+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	374	\N	http://localhost:8055
2813	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:07:08.133+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	373	\N	http://localhost:8055
2814	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:07:17.768+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	374	\N	http://localhost:8055
2815	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:09:31.501+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a47e3fa4-9797-4468-8fe2-cc1ad7533a81	\N	http://localhost:8055
2816	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:09:50.065+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9e43e19f-2a15-4c27-97e6-384788e5ff73	\N	http://localhost:8055
2817	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:09:53.724+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	1	\N	http://localhost:8055
2818	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:08.648+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	569b19e3-9635-40e1-b480-fe1612771514	\N	http://localhost:8055
2819	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:12.935+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	5d7b4315-1f3a-4969-a606-8c279c048c31	\N	http://localhost:8055
2820	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:15.285+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	2	\N	http://localhost:8055
2821	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:32.374+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	63f4e679-c694-47b2-89f8-a82c7aed4f07	\N	http://localhost:8055
2822	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:38.008+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fc832436-5365-4590-a688-796fadbee6af	\N	http://localhost:8055
2823	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:39.645+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	3	\N	http://localhost:8055
2824	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:49.946+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e987f767-7217-4615-8322-2925aa56e95f	\N	http://localhost:8055
2825	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:54.203+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	09b05086-6275-44c3-a0f9-e4246291b7be	\N	http://localhost:8055
2826	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:55.335+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	4	\N	http://localhost:8055
2827	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:09.709+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	375	\N	http://localhost:8055
2828	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:09.864+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	376	\N	http://localhost:8055
2829	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:36.427+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	46c32efd-cc9c-406e-bc71-2fcfe9ef3432	\N	http://localhost:8055
2830	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.262+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	1	\N	http://localhost:8055
2831	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.266+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	2	\N	http://localhost:8055
2832	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.269+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	3	\N	http://localhost:8055
2833	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.272+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_item	4	\N	http://localhost:8055
2834	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.275+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about	1	\N	http://localhost:8055
2835	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:13:41.854+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	377	\N	http://localhost:8055
2836	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.453+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	378	\N	http://localhost:8055
2837	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.459+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	379	\N	http://localhost:8055
2838	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.462+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	380	\N	http://localhost:8055
2839	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.465+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	381	\N	http://localhost:8055
2840	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.467+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	382	\N	http://localhost:8055
2841	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.47+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	383	\N	http://localhost:8055
2842	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:12.474+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	jp_about_text	\N	http://localhost:8055
2843	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:21.405+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	384	\N	http://localhost:8055
2844	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:35.462+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_text	1	\N	http://localhost:8055
2845	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:41.857+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_text	2	\N	http://localhost:8055
2846	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:48.205+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_text	3	\N	http://localhost:8055
2847	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:05.729+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	385	\N	http://localhost:8055
2848	create	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:05.869+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	386	\N	http://localhost:8055
2849	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.009+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_text	1	\N	http://localhost:8055
2850	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.013+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_text	2	\N	http://localhost:8055
2851	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.016+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about_text	3	\N	http://localhost:8055
2852	update	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.024+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	jp_about	1	\N	http://localhost:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
navigations_children	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	1	navigations	open	\N	f
blogs	\N	Technical blogs	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	6	\N	open	\N	f
jobs	\N	Hiring jobs	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	7	\N	open	\N	f
job_categories	\N	Categories of jobs	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	8	\N	open	\N	f
job_locations	\N	Locations of jobs	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	9	\N	open	\N	f
news	\N	Company activities	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	10	\N	open	\N	f
companies	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	11	\N	open	\N	f
jp_techstack_image	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	1	jp_techstack	open	\N	f
navigations	\N	Content for navigations	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	1	\N	open	\N	f
footers	\N	Content for footers	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	2	\N	open	\N	f
benefits	\N	Benefits when joining company	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	3	\N	open	\N	f
services	\N	Services provided by company	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	4	\N	open	\N	f
partners	\N	Companies with partnership	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	5	\N	open	\N	f
companies_links	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	12	\N	open	\N	f
footers_links_group	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	13	\N	open	\N	f
links	\N	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	14	\N	open	\N	f
links_group	\N	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N	15	\N	open	\N	f
links_group_links	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	16	\N	open	\N	f
navigations_links	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	17	\N	open	\N	f
navigations_links_1	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	18	\N	open	\N	f
navigations_links_2	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	19	\N	open	\N	f
users	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	20	\N	open	\N	f
navigations_navigations_children	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	21	\N	open	\N	f
jp_carousel	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	22	\N	open	\N	f
jp_develop	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	23	\N	open	\N	f
jp_marquee	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	24	\N	open	\N	f
jp_news	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	25	\N	open	\N	f
jp_techstack	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	26	\N	open	\N	f
jp_about	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
jp_about_item	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
jp_about_text	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
t	081f9ade-ba7c-472a-aa02-6caa4f0658de	directus-extension-schema-management-module	module	\N
t	90da981a-26a6-4fcf-896c-a7aa2875738a	directus-extension-schema-management-module	module	\N
t	817e149b-1dae-48b0-938d-58aaccd535ef	directus-extension-schema-management-module	module	\N
t	37cca1b0-0735-474b-a0d8-fc9be471cf22	directus-extension-schema-management-module	module	\N
t	8232ab67-5851-4043-ba1b-5cb8132ab8b0	directus-extension-schema-management-module	module	\N
t	596d35be-e9e3-4f9d-9d4e-db1e05754ea9	directus-extension-schema-management-module	module	\N
t	0ba0bd57-fc52-4870-8e1f-45177b1e1115	directus-extension-schema-management-module	module	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	benefits	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
30	blogs	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
3	companies	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
4	companies_links	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
5	footers	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
6	footers_links_group	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
7	job_categories	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
8	job_locations	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
9	jobs	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
10	links	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
11	links_group	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
12	links_group_links	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
13	navigations	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
14	navigations_links	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
15	navigations_links_1	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
16	navigations_links_2	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
17	news	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
18	partners	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
19	services	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
20	users	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
21	benefits	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
22	benefits	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
23	benefits	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
24	benefits	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
25	benefits	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
26	benefits	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
27	benefits	logo	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
28	benefits	content	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
39	companies	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
40	companies	address	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
41	companies	tel	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
42	companies	email	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
43	companies	contact_links	m2m	list-m2m	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
44	companies_links	companies_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
45	companies_links	links_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
35	blogs	content	\N	input-rich-text-md	\N	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
36	blogs	tags	cast-json	tags	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
31	blogs	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
32	blogs	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
33	blogs	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
34	blogs	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
37	blogs	author	m2o	select-dropdown-m2o	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
38	blogs	slug	\N	input	\N	\N	\N	f	f	13	full	\N	\N	\N	t	\N	\N	\N
2	blogs	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
29	blogs	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
46	footers	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	3	full	\N	\N	\N	f	\N	\N	\N
47	footers	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
48	footers	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
49	footers	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	7	half	\N	\N	\N	f	\N	\N	\N
50	footers	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	8	half	\N	\N	\N	f	\N	\N	\N
51	footers	links_groups	m2m	list-m2m	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
52	footers	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
53	footers_links_group	footers_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
54	footers_links_group	links_group_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
154	navigations	language	\N	select-dropdown	{"choices":[{"text":"vn","value":"vn"},{"text":"jp","value":"jp"}]}	\N	\N	f	f	11	full	\N	\N	\N	t	\N	\N	\N
167	navigations_navigations_children	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
168	navigations_navigations_children	navigations_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
329	jp_techstack	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
55	job_categories	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
56	job_categories	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
57	job_categories	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
58	job_categories	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
59	job_categories	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
60	job_categories	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
61	job_categories	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
62	job_categories	description	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
63	job_locations	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
64	job_locations	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
65	job_locations	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
66	job_locations	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
67	job_locations	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
68	job_locations	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
69	job_locations	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
70	jobs	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
71	jobs	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
72	jobs	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
73	jobs	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
74	jobs	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
75	jobs	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
76	jobs	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
77	jobs	description	\N	input-rich-text-md	\N	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
78	jobs	intro	\N	input-multiline	{"placeholder":"Brief introduction about the job"}	\N	\N	f	f	11	full	\N	\N	\N	t	\N	\N	\N
79	jobs	link	m2o	select-dropdown-m2o	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
80	jobs	logo	file	file-image	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
81	jobs	category	m2o	select-dropdown-m2o	\N	\N	\N	f	f	13	full	\N	\N	\N	t	\N	\N	\N
82	jobs	location	m2o	select-dropdown-m2o	\N	\N	\N	f	f	14	full	\N	\N	\N	t	\N	\N	\N
83	links	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
84	links	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
85	links	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
86	links	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
87	links	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
88	links	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
89	links	label	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
90	links	url	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
91	links	slug	\N	input	{"placeholder":"Relative url"}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
92	links	is_relative	cast-boolean	boolean	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
155	navigations_children	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
169	navigations_navigations_children	navigations_children_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
171	services	language	\N	select-dropdown	{"choices":[{"text":"vn","value":"vn"},{"text":"jp","value":"jp"}],"placeholder":"Selection web"}	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
330	jp_techstack	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
93	links_group	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
94	links_group	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
95	links_group	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
96	links_group	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
97	links_group	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
98	links_group	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
99	links_group	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
100	links_group	links	m2m	list-m2m	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
101	links_group_links	links_group_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
102	links_group_links	links_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
103	navigations	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
104	navigations	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
105	navigations	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
106	navigations	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
107	navigations	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
109	navigations	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
111	navigations_links	navigations_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
112	navigations_links	links_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
113	navigations_links_1	navigations_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
114	navigations_links_1	links_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
115	navigations_links_2	navigations_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
116	navigations_links_2	links_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
117	navigations_links_2	sort	\N	\N	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
118	news	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
119	news	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
120	news	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
121	news	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
122	news	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
123	news	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
124	news	content	\N	input-rich-text-html	\N	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
125	news	slug	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
126	partners	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
127	partners	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
128	partners	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
129	partners	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
130	partners	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
131	partners	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
132	partners	logo	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
133	partners	link	m2o	select-dropdown-m2o	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
331	jp_techstack	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
332	jp_techstack	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
333	jp_techstack_image	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
134	services	status	\N	select-dropdown	{"choices":[{"color":"var(--theme--primary)","text":"$t:published","value":"published"},{"color":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"color":"var(--theme--warning)","text":"$t:archived","value":"archived"}]}	labels	{"choices":[{"background":"var(--theme--primary-background)","color":"var(--theme--primary)","foreground":"var(--theme--primary)","text":"$t:published","value":"published"},{"background":"var(--theme--background-normal)","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","text":"$t:draft","value":"draft"},{"background":"var(--theme--warning-background)","color":"var(--theme--warning)","foreground":"var(--theme--warning)","text":"$t:archived","value":"archived"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
135	services	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
136	services	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
137	services	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
138	services	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
139	services	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
140	services	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
141	services	content	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
142	services	link	m2o	select-dropdown-m2o	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
143	users	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
144	users	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
145	users	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
146	users	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
147	users	username	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
148	users	logo	file	file-image	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
149	users	email	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
150	blogs	logo	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
151	blogs	intro	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
156	navigations_children	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
157	navigations_children	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
158	navigations_children	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
159	navigations_children	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
160	navigations_children	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
163	navigations_children	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
165	navigations_children	language	\N	select-dropdown	{"choices":[{"text":"vn","value":"vn"},{"text":"jp","value":"jp"}]}	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
166	navigations	nav_children	m2m	list-m2m	{}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
196	jp_news	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
197	jp_news	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
198	jp_news	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
199	jp_news	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
200	jp_news	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
201	jp_news	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
203	jp_news	description	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
202	jp_news	date	\N	datetime	\N	datetime	{"format":"short"}	f	f	7	full	\N	\N	\N	t	\N	\N	\N
205	jp_develop	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
206	jp_develop	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
207	jp_develop	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
208	jp_develop	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
209	jp_develop	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
210	jp_develop	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
211	jp_develop	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
212	jp_develop	description	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
217	jp_develop	url	m2o	select-dropdown-m2o	{"template":"{{url}}"}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
219	jp_carousel	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
220	jp_carousel	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
221	jp_carousel	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
222	jp_carousel	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
223	jp_carousel	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
224	jp_carousel	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
226	jp_carousel	alt	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
227	jp_marquee	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
228	jp_marquee	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
229	jp_marquee	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
230	jp_marquee	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
231	jp_marquee	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
232	jp_marquee	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
233	jp_marquee	alt	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
234	jp_marquee	catetory	\N	select-dropdown	{"choices":[{"text":"transaction","value":"transaction"},{"text":"badge","value":"badge"}]}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
218	jp_news	url	m2o	select-dropdown-m2o	{"template":"{{url}}"}	related-values	{"template":"{{url}}"}	f	f	9	full	\N	\N	\N	f	\N	\N	\N
243	navigations	url	m2o	select-dropdown-m2o	{"template":"{{url}}"}	related-values	{"template":"{{url}}"}	f	f	13	full	\N	\N	\N	f	\N	\N	\N
244	navigations_children	url	m2o	select-dropdown-m2o	{"template":"{{url}}"}	\N	\N	f	f	10	full	\N	\N	\N	t	\N	\N	\N
249	jp_marquee	image	m2o	file-image	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31"}	image	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
250	jp_carousel	image	m2o	file-image	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb"}	image	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
248	jp_develop	image	m2o	file-image	{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4"}	image	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
327	jp_techstack	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
328	jp_techstack	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
334	jp_techstack_image	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
335	jp_techstack_image	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
336	jp_techstack_image	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
337	jp_techstack_image	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
338	jp_techstack_image	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
365	jp_about_item	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
340	jp_techstack_image	linkto	m2o	select-dropdown-m2o	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
341	jp_techstack	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
342	jp_techstack_image	image	m2o	file	{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"}	image	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
343	jp_techstack_image	alt	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
356	services	image	m2o	file-image	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83"}	image	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
357	services	reverse	cast-boolean	boolean	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
358	jp_about	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
359	jp_about	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
360	jp_about	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
361	jp_about	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
362	jp_about	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
363	jp_about	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
364	jp_about	image	m2o	file-image	\N	image	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
366	jp_about_item	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
367	jp_about_item	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
368	jp_about_item	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
369	jp_about_item	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
370	jp_about_item	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
371	jp_about_item	main_text	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
372	jp_about_item	hover_text	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
373	jp_about_item	image_src	m2o	file-image	\N	image	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
374	jp_about_item	icon_src	m2o	file-image	\N	image	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
375	jp_about_item	linkto	m2o	\N	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
376	jp_about	jp_about_item	o2m	list-o2m	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
378	jp_about_text	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
379	jp_about_text	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
380	jp_about_text	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
381	jp_about_text	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
382	jp_about_text	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
383	jp_about_text	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
384	jp_about_text	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
385	jp_about_text	linkto	m2o	\N	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
386	jp_about	jp_about_text	o2m	list-o2m	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
d34afa1b-9431-4df0-8cb7-5e0e2a3621ed	azure	d34afa1b-9431-4df0-8cb7-5e0e2a3621ed.png	company-1.png	Company 1	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.041+00	\N	2024-12-19 06:15:54.871+00	\N	4205	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:54.869+00
4163551b-371b-4256-888f-c9e2924988a0	azure	4163551b-371b-4256-888f-c9e2924988a0.png	istqb.png	Istqb	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.079+00	\N	2024-12-19 06:15:54.872+00	\N	10541	272	154	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:54.87+00
ad58e314-2deb-4a69-85e5-7ea63e043691	azure	ad58e314-2deb-4a69-85e5-7ea63e043691.png	company-4.png	Company 4	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.02+00	\N	2024-12-19 06:15:54.874+00	\N	4237	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:54.87+00
d83dcde1-2f9f-490b-b7b8-50c6353413bb	azure	d83dcde1-2f9f-490b-b7b8-50c6353413bb.png	sao_khue.png	Sao Khue	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.083+00	\N	2024-12-19 06:15:54.876+00	\N	13899	272	154	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:54.87+00
9f75622f-5815-4986-909a-0d8af58bf7c0	azure	9f75622f-5815-4986-909a-0d8af58bf7c0.png	company-5.png	Company 5	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.059+00	\N	2024-12-19 06:15:54.877+00	\N	3124	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:54.876+00
7701551a-80b0-48b4-9da7-bc7cea8bdec2	azure	7701551a-80b0-48b4-9da7-bc7cea8bdec2.png	company.png	Company	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.009+00	\N	2024-12-19 06:15:55.154+00	\N	6232	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:55.154+00
de92ea69-8230-4b99-9ec6-3739df6effe1	azure	de92ea69-8230-4b99-9ec6-3739df6effe1.png	salesforce-partner.png	Salesforce Partner	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.92+00	\N	2024-12-19 06:15:55.335+00	\N	8627	272	154	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:55.334+00
ad0a3b86-7ad6-4aa4-8691-ef2134df633b	azure	ad0a3b86-7ad6-4aa4-8691-ef2134df633b.png	vietnam_top_100.png	Vietnam Top 100	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.938+00	\N	2024-12-19 06:15:55.344+00	\N	7517	272	154	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:55.341+00
a05da9d6-6101-43c8-9061-d8f80f1f30e7	azure	a05da9d6-6101-43c8-9061-d8f80f1f30e7.png	company-3.png	Company 3	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.921+00	\N	2024-12-19 06:15:55.345+00	\N	5294	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:55.342+00
26814cd7-0381-4003-8c40-09b312834e74	azure	26814cd7-0381-4003-8c40-09b312834e74.png	company-2.png	Company 2	image/png	0d27f18a-eb34-4735-acc8-4c34beb7df31	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:15:54.938+00	\N	2024-12-19 06:15:55.358+00	\N	7948	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:15:55.351+00
d4627602-e266-454f-bfec-e50ce12d4e64	azure	d4627602-e266-454f-bfec-e50ce12d4e64.png	service.png	Service	image/png	caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.609+00	\N	2024-12-19 06:17:00.211+00	\N	131459	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:17:00.21+00
0f6d3f6c-d00b-460d-9ad1-dd419285b3d6	azure	0f6d3f6c-d00b-460d-9ad1-dd419285b3d6.png	service-2.png	Service 2	image/png	caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.645+00	\N	2024-12-19 06:17:00.329+00	\N	167627	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:17:00.327+00
fcdb1c97-a2bc-4109-ab77-649037a19f0e	azure	fcdb1c97-a2bc-4109-ab77-649037a19f0e.png	service-3.png	Service 3	image/png	caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.65+00	\N	2024-12-19 06:17:00.384+00	\N	131716	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:17:00.38+00
549ce2e3-03f3-4621-98e4-14ce619ef01c	azure	549ce2e3-03f3-4621-98e4-14ce619ef01c.png	service-1.png	Service 1	image/png	caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:16:59.626+00	\N	2024-12-19 06:17:00.389+00	\N	188037	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:17:00.387+00
5400aa1d-4303-49a5-971c-4db4ac2ce952	azure	5400aa1d-4303-49a5-971c-4db4ac2ce952.png	background-develop.png	Background Develop	image/png	91915b07-e44b-47f7-b21d-2fb5d296b0d4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:17:25.281+00	\N	2024-12-19 06:17:25.938+00	\N	199537	870	620	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-19 06:17:25.937+00
95a37fc0-645d-4d5e-8349-e727784abc24	azure	95a37fc0-645d-4d5e-8349-e727784abc24.svg	ts-8.svg	TS 8	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.669+00	\N	2024-12-19 06:21:08.011+00	\N	45960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.009+00
9bd5e5b3-df48-4356-9951-a3f624eb4042	azure	9bd5e5b3-df48-4356-9951-a3f624eb4042.svg	ts-20-2.svg	TS 20 2	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.68+00	\N	2024-12-19 06:21:08.012+00	\N	8366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.01+00
0554f909-08d6-4fa1-8194-3dcb2d0fb2c7	azure	0554f909-08d6-4fa1-8194-3dcb2d0fb2c7.svg	ts-20-1.svg	TS 20 1	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.703+00	\N	2024-12-19 06:21:08.039+00	\N	129649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.035+00
d617e2d3-d26f-4562-b0c3-46e5bc068016	azure	d617e2d3-d26f-4562-b0c3-46e5bc068016.svg	ts-20-3.svg	TS 20 3	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.712+00	\N	2024-12-19 06:21:08.04+00	\N	30423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.036+00
2c9ae88d-dde2-4066-a352-491ec71dd805	azure	2c9ae88d-dde2-4066-a352-491ec71dd805.svg	ts-1.svg	TS 1	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.312+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	37745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:19:14.634+00
873ceb2a-72f4-4da6-b4a9-0a9dc978f046	azure	873ceb2a-72f4-4da6-b4a9-0a9dc978f046.svg	ts-19-1.svg	TS 19 1	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.382+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	28254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:19:14.688+00
b3f5281a-a99e-4814-8bc2-65c9a9027343	azure	b3f5281a-a99e-4814-8bc2-65c9a9027343.svg	ts-19-3.svg	TS 19 3	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.39+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	17427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:19:14.693+00
b1815bb8-6c29-4537-bc7f-790901d29b67	azure	b1815bb8-6c29-4537-bc7f-790901d29b67.svg	ts-19-2.svg	TS 19 2	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.391+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	48188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:19:14.704+00
388720df-d81f-4887-a19c-29dcf1c3d7db	azure	388720df-d81f-4887-a19c-29dcf1c3d7db.svg	ts-7.svg	TS 7	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.33+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	357787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:19:14.848+00
6b21841e-3b5a-4aed-9139-a50a5e716b76	azure	6b21841e-3b5a-4aed-9139-a50a5e716b76.svg	ts-13.svg	TS 13	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:19:14.356+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	196773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:19:14.896+00
6c1634f5-1a38-413f-b838-ced9c6202235	azure	6c1634f5-1a38-413f-b838-ced9c6202235.svg	ts-19-4.svg	TS 19 4	image/svg+xml	2f74c38b-0eb5-47ca-8449-8e01b1b19df4	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:16.601+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:20:38.85+00	\N	40430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:20:16.908+00
b25ba673-e5e1-4187-beec-ba8a3cfc76c7	azure	b25ba673-e5e1-4187-beec-ba8a3cfc76c7.svg	ts-14.svg	TS 14	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.657+00	\N	2024-12-19 06:21:08.099+00	\N	35778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.098+00
7716cc3f-8c21-47ff-ac5f-ad7d2b864718	azure	7716cc3f-8c21-47ff-ac5f-ad7d2b864718.svg	ts-2.svg	TS 2	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:07.647+00	\N	2024-12-19 06:21:08.178+00	\N	75756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.176+00
be53a4c4-098a-45ea-91db-b6ae2669564a	azure	be53a4c4-098a-45ea-91db-b6ae2669564a.svg	ts-20-6.svg	TS 20 6	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:08.038+00	\N	2024-12-19 06:21:08.335+00	\N	4494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.334+00
a0d21d1c-54ff-45e7-984f-591b8ae9be63	azure	a0d21d1c-54ff-45e7-984f-591b8ae9be63.svg	ts-20-4.svg	TS 20 4	image/svg+xml	67c86201-a81c-44ad-822f-281f5d2cac4b	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:08.083+00	\N	2024-12-19 06:21:08.404+00	\N	3146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:08.402+00
08f0dc33-94b4-4c53-8c98-e5adb3954a44	azure	08f0dc33-94b4-4c53-8c98-e5adb3954a44.svg	ts-21-3.svg	TS 21 3	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.484+00	\N	2024-12-19 06:21:29.807+00	\N	847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:29.806+00
b05090ee-719d-4d8a-9256-d6975a0ad377	azure	b05090ee-719d-4d8a-9256-d6975a0ad377.svg	ts-3.svg	TS 3	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.435+00	\N	2024-12-19 06:21:29.82+00	\N	120988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:29.819+00
c7d84063-d35e-4369-be6e-2c4c488e13ea	azure	c7d84063-d35e-4369-be6e-2c4c488e13ea.svg	ts-21-1.svg	TS 21 1	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.508+00	\N	2024-12-19 06:21:29.831+00	\N	39804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:29.828+00
fbefceae-bb19-44cc-aa2b-7e176277639a	azure	fbefceae-bb19-44cc-aa2b-7e176277639a.svg	ts-15.svg	TS 15	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.464+00	\N	2024-12-19 06:21:29.904+00	\N	129928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:29.902+00
15331689-8d96-46c4-8f5f-20ab35f8adb1	azure	15331689-8d96-46c4-8f5f-20ab35f8adb1.svg	ts-21-4.svg	TS 21 4	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.83+00	\N	2024-12-19 06:21:30.155+00	\N	32723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:30.155+00
29df87d8-1ac1-4386-b814-ffa951aa5bca	azure	29df87d8-1ac1-4386-b814-ffa951aa5bca.svg	ts-21-6.svg	TS 21 6	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.875+00	\N	2024-12-19 06:21:30.194+00	\N	53182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:30.193+00
3a3ab399-08aa-47df-9740-96ba1319c000	azure	3a3ab399-08aa-47df-9740-96ba1319c000.svg	ts-21-2.svg	TS 21 2	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.505+00	\N	2024-12-19 06:21:29.843+00	\N	42753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:29.839+00
58a7a9de-2217-427c-b371-5201f5901778	azure	58a7a9de-2217-427c-b371-5201f5901778.svg	ts-9.svg	TS 9	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.451+00	\N	2024-12-19 06:21:29.923+00	\N	32162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:29.922+00
c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0	azure	c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0.svg	ts-21-5.svg	TS 21 5	image/svg+xml	be7eb220-8cfd-4826-88cd-5cd935feb8bf	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:21:29.856+00	\N	2024-12-19 06:21:30.186+00	\N	38991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:21:30.186+00
2d280990-e1ac-4c49-9c59-73a439541ec8	azure	2d280990-e1ac-4c49-9c59-73a439541ec8.svg	ts-4.svg	TS 4	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.287+00	\N	2024-12-19 06:22:04.611+00	\N	43389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.61+00
80b3a5b9-5051-498e-9d7a-a651226b6b04	azure	80b3a5b9-5051-498e-9d7a-a651226b6b04.svg	ts-16.svg	TS 16	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.295+00	\N	2024-12-19 06:22:04.634+00	\N	16406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.632+00
a3aa6e44-9ada-4950-be23-88143059ecc6	azure	a3aa6e44-9ada-4950-be23-88143059ecc6.svg	ts-22-2.svg	TS 22 2	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.331+00	\N	2024-12-19 06:22:04.653+00	\N	10736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.65+00
70226b1b-320c-4635-8701-ec36629ee48d	azure	70226b1b-320c-4635-8701-ec36629ee48d.svg	ts-22-3.svg	TS 22 3	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.356+00	\N	2024-12-19 06:22:04.696+00	\N	17864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.684+00
fc99029a-d177-4d2b-b87e-0052c6bf00d9	azure	fc99029a-d177-4d2b-b87e-0052c6bf00d9.svg	ts-10.svg	TS 10	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.316+00	\N	2024-12-19 06:22:04.705+00	\N	105729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.685+00
965b9bf2-a506-44a2-a04e-23f7d621b6ef	azure	965b9bf2-a506-44a2-a04e-23f7d621b6ef.svg	ts-22-4.svg	TS 22 4	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.344+00	\N	2024-12-19 06:22:04.871+00	\N	78505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.87+00
4d745ef1-47c9-4a7a-be10-fdd3538fbcb7	azure	4d745ef1-47c9-4a7a-be10-fdd3538fbcb7.svg	ts-22-1.svg	TS 22 1	image/svg+xml	e8636db1-0c68-42de-bd47-659273618d25	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-19 06:22:04.633+00	\N	2024-12-19 06:22:04.958+00	\N	30839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-19 06:22:04.957+00
cfa88e35-2afb-4fd8-ab88-f3033b908f6e	azure	cfa88e35-2afb-4fd8-ab88-f3033b908f6e.webp	Slide-03.webp	Slide 03	image/webp	edc43ca7-0115-4437-b4d2-02d00e5aabeb	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:21:35.241+00	\N	2024-12-24 08:21:35.838+00	\N	38268	1920	992	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-24 08:21:35.838+00
3e2bd5e5-09da-4abd-89a4-ef410f87185b	azure	3e2bd5e5-09da-4abd-89a4-ef410f87185b.webp	Slide-01.webp	Slide 01	image/webp	edc43ca7-0115-4437-b4d2-02d00e5aabeb	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:21:35.228+00	\N	2024-12-24 08:21:36.119+00	\N	42820	1920	992	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-24 08:21:36.116+00
1e874b8a-04b6-4b9c-a5ba-749c38d8a004	azure	1e874b8a-04b6-4b9c-a5ba-749c38d8a004.webp	Slide-02.webp	Slide 02	image/webp	edc43ca7-0115-4437-b4d2-02d00e5aabeb	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:21:35.225+00	\N	2024-12-24 08:21:36.201+00	\N	75378	1920	992	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-24 08:21:36.2+00
3786ea60-385b-4738-a83e-dced7be6559b	azure	3786ea60-385b-4738-a83e-dced7be6559b.svg	ts-24-2.svg	TS 24 2	image/svg+xml	3668e451-3e54-4ed8-9356-ee28d42ace97	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.238+00	\N	2024-12-24 08:22:22.604+00	\N	39562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:22:22.602+00
118c67f9-a60f-4a62-bacc-b4700658d37a	azure	118c67f9-a60f-4a62-bacc-b4700658d37a.svg	ts-24-1.svg	TS 24 1	image/svg+xml	3668e451-3e54-4ed8-9356-ee28d42ace97	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.166+00	\N	2024-12-24 08:22:22.656+00	\N	35203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:22:22.655+00
d126a2a6-2b09-452a-9f3d-0a2491a1dbad	azure	d126a2a6-2b09-452a-9f3d-0a2491a1dbad.svg	ts-12.svg	TS 12	image/svg+xml	3668e451-3e54-4ed8-9356-ee28d42ace97	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.141+00	\N	2024-12-24 08:22:22.666+00	\N	83712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:22:22.66+00
8d4ca320-cfdf-4005-a385-a2777b942890	azure	8d4ca320-cfdf-4005-a385-a2777b942890.svg	ts-6.svg	TS 6	image/svg+xml	3668e451-3e54-4ed8-9356-ee28d42ace97	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.127+00	\N	2024-12-24 08:22:22.672+00	\N	41972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:22:22.662+00
8cbce33a-dfcc-44cc-bee4-4479b488f307	azure	8cbce33a-dfcc-44cc-bee4-4479b488f307.svg	ts-24-3.svg	TS 24 3	image/svg+xml	3668e451-3e54-4ed8-9356-ee28d42ace97	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.208+00	\N	2024-12-24 08:22:22.678+00	\N	42613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:22:22.678+00
e49bc8e4-b8f9-4517-b8d0-8c1d60aea537	azure	e49bc8e4-b8f9-4517-b8d0-8c1d60aea537.svg	ts-18.svg	TS 18	image/svg+xml	3668e451-3e54-4ed8-9356-ee28d42ace97	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:22:22.213+00	\N	2024-12-24 08:22:22.777+00	\N	120357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:22:22.77+00
339f955a-1a02-4429-be47-ab2a78631d8a	azure	339f955a-1a02-4429-be47-ab2a78631d8a.svg	ts-23-3.svg	TS 23 3	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.245+00	\N	2024-12-24 08:23:23.586+00	\N	30285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:23:23.585+00
74edc2e8-376a-403c-bb85-7face8a4191c	azure	74edc2e8-376a-403c-bb85-7face8a4191c.svg	ts-23-5.svg	TS 23 5	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.277+00	\N	2024-12-24 08:23:23.715+00	\N	138308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:23:23.712+00
bb161d17-d6a7-47a9-839b-9016d1a4eb3e	azure	bb161d17-d6a7-47a9-839b-9016d1a4eb3e.svg	ts-23-2.svg	TS 23 2	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.224+00	\N	2024-12-24 08:23:23.759+00	\N	150611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:23:23.758+00
137575ba-da54-4f43-9999-3d28590ed360	azure	137575ba-da54-4f43-9999-3d28590ed360.svg	ts-23-4.svg	TS 23 4	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-24 08:23:23.281+00	\N	2024-12-24 08:23:23.895+00	\N	153019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-24 08:23:23.894+00
0bd72556-0cc5-48dd-bf9d-e307f55d8a2a	azure	0bd72556-0cc5-48dd-bf9d-e307f55d8a2a.png	company-1.png	Company 1	image/png	\N	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 09:04:06.638+00	\N	2024-12-27 09:04:07.795+00	\N	4205	272	81	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-12-27 09:04:07.794+00
d790625e-2b34-4832-a4ef-f85b67d3d097	azure	d790625e-2b34-4832-a4ef-f85b67d3d097.png	service.png	Service	image/png	43574fa0-8ed5-446a-8122-7d962882ae83	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.652+00	\N	2025-01-07 03:14:39.4+00	\N	131459	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-07 03:14:39.4+00
155d2f9f-cceb-4e88-9e30-50085c634366	azure	155d2f9f-cceb-4e88-9e30-50085c634366.svg	ts-17.svg	TS 17	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:32.112+00	\N	2024-12-31 09:53:32.448+00	\N	28234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-31 09:53:32.445+00
c1b62116-5f99-4b83-813b-39e46c1abd57	azure	c1b62116-5f99-4b83-813b-39e46c1abd57.svg	ts-5.svg	TS 5	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:53:32.092+00	\N	2024-12-31 09:53:32.461+00	\N	57616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-31 09:53:32.458+00
a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f	azure	a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f.svg	ts-23-1.svg	TS 23 1	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:54:07.533+00	\N	2024-12-31 09:54:07.845+00	\N	38460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-31 09:54:07.844+00
e18e80be-8571-4e5f-8de1-be3e83872cdd	azure	e18e80be-8571-4e5f-8de1-be3e83872cdd.svg	ts-11.svg	TS 11	image/svg+xml	bdd75080-44de-4243-be87-9c3e3866f976	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:09.664+00	\N	2024-12-31 09:55:10.03+00	\N	5253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-12-31 09:55:10.029+00
300cf124-dd15-4ebf-92d8-850e3e469e87	azure	300cf124-dd15-4ebf-92d8-850e3e469e87.png	service-3.png	Service 3	image/png	43574fa0-8ed5-446a-8122-7d962882ae83	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.667+00	\N	2025-01-07 03:14:39.566+00	\N	131716	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-07 03:14:39.565+00
f5a958de-71c5-47cf-9c2e-423c9b45c686	azure	f5a958de-71c5-47cf-9c2e-423c9b45c686.png	service-1.png	Service 1	image/png	43574fa0-8ed5-446a-8122-7d962882ae83	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.653+00	\N	2025-01-07 03:14:39.614+00	\N	188037	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-07 03:14:39.613+00
a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42	azure	a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42.png	service-2.png	Service 2	image/png	43574fa0-8ed5-446a-8122-7d962882ae83	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-07 03:14:38.692+00	\N	2025-01-07 03:14:39.67+00	\N	167627	880	480	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-07 03:14:39.67+00
569b19e3-9635-40e1-b480-fe1612771514	azure	569b19e3-9635-40e1-b480-fe1612771514.webp	about.webp	About	image/webp	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:08.646+00	\N	2025-01-14 08:10:09.06+00	\N	41166	424	550	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 08:10:09.06+00
6851820a-a8db-4ee9-ba8f-942c19d0e64b	azure	6851820a-a8db-4ee9-ba8f-942c19d0e64b.png	2150169850 1 (2).png	DataImpact	image/png	edc43ca7-0115-4437-b4d2-02d00e5aabeb	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:15:00.6+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:15:15.363+00	\N	1469493	3840	2016	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 02:15:01.835+00
a47e3fa4-9797-4468-8fe2-cc1ad7533a81	azure	a47e3fa4-9797-4468-8fe2-cc1ad7533a81.webp	about.webp	About	image/webp	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:09:31.498+00	\N	2025-01-14 08:09:33.59+00	\N	41166	424	550	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 08:09:33.59+00
9e43e19f-2a15-4c27-97e6-384788e5ff73	azure	9e43e19f-2a15-4c27-97e6-384788e5ff73.svg	icon.svg	Icon	image/svg+xml	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:09:50.063+00	\N	2025-01-14 08:09:50.358+00	\N	18205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 08:09:50.357+00
5d7b4315-1f3a-4969-a606-8c279c048c31	azure	5d7b4315-1f3a-4969-a606-8c279c048c31.svg	icon.svg	Icon	image/svg+xml	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:12.932+00	\N	2025-01-14 08:10:13.226+00	\N	18205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 08:10:13.224+00
63f4e679-c694-47b2-89f8-a82c7aed4f07	azure	63f4e679-c694-47b2-89f8-a82c7aed4f07.webp	about.webp	About	image/webp	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:32.372+00	\N	2025-01-14 08:10:32.77+00	\N	41166	424	550	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 08:10:32.769+00
fc832436-5365-4590-a688-796fadbee6af	azure	fc832436-5365-4590-a688-796fadbee6af.svg	icon.svg	Icon	image/svg+xml	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:38.006+00	\N	2025-01-14 08:10:38.426+00	\N	18205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 08:10:38.425+00
e987f767-7217-4615-8322-2925aa56e95f	azure	e987f767-7217-4615-8322-2925aa56e95f.webp	about.webp	About	image/webp	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:49.944+00	\N	2025-01-14 08:10:50.351+00	\N	41166	424	550	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 08:10:50.349+00
09b05086-6275-44c3-a0f9-e4246291b7be	azure	09b05086-6275-44c3-a0f9-e4246291b7be.svg	icon.svg	Icon	image/svg+xml	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:54.202+00	\N	2025-01-14 08:10:54.569+00	\N	18205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-01-14 08:10:54.567+00
46c32efd-cc9c-406e-bc71-2fcfe9ef3432	azure	46c32efd-cc9c-406e-bc71-2fcfe9ef3432.png	about-1.png	About 1	image/png	\N	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:36.426+00	\N	2025-01-14 08:12:37.188+00	\N	192844	880	550	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-14 08:12:37.186+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
9fc92333-41e1-4d4c-9f24-982f61057617	Partner	\N
1475b3df-7b23-45eb-a0d0-03ea6eb15225	Azure	\N
dfd9fc6f-1b3d-42f2-a5cb-0c8dcb022d29	Machine_Learning	1475b3df-7b23-45eb-a0d0-03ea6eb15225
20d9aa93-aa7d-4c3d-9d64-efede41a8f72	AI_900	1475b3df-7b23-45eb-a0d0-03ea6eb15225
022e85ae-2f89-4471-b510-95dc21836dba	Azure App Service 230s Limitation	1475b3df-7b23-45eb-a0d0-03ea6eb15225
14b3d91c-b419-436c-bbc1-0cb57ada2954	AI	\N
ee3bffea-97f5-481e-a85a-367bf9c16850	Introduction to Neural Network	14b3d91c-b419-436c-bbc1-0cb57ada2954
40b34516-fbb9-4b54-95e3-4c175673153e	Semantic Router	14b3d91c-b419-436c-bbc1-0cb57ada2954
eb0ab25f-29fa-4b18-8b51-42983325852e	Transformer	14b3d91c-b419-436c-bbc1-0cb57ada2954
2e39087e-7a53-47fe-b714-c1103e0c51e6	CICD	1475b3df-7b23-45eb-a0d0-03ea6eb15225
d1a31099-fbd2-4788-8c64-841a0e69799c	User	\N
26a1033c-035e-4135-8f43-eb89bdf66865	Azure Data Factory	1475b3df-7b23-45eb-a0d0-03ea6eb15225
f4f64a90-9169-47f9-9667-df3aa5e512f0	Job	\N
20087177-7dcd-485b-816b-4eb96600d002	Javascript	\N
a9ed6ca8-ed12-4d02-8ecb-5cad1b9205e8	Benefit	\N
291545ea-5ab3-45de-83c9-3b7610731e4e	Ragas	1475b3df-7b23-45eb-a0d0-03ea6eb15225
be2c54f0-3904-4730-9b9e-401c6da5faa2	Autogen	14b3d91c-b419-436c-bbc1-0cb57ada2954
161d32c0-c79e-4686-b615-0ab7bd646ae7	Blog	\N
86e58119-edba-4a46-9759-0c700f8c92a1	Backup	\N
caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3	Image Service	\N
7316e61a-a02b-4b25-a6ea-6b4dedb8cd85	Tech Stack Image	\N
2f74c38b-0eb5-47ca-8449-8e01b1b19df4	Data Analysis	7316e61a-a02b-4b25-a6ea-6b4dedb8cd85
67c86201-a81c-44ad-822f-281f5d2cac4b	Database	7316e61a-a02b-4b25-a6ea-6b4dedb8cd85
be7eb220-8cfd-4826-88cd-5cd935feb8bf	Machine Learning	7316e61a-a02b-4b25-a6ea-6b4dedb8cd85
e8636db1-0c68-42de-bd47-659273618d25	Web/App Development - Frontend	7316e61a-a02b-4b25-a6ea-6b4dedb8cd85
bdd75080-44de-4243-be87-9c3e3866f976	Web/App Development - Backend	7316e61a-a02b-4b25-a6ea-6b4dedb8cd85
3668e451-3e54-4ed8-9356-ee28d42ace97	Cloud	7316e61a-a02b-4b25-a6ea-6b4dedb8cd85
91915b07-e44b-47f7-b21d-2fb5d296b0d4	Develop	\N
0d27f18a-eb34-4735-acc8-4c34beb7df31	Marquee	\N
edc43ca7-0115-4437-b4d2-02d00e5aabeb	Carousel	\N
43574fa0-8ed5-446a-8122-7d962882ae83	Service	\N
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2024-12-19 05:00:28.763897+00
20201029A	Remove System Relations	2024-12-19 05:00:28.768648+00
20201029B	Remove System Collections	2024-12-19 05:00:28.775276+00
20201029C	Remove System Fields	2024-12-19 05:00:28.782904+00
20201105A	Add Cascade System Relations	2024-12-19 05:00:28.834879+00
20201105B	Change Webhook URL Type	2024-12-19 05:00:28.84503+00
20210225A	Add Relations Sort Field	2024-12-19 05:00:28.851895+00
20210304A	Remove Locked Fields	2024-12-19 05:00:28.857627+00
20210312A	Webhooks Collections Text	2024-12-19 05:00:28.866273+00
20210331A	Add Refresh Interval	2024-12-19 05:00:28.870513+00
20210415A	Make Filesize Nullable	2024-12-19 05:00:28.880083+00
20210416A	Add Collections Accountability	2024-12-19 05:00:28.885202+00
20210422A	Remove Files Interface	2024-12-19 05:00:28.887983+00
20210506A	Rename Interfaces	2024-12-19 05:00:28.90539+00
20210510A	Restructure Relations	2024-12-19 05:00:28.924566+00
20210518A	Add Foreign Key Constraints	2024-12-19 05:00:28.933665+00
20210519A	Add System Fk Triggers	2024-12-19 05:00:28.964534+00
20210521A	Add Collections Icon Color	2024-12-19 05:00:28.968385+00
20210525A	Add Insights	2024-12-19 05:00:28.981749+00
20210608A	Add Deep Clone Config	2024-12-19 05:00:28.986587+00
20210626A	Change Filesize Bigint	2024-12-19 05:00:28.997093+00
20210716A	Add Conditions to Fields	2024-12-19 05:00:29.00148+00
20210721A	Add Default Folder	2024-12-19 05:00:29.007822+00
20210802A	Replace Groups	2024-12-19 05:00:29.014496+00
20210803A	Add Required to Fields	2024-12-19 05:00:29.018542+00
20210805A	Update Groups	2024-12-19 05:00:29.022245+00
20210805B	Change Image Metadata Structure	2024-12-19 05:00:29.028023+00
20210811A	Add Geometry Config	2024-12-19 05:00:29.032629+00
20210831A	Remove Limit Column	2024-12-19 05:00:29.036333+00
20210903A	Add Auth Provider	2024-12-19 05:00:29.053383+00
20210907A	Webhooks Collections Not Null	2024-12-19 05:00:29.06202+00
20210910A	Move Module Setup	2024-12-19 05:00:29.068477+00
20210920A	Webhooks URL Not Null	2024-12-19 05:00:29.077157+00
20210924A	Add Collection Organization	2024-12-19 05:00:29.083699+00
20210927A	Replace Fields Group	2024-12-19 05:00:29.092575+00
20210927B	Replace M2M Interface	2024-12-19 05:00:29.095982+00
20210929A	Rename Login Action	2024-12-19 05:00:29.099215+00
20211007A	Update Presets	2024-12-19 05:00:29.10737+00
20211009A	Add Auth Data	2024-12-19 05:00:29.111442+00
20211016A	Add Webhook Headers	2024-12-19 05:00:29.115065+00
20211103A	Set Unique to User Token	2024-12-19 05:00:29.119989+00
20211103B	Update Special Geometry	2024-12-19 05:00:29.123009+00
20211104A	Remove Collections Listing	2024-12-19 05:00:29.126754+00
20211118A	Add Notifications	2024-12-19 05:00:29.137426+00
20211211A	Add Shares	2024-12-19 05:00:29.153+00
20211230A	Add Project Descriptor	2024-12-19 05:00:29.15701+00
20220303A	Remove Default Project Color	2024-12-19 05:00:29.166985+00
20220308A	Add Bookmark Icon and Color	2024-12-19 05:00:29.171603+00
20220314A	Add Translation Strings	2024-12-19 05:00:29.175918+00
20220322A	Rename Field Typecast Flags	2024-12-19 05:00:29.180077+00
20220323A	Add Field Validation	2024-12-19 05:00:29.184016+00
20220325A	Fix Typecast Flags	2024-12-19 05:00:29.189328+00
20220325B	Add Default Language	2024-12-19 05:00:29.200487+00
20220402A	Remove Default Value Panel Icon	2024-12-19 05:00:29.20938+00
20220429A	Add Flows	2024-12-19 05:00:29.231966+00
20220429B	Add Color to Insights Icon	2024-12-19 05:00:29.235979+00
20220429C	Drop Non Null From IP of Activity	2024-12-19 05:00:29.241775+00
20220429D	Drop Non Null From Sender of Notifications	2024-12-19 05:00:29.246917+00
20220614A	Rename Hook Trigger to Event	2024-12-19 05:00:29.250173+00
20220801A	Update Notifications Timestamp Column	2024-12-19 05:00:29.261513+00
20220802A	Add Custom Aspect Ratios	2024-12-19 05:00:29.266823+00
20220826A	Add Origin to Accountability	2024-12-19 05:00:29.27223+00
20230401A	Update Material Icons	2024-12-19 05:00:29.282184+00
20230525A	Add Preview Settings	2024-12-19 05:00:29.28599+00
20230526A	Migrate Translation Strings	2024-12-19 05:00:29.294268+00
20230721A	Require Shares Fields	2024-12-19 05:00:29.300386+00
20230823A	Add Content Versioning	2024-12-19 05:00:29.314992+00
20230927A	Themes	2024-12-19 05:00:29.337586+00
20231009A	Update CSV Fields to Text	2024-12-19 05:00:29.341607+00
20231009B	Update Panel Options	2024-12-19 05:00:29.346252+00
20231010A	Add Extensions	2024-12-19 05:00:29.351606+00
20231215A	Add Focalpoints	2024-12-19 05:00:29.355481+00
20240122A	Add Report URL Fields	2024-12-19 05:00:29.360272+00
20240204A	Marketplace	2024-12-19 05:00:29.385459+00
20240305A	Change Useragent Type	2024-12-19 05:00:29.397975+00
20240311A	Deprecate Webhooks	2024-12-19 05:00:29.406567+00
20240422A	Public Registration	2024-12-19 05:00:29.413162+00
20240515A	Add Session Window	2024-12-19 05:00:29.417124+00
20240701A	Add Tus Data	2024-12-19 05:00:29.420835+00
20240716A	Update Files Date Fields	2024-12-19 05:00:29.428931+00
20240806A	Permissions Policies	2024-12-19 05:00:29.465564+00
20240817A	Update Icon Fields Length	2024-12-19 05:00:29.50284+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
bc75fb1b-af29-4ba4-8f8a-7d4c9261595d	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
47	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	links_group	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
46	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	users	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
51	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
55	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	job_locations	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
57	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	navigations	\N	\N	{"tabular":{"fields":["language","nav_children","status","title","url"]}}	\N	\N	\N	bookmark	\N
56	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	navigations_children	\N	\N	{"tabular":{"page":1,"fields":["language","link","status","title","url"]}}	\N	\N	\N	bookmark	\N
58	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	benefits	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
54	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	news	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
53	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	companies	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
48	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	links	\N	\N	{"tabular":{"page":1,"fields":["label","slug","status","url","id"]}}	\N	\N	\N	bookmark	\N
63	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	jp_develop	\N	\N	{"tabular":{"fields":["description","status","title","url","image"],"page":1}}	\N	\N	\N	bookmark	\N
49	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	jp_news	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
61	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	jobs	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
68	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	jp_techstack_image	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
60	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	blogs	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
45	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
62	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	jp_carousel	\N	tabular	{"tabular":{"page":1,"fields":["alt","image","status","id"]}}	\N	\N	\N	bookmark	\N
69	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	services	\N	\N	{"tabular":{"page":1,"fields":["content","link","status","title","language","reverse"]}}	\N	\N	\N	bookmark	\N
59	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	footers	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
71	\N	f343a843-c75d-4970-b281-73ebb92fc718	\N	jp_about_item	\N	\N	{"tabular":{"fields":["hover_text","image_src","main_text","status","id"]}}	\N	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	benefits	user_created	directus_users	\N	\N	\N	\N	\N	nullify
2	benefits	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
3	benefits	logo	directus_files	\N	\N	\N	\N	\N	nullify
4	blogs	user_created	directus_users	\N	\N	\N	\N	\N	nullify
5	blogs	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
6	blogs	author	users	\N	\N	\N	\N	\N	nullify
7	companies_links	links_id	links	\N	\N	\N	companies_id	\N	nullify
8	companies_links	companies_id	companies	contact_links	\N	\N	links_id	\N	nullify
9	footers	user_created	directus_users	\N	\N	\N	\N	\N	nullify
10	footers	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
11	footers_links_group	links_group_id	links_group	\N	\N	\N	footers_id	\N	nullify
12	footers_links_group	footers_id	footers	links_groups	\N	\N	links_group_id	\N	nullify
13	job_categories	user_created	directus_users	\N	\N	\N	\N	\N	nullify
14	job_categories	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
15	job_locations	user_created	directus_users	\N	\N	\N	\N	\N	nullify
16	job_locations	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
17	jobs	user_created	directus_users	\N	\N	\N	\N	\N	nullify
18	jobs	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
19	jobs	link	links	\N	\N	\N	\N	\N	nullify
20	jobs	logo	directus_files	\N	\N	\N	\N	\N	nullify
21	jobs	category	job_categories	\N	\N	\N	\N	\N	nullify
22	jobs	location	job_locations	\N	\N	\N	\N	\N	nullify
23	links	user_created	directus_users	\N	\N	\N	\N	\N	nullify
24	links	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
25	links_group	user_created	directus_users	\N	\N	\N	\N	\N	nullify
26	links_group	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
27	links_group_links	links_id	links	\N	\N	\N	links_group_id	\N	nullify
28	links_group_links	links_group_id	links_group	links	\N	\N	links_id	\N	nullify
29	navigations	user_created	directus_users	\N	\N	\N	\N	\N	nullify
30	navigations	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
32	navigations_links	links_id	links	\N	\N	\N	navigations_id	\N	nullify
33	navigations_links	navigations_id	navigations	\N	\N	\N	links_id	\N	nullify
34	navigations_links_1	links_id	links	\N	\N	\N	navigations_id	\N	nullify
35	navigations_links_1	navigations_id	navigations	\N	\N	\N	links_id	\N	nullify
36	navigations_links_2	links_id	links	\N	\N	\N	navigations_id	\N	nullify
38	news	user_created	directus_users	\N	\N	\N	\N	\N	nullify
39	news	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
40	partners	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
41	partners	logo	directus_files	\N	\N	\N	\N	\N	nullify
42	partners	link	links	\N	\N	\N	\N	\N	nullify
43	services	user_created	directus_users	\N	\N	\N	\N	\N	nullify
44	services	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
45	services	link	links	\N	\N	\N	\N	\N	nullify
46	users	user_created	directus_users	\N	\N	\N	\N	\N	nullify
47	users	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
48	users	logo	directus_files	\N	\N	\N	\N	\N	nullify
49	blogs	logo	directus_files	\N	\N	\N	\N	\N	nullify
50	navigations_children	user_created	directus_users	\N	\N	\N	\N	\N	nullify
51	navigations_children	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
54	navigations_navigations_children	navigations_children_id	navigations_children	\N	\N	\N	navigations_id	\N	nullify
55	navigations_navigations_children	navigations_id	navigations	nav_children	\N	\N	navigations_children_id	\N	nullify
66	jp_news	user_created	directus_users	\N	\N	\N	\N	\N	nullify
67	jp_news	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
68	jp_develop	user_created	directus_users	\N	\N	\N	\N	\N	nullify
69	jp_develop	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
73	jp_develop	url	links	\N	\N	\N	\N	\N	nullify
74	jp_news	url	links	\N	\N	\N	\N	\N	nullify
75	jp_carousel	user_created	directus_users	\N	\N	\N	\N	\N	nullify
76	jp_carousel	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
78	jp_marquee	user_created	directus_users	\N	\N	\N	\N	\N	nullify
79	jp_marquee	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
37	navigations_links_2	navigations_id	navigations	\N	\N	\N	links_id	\N	nullify
84	navigations	url	links	\N	\N	\N	\N	\N	nullify
85	navigations_children	url	links	\N	\N	\N	\N	\N	nullify
88	jp_develop	image	directus_files	\N	\N	\N	\N	\N	nullify
89	jp_marquee	image	directus_files	\N	\N	\N	\N	\N	nullify
90	jp_carousel	image	directus_files	\N	\N	\N	\N	\N	nullify
121	jp_techstack	user_created	directus_users	\N	\N	\N	\N	\N	nullify
122	jp_techstack	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
123	jp_techstack_image	user_created	directus_users	\N	\N	\N	\N	\N	nullify
124	jp_techstack_image	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
126	jp_techstack_image	linkto	jp_techstack	\N	\N	\N	\N	\N	nullify
127	jp_techstack_image	image	directus_files	\N	\N	\N	\N	\N	nullify
132	services	image	directus_files	\N	\N	\N	\N	\N	nullify
133	jp_about	user_created	directus_users	\N	\N	\N	\N	\N	nullify
134	jp_about	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
135	jp_about	image	directus_files	\N	\N	\N	\N	\N	nullify
136	jp_about_item	user_created	directus_users	\N	\N	\N	\N	\N	nullify
137	jp_about_item	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
138	jp_about_item	image_src	directus_files	\N	\N	\N	\N	\N	nullify
139	jp_about_item	icon_src	directus_files	\N	\N	\N	\N	\N	nullify
140	jp_about_item	linkto	jp_about	jp_about_item	\N	\N	\N	\N	nullify
141	jp_about_text	user_created	directus_users	\N	\N	\N	\N	\N	nullify
142	jp_about_text	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
143	jp_about_text	linkto	jp_about	jp_about_text	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1545	1709	directus_files	7701551a-80b0-48b4-9da7-bc7cea8bdec2	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company","filename_download":"company.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company","filename_download":"company.png","type":"image/png","storage":"azure"}	\N	\N
1546	1710	directus_files	ad58e314-2deb-4a69-85e5-7ea63e043691	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 4","filename_download":"company-4.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 4","filename_download":"company-4.png","type":"image/png","storage":"azure"}	\N	\N
1547	1711	directus_files	d34afa1b-9431-4df0-8cb7-5e0e2a3621ed	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 1","filename_download":"company-1.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 1","filename_download":"company-1.png","type":"image/png","storage":"azure"}	\N	\N
1548	1712	directus_files	9f75622f-5815-4986-909a-0d8af58bf7c0	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 5","filename_download":"company-5.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 5","filename_download":"company-5.png","type":"image/png","storage":"azure"}	\N	\N
1549	1713	directus_files	4163551b-371b-4256-888f-c9e2924988a0	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Istqb","filename_download":"istqb.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Istqb","filename_download":"istqb.png","type":"image/png","storage":"azure"}	\N	\N
1550	1714	directus_files	d83dcde1-2f9f-490b-b7b8-50c6353413bb	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Sao Khue","filename_download":"sao_khue.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Sao Khue","filename_download":"sao_khue.png","type":"image/png","storage":"azure"}	\N	\N
1551	1715	directus_files	de92ea69-8230-4b99-9ec6-3739df6effe1	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Salesforce Partner","filename_download":"salesforce-partner.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Salesforce Partner","filename_download":"salesforce-partner.png","type":"image/png","storage":"azure"}	\N	\N
1552	1716	directus_files	a05da9d6-6101-43c8-9061-d8f80f1f30e7	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 3","filename_download":"company-3.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 3","filename_download":"company-3.png","type":"image/png","storage":"azure"}	\N	\N
1553	1717	directus_files	ad0a3b86-7ad6-4aa4-8691-ef2134df633b	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Vietnam Top 100","filename_download":"vietnam_top_100.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Vietnam Top 100","filename_download":"vietnam_top_100.png","type":"image/png","storage":"azure"}	\N	\N
1554	1718	directus_files	26814cd7-0381-4003-8c40-09b312834e74	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 2","filename_download":"company-2.png","type":"image/png","storage":"azure"}	{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31","title":"Company 2","filename_download":"company-2.png","type":"image/png","storage":"azure"}	\N	\N
1555	1719	directus_files	d4627602-e266-454f-bfec-e50ce12d4e64	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service","filename_download":"service.png","type":"image/png","storage":"azure"}	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service","filename_download":"service.png","type":"image/png","storage":"azure"}	\N	\N
1556	1720	directus_files	549ce2e3-03f3-4621-98e4-14ce619ef01c	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service 1","filename_download":"service-1.png","type":"image/png","storage":"azure"}	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service 1","filename_download":"service-1.png","type":"image/png","storage":"azure"}	\N	\N
1557	1721	directus_files	0f6d3f6c-d00b-460d-9ad1-dd419285b3d6	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service 2","filename_download":"service-2.png","type":"image/png","storage":"azure"}	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service 2","filename_download":"service-2.png","type":"image/png","storage":"azure"}	\N	\N
1558	1722	directus_files	fcdb1c97-a2bc-4109-ab77-649037a19f0e	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service 3","filename_download":"service-3.png","type":"image/png","storage":"azure"}	{"folder":"caabc4a8-c4e4-40f4-9b9d-92ecfb3b7eb3","title":"Service 3","filename_download":"service-3.png","type":"image/png","storage":"azure"}	\N	\N
1559	1723	directus_files	5400aa1d-4303-49a5-971c-4db4ac2ce952	{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4","title":"Background Develop","filename_download":"background-develop.png","type":"image/png","storage":"azure"}	{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4","title":"Background Develop","filename_download":"background-develop.png","type":"image/png","storage":"azure"}	\N	\N
1560	1724	directus_files	2c9ae88d-dde2-4066-a352-491ec71dd805	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 1","filename_download":"ts-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 1","filename_download":"ts-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1561	1725	directus_files	388720df-d81f-4887-a19c-29dcf1c3d7db	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 7","filename_download":"ts-7.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 7","filename_download":"ts-7.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1562	1726	directus_files	6b21841e-3b5a-4aed-9139-a50a5e716b76	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 13","filename_download":"ts-13.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 13","filename_download":"ts-13.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1563	1727	directus_files	873ceb2a-72f4-4da6-b4a9-0a9dc978f046	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 1","filename_download":"ts-19-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 1","filename_download":"ts-19-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1564	1728	directus_files	b3f5281a-a99e-4814-8bc2-65c9a9027343	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 3","filename_download":"ts-19-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 3","filename_download":"ts-19-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1565	1729	directus_files	b1815bb8-6c29-4537-bc7f-790901d29b67	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 2","filename_download":"ts-19-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 2","filename_download":"ts-19-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1566	1730	directus_files	6c1634f5-1a38-413f-b838-ced9c6202235	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 4","filename_download":"ts-19-4.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 19 4","filename_download":"ts-19-4.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1567	1731	directus_files	2c9ae88d-dde2-4066-a352-491ec71dd805	{"id":"2c9ae88d-dde2-4066-a352-491ec71dd805","storage":"azure","filename_disk":"2c9ae88d-dde2-4066-a352-491ec71dd805.svg","filename_download":"ts-1.svg","title":"TS 1","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:19:14.312Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"37745","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:19:14.634Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1568	1732	directus_files	388720df-d81f-4887-a19c-29dcf1c3d7db	{"id":"388720df-d81f-4887-a19c-29dcf1c3d7db","storage":"azure","filename_disk":"388720df-d81f-4887-a19c-29dcf1c3d7db.svg","filename_download":"ts-7.svg","title":"TS 7","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:19:14.330Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"357787","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:19:14.848Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1569	1733	directus_files	6b21841e-3b5a-4aed-9139-a50a5e716b76	{"id":"6b21841e-3b5a-4aed-9139-a50a5e716b76","storage":"azure","filename_disk":"6b21841e-3b5a-4aed-9139-a50a5e716b76.svg","filename_download":"ts-13.svg","title":"TS 13","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:19:14.356Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"196773","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:19:14.896Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1570	1734	directus_files	6c1634f5-1a38-413f-b838-ced9c6202235	{"id":"6c1634f5-1a38-413f-b838-ced9c6202235","storage":"azure","filename_disk":"6c1634f5-1a38-413f-b838-ced9c6202235.svg","filename_download":"ts-19-4.svg","title":"TS 19 4","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:20:16.601Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"40430","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:20:16.908Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1571	1735	directus_files	873ceb2a-72f4-4da6-b4a9-0a9dc978f046	{"id":"873ceb2a-72f4-4da6-b4a9-0a9dc978f046","storage":"azure","filename_disk":"873ceb2a-72f4-4da6-b4a9-0a9dc978f046.svg","filename_download":"ts-19-1.svg","title":"TS 19 1","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:19:14.382Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"28254","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:19:14.688Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1572	1736	directus_files	b1815bb8-6c29-4537-bc7f-790901d29b67	{"id":"b1815bb8-6c29-4537-bc7f-790901d29b67","storage":"azure","filename_disk":"b1815bb8-6c29-4537-bc7f-790901d29b67.svg","filename_download":"ts-19-2.svg","title":"TS 19 2","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:19:14.391Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"48188","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:19:14.704Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1573	1737	directus_files	b3f5281a-a99e-4814-8bc2-65c9a9027343	{"id":"b3f5281a-a99e-4814-8bc2-65c9a9027343","storage":"azure","filename_disk":"b3f5281a-a99e-4814-8bc2-65c9a9027343.svg","filename_download":"ts-19-3.svg","title":"TS 19 3","type":"image/svg+xml","folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2024-12-19T06:19:14.390Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z","charset":null,"filesize":"17427","width":null,"height":null,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":null,"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2024-12-19T06:19:14.693Z"}	{"folder":"2f74c38b-0eb5-47ca-8449-8e01b1b19df4","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2024-12-19T06:20:38.850Z"}	\N	\N
1574	1738	directus_files	7716cc3f-8c21-47ff-ac5f-ad7d2b864718	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 2","filename_download":"ts-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 2","filename_download":"ts-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1575	1739	directus_files	b25ba673-e5e1-4187-beec-ba8a3cfc76c7	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 14","filename_download":"ts-14.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 14","filename_download":"ts-14.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1576	1740	directus_files	95a37fc0-645d-4d5e-8349-e727784abc24	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 8","filename_download":"ts-8.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 8","filename_download":"ts-8.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1577	1741	directus_files	9bd5e5b3-df48-4356-9951-a3f624eb4042	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 2","filename_download":"ts-20-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 2","filename_download":"ts-20-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1582	1746	directus_files	a0d21d1c-54ff-45e7-984f-591b8ae9be63	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 4","filename_download":"ts-20-4.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 4","filename_download":"ts-20-4.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1585	1749	directus_files	fbefceae-bb19-44cc-aa2b-7e176277639a	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 15","filename_download":"ts-15.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 15","filename_download":"ts-15.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1578	1742	directus_files	0554f909-08d6-4fa1-8194-3dcb2d0fb2c7	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 1","filename_download":"ts-20-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 1","filename_download":"ts-20-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1586	1750	directus_files	08f0dc33-94b4-4c53-8c98-e5adb3954a44	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 3","filename_download":"ts-21-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 3","filename_download":"ts-21-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1579	1743	directus_files	d617e2d3-d26f-4562-b0c3-46e5bc068016	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 3","filename_download":"ts-20-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 3","filename_download":"ts-20-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1580	1744	directus_files	be53a4c4-098a-45ea-91db-b6ae2669564a	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 6","filename_download":"ts-20-6.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 6","filename_download":"ts-20-6.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1581	1745	directus_files	f9f5e6bc-cfd0-4e48-b493-a0c307891ec1	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 5","filename_download":"ts-20-5.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"67c86201-a81c-44ad-822f-281f5d2cac4b","title":"TS 20 5","filename_download":"ts-20-5.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1583	1747	directus_files	b05090ee-719d-4d8a-9256-d6975a0ad377	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 3","filename_download":"ts-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 3","filename_download":"ts-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1584	1748	directus_files	58a7a9de-2217-427c-b371-5201f5901778	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 9","filename_download":"ts-9.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 9","filename_download":"ts-9.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1590	1754	directus_files	c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 5","filename_download":"ts-21-5.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 5","filename_download":"ts-21-5.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1594	1758	directus_files	fc99029a-d177-4d2b-b87e-0052c6bf00d9	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 10","filename_download":"ts-10.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 10","filename_download":"ts-10.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1597	1761	directus_files	70226b1b-320c-4635-8701-ec36629ee48d	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 3","filename_download":"ts-22-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 3","filename_download":"ts-22-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1598	1762	directus_files	4d745ef1-47c9-4a7a-be10-fdd3538fbcb7	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 1","filename_download":"ts-22-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 1","filename_download":"ts-22-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1602	1766	directus_files	8fc15695-313c-4fb4-b4e4-7e36692da213	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 24 1","filename_download":"ts-24-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 24 1","filename_download":"ts-24-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1587	1751	directus_files	3a3ab399-08aa-47df-9740-96ba1319c000	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 2","filename_download":"ts-21-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 2","filename_download":"ts-21-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1589	1753	directus_files	15331689-8d96-46c4-8f5f-20ab35f8adb1	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 4","filename_download":"ts-21-4.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 4","filename_download":"ts-21-4.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1591	1755	directus_files	29df87d8-1ac1-4386-b814-ffa951aa5bca	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 6","filename_download":"ts-21-6.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 6","filename_download":"ts-21-6.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1592	1756	directus_files	2d280990-e1ac-4c49-9c59-73a439541ec8	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 4","filename_download":"ts-4.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 4","filename_download":"ts-4.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1595	1759	directus_files	a3aa6e44-9ada-4950-be23-88143059ecc6	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 2","filename_download":"ts-22-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 2","filename_download":"ts-22-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1604	1768	directus_files	3984281c-1bdd-490a-9f0a-c0d22b1e9d4d	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 24 3","filename_download":"ts-24-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 24 3","filename_download":"ts-24-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1588	1752	directus_files	c7d84063-d35e-4369-be6e-2c4c488e13ea	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 1","filename_download":"ts-21-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"be7eb220-8cfd-4826-88cd-5cd935feb8bf","title":"TS 21 1","filename_download":"ts-21-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1593	1757	directus_files	80b3a5b9-5051-498e-9d7a-a651226b6b04	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 16","filename_download":"ts-16.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 16","filename_download":"ts-16.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1596	1760	directus_files	965b9bf2-a506-44a2-a04e-23f7d621b6ef	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 4","filename_download":"ts-22-4.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"e8636db1-0c68-42de-bd47-659273618d25","title":"TS 22 4","filename_download":"ts-22-4.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1599	1763	directus_files	e2d61f86-ffb9-47ad-a944-653121e6f024	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 5","filename_download":"ts-5.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 5","filename_download":"ts-5.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1600	1764	directus_files	61e1014d-d557-415c-848b-57c93d6c3107	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 11","filename_download":"ts-11.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 11","filename_download":"ts-11.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1601	1765	directus_files	f7fd38cc-e4ee-4bcc-9c7a-6d8c6e6d8b95	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 17","filename_download":"ts-17.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 17","filename_download":"ts-17.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1603	1767	directus_files	6c863c97-67fe-43ba-bc89-99e946ab0aae	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 24 2","filename_download":"ts-24-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 24 2","filename_download":"ts-24-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1605	1769	jp_marquee	1	{"id":1,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:17:49.883Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:27.736Z","alt":"Image","catetory":"transaction","image":"26814cd7-0381-4003-8c40-09b312834e74"}	{"image":"26814cd7-0381-4003-8c40-09b312834e74","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:27.736Z"}	\N	\N
1606	1770	jp_marquee	2	{"id":2,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:02.343Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:37.130Z","alt":"Image","catetory":"transaction","image":"a05da9d6-6101-43c8-9061-d8f80f1f30e7"}	{"image":"a05da9d6-6101-43c8-9061-d8f80f1f30e7","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:37.130Z"}	\N	\N
1607	1771	jp_marquee	3	{"id":3,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:09.209Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:45.835Z","alt":"Image","catetory":"transaction","image":"7701551a-80b0-48b4-9da7-bc7cea8bdec2"}	{"image":"7701551a-80b0-48b4-9da7-bc7cea8bdec2","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:45.835Z"}	\N	\N
1608	1772	jp_marquee	4	{"id":4,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:15.066Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:52.708Z","alt":"Image","catetory":"transaction","image":"9f75622f-5815-4986-909a-0d8af58bf7c0"}	{"image":"9f75622f-5815-4986-909a-0d8af58bf7c0","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:25:52.708Z"}	\N	\N
1609	1773	jp_marquee	5	{"id":5,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:24.667Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:01.339Z","alt":"Image","catetory":"transaction","image":"ad58e314-2deb-4a69-85e5-7ea63e043691"}	{"image":"ad58e314-2deb-4a69-85e5-7ea63e043691","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:01.339Z"}	\N	\N
1610	1774	jp_marquee	6	{"id":6,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:29.321Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:10.308Z","alt":"Image","catetory":"transaction","image":"d34afa1b-9431-4df0-8cb7-5e0e2a3621ed"}	{"image":"d34afa1b-9431-4df0-8cb7-5e0e2a3621ed","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:10.308Z"}	\N	\N
1611	1775	jp_marquee	7	{"id":7,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:38.066Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:16.427Z","alt":"Image","catetory":"badge","image":"ad0a3b86-7ad6-4aa4-8691-ef2134df633b"}	{"image":"ad0a3b86-7ad6-4aa4-8691-ef2134df633b","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:16.427Z"}	\N	\N
1612	1776	jp_marquee	8	{"id":8,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:44.473Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:24.023Z","alt":"Image","catetory":"badge","image":"de92ea69-8230-4b99-9ec6-3739df6effe1"}	{"image":"de92ea69-8230-4b99-9ec6-3739df6effe1","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:24.023Z"}	\N	\N
1613	1777	jp_marquee	9	{"id":9,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:53.857Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:35.261Z","alt":"Image","catetory":"badge","image":"d83dcde1-2f9f-490b-b7b8-50c6353413bb"}	{"image":"d83dcde1-2f9f-490b-b7b8-50c6353413bb","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:35.261Z"}	\N	\N
1614	1778	jp_marquee	10	{"id":10,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:00.362Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:43.082Z","alt":"Image","catetory":"badge","image":"4163551b-371b-4256-888f-c9e2924988a0"}	{"image":"4163551b-371b-4256-888f-c9e2924988a0","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:26:43.082Z"}	\N	\N
2027	2261	directus_fields	260	{"sort":8,"interface":"list-o2m","special":["o2m"],"collection":"jp_tech_stacks","field":"list_item"}	{"sort":8,"interface":"list-o2m","special":["o2m"],"collection":"jp_tech_stacks","field":"list_item"}	\N	\N
1615	1779	jp_develop	1	{"id":1,"status":"published","user_created":"f270b2d4-78c6-48b3-a138-f1f77f74c768","date_created":"2024-12-17T09:46:02.883Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:27:11.533Z","title":"タイトル","description":"Data Impactは、親会社であるHeadwatersとともに、マイクロソフト、ソニー、Nvidiaといった世界有数の企業の公式パートナーです。","image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","url":35}	{"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:27:11.533Z"}	\N	\N
1616	1780	jp_develop	2	{"id":2,"status":"published","user_created":"f270b2d4-78c6-48b3-a138-f1f77f74c768","date_created":"2024-12-17T09:46:24.581Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:27:22.214Z","title":"タイトル","description":"を競争力のあるコストと優れた品質で提供します。","image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","url":35}	{"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:27:22.214Z"}	\N	\N
1617	1781	jp_develop	3	{"id":3,"status":"published","user_created":"f270b2d4-78c6-48b3-a138-f1f77f74c768","date_created":"2024-12-17T09:46:36.092Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:27:27.947Z","title":"タイトル","description":"お客様のプロセスの最適化とビジネスパフォーマンスの向上に貢献することをお約束します。","image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","url":35}	{"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-19T06:27:27.947Z"}	\N	\N
1618	1789	services	7	{"id":7,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T06:54:34.199Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:06.653Z","title":"データサイエンス","content":"当社は、データ の収集から基盤の構築、加工、分析ツールの導入、可視化、レポーティング、運用まで、ビッグデータを最大限に活用できるよう一貫したサービスを行います。具体的には、DataBricks、SnowFlake、Microsoft Fabricなどの最新のクラウドベースのデータプラットフォームを活用し、効率的かつスケーラブルなデータ処理基盤を提供します。貴社が保有するデータと対話し、隠れた機会を見出し、潜在リスクを特定することで、ビジネスに真の価値をもたらすソリューションを提供します。","link":27,"language":"jp","image":"d4627602-e266-454f-bfec-e50ce12d4e64"}	{"image":"d4627602-e266-454f-bfec-e50ce12d4e64","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:06.653Z"}	\N	\N
1619	1790	services	9	{"id":9,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:00:39.216Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:17.028Z","title":"システム開発","content":"業務システム、基幹システム、Webサービス、モバイルアプリなど多様なニーズに対応し、要件定義、設計、実装、テスト、運用の各フェーズに専門エンジニアが対応します。新規開発はもちろん、既存システムの改善や保守にも柔軟に対応し、クラウドネイティブ、Microservices、APIファースト、コンテナ化（Docker/Kubernetes）、CI/CD（継続的インテグレーション／継続的デリバリー）など、最新のWeb開発技術を活用した、拡張性と安定性に優れたシステム開発ソリューションを提供します。","link":29,"language":"jp","image":"549ce2e3-03f3-4621-98e4-14ce619ef01c"}	{"image":"549ce2e3-03f3-4621-98e4-14ce619ef01c","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:17.028Z"}	\N	\N
1620	1791	services	8	{"id":8,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:00:05.144Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:28.534Z","title":"AIソリューション","content":"AIと業務システムを統合した包括的なソリューションを提供します。当社は、特徴分析や特徴抽出、予測モデル、レコメンドシステム、画像処理（コンピュータビジョン）、音声認識、生成AI（Generative AI）、LLM（大規模言語モデル）、RAG（Retrieval-Augmented Generation）など、最先端のAI技術を駆使して、幅広い分野で豊富な実績を有しています。さらに、当社は、AIモデルのトレーニングから運用までを一貫してサポートし、クライアントの要件定義、技術選定、開発、展開に至るまで、ワンストップでサービスを提供します。画像認識、音声認識、NLP（自然言語処理）、そして生成AIを組み合わせた革新的なソリューションで、ビジネスの成長を支援します。","link":28,"language":"jp","image":"0f6d3f6c-d00b-460d-9ad1-dd419285b3d6"}	{"image":"0f6d3f6c-d00b-460d-9ad1-dd419285b3d6","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:28.534Z"}	\N	\N
1621	1792	services	10	{"id":10,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:01:21.031Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:37.967Z","title":"DX推進支援","content":"貴社のDX推進においてアイディアソンやハンズオンを通じてアイデアを具体化し、問題解決へと導くプロセスのコンサルティングを提供し、戦略立案から実行までを一貫して支援します。DX推進に必要なシステムモダナイゼーションにも対応し、既存のシステムを最新技術にアップグレードすることで、貴社のデジタル変革を加速し、業務の効率性向上と競争力強化を実現します。","link":30,"language":"jp","image":"fcdb1c97-a2bc-4109-ab77-649037a19f0e"}	{"image":"fcdb1c97-a2bc-4109-ab77-649037a19f0e","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T06:40:37.967Z"}	\N	\N
1622	1794	directus_fields	218	{"id":218,"collection":"jp_news","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"},"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_news","field":"url","display":"related-values","display_options":{"template":"{{url}}"}}	\N	\N
1623	1795	jp_news	5	{"date":"2024-12-25","description":"1231231","url":27}	{"date":"2024-12-25","description":"1231231","url":27}	\N	\N
1624	1796	directus_fields	218	{"id":218,"collection":"jp_news","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}{{status}}"},"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_news","field":"url","display_options":{"template":"{{url}}{{status}}"}}	\N	\N
1625	1797	directus_fields	218	{"id":218,"collection":"jp_news","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"},"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_news","field":"url","display_options":{"template":"{{url}}"}}	\N	\N
1626	1798	directus_fields	236	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	\N	\N
1627	1799	directus_fields	237	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"test"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"test"}	\N	\N
1628	1800	directus_fields	238	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test"}	\N	\N
1629	1801	directus_fields	239	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test"}	\N	\N
1630	1802	directus_fields	240	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test"}	\N	\N
1631	1803	directus_fields	241	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test"}	\N	\N
1632	1804	directus_collections	test	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test"}	\N	\N
1633	1805	directus_fields	242	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"required":false,"options":{"template":"{{url}}"},"collection":"test","field":"url"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"required":false,"options":{"template":"{{url}}"},"collection":"test","field":"url"}	\N	\N
1634	1806	directus_fields	242	{"id":242,"collection":"test","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"test","field":"url","display":"related-values","display_options":{"template":"{{url}}"}}	\N	\N
1636	1809	directus_files	1e874b8a-04b6-4b9c-a5ba-749c38d8a004	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"Slide 02","filename_download":"Slide-02.webp","type":"image/webp","storage":"azure"}	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"Slide 02","filename_download":"Slide-02.webp","type":"image/webp","storage":"azure"}	\N	\N
1637	1808	directus_files	3e2bd5e5-09da-4abd-89a4-ef410f87185b	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"Slide 01","filename_download":"Slide-01.webp","type":"image/webp","storage":"azure"}	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"Slide 01","filename_download":"Slide-01.webp","type":"image/webp","storage":"azure"}	\N	\N
1638	1810	directus_files	cfa88e35-2afb-4fd8-ab88-f3033b908f6e	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"Slide 03","filename_download":"Slide-03.webp","type":"image/webp","storage":"azure"}	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"Slide 03","filename_download":"Slide-03.webp","type":"image/webp","storage":"azure"}	\N	\N
1639	1811	directus_files	8d4ca320-cfdf-4005-a385-a2777b942890	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 6","filename_download":"ts-6.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 6","filename_download":"ts-6.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1640	1812	directus_files	d126a2a6-2b09-452a-9f3d-0a2491a1dbad	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 12","filename_download":"ts-12.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 12","filename_download":"ts-12.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2028	2263	directus_fields	261	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack"}	\N	\N
1641	1813	directus_files	118c67f9-a60f-4a62-bacc-b4700658d37a	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 24 1","filename_download":"ts-24-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 24 1","filename_download":"ts-24-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1642	1814	directus_files	8cbce33a-dfcc-44cc-bee4-4479b488f307	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 24 3","filename_download":"ts-24-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 24 3","filename_download":"ts-24-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1643	1815	directus_files	e49bc8e4-b8f9-4517-b8d0-8c1d60aea537	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 18","filename_download":"ts-18.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 18","filename_download":"ts-18.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1644	1816	directus_files	3786ea60-385b-4738-a83e-dced7be6559b	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 24 2","filename_download":"ts-24-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"3668e451-3e54-4ed8-9356-ee28d42ace97","title":"TS 24 2","filename_download":"ts-24-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1645	1820	directus_files	0525446c-a58a-44f0-8cc9-d26fc03f96af	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 1","filename_download":"ts-23-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 1","filename_download":"ts-23-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1648	1823	directus_files	74edc2e8-376a-403c-bb85-7face8a4191c	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 5","filename_download":"ts-23-5.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 5","filename_download":"ts-23-5.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1646	1821	directus_files	bb161d17-d6a7-47a9-839b-9016d1a4eb3e	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 2","filename_download":"ts-23-2.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 2","filename_download":"ts-23-2.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1649	1824	directus_files	137575ba-da54-4f43-9999-3d28590ed360	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 4","filename_download":"ts-23-4.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 4","filename_download":"ts-23-4.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
1647	1822	directus_files	339f955a-1a02-4429-be47-ab2a78631d8a	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 3","filename_download":"ts-23-3.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 3","filename_download":"ts-23-3.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2029	2264	directus_fields	262	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack"}	\N	\N
2030	2265	directus_fields	263	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack"}	\N	\N
2031	2266	directus_fields	264	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack"}	\N	\N
2032	2267	directus_fields	265	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack"}	\N	\N
2033	2268	directus_fields	266	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack"}	\N	\N
2034	2269	directus_collections	jp_techstack	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack"}	\N	\N
2035	2270	directus_fields	267	{"sort":7,"interface":"input","special":null,"collection":"jp_techstack","field":"title"}	{"sort":7,"interface":"input","special":null,"collection":"jp_techstack","field":"title"}	\N	\N
2345	2585	directus_fields	316	{"id":316,"collection":"jp_techstack_image","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_techstack_image","field":"image","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"}}	\N	\N
2398	2653	jp_techstack_image	1	{"image":"e49bc8e4-b8f9-4517-b8d0-8c1d60aea537","linkto":1}	{"image":"e49bc8e4-b8f9-4517-b8d0-8c1d60aea537","linkto":1}	\N	\N
2401	2659	directus_collections	jp_techstack_image	{"collection":"jp_techstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"jp_techstack","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"jp_techstack"}	\N	\N
2402	2660	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
2403	2661	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2123	2358	directus_collections	jp_techstack	{"collection":"jp_techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"jp_teckstack_image","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"jp_teckstack_image"}	\N	\N
2124	2359	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
2125	2360	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2126	2361	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2127	2362	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2128	2363	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
2129	2364	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
2036	2271	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
2037	2272	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2038	2273	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2039	2274	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2040	2275	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
2041	2276	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
2042	2277	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
2043	2278	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2044	2279	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2045	2280	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2046	2281	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2047	2282	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2048	2283	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2049	2284	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2050	2285	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2051	2286	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2052	2287	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
2053	2288	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
2054	2289	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2055	2290	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2056	2291	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2057	2292	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
1799	2020	directus_fields	161	{"id":161,"collection":"navigations_children","field":"link","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigations_children","field":"link","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"}}	\N	\N
1800	2021	directus_fields	161	{"id":161,"collection":"navigations_children","field":"link","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"navigations_children","field":"link","display":"related-values"}	\N	\N
2058	2293	directus_collections	jp_techstack	{"collection":"jp_techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2059	2294	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2060	2295	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2061	2296	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
2062	2297	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2130	2365	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
1801	2022	jp_carousel	1	{"id":1,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:11.006Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T09:00:07.159Z","image":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004","alt":"Image"}	{"image":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T09:00:07.159Z"}	\N	\N
1802	2023	jp_carousel	2	{"id":2,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:15.672Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T09:00:12.686Z","image":"3e2bd5e5-09da-4abd-89a4-ef410f87185b","alt":"Image"}	{"image":"3e2bd5e5-09da-4abd-89a4-ef410f87185b","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T09:00:12.686Z"}	\N	\N
1803	2024	jp_carousel	3	{"id":3,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:20.339Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T09:00:17.993Z","image":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e","alt":"Image"}	{"image":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-24T09:00:17.993Z"}	\N	\N
2131	2366	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2132	2367	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2435	2693	jp_techstack_image	6	{"image":"118c67f9-a60f-4a62-bacc-b4700658d37a","linkto":1}	{"image":"118c67f9-a60f-4a62-bacc-b4700658d37a","linkto":1}	\N	\N
2440	2698	jp_techstack_image	11	{"image":"b1815bb8-6c29-4537-bc7f-790901d29b67","linkto":2}	{"image":"b1815bb8-6c29-4537-bc7f-790901d29b67","linkto":2}	\N	\N
2133	2368	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2134	2369	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2135	2370	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2136	2371	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2137	2372	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
1805	2027	navigations	11	{"title":"123","links":{"create":[{"navigations_id":"+","links_id":{"id":30}}],"update":[],"delete":[]}}	{"title":"123","links":{"create":[{"navigations_id":"+","links_id":{"id":30}}],"update":[],"delete":[]}}	\N	\N
1804	2026	navigations_links_2	10	{"navigations_id":11,"links_id":{"id":30}}	{"navigations_id":11,"links_id":{"id":30}}	1805	\N
1815	2038	navigations	9	{"id":9,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:43:59.091Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:56.588Z","title":"Tech Blog","language":"jp","url":26,"nav_children":[]}	{"url":26,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:56.588Z"}	\N	\N
1835	2062	directus_fields	245	{"id":245,"collection":"jp_carousel","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":null},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_carousel","field":"url","display":"image"}	\N	\N
1846	2073	jp_marquee	3	{"id":3,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:09.209Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:19.081Z","alt":"Image","catetory":"transaction","image":"7701551a-80b0-48b4-9da7-bc7cea8bdec2"}	{"image":"7701551a-80b0-48b4-9da7-bc7cea8bdec2","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:19.081Z"}	\N	\N
1849	2076	jp_marquee	6	{"id":6,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:29.321Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:41.750Z","alt":"Image","catetory":"transaction","image":"d34afa1b-9431-4df0-8cb7-5e0e2a3621ed"}	{"image":"d34afa1b-9431-4df0-8cb7-5e0e2a3621ed","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:41.750Z"}	\N	\N
2063	2298	directus_fields	268	{"sort":9,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"jp_teckstack_image","field":"list_item"}	{"sort":9,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"jp_teckstack_image","field":"list_item"}	\N	\N
2064	2299	directus_fields	269	{"sort":8,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"jp_techstack","field":"list_item"}	{"sort":8,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"jp_techstack","field":"list_item"}	\N	\N
2138	2373	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2139	2374	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2140	2375	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
1926	2157	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
1927	2158	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
1928	2159	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
1929	2160	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
1930	2161	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
1806	2029	directus_fields	243	{"sort":13,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{url}}"},"collection":"navigations","field":"url"}	{"sort":13,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{url}}"},"collection":"navigations","field":"url"}	\N	\N
1810	2033	navigations	4	{"id":4,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:31:39.082Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:08:42.093Z","title":"トップページ","language":"jp","url":21,"nav_children":[]}	{"url":21,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:08:42.093Z"}	\N	\N
1816	2039	directus_fields	243	{"id":243,"collection":"navigations","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{url}}"},"display":"related-values","display_options":{"template":"{{url}}"},"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"navigations","field":"url","display":"related-values","display_options":{"template":"{{url}}"}}	\N	\N
1826	2052	directus_fields	245	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{filename_disk}}"},"display":null,"collection":"jp_carousel","field":"url"}	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{filename_disk}}"},"display":null,"collection":"jp_carousel","field":"url"}	\N	\N
1827	2053	directus_fields	246	{"sort":1,"special":["o2m"],"interface":"list-o2m","collection":"directus_files","field":"jp_carousel"}	{"sort":1,"special":["o2m"],"interface":"list-o2m","collection":"directus_files","field":"jp_carousel"}	\N	\N
1828	2054	jp_carousel	1	{"id":1,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:11.006Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T08:21:59.653Z","image":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004","alt":"Image","url":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004"}	{"url":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T08:21:59.653Z"}	\N	\N
1836	2063	directus_fields	248	{"sort":11,"special":["m2o"],"collection":"jp_develop","field":"image"}	{"sort":11,"special":["m2o"],"collection":"jp_develop","field":"image"}	\N	\N
1847	2074	jp_marquee	4	{"id":4,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:15.066Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:24.925Z","alt":"Image","catetory":"transaction","image":"9f75622f-5815-4986-909a-0d8af58bf7c0"}	{"image":"9f75622f-5815-4986-909a-0d8af58bf7c0","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:24.925Z"}	\N	\N
1852	2079	jp_marquee	9	{"id":9,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:53.857Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:03:03.646Z","alt":"Image","catetory":"badge","image":"d83dcde1-2f9f-490b-b7b8-50c6353413bb"}	{"image":"d83dcde1-2f9f-490b-b7b8-50c6353413bb","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:03:03.646Z"}	\N	\N
1859	2089	directus_fields	248	{"id":248,"collection":"jp_develop","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_develop","field":"image","interface":"file-image"}	\N	\N
2065	2300	directus_fields	270	{"sort":9,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{image}}"},"collection":"jp_techstack","field":"list"}	{"sort":9,"interface":"list-o2m","special":["o2m"],"options":{"template":"{{image}}"},"collection":"jp_techstack","field":"list"}	\N	\N
2141	2376	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
1931	2162	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2346	2586	directus_fields	318	{"sort":9,"special":["m2o"],"display":null,"interface":null,"collection":"jp_techstack_image","field":"link_to"}	{"sort":9,"special":["m2o"],"display":null,"interface":null,"collection":"jp_techstack_image","field":"link_to"}	\N	\N
2399	2654	jp_techstack_image	1	{"id":1,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2024-12-31T08:11:22.084Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-31T08:11:25.283Z","linkto":1,"image":"e49bc8e4-b8f9-4517-b8d0-8c1d60aea537"}	{"status":"published","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-31T08:11:25.283Z"}	\N	\N
2442	2700	jp_techstack_image	13	{"linkto":2,"image":"873ceb2a-72f4-4da6-b4a9-0a9dc978f046"}	{"linkto":2,"image":"873ceb2a-72f4-4da6-b4a9-0a9dc978f046"}	\N	\N
2404	2662	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2443	2701	jp_techstack_image	14	{"linkto":3,"image":"a0d21d1c-54ff-45e7-984f-591b8ae9be63"}	{"linkto":3,"image":"a0d21d1c-54ff-45e7-984f-591b8ae9be63"}	\N	\N
1807	2030	navigations	1	{"id":1,"status":"published","user_created":"feab763e-788a-48ac-b524-bff99fc14360","date_created":"2024-11-19T07:48:20.359Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:07:57.496Z","title":"Tuyển dụng","language":"vn","url":1,"nav_children":[]}	{"url":1,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:07:57.496Z"}	\N	\N
1818	2041	navigations_children	1	{"id":1,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:51:17.029Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:11:43.181Z","link":27,"title":"データサイエンス","language":"jp","url":31}	{"url":31,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:11:43.181Z"}	\N	\N
1821	2044	navigations_children	4	{"id":4,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:51:57.145Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:12:10.165Z","link":30,"title":"DX推進支援","language":"jp","url":30}	{"url":30,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:12:10.165Z"}	\N	\N
1829	2055	jp_carousel	2	{"id":2,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:15.672Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T08:22:19.626Z","image":"3e2bd5e5-09da-4abd-89a4-ef410f87185b","alt":"Image","url":"3e2bd5e5-09da-4abd-89a4-ef410f87185b"}	{"url":"3e2bd5e5-09da-4abd-89a4-ef410f87185b","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T08:22:19.626Z"}	\N	\N
1837	2064	directus_fields	248	{"id":248,"collection":"jp_develop","field":"image","special":["m2o"],"interface":"file","options":{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_develop","field":"image","interface":"file","options":{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4"}}	\N	\N
1838	2065	jp_develop	1	{"id":1,"status":"published","user_created":"f270b2d4-78c6-48b3-a138-f1f77f74c768","date_created":"2024-12-17T09:46:02.883Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:41:27.369Z","title":"タイトル","description":"Data Impactは、親会社であるHeadwatersとともに、マイクロソフト、ソニー、Nvidiaといった世界有数の企業の公式パートナーです。","url":35,"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952"}	{"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:41:27.369Z"}	\N	\N
1848	2075	jp_marquee	5	{"id":5,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:24.667Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:32.286Z","alt":"Image","catetory":"transaction","image":"ad58e314-2deb-4a69-85e5-7ea63e043691"}	{"image":"ad58e314-2deb-4a69-85e5-7ea63e043691","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:32.286Z"}	\N	\N
1851	2078	jp_marquee	8	{"id":8,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:44.473Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:55.919Z","alt":"Image","catetory":"badge","image":"de92ea69-8230-4b99-9ec6-3739df6effe1"}	{"image":"de92ea69-8230-4b99-9ec6-3739df6effe1","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:55.919Z"}	\N	\N
1860	2090	directus_fields	248	{"id":248,"collection":"jp_develop","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"91915b07-e44b-47f7-b21d-2fb5d296b0d4"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_develop","field":"image","display":"image"}	\N	\N
1913	2144	directus_fields	251	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_teckstack_image"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_teckstack_image"}	\N	\N
1914	2145	directus_fields	252	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_teckstack_image"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_teckstack_image"}	\N	\N
1915	2146	directus_fields	253	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_teckstack_image"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_teckstack_image"}	\N	\N
1916	2147	directus_fields	254	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_teckstack_image"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_teckstack_image"}	\N	\N
1808	2031	navigations	2	{"id":2,"status":"published","user_created":"feab763e-788a-48ac-b524-bff99fc14360","date_created":"2024-11-19T08:25:34.520Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:08:05.411Z","title":"Tech Blogs","language":"vn","url":2,"nav_children":[]}	{"url":2,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:08:05.411Z"}	\N	\N
1820	2043	navigations_children	3	{"id":3,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:51:46.531Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:12:03.926Z","link":29,"title":"システム開発","language":"jp","url":29}	{"url":29,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:12:03.926Z"}	\N	\N
1830	2056	jp_carousel	3	{"id":3,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:20.339Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T08:22:32.947Z","image":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e","alt":"Image","url":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e"}	{"url":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T08:22:32.947Z"}	\N	\N
1839	2066	jp_develop	2	{"id":2,"status":"published","user_created":"f270b2d4-78c6-48b3-a138-f1f77f74c768","date_created":"2024-12-17T09:46:24.581Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:41:38.149Z","title":"タイトル","description":"を競争力のあるコストと優れた品質で提供します。","url":35,"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952"}	{"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:41:38.149Z"}	\N	\N
1840	2067	jp_develop	3	{"id":3,"status":"published","user_created":"f270b2d4-78c6-48b3-a138-f1f77f74c768","date_created":"2024-12-17T09:46:36.092Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:41:43.013Z","title":"タイトル","description":"お客様のプロセスの最適化とビジネスパフォーマンスの向上に貢献することをお約束します。","url":35,"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952"}	{"image":"5400aa1d-4303-49a5-971c-4db4ac2ce952","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:41:43.013Z"}	\N	\N
1850	2077	jp_marquee	7	{"id":7,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:38.066Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:50.207Z","alt":"Image","catetory":"badge","image":"ad0a3b86-7ad6-4aa4-8691-ef2134df633b"}	{"image":"ad0a3b86-7ad6-4aa4-8691-ef2134df633b","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:50.207Z"}	\N	\N
1853	2080	jp_marquee	10	{"id":10,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:00.362Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:03:08.469Z","alt":"Image","catetory":"badge","image":"4163551b-371b-4256-888f-c9e2924988a0"}	{"image":"4163551b-371b-4256-888f-c9e2924988a0","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:03:08.469Z"}	\N	\N
1861	2091	directus_fields	186	{"id":186,"collection":"jp_tech_stack_images","field":"image","special":["file"],"interface":"file-image","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85","letterbox":true},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_tech_stack_images","field":"image","display":"image"}	\N	\N
1917	2148	directus_fields	255	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_teckstack_image"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_teckstack_image"}	\N	\N
1918	2149	directus_fields	256	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_teckstack_image"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_teckstack_image"}	\N	\N
1919	2150	directus_collections	jp_teckstack_image	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_teckstack_image"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_teckstack_image"}	\N	\N
1932	2163	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
1933	2164	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
1934	2165	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2253	2491	directus_fields	307	{"sort":8,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"techstack_image","field":"linkto"}	{"sort":8,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"techstack_image","field":"linkto"}	\N	\N
1935	2166	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2445	2703	jp_techstack_image	16	{"linkto":3,"image":"7716cc3f-8c21-47ff-ac5f-ad7d2b864718"}	{"linkto":3,"image":"7716cc3f-8c21-47ff-ac5f-ad7d2b864718"}	\N	\N
1809	2032	navigations	3	{"id":3,"status":"published","user_created":"feab763e-788a-48ac-b524-bff99fc14360","date_created":"2024-11-19T08:26:11.655Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:08:15.517Z","title":"Liên Hệ","language":"vn","url":3,"nav_children":[]}	{"url":3,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:08:15.517Z"}	\N	\N
1822	2045	directus_files	0bd72556-0cc5-48dd-bf9d-e307f55d8a2a	{"title":"Company 1","filename_download":"company-1.png","type":"image/png","storage":"azure"}	{"title":"Company 1","filename_download":"company-1.png","type":"image/png","storage":"azure"}	\N	\N
1823	2046	jp_develop	4	{"title":"1","description":"1","image":"0bd72556-0cc5-48dd-bf9d-e307f55d8a2a","url":3}	{"title":"1","description":"1","image":"0bd72556-0cc5-48dd-bf9d-e307f55d8a2a","url":3}	\N	\N
1831	2058	directus_fields	245	{"id":245,"collection":"jp_carousel","field":"url","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":null},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_carousel","field":"url","options":{"template":null}}	\N	\N
1832	2059	directus_fields	247	{"sort":10,"special":["m2o"],"readonly":false,"required":false,"display":"user","collection":"jp_carousel","field":"test"}	{"sort":10,"special":["m2o"],"readonly":false,"required":false,"display":"user","collection":"jp_carousel","field":"test"}	\N	\N
1841	2068	directus_fields	249	{"sort":9,"special":["m2o"],"display":null,"collection":"jp_marquee","field":"image"}	{"sort":9,"special":["m2o"],"display":null,"collection":"jp_marquee","field":"image"}	\N	\N
1842	2069	directus_fields	249	{"id":249,"collection":"jp_marquee","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_marquee","field":"image","interface":"file-image","options":{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31"}}	\N	\N
1844	2071	directus_fields	249	{"id":249,"collection":"jp_marquee","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"0d27f18a-eb34-4735-acc8-4c34beb7df31"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_marquee","field":"image","display":"image"}	\N	\N
1854	2082	directus_fields	250	{"sort":9,"special":["m2o"],"collection":"jp_carousel","field":"image"}	{"sort":9,"special":["m2o"],"collection":"jp_carousel","field":"image"}	\N	\N
1855	2083	directus_fields	250	{"id":250,"collection":"jp_carousel","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_carousel","field":"image","interface":"file-image","options":{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb"},"display":"image"}	\N	\N
2066	2301	directus_fields	271	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"jp_techstack","field":"lsit"}	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"jp_techstack","field":"lsit"}	\N	\N
2142	2377	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2143	2378	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2144	2379	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2145	2380	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
1920	2151	directus_fields	257	{"sort":7,"interface":"input","special":null,"collection":"jp_teckstack_image","field":"alt"}	{"sort":7,"interface":"input","special":null,"collection":"jp_teckstack_image","field":"alt"}	\N	\N
1921	2152	directus_fields	258	{"sort":8,"special":["m2o"],"required":true,"interface":null,"collection":"jp_teckstack_image","field":"image"}	{"sort":8,"special":["m2o"],"required":true,"interface":null,"collection":"jp_teckstack_image","field":"image"}	\N	\N
1922	2153	directus_fields	258	{"id":258,"collection":"jp_teckstack_image","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_teckstack_image","field":"image","interface":"file-image","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"},"display":"image"}	\N	\N
2481	2747	jp_techstack_image	46	{"linkto":5,"image":"e18e80be-8571-4e5f-8de1-be3e83872cdd"}	{"linkto":5,"image":"e18e80be-8571-4e5f-8de1-be3e83872cdd"}	\N	\N
1811	2034	navigations	5	{"id":5,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:31:54.489Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:13.109Z","title":"会社情報","language":"jp","url":22,"nav_children":[]}	{"url":22,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:13.109Z"}	\N	\N
1813	2036	navigations	7	{"id":7,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:43:16.891Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:37.320Z","title":"採用情報","language":"jp","url":24,"nav_children":[]}	{"url":24,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:37.320Z"}	\N	\N
1817	2040	directus_fields	244	{"sort":10,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"options":{"template":"{{url}}"},"collection":"navigations_children","field":"url"}	{"sort":10,"interface":"select-dropdown-m2o","special":["m2o"],"required":true,"options":{"template":"{{url}}"},"collection":"navigations_children","field":"url"}	\N	\N
1819	2042	navigations_children	2	{"id":2,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:51:31.210Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:11:54.031Z","link":28,"title":"AIソリューション","language":"jp","url":28}	{"url":28,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:11:54.031Z"}	\N	\N
1824	2047	jp_develop	4	{"id":4,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2024-12-27T09:04:12.865Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T09:04:16.850Z","title":"1","description":"1","image":"0bd72556-0cc5-48dd-bf9d-e307f55d8a2a","url":3}	{"status":"published","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T09:04:16.850Z"}	\N	\N
1833	2060	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":"{{alt}}","hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":"{{alt}}"}	\N	\N
1843	2070	jp_marquee	1	{"id":1,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:17:49.883Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:44:59.490Z","alt":"Image","catetory":"transaction","image":"26814cd7-0381-4003-8c40-09b312834e74"}	{"image":"26814cd7-0381-4003-8c40-09b312834e74","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T09:44:59.490Z"}	\N	\N
1857	2085	jp_carousel	2	{"id":2,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:15.672Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:07:51.448Z","alt":"Image","image":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004"}	{"image":"1e874b8a-04b6-4b9c-a5ba-749c38d8a004","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:07:51.448Z"}	\N	\N
2067	2302	directus_fields	272	{"sort":8,"interface":"list-m2m","special":["m2m"],"display":null,"required":true,"collection":"jp_techstack","field":"list_item"}	{"sort":8,"interface":"list-m2m","special":["m2m"],"display":null,"required":true,"collection":"jp_techstack","field":"list_item"}	\N	\N
2068	2303	directus_fields	273	{"sort":1,"hidden":true,"field":"id","collection":"jp_techstack_jp_teckstack_image"}	{"sort":1,"hidden":true,"field":"id","collection":"jp_techstack_jp_teckstack_image"}	\N	\N
2069	2304	directus_collections	jp_techstack_jp_teckstack_image	{"hidden":true,"icon":"import_export","collection":"jp_techstack_jp_teckstack_image"}	{"hidden":true,"icon":"import_export","collection":"jp_techstack_jp_teckstack_image"}	\N	\N
2070	2305	directus_fields	274	{"sort":2,"hidden":true,"collection":"jp_techstack_jp_teckstack_image","field":"jp_techstack_id"}	{"sort":2,"hidden":true,"collection":"jp_techstack_jp_teckstack_image","field":"jp_techstack_id"}	\N	\N
2071	2306	directus_fields	275	{"sort":3,"hidden":true,"collection":"jp_techstack_jp_teckstack_image","field":"jp_teckstack_image_id"}	{"sort":3,"hidden":true,"collection":"jp_techstack_jp_teckstack_image","field":"jp_teckstack_image_id"}	\N	\N
2405	2663	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2406	2664	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
1923	2154	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"jp_tech_stacks","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"jp_tech_stacks"}	\N	\N
1812	2035	navigations	6	{"id":6,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:42:41.291Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:19.717Z","title":"ニュース","language":"jp","url":23,"nav_children":[]}	{"url":23,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:19.717Z"}	\N	\N
1814	2037	navigations	8	{"id":8,"status":"published","user_created":"1a9b7fa7-ea0f-499b-b362-74d7073a3d71","date_created":"2024-12-16T09:43:37.460Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:48.652Z","title":"お問い合わ","language":"jp","url":25,"nav_children":[]}	{"url":25,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-27T07:09:48.652Z"}	\N	\N
1825	2050	directus_fields	214	{"id":214,"collection":"jp_develop","field":"image","special":["file"],"interface":"file-image","options":{"letterbox":true},"display":"related-values","display_options":{"circle":true,"template":"{{filename_disk}}"},"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_develop","field":"image","display":"related-values","display_options":{"circle":true,"template":"{{filename_disk}}"}}	\N	\N
1834	2061	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"display_template":null}	\N	\N
1845	2072	jp_marquee	2	{"id":2,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:18:02.343Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:08.928Z","alt":"Image","catetory":"transaction","image":"a05da9d6-6101-43c8-9061-d8f80f1f30e7"}	{"image":"a05da9d6-6101-43c8-9061-d8f80f1f30e7","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:02:08.928Z"}	\N	\N
1856	2084	jp_carousel	1	{"id":1,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:11.006Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:07:45.768Z","alt":"Image","image":"3e2bd5e5-09da-4abd-89a4-ef410f87185b"}	{"image":"3e2bd5e5-09da-4abd-89a4-ef410f87185b","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:07:45.768Z"}	\N	\N
1858	2086	jp_carousel	3	{"id":3,"status":"published","user_created":"785347a8-5203-4dc2-bf75-c180b73f41df","date_created":"2024-12-18T07:19:20.339Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:07:55.375Z","alt":"Image","image":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e"}	{"image":"cfa88e35-2afb-4fd8-ab88-f3033b908f6e","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2024-12-30T10:07:55.375Z"}	\N	\N
2146	2381	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2147	2382	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2148	2383	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2149	2384	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
1924	2155	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
1925	2156	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
1936	2167	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
1937	2168	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2361	2608	directus_fields	325	{"sort":7,"interface":"input","special":null,"collection":"jp_techstack","field":"title"}	{"sort":7,"interface":"input","special":null,"collection":"jp_techstack","field":"title"}	\N	\N
1938	2169	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
1939	2170	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
1940	2171	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
1941	2172	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
1942	2173	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
1943	2174	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
1944	2175	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
1945	2176	directus_collections	jp_tech_stacks	{"collection":"jp_tech_stacks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
1946	2177	directus_collections	jp_tech_stack_images_jp_tech_stack_images	{"collection":"jp_tech_stack_images_jp_tech_stack_images","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
1947	2178	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
1948	2179	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
1949	2180	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
1950	2181	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2407	2665	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
1951	2182	directus_collections	jp_tech_stacks_jp_tech_stack_images	{"collection":"jp_tech_stacks_jp_tech_stack_images","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":28,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":28,"group":null}	\N	\N
2354	2601	directus_fields	319	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack"}	\N	\N
2355	2602	directus_fields	320	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack"}	\N	\N
2150	2385	directus_collections	jp_techstack_jp_teckstack_image	{"collection":"jp_techstack_jp_teckstack_image","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2151	2386	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
2152	2387	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2153	2388	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2154	2389	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2155	2390	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
2156	2391	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
2356	2603	directus_fields	321	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack"}	\N	\N
2357	2604	directus_fields	322	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack"}	\N	\N
2358	2605	directus_fields	323	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack"}	\N	\N
2359	2606	directus_fields	324	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack"}	\N	\N
2360	2607	directus_collections	jp_techstack	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack"}	\N	\N
2408	2666	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
2157	2392	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
2158	2393	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2159	2394	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2160	2395	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2161	2396	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2162	2397	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2409	2667	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2449	2707	jp_techstack_image	20	{"linkto":3,"image":"9bd5e5b3-df48-4356-9951-a3f624eb4042"}	{"linkto":3,"image":"9bd5e5b3-df48-4356-9951-a3f624eb4042"}	\N	\N
2450	2708	jp_techstack_image	21	{"linkto":3,"image":"95a37fc0-645d-4d5e-8349-e727784abc24"}	{"linkto":3,"image":"95a37fc0-645d-4d5e-8349-e727784abc24"}	\N	\N
2453	2711	jp_techstack_image	24	{"linkto":4,"image":"15331689-8d96-46c4-8f5f-20ab35f8adb1"}	{"linkto":4,"image":"15331689-8d96-46c4-8f5f-20ab35f8adb1"}	\N	\N
2456	2714	jp_techstack_image	27	{"linkto":4,"image":"3a3ab399-08aa-47df-9740-96ba1319c000"}	{"linkto":4,"image":"3a3ab399-08aa-47df-9740-96ba1319c000"}	\N	\N
2461	2719	jp_techstack_image	32	{"linkto":5,"image":"bb161d17-d6a7-47a9-839b-9016d1a4eb3e"}	{"linkto":5,"image":"bb161d17-d6a7-47a9-839b-9016d1a4eb3e"}	\N	\N
2464	2722	jp_techstack_image	35	{"linkto":5,"image":"339f955a-1a02-4429-be47-ab2a78631d8a"}	{"linkto":5,"image":"339f955a-1a02-4429-be47-ab2a78631d8a"}	\N	\N
2466	2724	jp_techstack_image	37	{"linkto":5,"image":"e2d61f86-ffb9-47ad-a944-653121e6f024"}	{"linkto":5,"image":"e2d61f86-ffb9-47ad-a944-653121e6f024"}	\N	\N
2468	2726	jp_techstack_image	39	{"linkto":6,"image":"80b3a5b9-5051-498e-9d7a-a651226b6b04"}	{"linkto":6,"image":"80b3a5b9-5051-498e-9d7a-a651226b6b04"}	\N	\N
2473	2731	jp_techstack_image	44	{"linkto":6,"image":"4d745ef1-47c9-4a7a-be10-fdd3538fbcb7"}	{"linkto":6,"image":"4d745ef1-47c9-4a7a-be10-fdd3538fbcb7"}	\N	\N
2163	2398	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2164	2399	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2165	2400	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2166	2401	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2410	2668	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2411	2669	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2412	2670	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2413	2671	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2467	2725	jp_techstack_image	38	{"linkto":5,"image":"61e1014d-d557-415c-848b-57c93d6c3107"}	{"linkto":5,"image":"61e1014d-d557-415c-848b-57c93d6c3107"}	\N	\N
2482	2748	jp_techstack_image	47	{"linkto":5,"image":"c1b62116-5f99-4b83-813b-39e46c1abd57"}	{"linkto":5,"image":"c1b62116-5f99-4b83-813b-39e46c1abd57"}	\N	\N
2499	2769	directus_fields	356	{"sort":12,"special":["m2o"],"collection":"services","field":"image"}	{"sort":12,"special":["m2o"],"collection":"services","field":"image"}	\N	\N
2500	2770	directus_folders	43574fa0-8ed5-446a-8122-7d962882ae83	{"name":"Service"}	{"name":"Service"}	\N	\N
2502	2772	directus_files	f5a958de-71c5-47cf-9c2e-423c9b45c686	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service 1","filename_download":"service-1.png","type":"image/png","storage":"azure"}	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service 1","filename_download":"service-1.png","type":"image/png","storage":"azure"}	\N	\N
2510	2783	directus_fields	357	{"sort":13,"interface":"boolean","special":["cast-boolean"],"collection":"services","field":"reverse"}	{"sort":13,"interface":"boolean","special":["cast-boolean"],"collection":"services","field":"reverse"}	\N	\N
2515	2789	directus_files	6851820a-a8db-4ee9-ba8f-942c19d0e64b	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"2150169850 1 (2)","filename_download":"2150169850 1 (2).png","type":"image/png","storage":"azure"}	{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","title":"2150169850 1 (2)","filename_download":"2150169850 1 (2).png","type":"image/png","storage":"azure"}	\N	\N
2517	2791	jp_carousel	4	{"image":"6851820a-a8db-4ee9-ba8f-942c19d0e64b","status":"published"}	{"image":"6851820a-a8db-4ee9-ba8f-942c19d0e64b","status":"published"}	\N	\N
2518	2793	directus_fields	358	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about"}	\N	\N
2167	2402	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
2168	2403	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
2169	2404	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2534	2809	directus_fields	371	{"sort":7,"interface":"input","special":null,"collection":"jp_about_item","field":"main_text"}	{"sort":7,"interface":"input","special":null,"collection":"jp_about_item","field":"main_text"}	\N	\N
2170	2405	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2186	2421	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
2368	2621	directus_fields	326	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_techstack_image","field":"link_to"}	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_techstack_image","field":"link_to"}	\N	\N
2469	2727	jp_techstack_image	40	{"linkto":6,"image":"fc99029a-d177-4d2b-b87e-0052c6bf00d9"}	{"linkto":6,"image":"fc99029a-d177-4d2b-b87e-0052c6bf00d9"}	\N	\N
2483	2749	jp_techstack_image	48	{"linkto":5,"image":"155d2f9f-cceb-4e88-9e30-50085c634366"}	{"linkto":5,"image":"155d2f9f-cceb-4e88-9e30-50085c634366"}	\N	\N
1997	2229	directus_fields	259	{"sort":8,"interface":"list-o2m","special":["o2m"],"collection":"jp_tech_stacks","field":"list_item"}	{"sort":8,"interface":"list-o2m","special":["o2m"],"collection":"jp_tech_stacks","field":"list_item"}	\N	\N
1998	2230	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
1999	2231	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2000	2232	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2001	2233	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2002	2234	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
2003	2235	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
2004	2236	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
2005	2237	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2006	2238	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2007	2239	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2008	2240	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2009	2241	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2010	2242	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2011	2243	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2012	2244	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2013	2245	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2014	2246	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
2015	2247	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
2016	2248	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2017	2249	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2018	2250	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2019	2251	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
2020	2252	directus_collections	jp_tech_stacks	{"collection":"jp_tech_stacks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2021	2253	directus_collections	jp_tech_stack_images_jp_tech_stack_images	{"collection":"jp_tech_stack_images_jp_tech_stack_images","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2022	2254	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2023	2255	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
2024	2256	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2025	2257	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":28,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":28,"group":null}	\N	\N
2026	2258	directus_collections	jp_tech_stacks_jp_tech_stack_images	{"collection":"jp_tech_stacks_jp_tech_stack_images","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":29,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":29,"group":null}	\N	\N
2171	2406	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2172	2407	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
2173	2408	directus_collections	jp_techstack	{"collection":"jp_techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2174	2409	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2175	2410	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2176	2411	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
2177	2412	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2178	2413	directus_collections	jp_techstack_jp_teckstack_image	{"collection":"jp_techstack_jp_teckstack_image","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":28,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":28,"group":null}	\N	\N
2179	2414	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"jp_techstack","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"jp_techstack"}	\N	\N
2180	2415	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
2181	2416	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2182	2417	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2183	2418	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2184	2419	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
2185	2420	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
2187	2422	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2188	2423	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2189	2424	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2190	2425	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2191	2426	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2192	2427	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2193	2428	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2194	2429	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2195	2430	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2196	2431	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
2197	2432	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
2198	2433	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2199	2434	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2200	2435	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2201	2436	directus_collections	jp_techstack	{"collection":"jp_techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
2202	2437	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2203	2438	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2204	2439	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2205	2440	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
2206	2441	directus_collections	jp_techstack_jp_teckstack_image	{"collection":"jp_techstack_jp_teckstack_image","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2414	2672	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2415	2673	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2416	2674	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2417	2675	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2418	2676	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
2419	2677	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
2420	2678	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2421	2679	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2422	2680	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2484	2750	jp_techstack_image	49	{"linkto":5,"image":"a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f"}	{"linkto":5,"image":"a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f"}	\N	\N
2525	2800	directus_fields	364	{"sort":7,"special":["m2o"],"collection":"jp_about","field":"image"}	{"sort":7,"special":["m2o"],"collection":"jp_about","field":"image"}	\N	\N
2526	2801	directus_fields	364	{"id":364,"collection":"jp_about","field":"image","special":["m2o"],"interface":"file-image","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_about","field":"image","interface":"file-image","display":"image"}	\N	\N
2207	2443	directus_collections	jp_techstack_jp_teckstack_image	{"collection":"jp_techstack_jp_teckstack_image","icon":"import_export","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"hidden":false}	\N	\N
2423	2681	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
2424	2682	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2425	2683	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2426	2684	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2427	2685	directus_collections	jp_techstack	{"collection":"jp_techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
2476	2740	directus_files	faee7ac0-6624-4041-880b-ceaed7f01b08	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 1","filename_download":"ts-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 1","filename_download":"ts-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2485	2753	directus_fields	344	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about"}	\N	\N
2486	2754	directus_fields	345	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about"}	\N	\N
2487	2755	directus_fields	346	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about"}	\N	\N
2488	2756	directus_fields	347	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about"}	\N	\N
2489	2757	directus_fields	348	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about"}	\N	\N
2535	2810	directus_fields	372	{"sort":8,"interface":"input","special":null,"collection":"jp_about_item","field":"hover_text"}	{"sort":8,"interface":"input","special":null,"collection":"jp_about_item","field":"hover_text"}	\N	\N
2536	2811	directus_fields	373	{"sort":9,"special":["m2o"],"collection":"jp_about_item","field":"image_src"}	{"sort":9,"special":["m2o"],"collection":"jp_about_item","field":"image_src"}	\N	\N
2537	2812	directus_fields	374	{"sort":10,"special":["m2o"],"collection":"jp_about_item","field":"icon_src"}	{"sort":10,"special":["m2o"],"collection":"jp_about_item","field":"icon_src"}	\N	\N
2541	2816	directus_files	9e43e19f-2a15-4c27-97e6-384788e5ff73	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2208	2444	directus_fields	276	{"sort":9,"special":["o2m"],"interface":null,"collection":"jp_techstack","field":"test"}	{"sort":9,"special":["o2m"],"interface":null,"collection":"jp_techstack","field":"test"}	\N	\N
2209	2445	directus_fields	277	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	\N	\N
2210	2446	directus_fields	278	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"test"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"test"}	\N	\N
2211	2447	directus_fields	279	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test"}	\N	\N
2212	2448	directus_fields	280	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test"}	\N	\N
2213	2449	directus_fields	281	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test"}	\N	\N
2214	2450	directus_fields	282	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test"}	\N	\N
2215	2451	directus_collections	test	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test"}	\N	\N
2257	2495	directus_collections	navigations	{"collection":"navigations","icon":null,"note":"Content for navigations","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
2258	2496	directus_collections	footers	{"collection":"footers","icon":null,"note":"Content for footers","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
2259	2497	directus_collections	benefits	{"collection":"benefits","icon":null,"note":"Benefits when joining company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
2260	2498	directus_collections	services	{"collection":"services","icon":null,"note":"Services provided by company","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
2261	2499	directus_collections	partners	{"collection":"partners","icon":null,"note":"Companies with partnership","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
2262	2500	directus_collections	blogs	{"collection":"blogs","icon":null,"note":"Technical blogs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
2335	2575	directus_fields	310	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack_image"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack_image"}	\N	\N
2216	2452	directus_fields	283	{"sort":7,"special":["o2m"],"collection":"test","field":"test"}	{"sort":7,"special":["o2m"],"collection":"test","field":"test"}	\N	\N
2263	2501	directus_collections	jobs	{"collection":"jobs","icon":null,"note":"Hiring jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
2264	2502	directus_collections	job_categories	{"collection":"job_categories","icon":null,"note":"Categories of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
2265	2503	directus_collections	job_locations	{"collection":"job_locations","icon":null,"note":"Locations of jobs","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
2266	2504	directus_collections	news	{"collection":"news","icon":null,"note":"Company activities","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
2267	2505	directus_collections	companies	{"collection":"companies","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
2268	2506	directus_collections	companies_links	{"collection":"companies_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
2269	2507	directus_collections	footers_links_group	{"collection":"footers_links_group","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
2270	2508	directus_collections	links	{"collection":"links","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
2271	2509	directus_collections	links_group	{"collection":"links_group","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
2272	2510	directus_collections	links_group_links	{"collection":"links_group_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
2273	2511	directus_collections	navigations_links	{"collection":"navigations_links","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
2274	2512	directus_collections	navigations_links_1	{"collection":"navigations_links_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
2275	2513	directus_collections	navigations_links_2	{"collection":"navigations_links_2","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
2276	2514	directus_collections	users	{"collection":"users","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
2277	2515	directus_collections	navigations_navigations_children	{"collection":"navigations_navigations_children","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
2376	2631	directus_fields	327	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack"}	\N	\N
2217	2453	directus_fields	284	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test1"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test1"}	\N	\N
2218	2454	directus_fields	285	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"test1"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"test1"}	\N	\N
2219	2455	directus_fields	286	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test1"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"test1"}	\N	\N
2220	2456	directus_fields	287	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test1"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"test1"}	\N	\N
2221	2457	directus_fields	288	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test1"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"test1"}	\N	\N
2222	2458	directus_fields	289	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test1"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"test1"}	\N	\N
2223	2459	directus_collections	test1	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test1"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"test1"}	\N	\N
2225	2461	directus_fields	290	{"id":290,"collection":"test1","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"test1","field":"image","interface":"file-image","options":{"folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb"}}	\N	\N
2428	2686	jp_techstack	3	{"status":"published","title":"Database"}	{"status":"published","title":"Database"}	\N	\N
2228	2464	directus_fields	291	{"sort":8,"special":["m2o"],"collection":"test1","field":"test"}	{"sort":8,"special":["m2o"],"collection":"test1","field":"test"}	\N	\N
2429	2687	jp_techstack	4	{"status":"published","title":"Machine Learning"}	{"status":"published","title":"Machine Learning"}	\N	\N
2278	2516	directus_collections	jp_teckstack_image	{"collection":"jp_teckstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
2279	2517	directus_collections	jp_techstack	{"collection":"jp_techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
2280	2518	directus_collections	jp_carousel	{"collection":"jp_carousel","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
2281	2519	directus_collections	jp_develop	{"collection":"jp_develop","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
2282	2520	directus_collections	jp_marquee	{"collection":"jp_marquee","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
2224	2460	directus_fields	290	{"sort":7,"special":["m2o"],"collection":"test1","field":"image"}	{"sort":7,"special":["m2o"],"collection":"test1","field":"image"}	\N	\N
2377	2632	directus_fields	328	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack"}	\N	\N
2283	2521	directus_collections	jp_news	{"collection":"jp_news","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":27,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":27,"group":null}	\N	\N
2284	2522	directus_collections	jp_techstack_jp_teckstack_image	{"collection":"jp_techstack_jp_teckstack_image","icon":"import_export","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":28,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":28,"group":null}	\N	\N
2285	2523	directus_collections	techstack	{"collection":"techstack","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":29,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":29,"group":null}	\N	\N
2286	2524	directus_collections	techstack_image	{"collection":"techstack_image","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":30,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":30,"group":null}	\N	\N
2378	2633	directus_fields	329	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack"}	\N	\N
2379	2634	directus_fields	330	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack"}	\N	\N
2380	2635	directus_fields	331	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack"}	\N	\N
2381	2636	directus_fields	332	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack"}	\N	\N
2382	2637	directus_collections	jp_techstack	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack"}	\N	\N
2383	2638	directus_fields	333	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack_image"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_techstack_image"}	\N	\N
2430	2688	jp_techstack	5	{"status":"published","title":"Web/App Development - Backend"}	{"status":"published","title":"Web/App Development - Backend"}	\N	\N
2431	2689	jp_techstack	6	{"status":"published","title":"Web/App Development - Frontend"}	{"status":"published","title":"Web/App Development - Frontend"}	\N	\N
2446	2704	jp_techstack_image	17	{"linkto":3,"image":"b25ba673-e5e1-4187-beec-ba8a3cfc76c7"}	{"linkto":3,"image":"b25ba673-e5e1-4187-beec-ba8a3cfc76c7"}	\N	\N
2448	2706	jp_techstack_image	19	{"linkto":3,"image":"0554f909-08d6-4fa1-8194-3dcb2d0fb2c7"}	{"linkto":3,"image":"0554f909-08d6-4fa1-8194-3dcb2d0fb2c7"}	\N	\N
2451	2709	jp_techstack_image	22	{"linkto":4,"image":"29df87d8-1ac1-4386-b814-ffa951aa5bca"}	{"linkto":4,"image":"29df87d8-1ac1-4386-b814-ffa951aa5bca"}	\N	\N
2460	2718	jp_techstack_image	31	{"linkto":5,"image":"137575ba-da54-4f43-9999-3d28590ed360"}	{"linkto":5,"image":"137575ba-da54-4f43-9999-3d28590ed360"}	\N	\N
2384	2639	directus_fields	334	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack_image"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack_image"}	\N	\N
2287	2525	directus_fields	308	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_teckstack_image","field":"link_to"}	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_teckstack_image","field":"link_to"}	\N	\N
2288	2526	directus_fields	309	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_teckstack_image","field":"link_to"}	{"sort":9,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_teckstack_image","field":"link_to"}	\N	\N
2336	2576	directus_fields	311	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack_image"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_techstack_image"}	\N	\N
2337	2577	directus_fields	312	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack_image"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack_image"}	\N	\N
2338	2578	directus_fields	313	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack_image"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack_image"}	\N	\N
2339	2579	directus_fields	314	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack_image"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack_image"}	\N	\N
2340	2580	directus_fields	315	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack_image"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack_image"}	\N	\N
2341	2581	directus_collections	jp_techstack_image	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack_image"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack_image"}	\N	\N
2342	2582	directus_fields	316	{"sort":7,"special":["m2o"],"interface":null,"collection":"jp_techstack_image","field":"image"}	{"sort":7,"special":["m2o"],"interface":null,"collection":"jp_techstack_image","field":"image"}	\N	\N
2343	2583	directus_fields	316	{"id":316,"collection":"jp_techstack_image","field":"image","special":["m2o"],"interface":"file-image","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_techstack_image","field":"image","interface":"file-image","display":"image"}	\N	\N
2229	2465	directus_fields	292	{"sort":7,"interface":"input","special":null,"collection":"test","field":"title"}	{"sort":7,"interface":"input","special":null,"collection":"test","field":"title"}	\N	\N
2385	2640	directus_fields	335	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack_image"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_techstack_image"}	\N	\N
2386	2641	directus_fields	336	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack_image"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_techstack_image"}	\N	\N
2387	2642	directus_fields	337	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack_image"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_techstack_image"}	\N	\N
2388	2643	directus_fields	338	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack_image"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_techstack_image"}	\N	\N
2389	2644	directus_collections	jp_techstack_image	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack_image"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_techstack_image"}	\N	\N
2432	2690	jp_techstack_image	3	{"linkto":1,"image":"8cbce33a-dfcc-44cc-bee4-4479b488f307"}	{"linkto":1,"image":"8cbce33a-dfcc-44cc-bee4-4479b488f307"}	\N	\N
2447	2705	jp_techstack_image	18	{"linkto":3,"image":"d617e2d3-d26f-4562-b0c3-46e5bc068016"}	{"linkto":3,"image":"d617e2d3-d26f-4562-b0c3-46e5bc068016"}	\N	\N
2454	2712	jp_techstack_image	25	{"linkto":4,"image":"58a7a9de-2217-427c-b371-5201f5901778"}	{"linkto":4,"image":"58a7a9de-2217-427c-b371-5201f5901778"}	\N	\N
2459	2717	jp_techstack_image	30	{"linkto":4,"image":"08f0dc33-94b4-4c53-8c98-e5adb3954a44"}	{"linkto":4,"image":"08f0dc33-94b4-4c53-8c98-e5adb3954a44"}	\N	\N
2463	2721	jp_techstack_image	34	{"linkto":5,"image":"0525446c-a58a-44f0-8cc9-d26fc03f96af"}	{"linkto":5,"image":"0525446c-a58a-44f0-8cc9-d26fc03f96af"}	\N	\N
2471	2729	jp_techstack_image	42	{"linkto":6,"image":"965b9bf2-a506-44a2-a04e-23f7d621b6ef"}	{"linkto":6,"image":"965b9bf2-a506-44a2-a04e-23f7d621b6ef"}	\N	\N
2344	2584	directus_fields	317	{"sort":8,"interface":"input","special":null,"collection":"jp_techstack_image","field":"alt"}	{"sort":8,"interface":"input","special":null,"collection":"jp_techstack_image","field":"alt"}	\N	\N
2472	2730	jp_techstack_image	43	{"linkto":6,"image":"2d280990-e1ac-4c49-9c59-73a439541ec8"}	{"linkto":6,"image":"2d280990-e1ac-4c49-9c59-73a439541ec8"}	\N	\N
2475	2733	directus_fields	343	{"sort":10,"interface":"input","special":null,"collection":"jp_techstack_image","field":"alt"}	{"sort":10,"interface":"input","special":null,"collection":"jp_techstack_image","field":"alt"}	\N	\N
2477	2741	directus_files	c1b62116-5f99-4b83-813b-39e46c1abd57	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 5","filename_download":"ts-5.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 5","filename_download":"ts-5.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2479	2744	directus_files	a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 1","filename_download":"ts-23-1.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 23 1","filename_download":"ts-23-1.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2490	2758	directus_fields	349	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about"}	\N	\N
2491	2759	directus_collections	jp_about	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about"}	\N	\N
2501	2771	directus_files	d790625e-2b34-4832-a4ef-f85b67d3d097	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service","filename_download":"service.png","type":"image/png","storage":"azure"}	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service","filename_download":"service.png","type":"image/png","storage":"azure"}	\N	\N
2504	2774	directus_files	a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service 2","filename_download":"service-2.png","type":"image/png","storage":"azure"}	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service 2","filename_download":"service-2.png","type":"image/png","storage":"azure"}	\N	\N
2505	2775	directus_fields	356	{"id":356,"collection":"services","field":"image","special":["m2o"],"interface":"file-image","options":{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"services","field":"image","interface":"file-image","options":{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83"},"display":"image"}	\N	\N
2527	2802	directus_fields	365	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about_item"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about_item"}	\N	\N
2540	2815	directus_files	a47e3fa4-9797-4468-8fe2-cc1ad7533a81	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	\N	\N
2233	2471	directus_fields	293	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"techstack"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"techstack"}	\N	\N
2234	2472	directus_fields	294	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"techstack"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"techstack"}	\N	\N
2235	2473	directus_fields	295	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"techstack"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"techstack"}	\N	\N
2236	2474	directus_fields	296	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"techstack"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"techstack"}	\N	\N
2237	2475	directus_fields	297	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"techstack"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"techstack"}	\N	\N
2238	2476	directus_fields	298	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"techstack"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"techstack"}	\N	\N
2239	2477	directus_collections	techstack	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"techstack"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"techstack"}	\N	\N
2243	2481	directus_fields	300	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"techstack_image"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"techstack_image"}	\N	\N
2244	2482	directus_fields	301	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"techstack_image"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"techstack_image"}	\N	\N
2245	2483	directus_fields	302	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"techstack_image"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"techstack_image"}	\N	\N
2246	2484	directus_fields	303	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"techstack_image"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"techstack_image"}	\N	\N
2240	2478	directus_fields	299	{"sort":7,"interface":"input","special":null,"collection":"techstack","field":"title"}	{"sort":7,"interface":"input","special":null,"collection":"techstack","field":"title"}	\N	\N
2390	2645	directus_fields	339	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_techstack_image","field":"image"}	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_techstack_image","field":"image"}	\N	\N
2391	2646	directus_fields	339	{"id":339,"collection":"jp_techstack_image","field":"image","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_techstack_image","field":"image","display":"image"}	\N	\N
2392	2647	directus_fields	340	{"sort":8,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_techstack_image","field":"linkto"}	{"sort":8,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"jp_techstack_image","field":"linkto"}	\N	\N
2433	2691	jp_techstack_image	4	{"linkto":1,"image":"8d4ca320-cfdf-4005-a385-a2777b942890"}	{"linkto":1,"image":"8d4ca320-cfdf-4005-a385-a2777b942890"}	\N	\N
2436	2694	jp_techstack_image	7	{"image":"3786ea60-385b-4738-a83e-dced7be6559b","linkto":1}	{"image":"3786ea60-385b-4738-a83e-dced7be6559b","linkto":1}	\N	\N
2437	2695	jp_techstack_image	8	{"linkto":2,"image":"388720df-d81f-4887-a19c-29dcf1c3d7db"}	{"linkto":2,"image":"388720df-d81f-4887-a19c-29dcf1c3d7db"}	\N	\N
2438	2696	jp_techstack_image	9	{"image":"6c1634f5-1a38-413f-b838-ced9c6202235"}	{"image":"6c1634f5-1a38-413f-b838-ced9c6202235"}	\N	\N
2439	2697	jp_techstack_image	10	{"image":"6b21841e-3b5a-4aed-9139-a50a5e716b76","linkto":2}	{"image":"6b21841e-3b5a-4aed-9139-a50a5e716b76","linkto":2}	\N	\N
2441	2699	jp_techstack_image	12	{"linkto":2,"image":"b3f5281a-a99e-4814-8bc2-65c9a9027343"}	{"linkto":2,"image":"b3f5281a-a99e-4814-8bc2-65c9a9027343"}	\N	\N
2444	2702	jp_techstack_image	15	{"linkto":3,"image":"be53a4c4-098a-45ea-91db-b6ae2669564a"}	{"linkto":3,"image":"be53a4c4-098a-45ea-91db-b6ae2669564a"}	\N	\N
2452	2710	jp_techstack_image	23	{"linkto":4,"image":"c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0"}	{"linkto":4,"image":"c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0"}	\N	\N
2455	2713	jp_techstack_image	26	{"linkto":4,"image":"fbefceae-bb19-44cc-aa2b-7e176277639a"}	{"linkto":4,"image":"fbefceae-bb19-44cc-aa2b-7e176277639a"}	\N	\N
2457	2715	jp_techstack_image	28	{"linkto":4,"image":"c7d84063-d35e-4369-be6e-2c4c488e13ea"}	{"linkto":4,"image":"c7d84063-d35e-4369-be6e-2c4c488e13ea"}	\N	\N
2458	2716	jp_techstack_image	29	{"linkto":4,"image":"b05090ee-719d-4d8a-9256-d6975a0ad377"}	{"linkto":4,"image":"b05090ee-719d-4d8a-9256-d6975a0ad377"}	\N	\N
2465	2723	jp_techstack_image	36	{"linkto":5,"image":"f7fd38cc-e4ee-4bcc-9c7a-6d8c6e6d8b95"}	{"linkto":5,"image":"f7fd38cc-e4ee-4bcc-9c7a-6d8c6e6d8b95"}	\N	\N
2470	2728	jp_techstack_image	41	{"linkto":6,"image":"70226b1b-320c-4635-8701-ec36629ee48d"}	{"linkto":6,"image":"70226b1b-320c-4635-8701-ec36629ee48d"}	\N	\N
2474	2732	jp_techstack_image	45	{"linkto":6,"image":"a3aa6e44-9ada-4950-be23-88143059ecc6"}	{"linkto":6,"image":"a3aa6e44-9ada-4950-be23-88143059ecc6"}	\N	\N
2478	2742	directus_files	155d2f9f-cceb-4e88-9e30-50085c634366	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 17","filename_download":"ts-17.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 17","filename_download":"ts-17.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2492	2761	directus_fields	350	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_service"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_service"}	\N	\N
2493	2762	directus_fields	351	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_service"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_service"}	\N	\N
2494	2763	directus_fields	352	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_service"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_service"}	\N	\N
2495	2764	directus_fields	353	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_service"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_service"}	\N	\N
2496	2765	directus_fields	354	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_service"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_service"}	\N	\N
2247	2485	directus_fields	304	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"techstack_image"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"techstack_image"}	\N	\N
2248	2486	directus_fields	305	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"techstack_image"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"techstack_image"}	\N	\N
2249	2487	directus_collections	techstack_image	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"techstack_image"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"techstack_image"}	\N	\N
2250	2488	directus_fields	306	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"techstack_image","field":"image"}	{"sort":7,"special":["m2o"],"interface":"select-dropdown-m2o","collection":"techstack_image","field":"image"}	\N	\N
2251	2489	directus_fields	306	{"id":306,"collection":"techstack_image","field":"image","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"techstack_image","field":"image","display":"image"}	\N	\N
2393	2648	directus_fields	341	{"sort":7,"interface":"input","special":null,"required":true,"collection":"jp_techstack","field":"title"}	{"sort":7,"interface":"input","special":null,"required":true,"collection":"jp_techstack","field":"title"}	\N	\N
2394	2649	jp_techstack	1	{"status":"published","title":"Cloud"}	{"status":"published","title":"Cloud"}	\N	\N
2395	2650	jp_techstack	2	{"status":"published","title":"Data Analysis"}	{"status":"published","title":"Data Analysis"}	\N	\N
2396	2651	directus_fields	342	{"sort":9,"special":["m2o"],"interface":null,"collection":"jp_techstack_image","field":"image"}	{"sort":9,"special":["m2o"],"interface":null,"collection":"jp_techstack_image","field":"image"}	\N	\N
2397	2652	directus_fields	342	{"id":342,"collection":"jp_techstack_image","field":"image","special":["m2o"],"interface":"file","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"},"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_techstack_image","field":"image","interface":"file","options":{"folder":"7316e61a-a02b-4b25-a6ea-6b4dedb8cd85"},"display":"image"}	\N	\N
2400	2655	jp_techstack_image	2	{"status":"published","linkto":2,"image":"2c9ae88d-dde2-4066-a352-491ec71dd805"}	{"status":"published","linkto":2,"image":"2c9ae88d-dde2-4066-a352-491ec71dd805"}	\N	\N
2434	2692	jp_techstack_image	5	{"linkto":1,"image":"d126a2a6-2b09-452a-9f3d-0a2491a1dbad"}	{"linkto":1,"image":"d126a2a6-2b09-452a-9f3d-0a2491a1dbad"}	\N	\N
2462	2720	jp_techstack_image	33	{"linkto":5,"image":"74edc2e8-376a-403c-bb85-7face8a4191c"}	{"linkto":5,"image":"74edc2e8-376a-403c-bb85-7face8a4191c"}	\N	\N
2480	2746	directus_files	e18e80be-8571-4e5f-8de1-be3e83872cdd	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 11","filename_download":"ts-11.svg","type":"image/svg+xml","storage":"azure"}	{"folder":"bdd75080-44de-4243-be87-9c3e3866f976","title":"TS 11","filename_download":"ts-11.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2497	2766	directus_fields	355	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_service"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_service"}	\N	\N
2498	2767	directus_collections	jp_service	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_service"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_service"}	\N	\N
2503	2773	directus_files	300cf124-dd15-4ebf-92d8-850e3e469e87	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service 3","filename_download":"service-3.png","type":"image/png","storage":"azure"}	{"folder":"43574fa0-8ed5-446a-8122-7d962882ae83","title":"Service 3","filename_download":"service-3.png","type":"image/png","storage":"azure"}	\N	\N
2506	2776	services	7	{"id":7,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T06:54:34.199Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:15.625Z","title":"データサイエンス","content":"当社は、データ の収集から基盤の構築、加工、分析ツールの導入、可視化、レポーティング、運用まで、ビッグデータを最大限に活用できるよう一貫したサービスを行います。具体的には、DataBricks、SnowFlake、Microsoft Fabricなどの最新のクラウドベースのデータプラットフォームを活用し、効率的かつスケーラブルなデータ処理基盤を提供します。貴社が保有するデータと対話し、隠れた機会を見出し、潜在リスクを特定することで、ビジネスに真の価値をもたらすソリューションを提供します。","link":27,"language":"jp","image":"d790625e-2b34-4832-a4ef-f85b67d3d097"}	{"image":"d790625e-2b34-4832-a4ef-f85b67d3d097","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:15.625Z"}	\N	\N
2507	2777	services	9	{"id":9,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:00:39.216Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:39.298Z","title":"システム開発","content":"業務システム、基幹システム、Webサービス、モバイルアプリなど多様なニーズに対応し、要件定義、設計、実装、テスト、運用の各フェーズに専門エンジニアが対応します。新規開発はもちろん、既存システムの改善や保守にも柔軟に対応し、クラウドネイティブ、Microservices、APIファースト、コンテナ化（Docker/Kubernetes）、CI/CD（継続的インテグレーション／継続的デリバリー）など、最新のWeb開発技術を活用した、拡張性と安定性に優れたシステム開発ソリューションを提供します。","link":29,"language":"jp","image":"300cf124-dd15-4ebf-92d8-850e3e469e87"}	{"image":"300cf124-dd15-4ebf-92d8-850e3e469e87","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:39.298Z"}	\N	\N
2508	2778	services	8	{"id":8,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:00:05.144Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:46.479Z","title":"AIソリューション","content":"AIと業務システムを統合した包括的なソリューションを提供します。当社は、特徴分析や特徴抽出、予測モデル、レコメンドシステム、画像処理（コンピュータビジョン）、音声認識、生成AI（Generative AI）、LLM（大規模言語モデル）、RAG（Retrieval-Augmented Generation）など、最先端のAI技術を駆使して、幅広い分野で豊富な実績を有しています。さらに、当社は、AIモデルのトレーニングから運用までを一貫してサポートし、クライアントの要件定義、技術選定、開発、展開に至るまで、ワンストップでサービスを提供します。画像認識、音声認識、NLP（自然言語処理）、そして生成AIを組み合わせた革新的なソリューションで、ビジネスの成長を支援します。","link":28,"language":"jp","image":"f5a958de-71c5-47cf-9c2e-423c9b45c686"}	{"image":"f5a958de-71c5-47cf-9c2e-423c9b45c686","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:46.479Z"}	\N	\N
2509	2779	services	10	{"id":10,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:01:21.031Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:53.095Z","title":"DX推進支援","content":"貴社のDX推進においてアイディアソンやハンズオンを通じてアイデアを具体化し、問題解決へと導くプロセスのコンサルティングを提供し、戦略立案から実行までを一貫して支援します。DX推進に必要なシステムモダナイゼーションにも対応し、既存のシステムを最新技術にアップグレードすることで、貴社のデジタル変革を加速し、業務の効率性向上と競争力強化を実現します。","link":30,"language":"jp","image":"a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42"}	{"image":"a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-07T03:16:53.095Z"}	\N	\N
2511	2784	services	7	{"id":7,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T06:54:34.199Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:44:51.277Z","title":"データサイエンス","content":"当社は、データ の収集から基盤の構築、加工、分析ツールの導入、可視化、レポーティング、運用まで、ビッグデータを最大限に活用できるよう一貫したサービスを行います。具体的には、DataBricks、SnowFlake、Microsoft Fabricなどの最新のクラウドベースのデータプラットフォームを活用し、効率的かつスケーラブルなデータ処理基盤を提供します。貴社が保有するデータと対話し、隠れた機会を見出し、潜在リスクを特定することで、ビジネスに真の価値をもたらすソリューションを提供します。","link":27,"language":"jp","image":"d790625e-2b34-4832-a4ef-f85b67d3d097","reverse":true}	{"reverse":true,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:44:51.277Z"}	\N	\N
2512	2785	services	8	{"id":8,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:00:05.144Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:44:56.451Z","title":"AIソリューション","content":"AIと業務システムを統合した包括的なソリューションを提供します。当社は、特徴分析や特徴抽出、予測モデル、レコメンドシステム、画像処理（コンピュータビジョン）、音声認識、生成AI（Generative AI）、LLM（大規模言語モデル）、RAG（Retrieval-Augmented Generation）など、最先端のAI技術を駆使して、幅広い分野で豊富な実績を有しています。さらに、当社は、AIモデルのトレーニングから運用までを一貫してサポートし、クライアントの要件定義、技術選定、開発、展開に至るまで、ワンストップでサービスを提供します。画像認識、音声認識、NLP（自然言語処理）、そして生成AIを組み合わせた革新的なソリューションで、ビジネスの成長を支援します。","link":28,"language":"jp","image":"f5a958de-71c5-47cf-9c2e-423c9b45c686","reverse":false}	{"reverse":false,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:44:56.451Z"}	\N	\N
2513	2786	services	9	{"id":9,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:00:39.216Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:45:08.395Z","title":"システム開発","content":"業務システム、基幹システム、Webサービス、モバイルアプリなど多様なニーズに対応し、要件定義、設計、実装、テスト、運用の各フェーズに専門エンジニアが対応します。新規開発はもちろん、既存システムの改善や保守にも柔軟に対応し、クラウドネイティブ、Microservices、APIファースト、コンテナ化（Docker/Kubernetes）、CI/CD（継続的インテグレーション／継続的デリバリー）など、最新のWeb開発技術を活用した、拡張性と安定性に優れたシステム開発ソリューションを提供します。","link":29,"language":"jp","image":"300cf124-dd15-4ebf-92d8-850e3e469e87","reverse":true}	{"reverse":true,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:45:08.395Z"}	\N	\N
2514	2787	services	10	{"id":10,"status":"published","sort":null,"user_created":"ca300add-b2b2-432d-8164-d6fb6583a62e","date_created":"2024-12-17T07:01:21.031Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:45:12.126Z","title":"DX推進支援","content":"貴社のDX推進においてアイディアソンやハンズオンを通じてアイデアを具体化し、問題解決へと導くプロセスのコンサルティングを提供し、戦略立案から実行までを一貫して支援します。DX推進に必要なシステムモダナイゼーションにも対応し、既存のシステムを最新技術にアップグレードすることで、貴社のデジタル変革を加速し、業務の効率性向上と競争力強化を実現します。","link":30,"language":"jp","image":"a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42","reverse":false}	{"reverse":false,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-09T09:45:12.126Z"}	\N	\N
2516	2790	directus_files	6851820a-a8db-4ee9-ba8f-942c19d0e64b	{"id":"6851820a-a8db-4ee9-ba8f-942c19d0e64b","storage":"azure","filename_disk":"6851820a-a8db-4ee9-ba8f-942c19d0e64b.png","filename_download":"2150169850 1 (2).png","title":"DataImpact","type":"image/png","folder":"edc43ca7-0115-4437-b4d2-02d00e5aabeb","uploaded_by":"f343a843-c75d-4970-b281-73ebb92fc718","created_on":"2025-01-14T02:15:00.600Z","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2025-01-14T02:15:15.363Z","charset":null,"filesize":"1469493","width":3840,"height":2016,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2025-01-14T02:15:01.835Z"}	{"title":"DataImpact","modified_by":"f343a843-c75d-4970-b281-73ebb92fc718","modified_on":"2025-01-14T02:15:15.363Z"}	\N	\N
2519	2794	directus_fields	359	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about"}	\N	\N
2520	2795	directus_fields	360	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about"}	\N	\N
2521	2796	directus_fields	361	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about"}	\N	\N
2522	2797	directus_fields	362	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about"}	\N	\N
2523	2798	directus_fields	363	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about"}	\N	\N
2524	2799	directus_collections	jp_about	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about"}	\N	\N
2528	2803	directus_fields	366	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about_item"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about_item"}	\N	\N
2529	2804	directus_fields	367	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about_item"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about_item"}	\N	\N
2530	2805	directus_fields	368	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about_item"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about_item"}	\N	\N
2531	2806	directus_fields	369	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about_item"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about_item"}	\N	\N
2532	2807	directus_fields	370	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about_item"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about_item"}	\N	\N
2533	2808	directus_collections	jp_about_item	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about_item"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about_item"}	\N	\N
2538	2813	directus_fields	373	{"id":373,"collection":"jp_about_item","field":"image_src","special":["m2o"],"interface":"file-image","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_about_item","field":"image_src","interface":"file-image","display":"image"}	\N	\N
2539	2814	directus_fields	374	{"id":374,"collection":"jp_about_item","field":"icon_src","special":["m2o"],"interface":"file-image","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"jp_about_item","field":"icon_src","interface":"file-image","display":"image"}	\N	\N
2542	2817	jp_about_item	1	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"a47e3fa4-9797-4468-8fe2-cc1ad7533a81","icon_src":"9e43e19f-2a15-4c27-97e6-384788e5ff73"}	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"a47e3fa4-9797-4468-8fe2-cc1ad7533a81","icon_src":"9e43e19f-2a15-4c27-97e6-384788e5ff73"}	\N	\N
2543	2818	directus_files	569b19e3-9635-40e1-b480-fe1612771514	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	\N	\N
2544	2819	directus_files	5d7b4315-1f3a-4969-a606-8c279c048c31	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2545	2820	jp_about_item	2	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"569b19e3-9635-40e1-b480-fe1612771514","icon_src":"5d7b4315-1f3a-4969-a606-8c279c048c31"}	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"569b19e3-9635-40e1-b480-fe1612771514","icon_src":"5d7b4315-1f3a-4969-a606-8c279c048c31"}	\N	\N
2546	2821	directus_files	63f4e679-c694-47b2-89f8-a82c7aed4f07	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	\N	\N
2547	2822	directus_files	fc832436-5365-4590-a688-796fadbee6af	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2548	2823	jp_about_item	3	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"63f4e679-c694-47b2-89f8-a82c7aed4f07","icon_src":"fc832436-5365-4590-a688-796fadbee6af"}	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"63f4e679-c694-47b2-89f8-a82c7aed4f07","icon_src":"fc832436-5365-4590-a688-796fadbee6af"}	\N	\N
2549	2824	directus_files	e987f767-7217-4615-8322-2925aa56e95f	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	{"title":"About","filename_download":"about.webp","type":"image/webp","storage":"azure"}	\N	\N
2550	2825	directus_files	09b05086-6275-44c3-a0f9-e4246291b7be	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	{"title":"Icon","filename_download":"icon.svg","type":"image/svg+xml","storage":"azure"}	\N	\N
2551	2826	jp_about_item	4	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"e987f767-7217-4615-8322-2925aa56e95f","icon_src":"09b05086-6275-44c3-a0f9-e4246291b7be"}	{"status":"published","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"e987f767-7217-4615-8322-2925aa56e95f","icon_src":"09b05086-6275-44c3-a0f9-e4246291b7be"}	\N	\N
2552	2827	directus_fields	375	{"sort":11,"special":["m2o"],"interface":null,"collection":"jp_about_item","field":"linkto"}	{"sort":11,"special":["m2o"],"interface":null,"collection":"jp_about_item","field":"linkto"}	\N	\N
2553	2828	directus_fields	376	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"jp_about","field":"jp_about_item"}	{"sort":8,"special":["o2m"],"interface":"list-o2m","collection":"jp_about","field":"jp_about_item"}	\N	\N
2554	2829	directus_files	46c32efd-cc9c-406e-bc71-2fcfe9ef3432	{"title":"About 1","filename_download":"about-1.png","type":"image/png","storage":"azure"}	{"title":"About 1","filename_download":"about-1.png","type":"image/png","storage":"azure"}	\N	\N
2560	2835	directus_fields	377	{"sort":9,"interface":"input","special":null,"collection":"jp_about","field":"title"}	{"sort":9,"interface":"input","special":null,"collection":"jp_about","field":"title"}	\N	\N
2559	2834	jp_about	1	{"status":"published","image":"46c32efd-cc9c-406e-bc71-2fcfe9ef3432","jp_about_item":{"create":[],"update":[{"linkto":"+","id":1},{"linkto":"+","id":2},{"linkto":"+","id":3},{"linkto":"+","id":4}],"delete":[]}}	{"status":"published","image":"46c32efd-cc9c-406e-bc71-2fcfe9ef3432","jp_about_item":{"create":[],"update":[{"linkto":"+","id":1},{"linkto":"+","id":2},{"linkto":"+","id":3},{"linkto":"+","id":4}],"delete":[]}}	\N	\N
2555	2830	jp_about_item	1	{"id":1,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:09:53.722Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.261Z","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"a47e3fa4-9797-4468-8fe2-cc1ad7533a81","icon_src":"9e43e19f-2a15-4c27-97e6-384788e5ff73","linkto":1}	{"linkto":1,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.261Z"}	2559	\N
2556	2831	jp_about_item	2	{"id":2,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:10:15.284Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.265Z","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"569b19e3-9635-40e1-b480-fe1612771514","icon_src":"5d7b4315-1f3a-4969-a606-8c279c048c31","linkto":1}	{"linkto":1,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.265Z"}	2559	\N
2557	2832	jp_about_item	3	{"id":3,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:10:39.644Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.269Z","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"63f4e679-c694-47b2-89f8-a82c7aed4f07","icon_src":"fc832436-5365-4590-a688-796fadbee6af","linkto":1}	{"linkto":1,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.269Z"}	2559	\N
2558	2833	jp_about_item	4	{"id":4,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:10:55.334Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.272Z","main_text":"包括的な技術ソリューション","hover_text":"当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。","image_src":"e987f767-7217-4615-8322-2925aa56e95f","icon_src":"09b05086-6275-44c3-a0f9-e4246291b7be","linkto":1}	{"linkto":1,"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:12:52.272Z"}	2559	\N
2561	2836	directus_fields	378	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about_text"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"jp_about_text"}	\N	\N
2574	2849	jp_about_text	1	{"id":1,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:15:35.460Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.008Z","title":"当社は、ベトナムに拠点を置き、データとAIを中心にした先端技術の研究開発に特化した企業です。親会社である株式会社ヘッドウォータースと連携し、Microsoft、Databrick、Snowflakeなどの世界的な企業と公式パートナーシップを結ぶことで、最新技術を活用したソリューションを提供しています。","linkto":1}	{"linkto":"1","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.008Z"}	2577	\N
2562	2837	directus_fields	379	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about_text"}	{"sort":2,"width":"full","options":{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]},"field":"status","collection":"jp_about_text"}	\N	\N
2563	2838	directus_fields	380	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about_text"}	{"sort":3,"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"jp_about_text"}	\N	\N
2564	2839	directus_fields	381	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about_text"}	{"sort":4,"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"jp_about_text"}	\N	\N
2565	2840	directus_fields	382	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about_text"}	{"sort":5,"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"jp_about_text"}	\N	\N
2566	2841	directus_fields	383	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about_text"}	{"sort":6,"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"jp_about_text"}	\N	\N
2567	2842	directus_collections	jp_about_text	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about_text"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"jp_about_text"}	\N	\N
2568	2843	directus_fields	384	{"sort":7,"interface":"input","special":null,"collection":"jp_about_text","field":"title"}	{"sort":7,"interface":"input","special":null,"collection":"jp_about_text","field":"title"}	\N	\N
2569	2844	jp_about_text	1	{"status":"published","title":"当社は、ベトナムに拠点を置き、データとAIを中心にした先端技術の研究開発に特化した企業です。親会社である株式会社ヘッドウォータースと連携し、Microsoft、Databrick、Snowflakeなどの世界的な企業と公式パートナーシップを結ぶことで、最新技術を活用したソリューションを提供しています。"}	{"status":"published","title":"当社は、ベトナムに拠点を置き、データとAIを中心にした先端技術の研究開発に特化した企業です。親会社である株式会社ヘッドウォータースと連携し、Microsoft、Databrick、Snowflakeなどの世界的な企業と公式パートナーシップを結ぶことで、最新技術を活用したソリューションを提供しています。"}	\N	\N
2570	2845	jp_about_text	2	{"status":"published","title":"私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。"}	{"status":"published","title":"私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。"}	\N	\N
2571	2846	jp_about_text	3	{"title":"私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。","status":"published"}	{"title":"私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。","status":"published"}	\N	\N
2572	2847	directus_fields	385	{"sort":8,"special":["m2o"],"collection":"jp_about_text","field":"linkto"}	{"sort":8,"special":["m2o"],"collection":"jp_about_text","field":"linkto"}	\N	\N
2573	2848	directus_fields	386	{"sort":10,"special":["o2m"],"interface":"list-o2m","collection":"jp_about","field":"jp_about_text"}	{"sort":10,"special":["o2m"],"interface":"list-o2m","collection":"jp_about","field":"jp_about_text"}	\N	\N
2577	2852	jp_about	1	{"id":1,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:12:52.254Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.007Z","image":"46c32efd-cc9c-406e-bc71-2fcfe9ef3432","jp_about_item":[1,2,3,4],"jp_about_text":[1,2,3]}	{"user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.007Z"}	\N	\N
2575	2850	jp_about_text	2	{"id":2,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:15:41.856Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.012Z","title":"私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。","linkto":1}	{"linkto":"1","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.012Z"}	2577	\N
2576	2851	jp_about_text	3	{"id":3,"status":"published","user_created":"f343a843-c75d-4970-b281-73ebb92fc718","date_created":"2025-01-14T08:15:48.204Z","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.015Z","title":"私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。","linkto":1}	{"linkto":"1","user_updated":"f343a843-c75d-4970-b281-73ebb92fc718","date_updated":"2025-01-14T08:16:54.015Z"}	2577	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
09f4ed23-891e-4672-ac58-0b54f4dfc69c	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
V5A7UINgDzQdexHtlCIdSfc600GJ2yxYV0lwKPlDtGWuCF96DOErOKMgv6-B0WLI	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-16 02:12:46.357+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
f_avWo1nCVe1ULn9veUfeU1xzoLZjaMLZV-ierNYexsQn5cHOq1Xaq3R7el9KG5h	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-15 06:50:07.35+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
4T6juLfc-IWf_BDUuS_HjGmIYzoqRMdFrn7U7ZMm-huUOfa6noVLv6X037R62XQf	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-21 06:59:05.159+00	172.18.0.1	node	\N	\N	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter) FROM stdin;
1	DataImpact CMS	\N	#3399FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"schema-management-module","enabled":true}]	\N	en-US	\N	\N	dark	Directus Minimal	\N	Directus Minimal	\N	\N	\N	\N	f	t	\N	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
f343a843-c75d-4970-b281-73ebb92fc718	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$1qWGX8S/7Yw6fE/cE186yg$koByQHWlKZ1vNVDlU9Alvk6pPghQ3IZe32kC9hQYiss	\N	\N	\N	\N	\N	\N	\N	active	09f4ed23-891e-4672-ac58-0b54f4dfc69c	\N	2025-01-14 06:59:05.184+00	/content/jp_about	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: footers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footers (id, status, user_created, date_created, user_updated, date_updated, title) FROM stdin;
1	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:25:38.172+00	\N	\N	Services
\.


--
-- Data for Name: footers_links_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footers_links_group (id, footers_id, links_group_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: job_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_categories (id, status, sort, user_created, date_created, user_updated, date_updated, title, description) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 09:50:06.621+00	\N	\N	AI	\N
\.


--
-- Data for Name: job_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_locations (id, status, sort, user_created, date_created, user_updated, date_updated, title) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 09:50:06.615+00	\N	\N	Hà Nội
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, status, sort, user_created, date_created, user_updated, date_updated, title, description, intro, link, logo, category, location) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 09:50:06.628+00	\N	\N	AI Engineer	Bộ phận/Phòng ban: Solution  \nTên vị trí: AI Engineer   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \n- **Thu thập và phân tích dữ liệu:** Sử dụng kỹ thuật thu thập dữ liệu và phân tích dữ liệu để hiểu các mẫu dữ liệu và tạo ra các mô hình dự đoán.\n- **Xây dựng mô hình AI:** Thiết kế và phát triển các mô hình AI bằng cách sử dụng các kỹ thuật học máy và khai thác dữ liệu để đưa ra dự đoán hoặc phân tích các tình huống khác nhau.\n- **Tối ưu hóa mô hình AI:** Tối ưu hóa mô hình AI để đạt được độ chính xác tốt nhất và giảm thiểu các sai số.\n- **Triển khai các hệ thống AI:** Xây dựng các hệ thống AI bằng cách sử dụng các công nghệ khác nhau như mã nguồn mở, các nền tảng điện toán đám mây và các công nghệ khác.\n- **Điều chỉnh các hệ thống AI hiện có:** Điều chỉnh các hệ thống AI hiện có để đảm bảo chúng luôn hoạt động hiệu quả và đáp ứng được nhu cầu của khách hàng.\n- **Giám sát hiệu suất của các hệ thống AI:** Đảm bảo các hệ thống AI hoạt động một cách hiệu quả và đáp ứng được các tiêu chuẩn đánh giá hiệu suất của khách hàng.\n- **Nghiên cứu và phát triển các công nghệ AI mới:** Nghiên cứu và phát triển các công nghệ mới để cải thiện hiệu suất và khả năng ứng dụng của các hệ thống AI.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Bằng kỹ sư hoặc kinh nghiệm thực tế tương đương về Khoa học Máy tính, Toán hoặc Thống kê.\n- Hơn 2 năm kinh nghiệm làm việc ở vị trí kỹ sư AI.\n- Có kinh nghiệm với các ngôn ngữ lập trình hướng đối tượng như Python, Java, Scala, C++.\n- Có kiến thức về Machine Learning, Deep Learning; hay kinh nghiệm xây dựng các mô hình NLP, Computer Vision, Voice Processing, Optimization, Time Series Analysis, Tabular Data Processing.\n- Có kinh nghiệm với một hoặc nhiều framework Deep Learning phổ biến như Tensorflow, Keras, Pytorch.\n- Kỹ năng giao tiếp bằng lời nói và bằng văn bản tốt. Tự tin với kỹ năng làm việc nhóm.\n- Có kiến thức về Cloud (Azure) là một lợi thế.\n- Có thể sử dụng tiếng Anh, tiếng Nhật là một lợi thế.\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	12	374509b8-015d-4f73-8d17-be6cb8686f75	1	1
2	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:02:42.87+00	\N	\N	Comtor	Bộ phận/Phòng ban: Solution  \nTên vị trí: IT Comtor   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**\n\nTạo sự kết nối chặt chẽ với các kỹ sư thông qua các công việc sau:\n- Phiên dịch tiếng Nhật tại cuộc họp\n- Biên dịch tài liệu IT tiếng Nhật của các dự án\n- Tham gia vào các dự án phát triển hệ thống và điều phối cuộc họp giữa các bên\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Trình độ tiếng Nhật N2 trở lên\n- Có từ 2 năm kinh nghiệm biên, phiên dịch tại các công ty IT\n- Có kỹ năng giao tiếp tốt bằng lời nói và bằng văn bản (tiếng Nhật và tiếng Việt)\n- Ưu tiên các ứng viên có kiến thức về lĩnh vực công nghệ thông tin hoặc những ứng viên đã từng sống và học tập tại Nhật\n- Có định hướng trở thành BrSE, PM, BA,…trong tương lai\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	13	a04bb1e3-7499-43a2-8423-36e2f00385f8	1	1
3	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:09:01.526+00	\N	\N	BrSE	Bộ phận/Phòng ban: Solution  \nTên vị trí: BrSE   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**\n\n- **Giao tiếp với khách hàng:** Là người đại diện cho công ty và giao tiếp với khách hàng hoặc đối tác Nhật Bản.\n- **Phân tích yêu cầu của khách hàng:** Hiểu và phân tích yêu cầu của khách hàng để tạo ra một giải pháp phù hợp cho công ty.\n- **Tham gia thiết kế phần mềm:** Cùng với các kỹ sư tham gia thiết kế phần mềm, tạo ra một kế hoạch phát triển, và đưa ra những phương án tốt nhất để đáp ứng yêu cầu của khách hàng.\n- **Tham gia vào quản lý dự án:** Tham gia vào quản lý dự án, bao gồm lên kế hoạch, phân công công việc cho các thành viên trong đội ngũ, giám sát tiến độ dự án và đưa ra các giải pháp nếu có sự cố.\n- **Hỗ trợ kỹ thuật:** Hỗ trợ các nhân viên kỹ thuật trong công ty, giúp họ hiểu và phát triển phần mềm một cách hiệu quả nhất.\n- **Kiểm tra sản phẩm:** Kiểm tra sản phẩm để đảm bảo chất lượng và đáp ứng yêu cầu của khách hàng.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Tốt nghiệp đại học chuyên ngành công nghệ thông tin, hoặc kinh nghiệm tương đương\n- Tiếng Nhật nói và viết tốt (tương đương N2 trở lên).\n- Ưu tiên các ứng viên đã có kinh nghiệm làm việc tại Nhật hoặc đã từng làm việc với khách hàng Nhật.\n- Có khả năng trao đổi yêu cầu với khách hàng tốt\n- Có kinh nghiệm làm việc trong các dự án về BigData, AI là một lợi thế\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n\n<ins>Tại Việt Nam</ins>:\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n<ins>Tại Nhật Bản</ins>:\n- Mức lương khởi điểm hấp dẫn, cạnh tranh, tương xứng với năng lực và kinh nghiệm làm việc: Up to 600 万円 /năm\n- Thu nhập cạnh trạnh hấp dẫn: 13 tháng lương/năm + thưởng dự án, thưởng Tết và các dịp lễ…\n- Được nhận các khoản trợ cấp hàng tháng như sau:\n- Trợ cấp đi lại upto: 25.000 JPY/tháng;\n- Trợ cấp nhà ở upto: 30.000 JPY/tháng;\n- Xét tăng lương 1 lần/năm theo năng lực và hiệu quả công việc;\n- Được công ty tài trợ 100% vé khứ hồi về Việt Nam thăm gia đình 01 lần/năm (áp dụng cho nhân viên có HĐLĐ chính thức tại công ty từ 12 tháng trở lên);\n- Nghỉ thứ 7, Chủ nhật + Nghỉ phép theo Quy định của Pháp luật hiện hành\n- Được tham gia bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp theo Quy định của Pháp luật hiện hành và quy định công ty\n- Khám sức khỏe định kỳ 1 năm/1 lần;\n- Được tham gia các hoạt động tập thể sôi động của công ty: Nghỉ mát, Teambuilding hàng năm,…\n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n- Cơ hội tham gia nhiều dự án đa dạng với các khách hàng hàng đầu Nhật Bản.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	14	a04bb1e3-7499-43a2-8423-36e2f00385f8	1	1
4	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:14:18.979+00	\N	\N	Web Developer	Bộ phận/Phòng ban: Solution  \nTên vị trí: Web Developer (Front End, Back End)   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \n- Tham gia các phát triển dự án của khách hàng Nhật Bản. Cùng team tìm hiểu phân tích yêu cầu, nghiên cứu công nghệ và review source code.\n- Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ của dự án.\n- Nghiên cứu và làm việc trực tiếp với các dịch vụ cloud như Azure, AWS.\n- Thực hiện các công việc liên quan đến bảo vệ, bảo mật dữ liệu của sản phẩm.\n- Cập nhật các kiến thức mới, công nghệ mới, duy trì cho website, sản phẩm, ứng dụng được hoạt động ổn định và ngày càng tối ưu hơn.\n- Nghiên cứu học hỏi các kiến thức công nghệ về AI, IoT.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Bằng kỹ sư hoặc kinh nghiệm thực tế tương đương về Khoa học Máy tính, Điện tử viễn thông.\n- Kinh nghiệm: Ít nhất 2 năm kinh nghiệm với lập trình web.\n- Có kinh nghiệm với 1 trong các ngôn ngữ lập trình sau: Backend (Python), Frontend (Reactjs).\n- Kỹ năng giao tiếp bằng lời nói và bằng văn bản tốt. Tự tin với kỹ năng làm việc nhóm.\n- Có kiến thức và kinh nghiệm về Cloud là một lợi thế.\n- Có thể sử dụng tiếng Anh, tiếng Nhật là một lợi thế.\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	15	0fd02a8e-3a75-473e-a633-a0855b928b42	1	1
5	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:17:31.013+00	\N	\N	Senior Web Developer	Bộ phận/Phòng ban: Solution  \nTên vị trí: Senior Web Developer   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \n- Lead các dự án phát triển web của khách hàng Nhật Bản. Được phụ trách các dự án phù hợp với mong muốn cũng như các kinh nghiệm đã có.\n- Tham gia các công đoạn tìm hiểu yêu cầu, phân tích, thiết kế, nghiên cứu công nghệ của dự án.\n- Nghiên cứu và làm việc trực tiếp với các dịch vụ cloud như Azure, AWS.\n- Thực hiện các công việc liên quan đến bảo vệ, bảo mật dữ liệu của sản phẩm.\n- Cập nhật các kiến thức mới, công nghệ mới, duy trì cho website, sản phẩm, ứng dụng được hoạt động ổn định và ngày càng tối ưu hơn.\n- Nghiên cứu học hỏi các kiến thức công nghệ về AI, IoT.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Bằng kỹ sư hoặc kinh nghiệm thực tế tương đương về Khoa học Máy tính, hoặc Điện tử viễn thông.\n- Kinh nghiệm: Ít nhất 5 năm kinh nghiệm với lập trình web.\n- Có kinh nghiệm với 1 trong các ngôn ngữ lập trình sau: PHP, JavaScript, Python, C#, Java.\n- Có kinh nghiệm với một trong các framework phổ biến: (Frontend) React, TypeScript, Vue.js, Angular, Bootstrap, (Backend) Django, Laravel, CakePHP, Ruby on Rails, Flask.\n- Kỹ năng giao tiếp bằng lời nói và bằng văn bản tốt. Tự tin với kỹ năng lead nhóm. Khả năng giao việc và quản lý công việc cho các bạn member tốt.\n- Có kỹ năng giao tiếp với khách.\n- Có kiến thức về Cloud (Azure) là một lợi thế.\n- Có thể sử dụng tiếng Anh, tiếng Nhật là một lợi thế.\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	16	bc3a94c6-9723-49a1-8824-1aca20b4f833	1	1
6	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:19:21.469+00	\N	\N	Tester	Bộ phận/Phòng ban: Solution  \nTên vị trí: Tester/Automation Test   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \n- **Xây dựng kế hoạch test dự án:** Bao gồm lên kế hoạch, thiết kế kịch bản test, xác định tài nguyên cần thiết, lên lịch test và xác định các tiêu chí đánh giá kết quả test.\n- **Thực hiện test:** Test các tính năng, chức năng, hiệu suất của phần mềm, ghi lại kết quả test, đảm bảo rằng các lỗi được phát hiện sẽ được báo cáo và kiểm tra lại sau khi lỗi được sửa chữa.\n- **Phân tích kết quả test:** Đánh giá và phân tích kết quả test, đảm bảo rằng phần mềm đáp ứng các yêu cầu chức năng, chất lượng và hiệu suất.\n- **Báo cáo và đóng góp ý kiến:** Cung cấp báo cáo chi tiết về các lỗi phát hiện được, đưa ra đánh giá về chất lượng phần mềm, đóng góp ý kiến và đề xuất cải tiến để cải thiện chất lượng sản phẩm.\n- **Cập nhật các kiến thức mới, công nghệ mới:** Duy trì cho website, sản phẩm, ứng dụng được hoạt động ổn định và ngày càng tối ưu hơn.\n- **Phối hợp với các thành viên khác:** Làm việc chặt chẽ với các thành viên khác trong nhóm phát triển phần mềm như nhà phát triển, quản lý sản phẩm và nhà thiết kế để đảm bảo chất lượng sản phẩm.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Tốt nghiệp cao đẳng, đại học; ưu tiên tốt nghiệp chuyên ngành CNTT, hoặc chuyên ngành liên quan.\n- Có ít nhất 2 năm kinh nghiệm ở vị trí tương đương là lợi thế.\n- Làm việc tốt với cơ sở dữ liệu.\n- Nắm vững quy trình kiểm thử phần mềm.\n- Có tư duy logic tốt, nắm bắt nghiệp vụ nhanh, tinh thần trách nhiệm cao.\n- Có khả năng làm việc độc lập và khả năng làm theo nhóm.\n- Có thể sử dụng tiếng Anh, tiếng Nhật là một lợi thế.\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	17	005d5b74-ab54-44ee-9f38-0cefcfda252b	1	1
8	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:26:40.795+00	\N	\N	Data Engineer	Bộ phận/Phòng ban: Solution  \nTên vị trí: AI Engineer   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \n- Thiết kế và phát triển hệ thống dữ liệu phù hợp với nhu cầu kinh doanh.\n- Phát triển các thuật toán để chuyển đổi dữ liệu thành thông tin hữu ích, có thể thực hiện được.\n- Xây dựng, thử nghiệm và bảo trì các pipeline cơ sở dữ liệu.\n- Lấy, thêm, sửa đổi dữ liệu theo yêu cầu.\n- Có kỹ năng phối hợp với quản lý để hiểu các mục tiêu của công ty.\n- Phát triển các phương pháp xác thực dữ liệu và các công cụ phân tích dữ liệu.\n- Đảm bảo tuân thủ các chính sách quản trị và bảo mật dữ liệu.\n- Sử dụng các công cụ Business Intelligence để visualize dữ liệu.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Tốt nghiệp Đại học trở lên.\n- Có kinh nghiệm từ 2 năm làm việc về các hệ thống Big data\n- Có kinh nghiệm coding SQL và một trong những ngôn ngữ sau NoSQL, Python, Java, R, and Scala từ 2 năm trở lên\n- Có kinh nghiệm về thiết kế Data-warehouse, xử lý dữ liệu phân tán, xử lý dữ liệu lớn (Hadoop, Spark, MongoDB, and Kafka…)\n- Có kiến thức về Relational and non-relational databases.\n- Có kinh nghiệm build ETL hay các data pipeline (Airflow…).\n- Có kinh nghiệm viết các script tự động hoá các tác vụ bằng SQL hay Python …\n- Có kiến thức về Data Security\n- Tư duy tốt, có khả năng nghiên cứu, đánh giá và cập nhật công nghệ mới.\n- Kỹ năng giao tiếp bằng lời nói và bằng văn bản tốt. Tự tin với kỹ năng làm việc nhóm.\n- Có kiến thức về Cloud (Azure, GCP, AWS) là một lợi thế.\n- Có kiến thức về Machine Learning là một lợi thế.\n- Có thể sử dụng tiếng Anh, tiếng Nhật là một lợi thế\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	19	0fd02a8e-3a75-473e-a633-a0855b928b42	1	1
9	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:29:18.032+00	\N	\N	IT Helpdesk	Bộ phận/Phòng ban: Solution  \nTên vị trí: IT Helpdesk   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \nHỗ trợ người dùng nội bộ:\n\n- Cài đặt, cấu hình, bảo trì và khắc phục sự cố phần cứng máy tính, máy in, thiết bị mạng, phần mềm hệ điều hành và các ứng dụng văn phòng (Microsoft Office, Teams, v.v.).\n- Hỗ trợ các vấn đề liên quan đến kết nối mạng, internet, và các dịch vụ IT khác.\n- Hỗ trợ quản lý tài khoản email, phân quyền người dùng trên các hệ thống nội bộ.\n\nHỗ trợ từ xa và onsite: \n\n- Đáp ứng yêu cầu hỗ trợ từ xa hoặc trực tiếp, xử lý và khắc phục sự cố nhanh chóng và hiệu quả. \n- Quản lý và hỗ trợ thiết lập các thiết bị di động, hệ thống VPN, và các dịch vụ liên quan. \n\nQuản lý và bảo trì tài sản IT: \n\n- Theo dõi và quản lý kho thiết bị IT, bao gồm máy tính, máy in, và các thiết bị khác. \n- Đảm bảo các thiết bị luôn trong trạng thái hoạt động tốt và tuân thủ các quy định bảo mật của công ty.\n\nHỗ trợ triển khai dự án Security: \n\n- Tham gia vào các dự án liên quan đến bảo mật hệ thống của công ty. \n- Hỗ trợ cài đặt và cấu hình các công cụ bảo mật như Eset, firewall, .. \n- Giám sát và phát hiện các sự cố bảo mật, phối hợp xử lý sự cố theo quy trình. \n- Thực hiện các kiểm tra bảo mật định kỳ trên hệ thống và thiết bị, đảm bảo việc tuân thủ các chính sách bảo mật. \n- Hỗ trợ nâng cấp và triển khai các giải pháp bảo mật mới theo yêu cầu của dự án. \n\n## Yêu cầu kinh nghiệm, học vấn  \n- 6 tháng đến 1 năm kinh nghiệm ở vị trí tương tự hoặc trong lĩnh vực hỗ trợ IT.\n- Hiểu biết về hệ điều hành Windows, macOS, và các phần mềm văn phòng (Office 365, Google Workspace).\n- Kỹ năng cơ bản về cài đặt và cấu hình mạng (LAN, WAN, VPN, Wi-Fi).\n- Kiến thức về bảo mật hệ thống và các công cụ bảo vệ (antivirus, firewall).\n- Kỹ năng giao tiếp tốt, có khả năng làm việc trực tiếp và từ xa với người dùng.\n- Tinh thần trách nhiệm, chăm chỉ, và sẵn sàng học hỏi.\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	20	0fd02a8e-3a75-473e-a633-a0855b928b42	1	1
7	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:24:38.583+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:33:11.778+00	Marketing Executive	Bộ phận/Phòng ban: Solution  \nTên vị trí: Marketing Executive   \nBáo cáo trực tiếp cho: Trưởng phòng, Trưởng nhóm  \nLoại hình lao động: Full-time\n\n##  Phạm vi công việc\n**Về Data Impact**  \n<span class="text-primary-base">Data Impact</span> là công ty tại Việt Nam có vốn đầu tư từ [Tập đoàn Headwaters](https://www.headwaters.co.jp/), Nhật Bản. Là một công ty đang được giao dịch trên sàn chứng khoán Nhật Bản, Headwaters đang được rất nhiều khách hàng là các tập đoàn lớn như Microsoft, Sony, Nvidia chọn lựa là đối tác triển khai các giải pháp CNTT, AI, IoT.  \n\n<span class="text-primary-base">Data Impact</span> với nền tảng là các kỹ sư Việt Nam tài năng, sẽ cung cấp các giải pháp CNTT mới và chất lượng nhất, cạnh tranh trực tiếp với các công ty lớn trên thế giới. Data Impact là một môi trường nơi các kỹ sư có nhiều cơ hội học tập trau dồi kiến thức. Cùng với đó các kỹ sư được tham gia vào các dự án khó, nhiều thách thức để phát huy được hết các tài năng của bản thân.  \n\n<span class="text-primary-base">Data Impact</span> tin tưởng vào sự phát triển và phổ cập của những công nghệ mới như AI, IoT, Big Data. Sứ mệnh của công ty là chinh phục và làm chủ những công nghệ này để thúc đẩy sự phát triển của XH.  \n\n**Bạn sẽ làm gì:**  \n- **Xây dựng thương hiệu:**\n  - Phát triển và thực hiện chiến lược marketing cho các sản phẩm công nghệ dành cho thị trường Nhật Bản.\n  - Tạo dựng và quản lý hình ảnh thương hiệu công ty trên các kênh marketing như website, mạng xã hội, email marketing, v.v.\n  - Làm tài liệu MKT dạng Video, Brochure, Flyer… Hợp tác với các bên liên quan để đảm bảo hình ảnh thương hiệu đến với khách hàng.\n  <br/>\n- **Tạo nội dung:**\n  - Viết và đăng các bài viết, bài blog và các nội dung khác liên quan đến sản phẩm và dịch vụ của công ty bằng tiếng Nhật với độ unique 90-100% trên trang web.\n  - Đảm bảo tất cả nội dung được tối ưu hóa SEO để tăng lượng truy cập web và cải thiện thứ hạng trên công cụ tìm kiếm.\n  - Sản xuất và quản lý nội dung cho các nền tảng mạng xã hội và các chiến dịch email marketing.\n  <br/>\n- **Thu hút khách hàng tiềm năng:**\n  - Nghiên cứu và phân tích thị trường Nhật Bản để xác định đối tượng khách hàng mục tiêu và xu hướng thị trường.\n  - Xây dựng và triển khai các chiến dịch marketing nhằm thu hút khách hàng tiềm năng và tăng tỷ lệ chuyển đổi.\n  - Quản lý và phân tích dữ liệu khách hàng để đánh giá hiệu quả chiến dịch marketing và tối ưu hóa chiến lược.\n  - Tổ chức và quản lý triển khai các sự kiện đối ngoại: Triển lãm, hội thảo, Webinar…\n  - Hỗ trợ các hoạt động khác của đội Sales khi được yêu cầu.\n\n## Yêu cầu kinh nghiệm, học vấn  \n- Có khả năng viết tiếng Nhật tốt. Trình độ tiếng Nhật tối thiểu N2. Ưu tiên các bạn có trình độ tiếng Nhật N1 và am hiểu cách viết bài và văn phong, văn hoá Nhật.\n- Có khả năng giao tiếp tiếng Nhật.\n- Có kinh nghiệm tối thiểu 1 năm kinh nghiệm về Marketing (Branding, PR, Email marketing, Content).\n- Có knowhow trong việc buid kênh tiếp cận khách hàng hoặc có kinh nghiệm PR, branding tại thị trường Nhật là một lợi thế.\n- Khả năng nghiên cứu, tổng hợp thông tin tốt. Ưu tiên những bạn có khả năng tự học hỏi và phát triển kỹ năng.\n- Linh hoạt, nhanh nhẹn, có trách nhiệm với công việc.\n- Kỹ năng giao tiếp và hoạt động teamwork tốt.\n- Kỹ năng quản lý thời gian và tiến độ công việc tốt.\n\n## Chế độ, phúc lợi  \n**Chế độ làm việc**  \n- Môi trường làm việc trẻ trung, với nhiều cộng sự tài năng.\n- Thời gian làm việc thoải mái: Thứ 2 – Thứ 6, flexible check in.\n- Nghỉ phép đặc biệt cho nữ: 1 ngày/tháng.  \n\n**Quyền lợi**\n- Mức lương cạnh tranh tương xứng với năng lực.\n- Xét tăng lương/thăng chức 2 lần/năm (Tháng 06 và tháng 12).\n- Tổng thu nhập lên đến 14 tháng lương/năm.\n- Được tham gia BHXH, BHYT, BHTN và các chế độ theo quy định của luật Lao động.\n- Khám sức khỏe định kỳ 1 lần/năm tại các bệnh viện hàng đầu Việt Nam.\n- Cơ hội đi onsite tại Nhật Bản.\n- Tham gia Team Building, party, dã ngoại, thể thao, du lịch công ty.  \n\n**Phát triển năng lực cá nhân**\n- Văn hóa học tập mạnh mẽ và thúc đẩy phát triển.\n- Hỗ trợ các khoá học nâng cao nghiệp vụ chuyên môn trên Udemy, Coursera.\n- Tham gia các khóa đào tạo nội bộ về kiến thức chuyên môn, ngoại ngữ và các kỹ năng khác.\n- Hỗ trợ học phí, thưởng nóng khi đỗ các chứng chỉ IT, ngoại ngữ (Tiếng Nhật, Anh).\n- Được tư vấn, đồng hành và hỗ trợ phát triển sự nghiệp.\n- Cơ hội thăng tiến, nâng cao thu nhập cho người có năng lực, tâm huyết và gắn bó lâu dài.\n\n## Liên hệ\n### Thông tin ứng tuyển  \nỨng viên gửi CV cá nhân về địa chỉ email: HR_vn@headwaters.co.jp với tiêu đề: **Họ tên – Vị trí ứng tuyển**.\n\nĐể được hỗ trợ thêm thông tin cần thiết, ứng viên vui lòng liên hệ tới phòng Nhân sự của công ty theo số điện thoại: **0976879848**.\n\n**Địa chỉ**: Tầng 11, Tòa nhà Hồ Gươm Plaza, 102 Trần Phú, Hà Đông.	Gần đây, số lượng các công ty xử lý AI engine với mục tiêu rõ ràng hơn đã tăng lên, nhưng có rất ít công ty có thể cung cấp giải pháp cho từng hệ thống đi kèm với AI engine dự	18	a04bb1e3-7499-43a2-8423-36e2f00385f8	1	1
\.


--
-- Data for Name: jp_about; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_about (id, status, user_created, date_created, user_updated, date_updated, image) FROM stdin;
1	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.254+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.007+00	46c32efd-cc9c-406e-bc71-2fcfe9ef3432
\.


--
-- Data for Name: jp_about_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_about_item (id, status, user_created, date_created, user_updated, date_updated, main_text, hover_text, image_src, icon_src, linkto) FROM stdin;
1	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:09:53.722+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.261+00	包括的な技術ソリューション	当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。	a47e3fa4-9797-4468-8fe2-cc1ad7533a81	9e43e19f-2a15-4c27-97e6-384788e5ff73	1
2	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:15.284+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.265+00	包括的な技術ソリューション	当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。	569b19e3-9635-40e1-b480-fe1612771514	5d7b4315-1f3a-4969-a606-8c279c048c31	1
3	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:39.644+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.269+00	包括的な技術ソリューション	当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。	63f4e679-c694-47b2-89f8-a82c7aed4f07	fc832436-5365-4590-a688-796fadbee6af	1
4	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:10:55.334+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:12:52.272+00	包括的な技術ソリューション	当社は、データプラットフォームの構築からデータ分析、さらには可視化や管理アプリの実装に至るまで、幅広い技術ソリューションを提供しています。お客様のニーズに応じた総合的なアプローチで、ビジネスの成長を支援します。	e987f767-7217-4615-8322-2925aa56e95f	09b05086-6275-44c3-a0f9-e4246291b7be	1
\.


--
-- Data for Name: jp_about_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_about_text (id, status, user_created, date_created, user_updated, date_updated, title, linkto) FROM stdin;
1	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:35.46+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.008+00	当社は、ベトナムに拠点を置き、データとAIを中心にした先端技術の研究開発に特化した企業です。親会社である株式会社ヘッドウォータースと連携し、Microsoft、Databrick、Snowflakeなどの世界的な企業と公式パートナーシップを結ぶことで、最新技術を活用したソリューションを提供しています。	1
2	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:41.856+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.012+00	私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。	1
3	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:15:48.204+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 08:16:54.015+00	私たちは、親会社の豊かなノウハウを受け継ぎ、ベトナムの優れた人材リソースと技術的ケーパビリティーを一層強化することで、お客様に先進的で高品質、そして競争力のあるコストでテクノロジーソリューションを提供することを目指しています。	1
\.


--
-- Data for Name: jp_carousel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_carousel (id, status, user_created, date_created, user_updated, date_updated, alt, image) FROM stdin;
1	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:19:11.006+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:45.768+00	Image	3e2bd5e5-09da-4abd-89a4-ef410f87185b
2	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:19:15.672+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:51.448+00	Image	1e874b8a-04b6-4b9c-a5ba-749c38d8a004
3	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:19:20.339+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:07:55.375+00	Image	cfa88e35-2afb-4fd8-ab88-f3033b908f6e
4	published	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-14 02:15:34.287+00	\N	\N	Image	6851820a-a8db-4ee9-ba8f-942c19d0e64b
\.


--
-- Data for Name: jp_develop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_develop (id, status, user_created, date_created, user_updated, date_updated, title, description, url, image) FROM stdin;
1	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:46:02.883+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:27.369+00	タイトル	Data Impactは、親会社であるHeadwatersとともに、マイクロソフト、ソニー、Nvidiaといった世界有数の企業の公式パートナーです。	35	5400aa1d-4303-49a5-971c-4db4ac2ce952
2	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:46:24.581+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:38.149+00	タイトル	を競争力のあるコストと優れた品質で提供します。	35	5400aa1d-4303-49a5-971c-4db4ac2ce952
3	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:46:36.092+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:41:43.013+00	タイトル	お客様のプロセスの最適化とビジネスパフォーマンスの向上に貢献することをお約束します。	35	5400aa1d-4303-49a5-971c-4db4ac2ce952
\.


--
-- Data for Name: jp_marquee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_marquee (id, status, user_created, date_created, user_updated, date_updated, alt, catetory, image) FROM stdin;
1	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:17:49.883+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 09:44:59.49+00	Image	transaction	26814cd7-0381-4003-8c40-09b312834e74
2	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:02.343+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:08.928+00	Image	transaction	a05da9d6-6101-43c8-9061-d8f80f1f30e7
3	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:09.209+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:19.081+00	Image	transaction	7701551a-80b0-48b4-9da7-bc7cea8bdec2
4	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:15.066+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:24.925+00	Image	transaction	9f75622f-5815-4986-909a-0d8af58bf7c0
5	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:24.667+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:32.286+00	Image	transaction	ad58e314-2deb-4a69-85e5-7ea63e043691
6	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:29.321+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:41.75+00	Image	transaction	d34afa1b-9431-4df0-8cb7-5e0e2a3621ed
7	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:38.066+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:50.207+00	Image	badge	ad0a3b86-7ad6-4aa4-8691-ef2134df633b
8	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:44.473+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:02:55.919+00	Image	badge	de92ea69-8230-4b99-9ec6-3739df6effe1
9	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:18:53.857+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:03:03.646+00	Image	badge	d83dcde1-2f9f-490b-b7b8-50c6353413bb
10	published	785347a8-5203-4dc2-bf75-c180b73f41df	2024-12-18 07:19:00.362+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-30 10:03:08.469+00	Image	badge	4163551b-371b-4256-888f-c9e2924988a0
\.


--
-- Data for Name: jp_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_news (id, status, user_created, date_created, user_updated, date_updated, date, description, url) FROM stdin;
1	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:21:56.104+00	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:32:04.873+00	2024-01-11	企業ホームページのリニューアルを行いました。SEO対策を強化し、顧客獲得率を向上させました。	23
2	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:22:18.867+00	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:32:13.288+00	2024-10-25	新しいサービスを開始しました。これにより顧客満足度が大幅に向上しました。	23
3	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:22:37.333+00	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:32:20.643+00	2024-10-10	弊社が提供する製品が業界最高の評価を受けました。	23
4	published	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 09:22:50.174+00	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:32:27.101+00	2024-10-10	弊社が提供する製品が業界最高の評価を受けました。	23
\.


--
-- Data for Name: jp_techstack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_techstack (id, status, user_created, date_created, user_updated, date_updated, title) FROM stdin;
1	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:09:03.708+00	\N	\N	Cloud
2	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:09:12.286+00	\N	\N	Data Analysis
3	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:52:43.314+00	\N	\N	Database
4	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:52:50.259+00	\N	\N	Machine Learning
5	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:18.651+00	\N	\N	Web/App Development - Backend
6	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:25.767+00	\N	\N	Web/App Development - Frontend
\.


--
-- Data for Name: jp_techstack_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jp_techstack_image (id, status, user_created, date_created, user_updated, date_updated, linkto, image, alt) FROM stdin;
1	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:22.084+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:25.283+00	1	e49bc8e4-b8f9-4517-b8d0-8c1d60aea537	image
2	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:11:37.906+00	\N	\N	2	2c9ae88d-dde2-4066-a352-491ec71dd805	image
3	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:39.834+00	\N	\N	1	8cbce33a-dfcc-44cc-bee4-4479b488f307	image
4	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:48.098+00	\N	\N	1	8d4ca320-cfdf-4005-a385-a2777b942890	image
5	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:53:57.385+00	\N	\N	1	d126a2a6-2b09-452a-9f3d-0a2491a1dbad	image
6	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:05.657+00	\N	\N	1	118c67f9-a60f-4a62-bacc-b4700658d37a	image
7	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:12.744+00	\N	\N	1	3786ea60-385b-4738-a83e-dced7be6559b	image
8	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:28.155+00	\N	\N	2	388720df-d81f-4887-a19c-29dcf1c3d7db	image
9	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:39.736+00	\N	\N	\N	6c1634f5-1a38-413f-b838-ced9c6202235	image
10	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:54:51.945+00	\N	\N	2	6b21841e-3b5a-4aed-9139-a50a5e716b76	image
11	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:02.53+00	\N	\N	2	b1815bb8-6c29-4537-bc7f-790901d29b67	image
12	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:10.769+00	\N	\N	2	b3f5281a-a99e-4814-8bc2-65c9a9027343	image
13	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:18.826+00	\N	\N	2	873ceb2a-72f4-4da6-b4a9-0a9dc978f046	image
14	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:47.425+00	\N	\N	3	a0d21d1c-54ff-45e7-984f-591b8ae9be63	image
15	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:55:55.106+00	\N	\N	3	be53a4c4-098a-45ea-91db-b6ae2669564a	image
16	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:02.44+00	\N	\N	3	7716cc3f-8c21-47ff-ac5f-ad7d2b864718	image
17	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:11.481+00	\N	\N	3	b25ba673-e5e1-4187-beec-ba8a3cfc76c7	image
18	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:18.873+00	\N	\N	3	d617e2d3-d26f-4562-b0c3-46e5bc068016	image
19	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:26.566+00	\N	\N	3	0554f909-08d6-4fa1-8194-3dcb2d0fb2c7	image
20	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:38.353+00	\N	\N	3	9bd5e5b3-df48-4356-9951-a3f624eb4042	image
21	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:47.474+00	\N	\N	3	95a37fc0-645d-4d5e-8349-e727784abc24	image
22	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:56:57.897+00	\N	\N	4	29df87d8-1ac1-4386-b814-ffa951aa5bca	image
23	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:06.65+00	\N	\N	4	c927d72f-d6b9-4cb2-a4c1-c3a8cc1403a0	image
24	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:14.867+00	\N	\N	4	15331689-8d96-46c4-8f5f-20ab35f8adb1	image
25	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:23.081+00	\N	\N	4	58a7a9de-2217-427c-b371-5201f5901778	image
26	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:30.656+00	\N	\N	4	fbefceae-bb19-44cc-aa2b-7e176277639a	image
27	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:39.37+00	\N	\N	4	3a3ab399-08aa-47df-9740-96ba1319c000	image
28	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:47.344+00	\N	\N	4	c7d84063-d35e-4369-be6e-2c4c488e13ea	image
29	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:57:56.178+00	\N	\N	4	b05090ee-719d-4d8a-9256-d6975a0ad377	image
30	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:04.025+00	\N	\N	4	08f0dc33-94b4-4c53-8c98-e5adb3954a44	image
31	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:14.296+00	\N	\N	5	137575ba-da54-4f43-9999-3d28590ed360	image
32	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:24.357+00	\N	\N	5	bb161d17-d6a7-47a9-839b-9016d1a4eb3e	image
33	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:32.361+00	\N	\N	5	74edc2e8-376a-403c-bb85-7face8a4191c	image
35	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:58:57.505+00	\N	\N	5	339f955a-1a02-4429-be47-ab2a78631d8a	image
39	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:39.92+00	\N	\N	6	80b3a5b9-5051-498e-9d7a-a651226b6b04	image
40	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:48.45+00	\N	\N	6	fc99029a-d177-4d2b-b87e-0052c6bf00d9	image
41	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 08:59:56.442+00	\N	\N	6	70226b1b-320c-4635-8701-ec36629ee48d	image
42	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:05.216+00	\N	\N	6	965b9bf2-a506-44a2-a04e-23f7d621b6ef	image
43	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:15.969+00	\N	\N	6	2d280990-e1ac-4c49-9c59-73a439541ec8	image
44	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:23.798+00	\N	\N	6	4d745ef1-47c9-4a7a-be10-fdd3538fbcb7	image
45	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:00:31.489+00	\N	\N	6	a3aa6e44-9ada-4950-be23-88143059ecc6	image
46	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:23.83+00	\N	\N	5	e18e80be-8571-4e5f-8de1-be3e83872cdd	image
47	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:34.202+00	\N	\N	5	c1b62116-5f99-4b83-813b-39e46c1abd57	image
48	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 09:55:48.037+00	\N	\N	5	155d2f9f-cceb-4e88-9e30-50085c634366	image
49	published	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-31 10:01:25.255+00	\N	\N	5	a0e2ac1b-b447-4ee8-b6b2-cf94b94cf54f	image
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.links (id, status, sort, user_created, date_created, user_updated, date_updated, label, url, slug, is_relative) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 07:48:20.362+00	\N	\N	Career	/career	career	t
2	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:25:34.522+00	\N	\N	Tech Blogs	/blog	blog	t
3	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:26:11.657+00	\N	\N	Liên Hệ	/contact	contact	t
4	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:37:50.326+00	\N	\N	Data Solution	/data-solution	data-solution	t
5	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:39:21.333+00	\N	\N	Deep Learning Image Processing	/deep-learning-image-processing	deep-learning-image-processing	t
6	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:39:56.198+00	\N	\N	GPT Language Model	/gpt-language-model	gpt-language-model	t
7	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:40:20.478+00	\N	\N	IoT Development	/iot-development	iot-development	t
8	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:40:43.229+00	\N	\N	Natural Language Processing	/natural-language-processing	natural-language-processing	t
9	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:41:10.638+00	\N	\N	Voice AI Solution	/voice-ai-solution	voice-ai-solution	t
10	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 09:02:43.947+00	\N	\N	Facebook	https://www.facebook.com/DataImpactVN?locale=vi_VN	\N	f
11	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 09:02:43.955+00	\N	\N	Linkedin	https://www.linkedin.com/company/data-impact-vn/?viewAsMember=true	\N	f
12	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 09:50:06.626+00	\N	\N	AI Engineer	/career/ai-engineer	ai-engineer	t
13	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:02:42.867+00	\N	\N	Comtor	/career/comtor	comtor	t
14	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:09:01.518+00	\N	\N	BrSE	/career/brse	brse	t
15	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:14:18.973+00	\N	\N	Web Developer	/career/web-developer	web-developer	t
16	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:17:31.008+00	\N	\N	Senior Web Developer	/career/senior-web-developer	senior-web-developer	t
17	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:19:21.466+00	\N	\N	Tester	/career/tester	tester	t
18	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:24:38.568+00	\N	\N	Marketing Executive	/career/marketing	marketing-executive	t
19	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:26:40.788+00	\N	\N	Data Engineer	/career/data-engineer	data-engineer	t
20	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 10:29:18.029+00	\N	\N	IT Helpdesk	/career/it-helpdesk	it-helpdesk	t
21	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:31:00.001+00	\N	\N	トップページ	/	\N	t
22	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:31:14.385+00	\N	\N	会社情報	/company	\N	t
24	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:43:16.899+00	\N	\N	採用情報	/careers	\N	t
25	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:43:37.462+00	\N	\N	お問い合わ	/contact	\N	t
26	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:43:59.092+00	\N	\N	Tech Blog	/tech-blog	\N	t
27	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:49:03.657+00	\N	\N	データサイエンス	/data-science	\N	t
28	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:49:17.483+00	\N	\N	AIソリューション	/ai-solutions	\N	t
29	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:49:27.92+00	\N	\N	システム開発	/system-development	\N	t
30	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:49:38.498+00	\N	\N	DX推進支援	/dx-support	\N	t
31	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 06:50:29.41+00	\N	\N	Data Science	/data-science	data-science	t
33	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 06:51:30.148+00	\N	\N	System Development	/system-development	system-development	t
34	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 06:52:15.518+00	\N	\N	DX promotion support	/dx-promotion-support	dx-promotion-support	t
32	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 06:50:57.016+00	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:20:38.886+00	AI solution	/ai-solution	ai-solution	t
35	published	\N	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:21:26.414+00	\N	\N	タイトル	/develop	develop	t
23	published	\N	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:42:41.292+00	f270b2d4-78c6-48b3-a138-f1f77f74c768	2024-12-17 10:31:34.967+00	ニュース	/news	news	t
\.


--
-- Data for Name: links_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.links_group (id, status, sort, user_created, date_created, user_updated, date_updated, title) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:25:38.176+00	\N	\N	Services
\.


--
-- Data for Name: links_group_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.links_group_links (id, links_group_id, links_id) FROM stdin;
1	1	4
2	1	5
3	1	6
4	1	7
5	1	8
6	1	9
\.


--
-- Data for Name: navigations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations (id, status, user_created, date_created, user_updated, date_updated, title, language, url) FROM stdin;
10	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:46:31.235+00	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:54:41.219+00	サービス	jp	\N
1	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 07:48:20.359+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:07:57.496+00	Tuyển dụng	vn	1
2	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:25:34.52+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:08:05.411+00	Tech Blogs	vn	2
3	published	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:26:11.655+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:08:15.517+00	Liên Hệ	vn	3
4	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:31:39.082+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:08:42.093+00	トップページ	jp	21
5	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:31:54.489+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:13.109+00	会社情報	jp	22
6	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:42:41.291+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:19.717+00	ニュース	jp	23
7	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:43:16.891+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:37.32+00	採用情報	jp	24
8	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:43:37.46+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:48.652+00	お問い合わ	jp	25
9	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:43:59.091+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:09:56.588+00	Tech Blog	jp	26
\.


--
-- Data for Name: navigations_children; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_children (id, status, user_created, date_created, user_updated, date_updated, title, language, url) FROM stdin;
1	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:51:17.029+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:11:43.181+00	データサイエンス	jp	31
2	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:51:31.21+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:11:54.031+00	AIソリューション	jp	28
3	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:51:46.531+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:12:03.926+00	システム開発	jp	29
4	published	1a9b7fa7-ea0f-499b-b362-74d7073a3d71	2024-12-16 09:51:57.145+00	f343a843-c75d-4970-b281-73ebb92fc718	2024-12-27 07:12:10.165+00	DX推進支援	jp	30
\.


--
-- Data for Name: navigations_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_links (id, navigations_id, links_id) FROM stdin;
\.


--
-- Data for Name: navigations_links_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_links_1 (id, navigations_id, links_id) FROM stdin;
\.


--
-- Data for Name: navigations_links_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_links_2 (id, navigations_id, links_id, sort) FROM stdin;
1	1	1	\N
2	2	2	\N
3	3	3	\N
4	4	21	\N
5	5	22	\N
6	6	23	\N
7	7	24	\N
8	8	25	\N
9	9	26	\N
10	\N	30	\N
\.


--
-- Data for Name: navigations_navigations_children; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.navigations_navigations_children (id, navigations_id, navigations_children_id) FROM stdin;
1	10	1
2	10	2
3	10	3
4	10	4
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, status, user_created, date_created, user_updated, date_updated, title, content, slug) FROM stdin;
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, status, sort, date_created, user_updated, date_updated, title, logo, link) FROM stdin;
1	draft	\N	2024-11-19 08:47:06.979+00	\N	\N	Ctc	ff971a8e-9023-415f-80ab-c8b07c1f0374	\N
2	draft	\N	2024-11-19 08:47:29.667+00	\N	\N	Jr	b48df4f4-fc6e-40de-8eca-61e921c632f8	\N
3	published	\N	2024-11-19 08:47:53.071+00	\N	\N	Microsoft	3ea17dfd-676f-4ac3-b22e-6190dafc541c	\N
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, status, sort, user_created, date_created, user_updated, date_updated, title, content, link, language, image, reverse) FROM stdin;
1	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:37:50.33+00	\N	\N	Data Solution	Data Solution	4	vn	\N	\N
2	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:39:21.335+00	\N	\N	Deep Learning Image Processing	Deep Learning Image Processing	5	vn	\N	\N
3	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:39:56.2+00	\N	\N	GPT Language Model	GPT Language Model	6	vn	\N	\N
4	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:40:20.481+00	\N	\N	IoT Development	IoT Development	7	vn	\N	\N
5	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:40:43.231+00	\N	\N	Natural Language Processing	Natural Language Processing	8	vn	\N	\N
6	published	\N	feab763e-788a-48ac-b524-bff99fc14360	2024-11-19 08:41:10.641+00	\N	\N	Voice AI Solution	Voice AI Solution	9	vn	\N	\N
10	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 07:01:21.031+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:45:12.126+00	DX推進支援	貴社のDX推進においてアイディアソンやハンズオンを通じてアイデアを具体化し、問題解決へと導くプロセスのコンサルティングを提供し、戦略立案から実行までを一貫して支援します。DX推進に必要なシステムモダナイゼーションにも対応し、既存のシステムを最新技術にアップグレードすることで、貴社のデジタル変革を加速し、業務の効率性向上と競争力強化を実現します。	30	jp	a9c9c666-3bae-41c8-af4f-4fc8f4bd4d42	f
7	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 06:54:34.199+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:44:51.277+00	データサイエンス	当社は、データ の収集から基盤の構築、加工、分析ツールの導入、可視化、レポーティング、運用まで、ビッグデータを最大限に活用できるよう一貫したサービスを行います。具体的には、DataBricks、SnowFlake、Microsoft Fabricなどの最新のクラウドベースのデータプラットフォームを活用し、効率的かつスケーラブルなデータ処理基盤を提供します。貴社が保有するデータと対話し、隠れた機会を見出し、潜在リスクを特定することで、ビジネスに真の価値をもたらすソリューションを提供します。	27	jp	d790625e-2b34-4832-a4ef-f85b67d3d097	t
8	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 07:00:05.144+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:44:56.451+00	AIソリューション	AIと業務システムを統合した包括的なソリューションを提供します。当社は、特徴分析や特徴抽出、予測モデル、レコメンドシステム、画像処理（コンピュータビジョン）、音声認識、生成AI（Generative AI）、LLM（大規模言語モデル）、RAG（Retrieval-Augmented Generation）など、最先端のAI技術を駆使して、幅広い分野で豊富な実績を有しています。さらに、当社は、AIモデルのトレーニングから運用までを一貫してサポートし、クライアントの要件定義、技術選定、開発、展開に至るまで、ワンストップでサービスを提供します。画像認識、音声認識、NLP（自然言語処理）、そして生成AIを組み合わせた革新的なソリューションで、ビジネスの成長を支援します。	28	jp	f5a958de-71c5-47cf-9c2e-423c9b45c686	f
9	published	\N	ca300add-b2b2-432d-8164-d6fb6583a62e	2024-12-17 07:00:39.216+00	f343a843-c75d-4970-b281-73ebb92fc718	2025-01-09 09:45:08.395+00	システム開発	業務システム、基幹システム、Webサービス、モバイルアプリなど多様なニーズに対応し、要件定義、設計、実装、テスト、運用の各フェーズに専門エンジニアが対応します。新規開発はもちろん、既存システムの改善や保守にも柔軟に対応し、クラウドネイティブ、Microservices、APIファースト、コンテナ化（Docker/Kubernetes）、CI/CD（継続的インテグレーション／継続的デリバリー）など、最新のWeb開発技術を活用した、拡張性と安定性に優れたシステム開発ソリューションを提供します。	29	jp	300cf124-dd15-4ebf-92d8-850e3e469e87	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_created, date_created, user_updated, date_updated, username, logo, email) FROM stdin;
1	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:12:50.803+00	\N	\N	BaDong	7cb80de6-4e01-4cf1-b5a8-a71488a0b31a	\N
2	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:13:25.554+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:15:31.104+00	Nguyen Chi Linh	84bec2f9-105c-4936-a00e-a5ce51ebc585	\N
3	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:13:36.455+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:16:55.994+00	Hoang Tung Anh	7021c2a5-7785-42bf-8934-ba9b8116884a	\N
4	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:13:57.123+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:13.154+00	Pham Quang Hung	9e085ca3-f0e7-417c-8c49-4cd70741d993	\N
5	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:14:13.787+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:19.524+00	Nguyen Hung Cuong	a6e3ab4c-4e30-413d-9483-15ffbfce22f1	\N
6	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:14:32.761+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:30.157+00	Nguyen Quang Huy	937316ab-8f50-4028-b41c-ab6e87fcc3c4	\N
7	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:14:41.122+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:37.356+00	Do Hai Hung	94796467-9e64-48bf-974f-a3efa2d5a51d	\N
8	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:14:53.994+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:42.924+00	Nguyen Trong Khiem	4b92c619-5647-411b-a8be-ca5b12b4dfff	\N
9	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:15:03.294+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:50.395+00	Pham Minh Long	cb0121b1-1ce6-40c5-9c55-f1c40b48261e	\N
10	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:15:10.809+00	feab763e-788a-48ac-b524-bff99fc14360	2024-11-21 10:17:57.153+00	Bui Quang Thang	cf0cddaf-f32f-4cde-8d7d-fe929e3a1805	\N
11	feab763e-788a-48ac-b524-bff99fc14360	2024-11-22 03:39:03.169+00	\N	\N	Tran Manh Cuong	5749673b-b5c2-4833-836b-dd7bd331c4d3	\N
\.


--
-- Name: benefits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benefits_id_seq', 8, true);


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 16, true);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, true);


--
-- Name: companies_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_links_id_seq', 2, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 2852, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 386, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 336, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 71, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 143, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 2577, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: footers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footers_id_seq', 1, true);


--
-- Name: footers_links_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footers_links_group_id_seq', 1, true);


--
-- Name: job_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_categories_id_seq', 1, true);


--
-- Name: job_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_locations_id_seq', 1, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 9, true);


--
-- Name: jp_about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_about_id_seq', 1, true);


--
-- Name: jp_about_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_about_item_id_seq', 4, true);


--
-- Name: jp_about_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_about_text_id_seq', 3, true);


--
-- Name: jp_carousel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_carousel_id_seq', 4, true);


--
-- Name: jp_develop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_develop_id_seq', 4, true);


--
-- Name: jp_marquee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_marquee_id_seq', 10, true);


--
-- Name: jp_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_news_id_seq', 5, true);


--
-- Name: jp_techstack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_techstack_id_seq', 6, true);


--
-- Name: jp_techstack_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jp_techstack_image_id_seq', 49, true);


--
-- Name: links_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.links_group_id_seq', 1, true);


--
-- Name: links_group_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.links_group_links_id_seq', 6, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.links_id_seq', 35, true);


--
-- Name: navigations_children_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_children_id_seq', 4, true);


--
-- Name: navigations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_id_seq', 11, true);


--
-- Name: navigations_links_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_links_1_id_seq', 1, false);


--
-- Name: navigations_links_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_links_2_id_seq', 10, true);


--
-- Name: navigations_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_links_id_seq', 1, false);


--
-- Name: navigations_navigations_children_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.navigations_navigations_children_id_seq', 4, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 3, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: benefits benefits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits
    ADD CONSTRAINT benefits_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_slug_unique UNIQUE (slug);


--
-- Name: companies_links companies_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies_links
    ADD CONSTRAINT companies_links_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: companies companies_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_title_unique UNIQUE (title);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: footers_links_group footers_links_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_links_group
    ADD CONSTRAINT footers_links_group_pkey PRIMARY KEY (id);


--
-- Name: footers footers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_pkey PRIMARY KEY (id);


--
-- Name: footers footers_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_title_unique UNIQUE (title);


--
-- Name: job_categories job_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_categories
    ADD CONSTRAINT job_categories_pkey PRIMARY KEY (id);


--
-- Name: job_categories job_categories_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_categories
    ADD CONSTRAINT job_categories_title_unique UNIQUE (title);


--
-- Name: job_locations job_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_locations
    ADD CONSTRAINT job_locations_pkey PRIMARY KEY (id);


--
-- Name: job_locations job_locations_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_locations
    ADD CONSTRAINT job_locations_title_unique UNIQUE (title);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_title_unique UNIQUE (title);


--
-- Name: jp_about_item jp_about_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item
    ADD CONSTRAINT jp_about_item_pkey PRIMARY KEY (id);


--
-- Name: jp_about jp_about_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about
    ADD CONSTRAINT jp_about_pkey PRIMARY KEY (id);


--
-- Name: jp_about_text jp_about_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_text
    ADD CONSTRAINT jp_about_text_pkey PRIMARY KEY (id);


--
-- Name: jp_carousel jp_carousel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_carousel
    ADD CONSTRAINT jp_carousel_pkey PRIMARY KEY (id);


--
-- Name: jp_develop jp_develop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_develop
    ADD CONSTRAINT jp_develop_pkey PRIMARY KEY (id);


--
-- Name: jp_marquee jp_marquee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_marquee
    ADD CONSTRAINT jp_marquee_pkey PRIMARY KEY (id);


--
-- Name: jp_news jp_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_news
    ADD CONSTRAINT jp_news_pkey PRIMARY KEY (id);


--
-- Name: jp_techstack_image jp_techstack_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack_image
    ADD CONSTRAINT jp_techstack_image_pkey PRIMARY KEY (id);


--
-- Name: jp_techstack jp_techstack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack
    ADD CONSTRAINT jp_techstack_pkey PRIMARY KEY (id);


--
-- Name: links_group_links links_group_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group_links
    ADD CONSTRAINT links_group_links_pkey PRIMARY KEY (id);


--
-- Name: links_group links_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group
    ADD CONSTRAINT links_group_pkey PRIMARY KEY (id);


--
-- Name: links links_label_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_label_unique UNIQUE (label);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: navigations_children navigations_children_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_children
    ADD CONSTRAINT navigations_children_pkey PRIMARY KEY (id);


--
-- Name: navigations_links_1 navigations_links_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_1
    ADD CONSTRAINT navigations_links_1_pkey PRIMARY KEY (id);


--
-- Name: navigations_links_2 navigations_links_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_2
    ADD CONSTRAINT navigations_links_2_pkey PRIMARY KEY (id);


--
-- Name: navigations_links navigations_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links
    ADD CONSTRAINT navigations_links_pkey PRIMARY KEY (id);


--
-- Name: navigations_navigations_children navigations_navigations_children_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_navigations_children
    ADD CONSTRAINT navigations_navigations_children_pkey PRIMARY KEY (id);


--
-- Name: navigations navigations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_pkey PRIMARY KEY (id);


--
-- Name: navigations navigations_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_title_unique UNIQUE (title);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: news news_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_slug_unique UNIQUE (slug);


--
-- Name: news news_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_title_unique UNIQUE (title);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: benefits benefits_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits
    ADD CONSTRAINT benefits_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: blogs blogs_author_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_author_foreign FOREIGN KEY (author) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: companies_links companies_links_companies_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies_links
    ADD CONSTRAINT companies_links_companies_id_foreign FOREIGN KEY (companies_id) REFERENCES public.companies(id) ON DELETE SET NULL;


--
-- Name: companies_links companies_links_links_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies_links
    ADD CONSTRAINT companies_links_links_id_foreign FOREIGN KEY (links_id) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: footers_links_group footers_links_group_footers_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_links_group
    ADD CONSTRAINT footers_links_group_footers_id_foreign FOREIGN KEY (footers_id) REFERENCES public.footers(id) ON DELETE SET NULL;


--
-- Name: footers_links_group footers_links_group_links_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers_links_group
    ADD CONSTRAINT footers_links_group_links_group_id_foreign FOREIGN KEY (links_group_id) REFERENCES public.links_group(id) ON DELETE SET NULL;


--
-- Name: footers footers_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footers
    ADD CONSTRAINT footers_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: job_categories job_categories_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_categories
    ADD CONSTRAINT job_categories_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: job_locations job_locations_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_locations
    ADD CONSTRAINT job_locations_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: jobs jobs_category_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_category_foreign FOREIGN KEY (category) REFERENCES public.job_categories(id) ON DELETE SET NULL;


--
-- Name: jobs jobs_link_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_link_foreign FOREIGN KEY (link) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: jobs jobs_location_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_location_foreign FOREIGN KEY (location) REFERENCES public.job_locations(id) ON DELETE SET NULL;


--
-- Name: jp_about jp_about_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about
    ADD CONSTRAINT jp_about_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: jp_about_item jp_about_item_icon_src_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item
    ADD CONSTRAINT jp_about_item_icon_src_foreign FOREIGN KEY (icon_src) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: jp_about_item jp_about_item_image_src_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item
    ADD CONSTRAINT jp_about_item_image_src_foreign FOREIGN KEY (image_src) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: jp_about_item jp_about_item_linkto_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item
    ADD CONSTRAINT jp_about_item_linkto_foreign FOREIGN KEY (linkto) REFERENCES public.jp_about(id) ON DELETE SET NULL;


--
-- Name: jp_about_item jp_about_item_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item
    ADD CONSTRAINT jp_about_item_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: jp_about_item jp_about_item_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_item
    ADD CONSTRAINT jp_about_item_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: jp_about_text jp_about_text_linkto_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_text
    ADD CONSTRAINT jp_about_text_linkto_foreign FOREIGN KEY (linkto) REFERENCES public.jp_about(id) ON DELETE SET NULL;


--
-- Name: jp_about_text jp_about_text_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_text
    ADD CONSTRAINT jp_about_text_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: jp_about_text jp_about_text_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about_text
    ADD CONSTRAINT jp_about_text_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: jp_about jp_about_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about
    ADD CONSTRAINT jp_about_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: jp_about jp_about_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_about
    ADD CONSTRAINT jp_about_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: jp_carousel jp_carousel_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_carousel
    ADD CONSTRAINT jp_carousel_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: jp_develop jp_develop_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_develop
    ADD CONSTRAINT jp_develop_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: jp_develop jp_develop_url_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_develop
    ADD CONSTRAINT jp_develop_url_foreign FOREIGN KEY (url) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: jp_marquee jp_marquee_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_marquee
    ADD CONSTRAINT jp_marquee_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET DEFAULT;


--
-- Name: jp_marquee jp_marquee_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_marquee
    ADD CONSTRAINT jp_marquee_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: jp_news jp_news_url_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_news
    ADD CONSTRAINT jp_news_url_foreign FOREIGN KEY (url) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: jp_techstack_image jp_techstack_image_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack_image
    ADD CONSTRAINT jp_techstack_image_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: jp_techstack_image jp_techstack_image_linkto_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack_image
    ADD CONSTRAINT jp_techstack_image_linkto_foreign FOREIGN KEY (linkto) REFERENCES public.jp_techstack(id) ON DELETE SET NULL;


--
-- Name: jp_techstack_image jp_techstack_image_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack_image
    ADD CONSTRAINT jp_techstack_image_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: jp_techstack_image jp_techstack_image_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack_image
    ADD CONSTRAINT jp_techstack_image_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: jp_techstack jp_techstack_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack
    ADD CONSTRAINT jp_techstack_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: jp_techstack jp_techstack_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jp_techstack
    ADD CONSTRAINT jp_techstack_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: links_group_links links_group_links_links_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group_links
    ADD CONSTRAINT links_group_links_links_group_id_foreign FOREIGN KEY (links_group_id) REFERENCES public.links_group(id) ON DELETE SET NULL;


--
-- Name: links_group_links links_group_links_links_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group_links
    ADD CONSTRAINT links_group_links_links_id_foreign FOREIGN KEY (links_id) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: links_group links_group_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links_group
    ADD CONSTRAINT links_group_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: navigations_children navigations_children_url_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_children
    ADD CONSTRAINT navigations_children_url_foreign FOREIGN KEY (url) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: navigations_links_1 navigations_links_1_links_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_1
    ADD CONSTRAINT navigations_links_1_links_id_foreign FOREIGN KEY (links_id) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: navigations_links_1 navigations_links_1_navigations_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_1
    ADD CONSTRAINT navigations_links_1_navigations_id_foreign FOREIGN KEY (navigations_id) REFERENCES public.navigations(id) ON DELETE SET NULL;


--
-- Name: navigations_links_2 navigations_links_2_links_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_2
    ADD CONSTRAINT navigations_links_2_links_id_foreign FOREIGN KEY (links_id) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: navigations_links_2 navigations_links_2_navigations_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links_2
    ADD CONSTRAINT navigations_links_2_navigations_id_foreign FOREIGN KEY (navigations_id) REFERENCES public.navigations(id) ON DELETE SET NULL;


--
-- Name: navigations_links navigations_links_links_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links
    ADD CONSTRAINT navigations_links_links_id_foreign FOREIGN KEY (links_id) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: navigations_links navigations_links_navigations_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_links
    ADD CONSTRAINT navigations_links_navigations_id_foreign FOREIGN KEY (navigations_id) REFERENCES public.navigations(id) ON DELETE SET NULL;


--
-- Name: navigations_navigations_children navigations_navigations_children_navigatio__439096f0_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_navigations_children
    ADD CONSTRAINT navigations_navigations_children_navigatio__439096f0_foreign FOREIGN KEY (navigations_children_id) REFERENCES public.navigations_children(id);


--
-- Name: navigations_navigations_children navigations_navigations_children_navigations_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations_navigations_children
    ADD CONSTRAINT navigations_navigations_children_navigations_id_foreign FOREIGN KEY (navigations_id) REFERENCES public.navigations(id) ON DELETE SET NULL;


--
-- Name: navigations navigations_url_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.navigations
    ADD CONSTRAINT navigations_url_foreign FOREIGN KEY (url) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: news news_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: news news_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: partners partners_link_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_link_foreign FOREIGN KEY (link) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- Name: partners partners_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: services services_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: services services_link_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_link_foreign FOREIGN KEY (link) REFERENCES public.links(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--


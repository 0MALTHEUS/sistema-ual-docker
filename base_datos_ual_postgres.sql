\restrict FlciQSjs04Og4xdSRFy2s6Lm6lMtEQdnzeoHooSNapUvewmy0aQlMVz0i1AesJX

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

ALTER TABLE IF EXISTS ONLY public.informes_mensuales DROP CONSTRAINT IF EXISTS informes_mensuales_asignacion_id_fkey;
ALTER TABLE IF EXISTS ONLY public.informes_mensuales DROP CONSTRAINT IF EXISTS informes_mensuales_asesor_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hojas_ruta DROP CONSTRAINT IF EXISTS hojas_ruta_asesor_id_fkey;
ALTER TABLE IF EXISTS ONLY public.historial_eventos DROP CONSTRAINT IF EXISTS historial_eventos_denuncia_id_fkey;
DROP INDEX IF EXISTS public.ix_usuarios_username;
DROP INDEX IF EXISTS public.ix_usuarios_id;
DROP INDEX IF EXISTS public.ix_logs_auditoria_username;
DROP INDEX IF EXISTS public.ix_logs_auditoria_id;
DROP INDEX IF EXISTS public.ix_informes_mensuales_id;
DROP INDEX IF EXISTS public.ix_informes_mensuales_asignacion_id;
DROP INDEX IF EXISTS public.ix_hojas_ruta_sisco;
DROP INDEX IF EXISTS public.ix_hojas_ruta_numero;
DROP INDEX IF EXISTS public.ix_hojas_ruta_id;
DROP INDEX IF EXISTS public.ix_historial_eventos_id;
DROP INDEX IF EXISTS public.ix_denuncias_numero_caso;
DROP INDEX IF EXISTS public.ix_denuncias_id;
DROP INDEX IF EXISTS public.ix_denuncias_denunciante;
DROP INDEX IF EXISTS public.ix_denuncias_abogado_asignado;
DROP INDEX IF EXISTS public.ix_asignaciones_trabajo_comunitario_numero;
DROP INDEX IF EXISTS public.ix_asignaciones_trabajo_comunitario_id;
ALTER TABLE IF EXISTS ONLY public.usuarios DROP CONSTRAINT IF EXISTS usuarios_pkey;
ALTER TABLE IF EXISTS ONLY public.registro_alertas DROP CONSTRAINT IF EXISTS registro_alertas_pkey;
ALTER TABLE IF EXISTS ONLY public.logs_auditoria DROP CONSTRAINT IF EXISTS logs_auditoria_pkey;
ALTER TABLE IF EXISTS ONLY public.informes_mensuales DROP CONSTRAINT IF EXISTS informes_mensuales_pkey;
ALTER TABLE IF EXISTS ONLY public.hojas_ruta DROP CONSTRAINT IF EXISTS hojas_ruta_pkey;
ALTER TABLE IF EXISTS ONLY public.historial_eventos DROP CONSTRAINT IF EXISTS historial_eventos_pkey;
ALTER TABLE IF EXISTS ONLY public.festivos_personalizados DROP CONSTRAINT IF EXISTS festivos_personalizados_pkey;
ALTER TABLE IF EXISTS ONLY public.festivos_personalizados DROP CONSTRAINT IF EXISTS festivos_personalizados_fecha_key;
ALTER TABLE IF EXISTS ONLY public.denuncias DROP CONSTRAINT IF EXISTS denuncias_pkey;
ALTER TABLE IF EXISTS ONLY public.configuracion DROP CONSTRAINT IF EXISTS configuracion_pkey;
ALTER TABLE IF EXISTS ONLY public.asignaciones_trabajo_comunitario DROP CONSTRAINT IF EXISTS asignaciones_trabajo_comunitario_pkey;
ALTER TABLE IF EXISTS public.usuarios ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.registro_alertas ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.logs_auditoria ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.informes_mensuales ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.hojas_ruta ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.historial_eventos ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.festivos_personalizados ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.denuncias ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.asignaciones_trabajo_comunitario ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.usuarios_id_seq;
DROP TABLE IF EXISTS public.usuarios;
DROP SEQUENCE IF EXISTS public.registro_alertas_id_seq;
DROP TABLE IF EXISTS public.registro_alertas;
DROP SEQUENCE IF EXISTS public.logs_auditoria_id_seq;
DROP TABLE IF EXISTS public.logs_auditoria;
DROP SEQUENCE IF EXISTS public.informes_mensuales_id_seq;
DROP TABLE IF EXISTS public.informes_mensuales;
DROP SEQUENCE IF EXISTS public.hojas_ruta_id_seq;
DROP TABLE IF EXISTS public.hojas_ruta;
DROP SEQUENCE IF EXISTS public.historial_eventos_id_seq;
DROP TABLE IF EXISTS public.historial_eventos;
DROP SEQUENCE IF EXISTS public.festivos_personalizados_id_seq;
DROP TABLE IF EXISTS public.festivos_personalizados;
DROP SEQUENCE IF EXISTS public.denuncias_id_seq;
DROP TABLE IF EXISTS public.denuncias;
DROP TABLE IF EXISTS public.configuracion;
DROP SEQUENCE IF EXISTS public.asignaciones_trabajo_comunitario_id_seq;
DROP TABLE IF EXISTS public.asignaciones_trabajo_comunitario;
SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.asignaciones_trabajo_comunitario (
    id integer NOT NULL,
    numero character varying,
    nombre_completo character varying,
    cedula character varying,
    dependencia character varying,
    supervisor_nombre character varying,
    lugar_trabajo character varying,
    tiempo_condena character varying,
    fecha_inicio date,
    fecha_conclusion date,
    dias character varying,
    horarios character varying,
    nurej character varying,
    juzgado_origen character varying,
    contacto_supervisor character varying,
    cite_informe character varying,
    fecha_informe date,
    asesor_legal character varying,
    sisco character varying,
    dth character varying,
    ual character varying,
    updated_by character varying,
    updated_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone
);

CREATE SEQUENCE public.asignaciones_trabajo_comunitario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.asignaciones_trabajo_comunitario_id_seq OWNED BY public.asignaciones_trabajo_comunitario.id;

CREATE TABLE public.configuracion (
    clave character varying(50) NOT NULL,
    valor character varying(255) NOT NULL,
    descripcion character varying(255)
);

CREATE TABLE public.denuncias (
    id integer NOT NULL,
    numero_caso character varying(50) NOT NULL,
    denunciante character varying(200) NOT NULL,
    fecha_audiencia date NOT NULL,
    hora_audiencia character varying(50),
    numero_citacion character varying(50),
    solicitudes_realizadas text,
    resolucion_administrativa character varying(100),
    fecha_notificacion date,
    disposicion_resolucion_adm character varying(100),
    plazo character varying(150),
    probabilidad character varying(50),
    recurso_revision_ministerial character varying(100),
    fecha_presentacion_rr date,
    abogado_asignado character varying(150),
    etapa_actual integer,
    estado_caso character varying(50),
    fecha_limite_informe date,
    fecha_informe_emitido date,
    fecha_limite_resolucion_adm date,
    fecha_emision_resolucion_adm date,
    fecha_limite_recurso_revision date,
    fecha_limite_remision date,
    fecha_remision_ministerio date,
    fecha_limite_resolucion_ministerial date,
    fecha_resolucion_ministerial date,
    resultado_resolucion_ministerial character varying(100),
    observaciones text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

CREATE SEQUENCE public.denuncias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.denuncias_id_seq OWNED BY public.denuncias.id;

CREATE TABLE public.festivos_personalizados (
    id integer NOT NULL,
    fecha date NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion text,
    activo boolean,
    created_at timestamp without time zone
);

CREATE SEQUENCE public.festivos_personalizados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.festivos_personalizados_id_seq OWNED BY public.festivos_personalizados.id;

CREATE TABLE public.historial_eventos (
    id integer NOT NULL,
    denuncia_id integer NOT NULL,
    fecha timestamp without time zone,
    titulo character varying(200) NOT NULL,
    descripcion text,
    tipo_evento character varying(50)
);

CREATE SEQUENCE public.historial_eventos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.historial_eventos_id_seq OWNED BY public.historial_eventos.id;

CREATE TABLE public.hojas_ruta (
    id integer NOT NULL,
    numero character varying,
    sisco character varying,
    dth character varying,
    ual character varying,
    reingreso character varying,
    reingreso_manual boolean DEFAULT false NOT NULL,
    fecha_ingreso date,
    fecha_asignacion date,
    fecha_entrega date,
    fecha_salida date,
    destino character varying,
    solicitante character varying,
    referencia_asignacion character varying,
    referencia_remision character varying,
    asesor character varying,
    asesor_id integer,
    observaciones character varying,
    gestion character varying,
    updated_by character varying,
    updated_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone,
    estado_envio character varying
);

CREATE SEQUENCE public.hojas_ruta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.hojas_ruta_id_seq OWNED BY public.hojas_ruta.id;

CREATE TABLE public.informes_mensuales (
    id integer NOT NULL,
    asignacion_id integer NOT NULL,
    cite character varying NOT NULL,
    fecha date,
    referencia character varying,
    nurej character varying,
    asesor character varying,
    asesor_id integer,
    created_by character varying,
    created_at timestamp without time zone
);

CREATE SEQUENCE public.informes_mensuales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.informes_mensuales_id_seq OWNED BY public.informes_mensuales.id;

CREATE TABLE public.logs_auditoria (
    id integer NOT NULL,
    "timestamp" timestamp without time zone,
    username character varying,
    action character varying,
    details character varying,
    ip_address character varying
);

CREATE SEQUENCE public.logs_auditoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.logs_auditoria_id_seq OWNED BY public.logs_auditoria.id;

CREATE TABLE public.registro_alertas (
    id integer NOT NULL,
    denuncia_id integer NOT NULL,
    fecha_alerta date NOT NULL,
    tipo_alerta character varying(100) NOT NULL,
    mensaje character varying(300) NOT NULL,
    enviado boolean
);

CREATE SEQUENCE public.registro_alertas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.registro_alertas_id_seq OWNED BY public.registro_alertas.id;

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    username character varying,
    hashed_password character varying,
    is_admin boolean,
    is_active boolean,
    current_token character varying,
    role character varying,
    nombres_apellidos character varying,
    cedula character varying,
    contacto character varying,
    cargo character varying,
    numero_contrato character varying
);

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;

ALTER TABLE ONLY public.asignaciones_trabajo_comunitario ALTER COLUMN id SET DEFAULT nextval('public.asignaciones_trabajo_comunitario_id_seq'::regclass);

ALTER TABLE ONLY public.denuncias ALTER COLUMN id SET DEFAULT nextval('public.denuncias_id_seq'::regclass);

ALTER TABLE ONLY public.festivos_personalizados ALTER COLUMN id SET DEFAULT nextval('public.festivos_personalizados_id_seq'::regclass);

ALTER TABLE ONLY public.historial_eventos ALTER COLUMN id SET DEFAULT nextval('public.historial_eventos_id_seq'::regclass);

ALTER TABLE ONLY public.hojas_ruta ALTER COLUMN id SET DEFAULT nextval('public.hojas_ruta_id_seq'::regclass);

ALTER TABLE ONLY public.informes_mensuales ALTER COLUMN id SET DEFAULT nextval('public.informes_mensuales_id_seq'::regclass);

ALTER TABLE ONLY public.logs_auditoria ALTER COLUMN id SET DEFAULT nextval('public.logs_auditoria_id_seq'::regclass);

ALTER TABLE ONLY public.registro_alertas ALTER COLUMN id SET DEFAULT nextval('public.registro_alertas_id_seq'::regclass);

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);

COPY public.asignaciones_trabajo_comunitario (id, numero, nombre_completo, cedula, dependencia, supervisor_nombre, lugar_trabajo, tiempo_condena, fecha_inicio, fecha_conclusion, dias, horarios, nurej, juzgado_origen, contacto_supervisor, cite_informe, fecha_informe, asesor_legal, sisco, dth, ual, updated_by, updated_at, created_by, created_at) FROM stdin;
1	1	Ramiro Mamani Choque	6789123-LP	Dirección de Gestión de Riesgos	Ing. Supervisor Responsable 1	Limpieza de canales y desagüe pluvial	40 horas de trabajo comunitario	2026-02-01	2026-02-21	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7001	Juzgado 1ro Penal	71002000	CITE-TC-2026-301	2026-02-23	Carlos Alberto Mendoza Ramos	SIS-8001	DTH-9001	UAL-1001	admin	2026-11-26 01:27:17.458055	admin	2026-11-26 01:27:17.458031
2	2	Gonzalo Vargas Flores	5918293-EA	Dirección de Parques y Jardines	Ing. Supervisor Responsable 2	Mantenimiento y arborización de áreas verdes	60 horas de trabajo comunitario	2026-02-04	2026-02-24	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7002	Juzgado 2do Penal	71002001	CITE-TC-2026-302	2026-02-26	Ana Patricia Vargas Flores	SIS-8002	DTH-9002	UAL-1002	admin	2026-11-26 01:27:17.464004	admin	2026-11-26 01:27:17.463996
3	3	Víctor Hugo Quispe Alanoca	7192834-LP	Dirección de Tráfico y Vialidad	Ing. Supervisor Responsable 3	Pintado de señalización horizontal en avenidas	50 horas de trabajo comunitario	2026-02-07	2026-02-27	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7003	Juzgado 3ro Mixto	71002002	CITE-TC-2026-303	2026-03-01	Miguel Ángel Quispe Condori	SIS-8003	DTH-9003	UAL-1003	admin	2026-11-26 01:27:17.465881	admin	2026-11-26 01:27:17.465875
4	4	Jorge Luis Condori Poma	4920192-LP	Secretaría de Seguridad Ciudadana	Ing. Supervisor Responsable 4	Apoyo en mantenimiento de módulos vecinales	80 horas de trabajo comunitario	2026-02-10	2026-03-02	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7004	Juzgado 1ro Anticorrupción	71002003	CITE-TC-2026-304	2026-03-04	Laura Elena Morales Ticona	SIS-8004	DTH-9004	UAL-1004	admin	2026-11-26 01:27:17.467475	admin	2026-11-26 01:27:17.467469
5	5	Oscar Mendoza Ríos	8291024-EA	Dirección de Saneamiento y Residuos	Ing. Supervisor Responsable 5	Barrido y aseo urbano comunal	30 horas de trabajo comunitario	2026-02-13	2026-03-05	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7005	Juzgado 4to de Sentencia	71002004	CITE-TC-2026-305	2026-03-07	Roberto Gonzalo Fernández Poma	SIS-8005	DTH-9005	UAL-1005	admin	2026-11-26 01:27:17.469243	admin	2026-11-26 01:27:17.469234
6	6	Carlos Alberto Ticona Apaza	6019283-OR	Vivero Municipal Distrito 4	Ing. Supervisor Responsable 6	Preparación de suelos y viveros forestales	45 horas de trabajo comunitario	2026-02-16	2026-03-08	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7006	Juzgado 2do Penal	71002005	CITE-TC-2026-306	2026-03-10	Elena Sofía Choque Mamani	SIS-8006	DTH-9006	UAL-1006	admin	2026-11-26 01:27:17.471475	admin	2026-11-26 01:27:17.471469
7	7	Edgar Apaza Huanca	7192840-LP	Subalcaldía Distrito 5	Ing. Supervisor Responsable 7	Mantenimiento de infraestructura vecinal	70 horas de trabajo comunitario	2026-02-19	2026-03-11	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7007	Juzgado 5to de Instrucción	71002006	CITE-TC-2026-307	2026-03-13	Fernando David Apaza Luna	SIS-8007	DTH-9007	UAL-1007	admin	2026-11-26 01:27:17.472997	admin	2026-11-26 01:27:17.472991
8	8	Rubén Darío Quisbert Luna	5829104-EA	Dirección de Obras Públicas	Ing. Supervisor Responsable 8	Retiro de escombros en vías públicas	40 horas de trabajo comunitario	2026-02-22	2026-03-14	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7008	Juzgado 1ro de Sentencia	71002007	CITE-TC-2026-308	2026-03-16	Daniela Rosario Pinto Luna	SIS-8008	DTH-9008	UAL-1008	admin	2026-11-26 01:27:17.474684	admin	2026-11-26 01:27:17.474678
9	9	Álvaro Morales Laura	6928103-LP	Albergue de Acogida Municipal	Ing. Supervisor Responsable 9	Pintado de ambientes y carpintería básica	60 horas de trabajo comunitario	2026-02-25	2026-03-17	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7009	Juzgado 3ro Penal	71002008	CITE-TC-2026-309	2026-03-19	Marcelo Renato Loza Gutierrez	SIS-8009	DTH-9009	UAL-1009	admin	2026-11-26 01:27:17.476893	admin	2026-11-26 01:27:17.476886
10	10	Hernán Poma Miranda	7492810-LP	Dirección de Tráfico y Vialidad	Ing. Supervisor Responsable 10	Señalización de pasos peatonales escolares	35 horas de trabajo comunitario	2026-02-28	2026-03-20	Lunes, Miércoles y Viernes	08:30 a 12:30	2026-NUR-7010	Juzgado 2do Mixto	71002009	CITE-TC-2026-310	2026-03-22	Patricia Beatriz Miranda Rios	SIS-8010	DTH-9010	UAL-1010	admin	2026-11-26 01:27:17.478914	admin	2026-11-26 01:27:17.478907
\.

COPY public.configuracion (clave, valor, descripcion) FROM stdin;
departamento	La Paz	Departamento oficial para cálculo de feriados regionales
dias_anticipacion	3	Días de anticipación para activar alertas preventivas
hora_apertura	08:30	Horario inicio atención al público
hora_cierre	16:30	Horario finalización de recepción de trámites
notificaciones_email	desactivado	Integración de correos electrónicos automáticos
\.

COPY public.denuncias (id, numero_caso, denunciante, fecha_audiencia, hora_audiencia, numero_citacion, solicitudes_realizadas, resolucion_administrativa, fecha_notificacion, disposicion_resolucion_adm, plazo, probabilidad, recurso_revision_ministerial, fecha_presentacion_rr, abogado_asignado, etapa_actual, estado_caso, fecha_limite_informe, fecha_informe_emitido, fecha_limite_resolucion_adm, fecha_emision_resolucion_adm, fecha_limite_recurso_revision, fecha_limite_remision, fecha_remision_ministerio, fecha_limite_resolucion_ministerial, fecha_resolucion_ministerial, resultado_resolucion_ministerial, observaciones, created_at, updated_at) FROM stdin;
1	1	Juana Paredes Ramos	2026-09-27	09:30	CIT-001/26	Pago de beneficios sociales y quinquenios devengados	RA-001/2026	2026-10-12	Rechazo	Concluido - Resolucion Ministerial (Confirmacion) 16/11/2026	Baja	No Presentado	\N	Carlos Alberto Mendoza Ramos	6	Concluido	2026-10-01	2026-10-01	2026-10-15	\N	2026-10-19	\N	\N	\N	2026-11-16	Confirmacion	Seguimiento procesal activo del caso N° 1.	2026-11-26 01:27:17.523552	2026-11-26 01:27:17.523557
2	2	Marcos Colquehuanca Nina	2026-12-01	10:30	CIT-002/26	Despido injustificado y cobro de desahucio	Pendiente	\N	Pendiente	Pendiente notificacion de R.A. (para computo de 5 dias de Recurso de Revision)	Alta	No Presentado	\N	Ana Patricia Vargas Flores	1	En Tramite	2026-12-07	\N	2026-12-21	\N	\N	\N	\N	\N	\N	Pendiente	Seguimiento procesal activo del caso N° 2.	2026-11-26 01:27:17.527302	2026-11-26 01:27:17.527305
3	3	Silvia Tarqui Mendoza	2026-11-08	11:30	CIT-003/26	Horas extraordinarias no remuneradas y bono de antigüedad	RA-003/2026	2026-11-24	Reincorporacion	3 dias habiles para presentar Recurso de Revision (01/12/2026)	Alta	No Presentado	\N	Miguel Ángel Quispe Condori	3	En Tramite	2026-11-12	2026-11-12	2026-11-26	\N	2026-12-01	\N	\N	\N	\N	Pendiente	Seguimiento procesal activo del caso N° 3.	2026-11-26 01:27:17.530481	2026-11-26 01:27:17.530487
4	4	René Chura Callisaya	2026-11-23	12:30	CIT-004/26	Acoso laboral y retención indebida de sueldo	Pendiente	\N	Pendiente	Pendiente notificacion de R.A. (para computo de 5 dias de Recurso de Revision)	Media	No Presentado	\N	Laura Elena Morales Ticona	2	En Tramite	2026-11-27	2026-11-25	2026-12-09	\N	\N	\N	\N	\N	\N	Pendiente	Seguimiento procesal activo del caso N° 4.	2026-11-26 01:27:17.533237	2026-11-26 01:27:17.53324
5	5	Patricia Gutierrez Ortiz	2026-11-01	13:30	CIT-005/26	Reincorporación laboral por inamovilidad funcionaria (maternidad)	RA-005/2026	2026-11-16	Reincorporacion	Recurso presentado - 1 dias habiles para Remision al Ministerio (27/11/2026)	Alta	Presentado	2026-11-24	Roberto Gonzalo Fernández Poma	4	En Tramite	2026-11-06	2026-11-05	2026-11-19	\N	2026-11-23	2026-11-27	\N	2027-02-03	\N	Pendiente	Seguimiento procesal activo del caso N° 5.	2026-11-26 01:27:17.536102	2026-11-26 01:27:17.536105
6	6	Esteban Mayta Nina	2026-10-17	09:30	CIT-006/26	Incumplimiento de convenio colectivo de trabajo	RA-006/2026	2026-11-01	Reincorporacion	En espera de Resolucion Ministerial - 35 dias habiles (18/01/2027)	Media	Presentado	2026-11-08	Elena Sofía Choque Mamani	5	En Tramite	2026-10-22	2026-10-21	2026-11-05	\N	2026-11-09	2026-11-11	2026-11-12	2027-01-18	\N	Pendiente	Seguimiento procesal activo del caso N° 6.	2026-11-26 01:27:17.54092	2026-11-26 01:27:17.540925
7	7	Beatriz Quispe Alanoca	2026-12-06	10:30	CIT-007/26	Liquidación final por renuncia forzosa	Pendiente	\N	Pendiente	Pendiente notificacion de R.A. (para computo de 5 dias de Recurso de Revision)	Baja	No Presentado	\N	Fernando David Apaza Luna	1	En Tramite	2026-12-10	\N	2026-12-24	\N	\N	\N	\N	\N	\N	Pendiente	Seguimiento procesal activo del caso N° 7.	2026-11-26 01:27:17.543126	2026-11-26 01:27:17.543128
8	8	Javier Pinto Miranda	2026-11-06	11:30	CIT-008/26	Falta de afiliación a la Caja Nacional de Salud y AFPs	RA-008/2026	2026-11-25	Rechazo	4 dias habiles para presentar Recurso de Revision (02/12/2026)	Media	No Presentado	\N	Daniela Rosario Pinto Luna	3	En Tramite	2026-11-12	2026-11-10	2026-11-24	\N	2026-12-02	\N	\N	\N	\N	Pendiente	Seguimiento procesal activo del caso N° 8.	2026-11-26 01:27:17.545723	2026-11-26 01:27:17.545728
9	9	Gladys Choque Flores	2026-11-20	12:30	CIT-009/26	Cobro de indemnización por riesgo profesional y accidente laboral	Pendiente	\N	Pendiente	Pendiente notificacion de R.A. (para computo de 5 dias de Recurso de Revision)	Alta	No Presentado	\N	Marcelo Renato Loza Gutierrez	2	En Tramite	2026-11-26	2026-11-24	2026-12-08	\N	\N	\N	\N	\N	\N	Pendiente	Seguimiento procesal activo del caso N° 9.	2026-11-26 01:27:17.548549	2026-11-26 01:27:17.548552
10	10	Nelson Loza Mamani	2026-09-17	13:30	CIT-010/26	Devolución de aportes retenidos y pago de aguinaldo diferido	RA-010/2026	2026-10-07	Reincorporacion	Concluido - Resolucion Ministerial (Reincorporacion) 21/11/2026	Alta	Presentado	2026-10-13	Patricia Beatriz Miranda Rios	6	Concluido	2026-09-23	2026-09-22	2026-10-06	\N	2026-10-14	2026-10-16	2026-10-17	2026-12-21	2026-11-21	Reincorporacion	Seguimiento procesal activo del caso N° 10.	2026-11-26 01:27:17.551097	2026-11-26 01:27:17.5511
\.

COPY public.festivos_personalizados (id, fecha, nombre, descripcion, activo, created_at) FROM stdin;
1	2026-01-01	Año Nuevo	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515213
2	2026-01-22	Día del Estado Plurinacional	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515218
3	2026-02-16	Lunes de Carnaval	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515219
4	2026-02-17	Martes de Ch'alla	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.51522
5	2026-03-06	Aniversario de la Ciudad de El Alto	Feriado Departamental / Municipal	t	2026-11-26 01:27:17.515221
6	2026-04-03	Viernes Santo	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515222
7	2026-05-01	Día del Trabajo	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515223
8	2026-06-04	Corpus Christi	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515224
9	2026-06-21	Año Nuevo Andino Amazónico	Feriado Nacional con suspensión de plazos	t	2026-11-26 01:27:17.515225
10	2026-07-16	Aniversario Cívico de La Paz	Feriado Departamental con suspensión de plazos	t	2026-11-26 01:27:17.515226
\.

COPY public.historial_eventos (id, denuncia_id, fecha, titulo, descripcion, tipo_evento) FROM stdin;
1	1	2026-11-16 01:27:17.557768	Radicación de Causa	Denuncia formal presentada e ingresada al sistema	Procesal
2	2	2026-11-17 01:27:17.557875	Emisión de Citación	Primera citación legal generada y remitida al notificador	Audiencia
3	3	2026-11-18 01:27:17.557979	Notificación Positiva	Notificación entregada formalmente en domicilio legal	Procesal
4	4	2026-11-19 01:27:17.558049	Audiencia Conciliatoria	Audiencia instalada con presencia de ambas partes	Audiencia
5	5	2026-11-20 01:27:17.558133	Cuarto Intermedio	Se otorga plazo probatorio de 48 horas para acreditación de planillas	Procesal
6	6	2026-11-21 01:27:17.558168	Reinstalación de Audiencia	Presentación de descargos laborales y propuestas de arreglo	Audiencia
7	7	2026-11-22 01:27:17.558197	Suscripción de Acuerdo	Acta de conciliación formal suscrita ante la inspectora legal	Procesal
8	8	2026-11-23 01:27:17.558225	Conminatoria de Pago	Resolución conminatoria emitida por incumplimiento patronal	Audiencia
9	9	2026-11-24 01:27:17.558252	Verificación de Depósito	Comprobación de depósito bancario por concepto de finiquito	Procesal
10	10	2026-11-25 01:27:17.558279	Archivo y Conclusión	Causa concluida satisfactoriamente con cumplimiento total verificado	Audiencia
\.

COPY public.hojas_ruta (id, numero, sisco, dth, ual, reingreso, reingreso_manual, fecha_ingreso, fecha_asignacion, fecha_entrega, fecha_salida, destino, solicitante, referencia_asignacion, referencia_remision, asesor, asesor_id, observaciones, gestion, updated_by, updated_at, created_by, created_at, estado_envio) FROM stdin;
1	1	SIS-2026-1001	DTH-501	UAL-2026-201		f	2026-01-10	2026-01-11	2026-01-16	2026-01-16	Unidad de Asesoría Legal	Dirección de Obras Municipales	Revisión de Contrato de Mantenimiento de Vías Urbanas	Remisión con visto bueno legal según informe #1	Carlos Alberto Mendoza Ramos	2	Trámite prioritario debidamente registrado.	2026	admin	2026-11-26 01:27:17.442071	admin	2026-11-26 01:27:17.442025	aceptado
2	2	SIS-2026-1002	DTH-502	UAL-2026-202		f	2026-01-14	2026-01-15	2026-01-20	2026-01-20	Unidad de Asesoría Legal	Secretaría de Desarrollo Humano	Dictamen Legal sobre Solicitud de Expropiación de Inmueble	Remisión con visto bueno legal según informe #2	Ana Patricia Vargas Flores	3	Documentación completa adjunta.	2026	admin	2026-11-26 01:27:17.442498	admin	2026-11-26 01:27:17.442486	enviado
3	3	SIS-2026-1003	DTH-503	UAL-2026-203	primer reingreso	t	2026-01-18	2026-01-19	\N	\N	Unidad de Asesoría Legal	Dirección Jurídica General	Análisis de Recurso Jerárquico interpuesto por Empresa Constructora	\N	Miguel Ángel Quispe Condori	4	Documentación completa adjunta.	2026	admin	2026-11-26 01:27:17.442663	admin	2026-11-26 01:27:17.442657	\N
4	4	SIS-2026-1004	DTH-504	UAL-2026-204		f	2026-01-22	2026-01-23	2026-01-28	2026-01-28	Unidad de Asesoría Legal	Unidad de Contrataciones Estatales	Validación Jurídica de Documento Base de Contratación (DBC)	Remisión con visto bueno legal según informe #4	Laura Elena Morales Ticona	5	Trámite prioritario debidamente registrado.	2026	admin	2026-11-26 01:27:17.442793	admin	2026-11-26 01:27:17.442786	aceptado
5	5	SIS-2026-1005	DTH-505	UAL-2026-205		f	2026-01-26	2026-01-27	\N	\N	Unidad de Asesoría Legal	Dirección de Tráfico y Vialidad	Informe Técnico Legal sobre Ordenanza de Tarifas de Transporte	\N	Roberto Gonzalo Fernández Poma	6	Documentación completa adjunta.	2026	admin	2026-11-26 01:27:17.44298	admin	2026-11-26 01:27:17.442973	\N
6	6	SIS-2026-1006	DTH-506	UAL-2026-206		f	2026-01-30	2026-01-31	2026-02-05	2026-02-05	Unidad de Asesoría Legal	Subalcaldía Distrito 1	Aprobación de Planimetría y Derecho Propietario Distrito 1	Remisión con visto bueno legal según informe #6	Elena Sofía Choque Mamani	7	Documentación completa adjunta.	2026	admin	2026-11-26 01:27:17.443133	admin	2026-11-26 01:27:17.443124	enviado
7	7	SIS-2026-1007	DTH-507	UAL-2026-207	primer reingreso	t	2026-02-03	2026-02-04	\N	\N	Unidad de Asesoría Legal	Subalcaldía Distrito 3	Solicitud de Inicio de Proceso Administrativo Interno	\N	Fernando David Apaza Luna	8	Trámite prioritario debidamente registrado.	2026	admin	2026-11-26 01:27:17.443313	admin	2026-11-26 01:27:17.443303	rechazado
8	8	SIS-2026-1008	DTH-508	UAL-2026-208		f	2026-02-07	2026-02-08	2026-02-13	2026-02-13	Unidad de Asesoría Legal	Dirección Administrativa Financiera	Descargo de Observaciones emitidas por la Contraloría	Remisión con visto bueno legal según informe #8	Daniela Rosario Pinto Luna	9	Documentación completa adjunta.	2026	admin	2026-11-26 01:27:17.443388	admin	2026-11-26 01:27:17.443384	aceptado
9	9	SIS-2026-1009	DTH-509	UAL-2026-209		f	2026-02-11	2026-02-12	\N	\N	Unidad de Asesoría Legal	Dirección de Auditoría Interna	Dictamen Legal de Baja de Bienes Muebles en Desuso	\N	Marcelo Renato Loza Gutierrez	10	Documentación completa adjunta.	2026	admin	2026-11-26 01:27:17.44351	admin	2026-11-26 01:27:17.443507	\N
10	10	SIS-2026-1010	DTH-510	UAL-2026-210		f	2026-02-15	2026-02-16	2026-02-21	2026-02-21	Unidad de Asesoría Legal	Jefatura de Talento Humano	Reglamento Específico de Evaluación y Desempeño Laboral	Remisión con visto bueno legal según informe #10	Patricia Beatriz Miranda Rios	11	Trámite prioritario debidamente registrado.	2026	admin	2026-11-26 01:27:17.443589	admin	2026-11-26 01:27:17.443586	enviado
\.

COPY public.informes_mensuales (id, asignacion_id, cite, fecha, referencia, nurej, asesor, asesor_id, created_by, created_at) FROM stdin;
1	1	INF-MENSUAL-2026-501	2026-02-28	Informe de cumplimiento de sanción - Infractor: Ramiro Mamani Choque	2026-NUR-7001	Carlos Alberto Mendoza Ramos	2	admin	2026-11-26 01:27:17.487198
2	2	INF-MENSUAL-2026-502	2026-03-02	Informe de cumplimiento de sanción - Infractor: Gonzalo Vargas Flores	2026-NUR-7002	Ana Patricia Vargas Flores	3	admin	2026-11-26 01:27:17.492571
3	3	INF-MENSUAL-2026-503	2026-03-04	Informe de cumplimiento de sanción - Infractor: Víctor Hugo Quispe Alanoca	2026-NUR-7003	Miguel Ángel Quispe Condori	4	admin	2026-11-26 01:27:17.494929
4	4	INF-MENSUAL-2026-504	2026-03-06	Informe de cumplimiento de sanción - Infractor: Jorge Luis Condori Poma	2026-NUR-7004	Laura Elena Morales Ticona	5	admin	2026-11-26 01:27:17.497116
5	5	INF-MENSUAL-2026-505	2026-03-08	Informe de cumplimiento de sanción - Infractor: Oscar Mendoza Ríos	2026-NUR-7005	Roberto Gonzalo Fernández Poma	6	admin	2026-11-26 01:27:17.49947
6	6	INF-MENSUAL-2026-506	2026-03-10	Informe de cumplimiento de sanción - Infractor: Carlos Alberto Ticona Apaza	2026-NUR-7006	Elena Sofía Choque Mamani	7	admin	2026-11-26 01:27:17.501239
7	7	INF-MENSUAL-2026-507	2026-03-12	Informe de cumplimiento de sanción - Infractor: Edgar Apaza Huanca	2026-NUR-7007	Fernando David Apaza Luna	8	admin	2026-11-26 01:27:17.502759
8	8	INF-MENSUAL-2026-508	2026-03-14	Informe de cumplimiento de sanción - Infractor: Rubén Darío Quisbert Luna	2026-NUR-7008	Daniela Rosario Pinto Luna	9	admin	2026-11-26 01:27:17.504615
9	9	INF-MENSUAL-2026-509	2026-03-16	Informe de cumplimiento de sanción - Infractor: Álvaro Morales Laura	2026-NUR-7009	Marcelo Renato Loza Gutierrez	10	admin	2026-11-26 01:27:17.506645
10	10	INF-MENSUAL-2026-510	2026-03-18	Informe de cumplimiento de sanción - Infractor: Hernán Poma Miranda	2026-NUR-7010	Patricia Beatriz Miranda Rios	11	admin	2026-11-26 01:27:17.508284
\.

COPY public.logs_auditoria (id, "timestamp", username, action, details, ip_address) FROM stdin;
1	2026-11-26 01:27:17.585978	carlos_abogado	LOGIN_SUCCESS	Inicio de sesión exitoso del usuario	192.168.1.50
2	2026-11-25 21:27:17.587443	ana_operador	CREAR_HOJA_RUTA	Registro de nueva hoja de ruta N° 1	192.168.1.51
3	2026-11-25 17:27:17.591387	miguel_abogado	ASIGNAR_CASO	Asignación de causa legal a abogado responsable	192.168.1.52
4	2026-11-25 13:27:17.593497	laura_legal	EXPORTAR_EXCEL	Descarga de reporte consolidado de hojas de ruta	192.168.1.53
5	2026-11-25 09:27:17.595784	roberto_jefe	ACTUALIZAR_ESTADO	Actualización de estado de hoja de ruta	192.168.1.54
6	2026-11-25 05:27:17.59752	elena_recepcion	REGISTRAR_AUDIENCIA	Programación de audiencia conciliatoria para caso N° 2	192.168.1.55
7	2026-11-25 01:27:17.598951	fernando_tecnico	IMPORTAR_PLANILLA	Ingesta masiva de resoluciones de trabajo comunitario	192.168.1.56
8	2026-11-24 21:27:17.600371	daniela_secretaria	EMITIR_INFORME	Generación de informe mensual para juzgado de origen	192.168.1.57
9	2026-11-24 17:27:17.601976	marcelo_auditor	CAMBIO_PASSWORD	Actualización administrativa de credenciales de operador	192.168.1.58
10	2026-11-24 13:27:17.603661	patricia_asesor	CIERRE_CASO	Causa concluida con resolución ministerial verificada	192.168.1.59
11	2026-11-26 01:27:45.196469	admin	LOGIN_SUCCESS	Logged in successfully	127.0.0.1
\.

COPY public.registro_alertas (id, denuncia_id, fecha_alerta, tipo_alerta, mensaje, enviado) FROM stdin;
1	1	2026-11-17	AUDIENCIA_PROXIMA	Alerta: Caso N° 1 (Juana Paredes Ramos) requiere atención procesal	t
2	2	2026-11-18	PLAZO_NOTIFICACION	Alerta: Caso N° 2 (Marcos Colquehuanca Nina) requiere atención procesal	t
3	3	2026-11-19	AUDIENCIA_PROXIMA	Alerta: Caso N° 3 (Silvia Tarqui Mendoza) requiere atención procesal	t
4	4	2026-11-20	PLAZO_NOTIFICACION	Alerta: Caso N° 4 (René Chura Callisaya) requiere atención procesal	t
5	5	2026-11-21	AUDIENCIA_PROXIMA	Alerta: Caso N° 5 (Patricia Gutierrez Ortiz) requiere atención procesal	t
6	6	2026-11-22	PLAZO_NOTIFICACION	Alerta: Caso N° 6 (Esteban Mayta Nina) requiere atención procesal	t
7	7	2026-11-23	AUDIENCIA_PROXIMA	Alerta: Caso N° 7 (Beatriz Quispe Alanoca) requiere atención procesal	t
8	8	2026-11-24	PLAZO_NOTIFICACION	Alerta: Caso N° 8 (Javier Pinto Miranda) requiere atención procesal	t
9	9	2026-11-25	AUDIENCIA_PROXIMA	Alerta: Caso N° 9 (Gladys Choque Flores) requiere atención procesal	t
10	10	2026-11-26	PLAZO_NOTIFICACION	Alerta: Caso N° 10 (Nelson Loza Mamani) requiere atención procesal	t
\.

COPY public.usuarios (id, username, hashed_password, is_admin, is_active, current_token, role, nombres_apellidos, cedula, contacto, cargo, numero_contrato) FROM stdin;
2	carlos_abogado	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	t	t	\N	admin	Carlos Alberto Mendoza Ramos	4829102-LP	71542010	Abogado Asesor I	CTR-2026-4829
3	ana_operador	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_1	Ana Patricia Vargas Flores	5910293-EA	72093841	Operador de Hojas de Ruta	CTR-2026-5910
4	miguel_abogado	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_2	Miguel Ángel Quispe Condori	6192834-LP	73849102	Abogado Especialista Laboral	CTR-2026-6192
5	laura_legal	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_2	Laura Elena Morales Ticona	7281920-LP	74928103	Asesora de Casos Comunitarios	CTR-2026-7281
6	roberto_jefe	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	t	t	\N	admin	Roberto Gonzalo Fernández Poma	3819201-LP	76192834	Jefe de Unidad UAL	CTR-2026-3819
7	elena_recepcion	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_1	Elena Sofía Choque Mamani	8291029-EA	77291029	Recepcionista y Derivación	CTR-2026-8291
8	fernando_tecnico	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_3	Fernando David Apaza Luna	6928102-OR	78391029	Técnico de Seguimiento Comunitario	CTR-2026-6928
9	daniela_secretaria	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_1	Daniela Rosario Pinto Luna	7391029-LP	79482910	Secretaria de Conciliaciones	CTR-2026-7391
10	marcelo_auditor	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_3	Marcelo Renato Loza Gutierrez	5829102-LP	70192834	Auditor Jurídico Interno	CTR-2026-5829
11	patricia_asesor	$2b$12$nYSKPpCkXiU2TW2O88SNOe7ILdzsLW9gnEkRPT2fFHU975LGwmaG6	f	t	\N	tipo_2	Patricia Beatriz Miranda Rios	6829103-EA	71293847	Abogada Sumariante	CTR-2026-6829
1	admin	$2b$12$5Y9U7c5WTRXKjl4mGLDcHOTMr3.QLOmFtiuX6G0.NhSn3Pcwowu82	t	t	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTgyNzE5MjQ2NX0.sbQTgY4yeDVNP8jsprv7uuW_qOsRlb1DeU74F5z1kYo	admin	Administrador del Sistema	1000001-LP	70000001	Administrador General UAL	CTR-2026-0001
\.

SELECT pg_catalog.setval('public.asignaciones_trabajo_comunitario_id_seq', 10, true);

SELECT pg_catalog.setval('public.denuncias_id_seq', 10, true);

SELECT pg_catalog.setval('public.festivos_personalizados_id_seq', 10, true);

SELECT pg_catalog.setval('public.historial_eventos_id_seq', 10, true);

SELECT pg_catalog.setval('public.hojas_ruta_id_seq', 10, true);

SELECT pg_catalog.setval('public.informes_mensuales_id_seq', 10, true);

SELECT pg_catalog.setval('public.logs_auditoria_id_seq', 11, true);

SELECT pg_catalog.setval('public.registro_alertas_id_seq', 10, true);

SELECT pg_catalog.setval('public.usuarios_id_seq', 11, true);

ALTER TABLE ONLY public.asignaciones_trabajo_comunitario
    ADD CONSTRAINT asignaciones_trabajo_comunitario_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.configuracion
    ADD CONSTRAINT configuracion_pkey PRIMARY KEY (clave);

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT denuncias_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.festivos_personalizados
    ADD CONSTRAINT festivos_personalizados_fecha_key UNIQUE (fecha);

ALTER TABLE ONLY public.festivos_personalizados
    ADD CONSTRAINT festivos_personalizados_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.historial_eventos
    ADD CONSTRAINT historial_eventos_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.hojas_ruta
    ADD CONSTRAINT hojas_ruta_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.informes_mensuales
    ADD CONSTRAINT informes_mensuales_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.logs_auditoria
    ADD CONSTRAINT logs_auditoria_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.registro_alertas
    ADD CONSTRAINT registro_alertas_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);

CREATE INDEX ix_asignaciones_trabajo_comunitario_id ON public.asignaciones_trabajo_comunitario USING btree (id);

CREATE INDEX ix_asignaciones_trabajo_comunitario_numero ON public.asignaciones_trabajo_comunitario USING btree (numero);

CREATE INDEX ix_denuncias_abogado_asignado ON public.denuncias USING btree (abogado_asignado);

CREATE INDEX ix_denuncias_denunciante ON public.denuncias USING btree (denunciante);

CREATE INDEX ix_denuncias_id ON public.denuncias USING btree (id);

CREATE UNIQUE INDEX ix_denuncias_numero_caso ON public.denuncias USING btree (numero_caso);

CREATE INDEX ix_historial_eventos_id ON public.historial_eventos USING btree (id);

CREATE INDEX ix_hojas_ruta_id ON public.hojas_ruta USING btree (id);

CREATE INDEX ix_hojas_ruta_numero ON public.hojas_ruta USING btree (numero);

CREATE INDEX ix_hojas_ruta_sisco ON public.hojas_ruta USING btree (sisco);

CREATE INDEX ix_informes_mensuales_asignacion_id ON public.informes_mensuales USING btree (asignacion_id);

CREATE INDEX ix_informes_mensuales_id ON public.informes_mensuales USING btree (id);

CREATE INDEX ix_logs_auditoria_id ON public.logs_auditoria USING btree (id);

CREATE INDEX ix_logs_auditoria_username ON public.logs_auditoria USING btree (username);

CREATE INDEX ix_usuarios_id ON public.usuarios USING btree (id);

CREATE UNIQUE INDEX ix_usuarios_username ON public.usuarios USING btree (username);

ALTER TABLE ONLY public.historial_eventos
    ADD CONSTRAINT historial_eventos_denuncia_id_fkey FOREIGN KEY (denuncia_id) REFERENCES public.denuncias(id);

ALTER TABLE ONLY public.hojas_ruta
    ADD CONSTRAINT hojas_ruta_asesor_id_fkey FOREIGN KEY (asesor_id) REFERENCES public.usuarios(id);

ALTER TABLE ONLY public.informes_mensuales
    ADD CONSTRAINT informes_mensuales_asesor_id_fkey FOREIGN KEY (asesor_id) REFERENCES public.usuarios(id);

ALTER TABLE ONLY public.informes_mensuales
    ADD CONSTRAINT informes_mensuales_asignacion_id_fkey FOREIGN KEY (asignacion_id) REFERENCES public.asignaciones_trabajo_comunitario(id);

\unrestrict FlciQSjs04Og4xdSRFy2s6Lm6lMtEQdnzeoHooSNapUvewmy0aQlMVz0i1AesJX


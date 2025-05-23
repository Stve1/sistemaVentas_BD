PGDMP                      }            sistemaVentas    17.4    17.4 u    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            Y           1262    16556    sistemaVentas    DATABASE     u   CREATE DATABASE "sistemaVentas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE "sistemaVentas";
                     postgres    false            �            1255    16697    verificar_stock()    FUNCTION     �  CREATE FUNCTION public.verificar_stock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    stock INTEGER := 0;
BEGIN
    -- Obtener el stock disponible del producto
    SELECT cant_producto INTO stock
    FROM productos
    WHERE id_producto = NEW.id_producto;

    -- Verificar si hay suficiente stock
    IF stock >= NEW.cantidad_producto THEN
        -- Actualizar el stock del producto
        UPDATE productos
        SET cant_producto = cant_producto - NEW.cantidad_producto
        WHERE id_producto = NEW.id_producto;
    ELSE
        -- Si no hay suficiente stock, generar un error
        RAISE EXCEPTION 'Stock no disponible.';
    END IF;
    
    -- Permitir que la inserción continúe
    RETURN NEW;
END;
$$;
 (   DROP FUNCTION public.verificar_stock();
       public               postgres    false            �            1259    16557 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying,
    estado_categoria character varying
);
    DROP TABLE public.categorias;
       public         heap r       postgres    false            �            1259    16562    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    numero_cliente integer,
    nombre_cliente character varying,
    apellido_cliente character varying,
    cedula_cliente integer
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false            �            1259    24940    costos    TABLE     �   CREATE TABLE public.costos (
    id_costo integer NOT NULL,
    costo_producto integer,
    fecha_modificacion_costo timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.costos;
       public         heap r       postgres    false            �            1259    24910    costos_productos    TABLE     �   CREATE TABLE public.costos_productos (
    id_costo_producto integer NOT NULL,
    id_costo integer,
    id_producto integer,
    fecha_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.costos_productos;
       public         heap r       postgres    false            �            1259    16567    id_categoria_inc    SEQUENCE     �   CREATE SEQUENCE public.id_categoria_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 '   DROP SEQUENCE public.id_categoria_inc;
       public               postgres    false    217            Z           0    0    id_categoria_inc    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.id_categoria_inc OWNED BY public.categorias.id_categoria;
          public               postgres    false    219            �            1259    16568    id_cliente_inc    SEQUENCE     �   CREATE SEQUENCE public.id_cliente_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 %   DROP SEQUENCE public.id_cliente_inc;
       public               postgres    false    218            [           0    0    id_cliente_inc    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.id_cliente_inc OWNED BY public.clientes.id_cliente;
          public               postgres    false    220            �            1259    24963    id_costo_inc    SEQUENCE     u   CREATE SEQUENCE public.id_costo_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.id_costo_inc;
       public               postgres    false    242            \           0    0    id_costo_inc    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.id_costo_inc OWNED BY public.costos.id_costo;
          public               postgres    false    244            �            1259    24916    id_costo_producto_inc    SEQUENCE     ~   CREATE SEQUENCE public.id_costo_producto_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.id_costo_producto_inc;
       public               postgres    false    239            ]           0    0    id_costo_producto_inc    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.id_costo_producto_inc OWNED BY public.costos_productos.id_costo_producto;
          public               postgres    false    240            �            1259    16569    metodo_pagos    TABLE     t   CREATE TABLE public.metodo_pagos (
    id_metodo_pago integer NOT NULL,
    descripcion_metodo character varying
);
     DROP TABLE public.metodo_pagos;
       public         heap r       postgres    false            �            1259    16574    id_metodo_pago_inc    SEQUENCE     {   CREATE SEQUENCE public.id_metodo_pago_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.id_metodo_pago_inc;
       public               postgres    false    221            ^           0    0    id_metodo_pago_inc    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.id_metodo_pago_inc OWNED BY public.metodo_pagos.id_metodo_pago;
          public               postgres    false    222            �            1259    16685    precios    TABLE     �   CREATE TABLE public.precios (
    id_precio integer NOT NULL,
    precio_producto integer,
    fecha_modificacion_precio timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.precios;
       public         heap r       postgres    false            �            1259    24962    id_precio_inc    SEQUENCE     v   CREATE SEQUENCE public.id_precio_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_precio_inc;
       public               postgres    false    237            _           0    0    id_precio_inc    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.id_precio_inc OWNED BY public.precios.id_precio;
          public               postgres    false    243            �            1259    24907    id_precio_producto_inc    SEQUENCE        CREATE SEQUENCE public.id_precio_producto_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.id_precio_producto_inc;
       public               postgres    false    237            `           0    0    id_precio_producto_inc    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.id_precio_producto_inc OWNED BY public.precios.id_precio;
          public               postgres    false    238            �            1259    16575 	   productos    TABLE     �   CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying,
    aplicacion_productos character varying,
    cant_producto integer,
    cod_producto integer DEFAULT 0,
    id_subcategoria integer
);
    DROP TABLE public.productos;
       public         heap r       postgres    false            �            1259    16583    id_productos_inc    SEQUENCE     �   CREATE SEQUENCE public.id_productos_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 '   DROP SEQUENCE public.id_productos_inc;
       public               postgres    false    223            a           0    0    id_productos_inc    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.id_productos_inc OWNED BY public.productos.id_producto;
          public               postgres    false    224            �            1259    16584    salidas    TABLE     �   CREATE TABLE public.salidas (
    id_salida integer NOT NULL,
    descripcion_salida character varying,
    valor_salida integer,
    metodo_pago_salida integer,
    fecha_salida timestamp without time zone
);
    DROP TABLE public.salidas;
       public         heap r       postgres    false            �            1259    16589    id_salida_inc    SEQUENCE     v   CREATE SEQUENCE public.id_salida_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_salida_inc;
       public               postgres    false    225            b           0    0    id_salida_inc    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.id_salida_inc OWNED BY public.salidas.id_salida;
          public               postgres    false    226            �            1259    16590    subcategorias    TABLE     �   CREATE TABLE public.subcategorias (
    id_subcategoria integer NOT NULL,
    nombre_subcategoria character varying,
    id_categoria integer
);
 !   DROP TABLE public.subcategorias;
       public         heap r       postgres    false            �            1259    16595    id_subcategoria_inc    SEQUENCE     �   CREATE SEQUENCE public.id_subcategoria_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 *   DROP SEQUENCE public.id_subcategoria_inc;
       public               postgres    false    227            c           0    0    id_subcategoria_inc    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.id_subcategoria_inc OWNED BY public.subcategorias.id_subcategoria;
          public               postgres    false    228            �            1259    16596    unidades    TABLE     f   CREATE TABLE public.unidades (
    id_unidad integer NOT NULL,
    nombre_unidad character varying
);
    DROP TABLE public.unidades;
       public         heap r       postgres    false            �            1259    16601    id_unidad_inc    SEQUENCE     v   CREATE SEQUENCE public.id_unidad_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_unidad_inc;
       public               postgres    false    229            d           0    0    id_unidad_inc    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.id_unidad_inc OWNED BY public.unidades.id_unidad;
          public               postgres    false    230            �            1259    16602    venta_productos    TABLE       CREATE TABLE public.venta_productos (
    id_venta_producto integer NOT NULL,
    id_producto integer,
    cantidad_producto integer,
    descuento_producto integer,
    incremento_producto integer,
    fecha_venta time without time zone,
    id_venta integer
);
 #   DROP TABLE public.venta_productos;
       public         heap r       postgres    false            �            1259    16605    id_venta_productos_inc    SEQUENCE     �   CREATE SEQUENCE public.id_venta_productos_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 -   DROP SEQUENCE public.id_venta_productos_inc;
       public               postgres    false    231            e           0    0    id_venta_productos_inc    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.id_venta_productos_inc OWNED BY public.venta_productos.id_venta_producto;
          public               postgres    false    232            �            1259    16606    ventas    TABLE     1  CREATE TABLE public.ventas (
    id_venta integer NOT NULL,
    fecha_venta timestamp without time zone,
    total_descuento integer,
    total_incremento integer,
    total_venta integer,
    id_cliente integer,
    cantidad_productos integer,
    metodo_pago integer,
    id_unidad integer DEFAULT 1
);
    DROP TABLE public.ventas;
       public         heap r       postgres    false            �            1259    16610    id_ventas_inc    SEQUENCE     �   CREATE SEQUENCE public.id_ventas_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 $   DROP SEQUENCE public.id_ventas_inc;
       public               postgres    false    233            f           0    0    id_ventas_inc    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.id_ventas_inc OWNED BY public.ventas.id_venta;
          public               postgres    false    234            �            1259    16611 
   parametros    TABLE     �   CREATE TABLE public.parametros (
    id_parametro integer NOT NULL,
    descripcion_parametro character varying,
    valor_parametro integer
);
    DROP TABLE public.parametros;
       public         heap r       postgres    false            �            1259    24924    precios_productos    TABLE       CREATE TABLE public.precios_productos (
    id_precio_producto integer DEFAULT nextval('public.id_precio_producto_inc'::regclass) NOT NULL,
    id_precio integer,
    id_producto integer,
    fecha_modificacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public.precios_productos;
       public         heap r       postgres    false    238            �            1259    16616    v_reportes_diarios    VIEW     I  CREATE VIEW public.v_reportes_diarios AS
 SELECT v.id_venta,
    concat(c.nombre_cliente, ' ', c.apellido_cliente) AS nombre_cliente,
    v.fecha_venta,
    v.total_descuento,
    v.total_incremento,
    v.total_venta,
    v.id_cliente,
    v.cantidad_productos,
    mp.id_metodo_pago,
    mp.descripcion_metodo,
    u.id_unidad
   FROM (((public.ventas v
     JOIN public.clientes c ON ((c.id_cliente = v.id_cliente)))
     JOIN public.metodo_pagos mp ON ((mp.id_metodo_pago = v.metodo_pago)))
     JOIN public.unidades u ON ((u.id_unidad = v.id_unidad)))
  ORDER BY v.id_venta DESC;
 %   DROP VIEW public.v_reportes_diarios;
       public       v       postgres    false    233    218    221    218    221    233    229    233    233    233    218    233    233    233    233            f           2604    16621    categorias id_categoria    DEFAULT     w   ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.id_categoria_inc'::regclass);
 F   ALTER TABLE public.categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public               postgres    false    219    217            g           2604    16622    clientes id_cliente    DEFAULT     q   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.id_cliente_inc'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    220    218            w           2604    24964    costos id_costo    DEFAULT     k   ALTER TABLE ONLY public.costos ALTER COLUMN id_costo SET DEFAULT nextval('public.id_costo_inc'::regclass);
 >   ALTER TABLE public.costos ALTER COLUMN id_costo DROP DEFAULT;
       public               postgres    false    244    242            s           2604    24917 "   costos_productos id_costo_producto    DEFAULT     �   ALTER TABLE ONLY public.costos_productos ALTER COLUMN id_costo_producto SET DEFAULT nextval('public.id_costo_producto_inc'::regclass);
 Q   ALTER TABLE public.costos_productos ALTER COLUMN id_costo_producto DROP DEFAULT;
       public               postgres    false    240    239            h           2604    16623    metodo_pagos id_metodo_pago    DEFAULT     }   ALTER TABLE ONLY public.metodo_pagos ALTER COLUMN id_metodo_pago SET DEFAULT nextval('public.id_metodo_pago_inc'::regclass);
 J   ALTER TABLE public.metodo_pagos ALTER COLUMN id_metodo_pago DROP DEFAULT;
       public               postgres    false    222    221            q           2604    24965    precios id_precio    DEFAULT     n   ALTER TABLE ONLY public.precios ALTER COLUMN id_precio SET DEFAULT nextval('public.id_precio_inc'::regclass);
 @   ALTER TABLE public.precios ALTER COLUMN id_precio DROP DEFAULT;
       public               postgres    false    243    237            i           2604    16624    productos id_producto    DEFAULT     u   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.id_productos_inc'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public               postgres    false    224    223            k           2604    16625    salidas id_salida    DEFAULT     n   ALTER TABLE ONLY public.salidas ALTER COLUMN id_salida SET DEFAULT nextval('public.id_salida_inc'::regclass);
 @   ALTER TABLE public.salidas ALTER COLUMN id_salida DROP DEFAULT;
       public               postgres    false    226    225            l           2604    16626    subcategorias id_subcategoria    DEFAULT     �   ALTER TABLE ONLY public.subcategorias ALTER COLUMN id_subcategoria SET DEFAULT nextval('public.id_subcategoria_inc'::regclass);
 L   ALTER TABLE public.subcategorias ALTER COLUMN id_subcategoria DROP DEFAULT;
       public               postgres    false    228    227            m           2604    16627    unidades id_unidad    DEFAULT     o   ALTER TABLE ONLY public.unidades ALTER COLUMN id_unidad SET DEFAULT nextval('public.id_unidad_inc'::regclass);
 A   ALTER TABLE public.unidades ALTER COLUMN id_unidad DROP DEFAULT;
       public               postgres    false    230    229            n           2604    16628 !   venta_productos id_venta_producto    DEFAULT     �   ALTER TABLE ONLY public.venta_productos ALTER COLUMN id_venta_producto SET DEFAULT nextval('public.id_venta_productos_inc'::regclass);
 P   ALTER TABLE public.venta_productos ALTER COLUMN id_venta_producto DROP DEFAULT;
       public               postgres    false    232    231            o           2604    16629    ventas id_venta    DEFAULT     l   ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.id_ventas_inc'::regclass);
 >   ALTER TABLE public.ventas ALTER COLUMN id_venta DROP DEFAULT;
       public               postgres    false    234    233            9          0    16557 
   categorias 
   TABLE DATA           V   COPY public.categorias (id_categoria, nombre_categoria, estado_categoria) FROM stdin;
    public               postgres    false    217   ��       :          0    16562    clientes 
   TABLE DATA           p   COPY public.clientes (id_cliente, numero_cliente, nombre_cliente, apellido_cliente, cedula_cliente) FROM stdin;
    public               postgres    false    218   ֏       Q          0    24940    costos 
   TABLE DATA           T   COPY public.costos (id_costo, costo_producto, fecha_modificacion_costo) FROM stdin;
    public               postgres    false    242   �       N          0    24910    costos_productos 
   TABLE DATA           h   COPY public.costos_productos (id_costo_producto, id_costo, id_producto, fecha_modificacion) FROM stdin;
    public               postgres    false    239   g�       =          0    16569    metodo_pagos 
   TABLE DATA           J   COPY public.metodo_pagos (id_metodo_pago, descripcion_metodo) FROM stdin;
    public               postgres    false    221   Ð       K          0    16611 
   parametros 
   TABLE DATA           Z   COPY public.parametros (id_parametro, descripcion_parametro, valor_parametro) FROM stdin;
    public               postgres    false    235   �       L          0    16685    precios 
   TABLE DATA           X   COPY public.precios (id_precio, precio_producto, fecha_modificacion_precio) FROM stdin;
    public               postgres    false    237   *�       P          0    24924    precios_productos 
   TABLE DATA           k   COPY public.precios_productos (id_precio_producto, id_precio, id_producto, fecha_modificacion) FROM stdin;
    public               postgres    false    241   ��       ?          0    16575 	   productos 
   TABLE DATA           �   COPY public.productos (id_producto, nombre_producto, aplicacion_productos, cant_producto, cod_producto, id_subcategoria) FROM stdin;
    public               postgres    false    223   ߑ       A          0    16584    salidas 
   TABLE DATA           p   COPY public.salidas (id_salida, descripcion_salida, valor_salida, metodo_pago_salida, fecha_salida) FROM stdin;
    public               postgres    false    225   Y�       C          0    16590    subcategorias 
   TABLE DATA           [   COPY public.subcategorias (id_subcategoria, nombre_subcategoria, id_categoria) FROM stdin;
    public               postgres    false    227   v�       E          0    16596    unidades 
   TABLE DATA           <   COPY public.unidades (id_unidad, nombre_unidad) FROM stdin;
    public               postgres    false    229   ��       G          0    16602    venta_productos 
   TABLE DATA           �   COPY public.venta_productos (id_venta_producto, id_producto, cantidad_producto, descuento_producto, incremento_producto, fecha_venta, id_venta) FROM stdin;
    public               postgres    false    231   ђ       I          0    16606    ventas 
   TABLE DATA           �   COPY public.ventas (id_venta, fecha_venta, total_descuento, total_incremento, total_venta, id_cliente, cantidad_productos, metodo_pago, id_unidad) FROM stdin;
    public               postgres    false    233   ��       g           0    0    id_categoria_inc    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_categoria_inc', 1, true);
          public               postgres    false    219            h           0    0    id_cliente_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_cliente_inc', 1, true);
          public               postgres    false    220            i           0    0    id_costo_inc    SEQUENCE SET     :   SELECT pg_catalog.setval('public.id_costo_inc', 4, true);
          public               postgres    false    244            j           0    0    id_costo_producto_inc    SEQUENCE SET     C   SELECT pg_catalog.setval('public.id_costo_producto_inc', 4, true);
          public               postgres    false    240            k           0    0    id_metodo_pago_inc    SEQUENCE SET     @   SELECT pg_catalog.setval('public.id_metodo_pago_inc', 4, true);
          public               postgres    false    222            l           0    0    id_precio_inc    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.id_precio_inc', 4, true);
          public               postgres    false    243            m           0    0    id_precio_producto_inc    SEQUENCE SET     D   SELECT pg_catalog.setval('public.id_precio_producto_inc', 4, true);
          public               postgres    false    238            n           0    0    id_productos_inc    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_productos_inc', 2, true);
          public               postgres    false    224            o           0    0    id_salida_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_salida_inc', 1, false);
          public               postgres    false    226            p           0    0    id_subcategoria_inc    SEQUENCE SET     A   SELECT pg_catalog.setval('public.id_subcategoria_inc', 1, true);
          public               postgres    false    228            q           0    0    id_unidad_inc    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.id_unidad_inc', 1, true);
          public               postgres    false    230            r           0    0    id_venta_productos_inc    SEQUENCE SET     E   SELECT pg_catalog.setval('public.id_venta_productos_inc', 28, true);
          public               postgres    false    232            s           0    0    id_ventas_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_ventas_inc', 13, true);
          public               postgres    false    234            z           2606    16631    categorias categorias_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pk PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pk;
       public                 postgres    false    217            |           2606    16633    clientes clientes_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pk;
       public                 postgres    false    218            �           2606    24951    costos costos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.costos
    ADD CONSTRAINT costos_pkey PRIMARY KEY (id_costo);
 <   ALTER TABLE ONLY public.costos DROP CONSTRAINT costos_pkey;
       public                 postgres    false    242            �           2606    24915 &   costos_productos costos_productos_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.costos_productos
    ADD CONSTRAINT costos_productos_pkey PRIMARY KEY (id_costo_producto);
 P   ALTER TABLE ONLY public.costos_productos DROP CONSTRAINT costos_productos_pkey;
       public                 postgres    false    239            ~           2606    16635    metodo_pagos metodo_pagos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.metodo_pagos
    ADD CONSTRAINT metodo_pagos_pkey PRIMARY KEY (id_metodo_pago);
 H   ALTER TABLE ONLY public.metodo_pagos DROP CONSTRAINT metodo_pagos_pkey;
       public                 postgres    false    221            �           2606    16637    parametros parametros_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.parametros
    ADD CONSTRAINT parametros_pk PRIMARY KEY (id_parametro);
 B   ALTER TABLE ONLY public.parametros DROP CONSTRAINT parametros_pk;
       public                 postgres    false    235            �           2606    16689    precios precios_productos_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.precios
    ADD CONSTRAINT precios_productos_pkey PRIMARY KEY (id_precio);
 H   ALTER TABLE ONLY public.precios DROP CONSTRAINT precios_productos_pkey;
       public                 postgres    false    237            �           2606    24928 )   precios_productos precios_productos_pkey1 
   CONSTRAINT     w   ALTER TABLE ONLY public.precios_productos
    ADD CONSTRAINT precios_productos_pkey1 PRIMARY KEY (id_precio_producto);
 S   ALTER TABLE ONLY public.precios_productos DROP CONSTRAINT precios_productos_pkey1;
       public                 postgres    false    241            �           2606    16639    productos productos_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pk PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pk;
       public                 postgres    false    223            �           2606    16641    salidas salidas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT salidas_pkey PRIMARY KEY (id_salida);
 >   ALTER TABLE ONLY public.salidas DROP CONSTRAINT salidas_pkey;
       public                 postgres    false    225            �           2606    16643    subcategorias subcategorias_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pk PRIMARY KEY (id_subcategoria);
 H   ALTER TABLE ONLY public.subcategorias DROP CONSTRAINT subcategorias_pk;
       public                 postgres    false    227            �           2606    16645    unidades unidades_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_pk PRIMARY KEY (id_unidad);
 >   ALTER TABLE ONLY public.unidades DROP CONSTRAINT unidades_pk;
       public                 postgres    false    229            �           2606    16647 "   venta_productos venta_productos_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT venta_productos_pk PRIMARY KEY (id_venta_producto);
 L   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT venta_productos_pk;
       public                 postgres    false    231            �           2606    16649    ventas ventas_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pk PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pk;
       public                 postgres    false    233            �           1259    24923    idx_costo_producto    INDEX     �   CREATE INDEX idx_costo_producto ON public.costos_productos USING btree (id_costo_producto DESC) WITH (deduplicate_items='true');
 &   DROP INDEX public.idx_costo_producto;
       public                 postgres    false    239            �           1259    24903    idx_precios_productos    INDEX     s   CREATE INDEX idx_precios_productos ON public.precios USING btree (id_precio DESC) WITH (deduplicate_items='true');
 )   DROP INDEX public.idx_precios_productos;
       public                 postgres    false    237                       1259    24899    idx_producto    INDEX     n   CREATE INDEX idx_producto ON public.productos USING btree (id_producto DESC) WITH (deduplicate_items='true');
     DROP INDEX public.idx_producto;
       public                 postgres    false    223            �           1259    24902    idx_salidas    INDEX     i   CREATE INDEX idx_salidas ON public.salidas USING btree (id_salida DESC) WITH (deduplicate_items='true');
    DROP INDEX public.idx_salidas;
       public                 postgres    false    225            �           1259    24901    idx_venta_productos    INDEX     �   CREATE INDEX idx_venta_productos ON public.venta_productos USING btree (id_venta_producto DESC) WITH (deduplicate_items='true');
 '   DROP INDEX public.idx_venta_productos;
       public                 postgres    false    231            �           1259    24900 
   idx_ventas    INDEX     f   CREATE INDEX idx_ventas ON public.ventas USING btree (id_venta DESC) WITH (deduplicate_items='true');
    DROP INDEX public.idx_ventas;
       public                 postgres    false    233            �           2620    16698 '   venta_productos trigger_verificar_stock    TRIGGER     �   CREATE TRIGGER trigger_verificar_stock BEFORE INSERT ON public.venta_productos FOR EACH ROW EXECUTE FUNCTION public.verificar_stock();
 @   DROP TRIGGER trigger_verificar_stock ON public.venta_productos;
       public               postgres    false    245    231            �           2606    16650    ventas id_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ;   ALTER TABLE ONLY public.ventas DROP CONSTRAINT id_cliente;
       public               postgres    false    218    233    4732            �           2606    24952    costos_productos id_costo    FK CONSTRAINT     �   ALTER TABLE ONLY public.costos_productos
    ADD CONSTRAINT id_costo FOREIGN KEY (id_costo) REFERENCES public.costos(id_costo) NOT VALID;
 C   ALTER TABLE ONLY public.costos_productos DROP CONSTRAINT id_costo;
       public               postgres    false    4762    242    239            �           2606    24929    precios_productos id_precio    FK CONSTRAINT     �   ALTER TABLE ONLY public.precios_productos
    ADD CONSTRAINT id_precio FOREIGN KEY (id_precio) REFERENCES public.precios(id_precio) NOT VALID;
 E   ALTER TABLE ONLY public.precios_productos DROP CONSTRAINT id_precio;
       public               postgres    false    241    4755    237            �           2606    16655    venta_productos id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 E   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT id_producto;
       public               postgres    false    223    231    4737            �           2606    24934    precios_productos id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.precios_productos
    ADD CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 G   ALTER TABLE ONLY public.precios_productos DROP CONSTRAINT id_producto;
       public               postgres    false    4737    241    223            �           2606    24957    costos_productos id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.costos_productos
    ADD CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 F   ALTER TABLE ONLY public.costos_productos DROP CONSTRAINT id_producto;
       public               postgres    false    223    4737    239            �           2606    16660    productos id_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_subcategoria FOREIGN KEY (id_subcategoria) REFERENCES public.subcategorias(id_subcategoria) NOT VALID;
 C   ALTER TABLE ONLY public.productos DROP CONSTRAINT id_subcategoria;
       public               postgres    false    223    227    4742            �           2606    16665    ventas id_unidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES public.unidades(id_unidad) NOT VALID;
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT id_unidad;
       public               postgres    false    229    233    4744            �           2606    16670    venta_productos id_venta    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT id_venta FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) NOT VALID;
 B   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT id_venta;
       public               postgres    false    231    4750    233            �           2606    16675    ventas metodo_pago    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT metodo_pago FOREIGN KEY (metodo_pago) REFERENCES public.metodo_pagos(id_metodo_pago) NOT VALID;
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT metodo_pago;
       public               postgres    false    221    233    4734            �           2606    16680    salidas metodo_pago_salida    FK CONSTRAINT     �   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT metodo_pago_salida FOREIGN KEY (metodo_pago_salida) REFERENCES public.metodo_pagos(id_metodo_pago) NOT VALID;
 D   ALTER TABLE ONLY public.salidas DROP CONSTRAINT metodo_pago_salida;
       public               postgres    false    225    4734    221            9      x�3�J-(M-.�/�t����� 9�      :   !   x�3�4426153��4��s"G$�=... }L�      Q   P   x��ʱ�@�:��xَ�z1����B��cP�!�wx�ڀ��0GO�\�h��h�.�
�[X�������#3/��#      N   L   x�u̱� D�ڞ�@����ga�9��H�ۧ���[t�F���9l�J(����q�7����d.����P�r<�      =   :   x�3�tMKM.�,��2��K-,��2�tJ�K����M�L�2�tI,�,�I,I����� ���      K      x������ � �      L   K   x��ʱ� D�ڞ�@wg"f��s�2U"��?����Ȏ��#(E���-�L��Q��4ja]�i�rw 8�      P   J   x�}ʱ�0���F�l�,���N��ڛ2�9u=��m�~C4i"���)���e�Ypu��p��>l��      ?   j   x�3�����KWp�/HTp�LK-J�K�L�Q��p��+x{��sp�Xprr����)8'���5�)����t�9��@mF��@m1z\\\ zrt      A      x������ � �      C      x�3��/�L��K�I-�4����� ?h4      E      x�3�.�/*��/�/Vp�)M����� Z��      G   �   x�U����0�7�b�H@,��dמ�#]()�� "�R�s�i�`X+n}���
�~����(HyW����B.ou=<��Z���^�Չ���/�i���|�*́��L������wYخ����J��G�N�]�_E��l�Wfg��l�_����-�s��E�3 �G=      I   �   x�]���0E�o�
7��L�u�C"�"$������A< I�b3@��h+�uOg~r�$�DLvӵvl�u��?�4�K�7�*���dJ;�"�\]�fE���!��%|:�Ry�kY���/��-��N�)�ZgP���f��	�2     
PGDMP      +                |            sistemaVentas    15.5    16.0 N    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            d           1262    16398    sistemaVentas    DATABASE     �   CREATE DATABASE "sistemaVentas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "sistemaVentas";
                postgres    false            �            1259    17296 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying,
    estado_categoria character varying
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    17266    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    numero_cliente integer,
    nombre_cliente character varying,
    apellido_cliente character varying,
    cedula_cliente integer
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    17338    id_categoria_inc    SEQUENCE     �   CREATE SEQUENCE public.id_categoria_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 '   DROP SEQUENCE public.id_categoria_inc;
       public          postgres    false    218            e           0    0    id_categoria_inc    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.id_categoria_inc OWNED BY public.categorias.id_categoria;
          public          postgres    false    223            �            1259    17367    id_cliente_inc    SEQUENCE     �   CREATE SEQUENCE public.id_cliente_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 %   DROP SEQUENCE public.id_cliente_inc;
       public          postgres    false    215            f           0    0    id_cliente_inc    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.id_cliente_inc OWNED BY public.clientes.id_cliente;
          public          postgres    false    227            �            1259    18329    metodo_pagos    TABLE     t   CREATE TABLE public.metodo_pagos (
    id_metodo_pago integer NOT NULL,
    descripcion_metodo character varying
);
     DROP TABLE public.metodo_pagos;
       public         heap    postgres    false            �            1259    18343    id_metodo_pago_inc    SEQUENCE     {   CREATE SEQUENCE public.id_metodo_pago_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.id_metodo_pago_inc;
       public          postgres    false    228            g           0    0    id_metodo_pago_inc    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.id_metodo_pago_inc OWNED BY public.metodo_pagos.id_metodo_pago;
          public          postgres    false    229            �            1259    17256 	   productos    TABLE     {  CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying,
    aplicacion_productos character varying,
    costo_producto integer,
    precio_producto integer,
    cant_producto integer,
    cod_producto integer DEFAULT 0,
    id_subcategoria integer,
    costo2_producto integer DEFAULT 0,
    precio2_producto integer DEFAULT 0
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    17336    id_productos_inc    SEQUENCE     �   CREATE SEQUENCE public.id_productos_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 '   DROP SEQUENCE public.id_productos_inc;
       public          postgres    false    214            h           0    0    id_productos_inc    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.id_productos_inc OWNED BY public.productos.id_producto;
          public          postgres    false    222            �            1259    18360    salidas    TABLE     �   CREATE TABLE public.salidas (
    id_salida integer NOT NULL,
    descripcion_salida character varying,
    valor_salida integer,
    metodo_pago_salida integer,
    fecha_salida timestamp without time zone
);
    DROP TABLE public.salidas;
       public         heap    postgres    false            �            1259    18372    id_salida_inc    SEQUENCE     v   CREATE SEQUENCE public.id_salida_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_salida_inc;
       public          postgres    false    232            i           0    0    id_salida_inc    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.id_salida_inc OWNED BY public.salidas.id_salida;
          public          postgres    false    233            �            1259    17289    subcategorias    TABLE     �   CREATE TABLE public.subcategorias (
    id_subcategoria integer NOT NULL,
    nombre_subcategoria character varying,
    id_categoria integer
);
 !   DROP TABLE public.subcategorias;
       public         heap    postgres    false            �            1259    17339    id_subcategoria_inc    SEQUENCE     �   CREATE SEQUENCE public.id_subcategoria_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 *   DROP SEQUENCE public.id_subcategoria_inc;
       public          postgres    false    217            j           0    0    id_subcategoria_inc    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.id_subcategoria_inc OWNED BY public.subcategorias.id_subcategoria;
          public          postgres    false    224            �            1259    17310    unidades    TABLE     f   CREATE TABLE public.unidades (
    id_unidad integer NOT NULL,
    nombre_unidad character varying
);
    DROP TABLE public.unidades;
       public         heap    postgres    false            �            1259    18350    id_unidad_inc    SEQUENCE     v   CREATE SEQUENCE public.id_unidad_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.id_unidad_inc;
       public          postgres    false    220            k           0    0    id_unidad_inc    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.id_unidad_inc OWNED BY public.unidades.id_unidad;
          public          postgres    false    231            �            1259    17273    venta_productos    TABLE       CREATE TABLE public.venta_productos (
    id_venta_producto integer NOT NULL,
    id_producto integer,
    cantidad_producto integer,
    descuento_producto integer,
    incremento_producto integer,
    fecha_venta time without time zone,
    id_venta integer
);
 #   DROP TABLE public.venta_productos;
       public         heap    postgres    false            �            1259    17360    id_venta_productos_inc    SEQUENCE     �   CREATE SEQUENCE public.id_venta_productos_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 -   DROP SEQUENCE public.id_venta_productos_inc;
       public          postgres    false    216            l           0    0    id_venta_productos_inc    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.id_venta_productos_inc OWNED BY public.venta_productos.id_venta_producto;
          public          postgres    false    226            �            1259    17320    ventas    TABLE     1  CREATE TABLE public.ventas (
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
       public         heap    postgres    false            �            1259    17358    id_ventas_inc    SEQUENCE     �   CREATE SEQUENCE public.id_ventas_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 $   DROP SEQUENCE public.id_ventas_inc;
       public          postgres    false    221            m           0    0    id_ventas_inc    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.id_ventas_inc OWNED BY public.ventas.id_venta;
          public          postgres    false    225            �            1259    17303 
   parametros    TABLE     �   CREATE TABLE public.parametros (
    id_parametro integer NOT NULL,
    descripcion_parametro character varying,
    valor_parametro integer
);
    DROP TABLE public.parametros;
       public         heap    postgres    false            �            1259    18345    v_reportes_diarios    VIEW     I  CREATE VIEW public.v_reportes_diarios AS
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
       public          postgres    false    221    228    221    221    221    221    221    228    215    215    215    221    221    220    221            �           2604    17340    categorias id_categoria    DEFAULT     w   ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.id_categoria_inc'::regclass);
 F   ALTER TABLE public.categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    223    218            �           2604    17370    clientes id_cliente    DEFAULT     q   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.id_cliente_inc'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    227    215            �           2604    18344    metodo_pagos id_metodo_pago    DEFAULT     }   ALTER TABLE ONLY public.metodo_pagos ALTER COLUMN id_metodo_pago SET DEFAULT nextval('public.id_metodo_pago_inc'::regclass);
 J   ALTER TABLE public.metodo_pagos ALTER COLUMN id_metodo_pago DROP DEFAULT;
       public          postgres    false    229    228            �           2604    17337    productos id_producto    DEFAULT     u   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.id_productos_inc'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    222    214            �           2604    18373    salidas id_salida    DEFAULT     n   ALTER TABLE ONLY public.salidas ALTER COLUMN id_salida SET DEFAULT nextval('public.id_salida_inc'::regclass);
 @   ALTER TABLE public.salidas ALTER COLUMN id_salida DROP DEFAULT;
       public          postgres    false    233    232            �           2604    17341    subcategorias id_subcategoria    DEFAULT     �   ALTER TABLE ONLY public.subcategorias ALTER COLUMN id_subcategoria SET DEFAULT nextval('public.id_subcategoria_inc'::regclass);
 L   ALTER TABLE public.subcategorias ALTER COLUMN id_subcategoria DROP DEFAULT;
       public          postgres    false    224    217            �           2604    18351    unidades id_unidad    DEFAULT     o   ALTER TABLE ONLY public.unidades ALTER COLUMN id_unidad SET DEFAULT nextval('public.id_unidad_inc'::regclass);
 A   ALTER TABLE public.unidades ALTER COLUMN id_unidad DROP DEFAULT;
       public          postgres    false    231    220            �           2604    17361 !   venta_productos id_venta_producto    DEFAULT     �   ALTER TABLE ONLY public.venta_productos ALTER COLUMN id_venta_producto SET DEFAULT nextval('public.id_venta_productos_inc'::regclass);
 P   ALTER TABLE public.venta_productos ALTER COLUMN id_venta_producto DROP DEFAULT;
       public          postgres    false    226    216            �           2604    17359    ventas id_venta    DEFAULT     l   ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.id_ventas_inc'::regclass);
 >   ALTER TABLE public.ventas ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    225    221            P          0    17296 
   categorias 
   TABLE DATA           V   COPY public.categorias (id_categoria, nombre_categoria, estado_categoria) FROM stdin;
    public          postgres    false    218   .]       M          0    17266    clientes 
   TABLE DATA           p   COPY public.clientes (id_cliente, numero_cliente, nombre_cliente, apellido_cliente, cedula_cliente) FROM stdin;
    public          postgres    false    215   Y]       Z          0    18329    metodo_pagos 
   TABLE DATA           J   COPY public.metodo_pagos (id_metodo_pago, descripcion_metodo) FROM stdin;
    public          postgres    false    228   �]       Q          0    17303 
   parametros 
   TABLE DATA           Z   COPY public.parametros (id_parametro, descripcion_parametro, valor_parametro) FROM stdin;
    public          postgres    false    219   �]       L          0    17256 	   productos 
   TABLE DATA           �   COPY public.productos (id_producto, nombre_producto, aplicacion_productos, costo_producto, precio_producto, cant_producto, cod_producto, id_subcategoria, costo2_producto, precio2_producto) FROM stdin;
    public          postgres    false    214   �]       ]          0    18360    salidas 
   TABLE DATA           p   COPY public.salidas (id_salida, descripcion_salida, valor_salida, metodo_pago_salida, fecha_salida) FROM stdin;
    public          postgres    false    232   �^       O          0    17289    subcategorias 
   TABLE DATA           [   COPY public.subcategorias (id_subcategoria, nombre_subcategoria, id_categoria) FROM stdin;
    public          postgres    false    217   �^       R          0    17310    unidades 
   TABLE DATA           <   COPY public.unidades (id_unidad, nombre_unidad) FROM stdin;
    public          postgres    false    220   �^       N          0    17273    venta_productos 
   TABLE DATA           �   COPY public.venta_productos (id_venta_producto, id_producto, cantidad_producto, descuento_producto, incremento_producto, fecha_venta, id_venta) FROM stdin;
    public          postgres    false    216   �^       S          0    17320    ventas 
   TABLE DATA           �   COPY public.ventas (id_venta, fecha_venta, total_descuento, total_incremento, total_venta, id_cliente, cantidad_productos, metodo_pago, id_unidad) FROM stdin;
    public          postgres    false    221   �_       n           0    0    id_categoria_inc    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_categoria_inc', 1, true);
          public          postgres    false    223            o           0    0    id_cliente_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_cliente_inc', 1, true);
          public          postgres    false    227            p           0    0    id_metodo_pago_inc    SEQUENCE SET     @   SELECT pg_catalog.setval('public.id_metodo_pago_inc', 4, true);
          public          postgres    false    229            q           0    0    id_productos_inc    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_productos_inc', 2, true);
          public          postgres    false    222            r           0    0    id_salida_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_salida_inc', 1, false);
          public          postgres    false    233            s           0    0    id_subcategoria_inc    SEQUENCE SET     A   SELECT pg_catalog.setval('public.id_subcategoria_inc', 1, true);
          public          postgres    false    224            t           0    0    id_unidad_inc    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.id_unidad_inc', 1, true);
          public          postgres    false    231            u           0    0    id_venta_productos_inc    SEQUENCE SET     E   SELECT pg_catalog.setval('public.id_venta_productos_inc', 22, true);
          public          postgres    false    226            v           0    0    id_ventas_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_ventas_inc', 13, true);
          public          postgres    false    225            �           2606    17302    categorias categorias_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pk PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pk;
       public            postgres    false    218            �           2606    17272    clientes clientes_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pk;
       public            postgres    false    215            �           2606    18336    metodo_pagos metodo_pagos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.metodo_pagos
    ADD CONSTRAINT metodo_pagos_pkey PRIMARY KEY (id_metodo_pago);
 H   ALTER TABLE ONLY public.metodo_pagos DROP CONSTRAINT metodo_pagos_pkey;
       public            postgres    false    228            �           2606    17309    parametros parametros_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.parametros
    ADD CONSTRAINT parametros_pk PRIMARY KEY (id_parametro);
 B   ALTER TABLE ONLY public.parametros DROP CONSTRAINT parametros_pk;
       public            postgres    false    219            �           2606    17265    productos productos_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pk PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pk;
       public            postgres    false    214            �           2606    18366    salidas salidas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT salidas_pkey PRIMARY KEY (id_salida);
 >   ALTER TABLE ONLY public.salidas DROP CONSTRAINT salidas_pkey;
       public            postgres    false    232            �           2606    17295    subcategorias subcategorias_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pk PRIMARY KEY (id_subcategoria);
 H   ALTER TABLE ONLY public.subcategorias DROP CONSTRAINT subcategorias_pk;
       public            postgres    false    217            �           2606    17316    unidades unidades_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_pk PRIMARY KEY (id_unidad);
 >   ALTER TABLE ONLY public.unidades DROP CONSTRAINT unidades_pk;
       public            postgres    false    220            �           2606    17277 "   venta_productos venta_productos_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT venta_productos_pk PRIMARY KEY (id_venta_producto);
 L   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT venta_productos_pk;
       public            postgres    false    216            �           2606    17326    ventas ventas_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pk PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pk;
       public            postgres    false    221            �           2606    17362    ventas id_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ;   ALTER TABLE ONLY public.ventas DROP CONSTRAINT id_cliente;
       public          postgres    false    3237    221    215            �           2606    17380    venta_productos id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 E   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT id_producto;
       public          postgres    false    216    3235    214            �           2606    17348    productos id_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_subcategoria FOREIGN KEY (id_subcategoria) REFERENCES public.subcategorias(id_subcategoria) NOT VALID;
 C   ALTER TABLE ONLY public.productos DROP CONSTRAINT id_subcategoria;
       public          postgres    false    217    3241    214            �           2606    18353    ventas id_unidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES public.unidades(id_unidad) NOT VALID;
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT id_unidad;
       public          postgres    false    3247    220    221            �           2606    17390    venta_productos id_venta    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT id_venta FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) NOT VALID;
 B   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT id_venta;
       public          postgres    false    216    3249    221            �           2606    18337    ventas metodo_pago    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT metodo_pago FOREIGN KEY (metodo_pago) REFERENCES public.metodo_pagos(id_metodo_pago) NOT VALID;
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT metodo_pago;
       public          postgres    false    228    221    3251            �           2606    18367    salidas metodo_pago_salida    FK CONSTRAINT     �   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT metodo_pago_salida FOREIGN KEY (metodo_pago_salida) REFERENCES public.metodo_pagos(id_metodo_pago) NOT VALID;
 D   ALTER TABLE ONLY public.salidas DROP CONSTRAINT metodo_pago_salida;
       public          postgres    false    228    232    3251            P      x�3�J-(M-.�/�t����� 9�      M   !   x�3�4426153��4��s"G$�=... }L�      Z   :   x�3�tMKM.�,��2��K-,��2�tJ�K����M�L�2�tI,�,�I,I����� ���      Q      x������ � �      L   �   x�5��
�0�s�y%�������x�R���t��?�
B�!!�'0n|./�5�1ϩ����C���m��|9�l�@t�#&`�;M!2!��R���T�J[u��>��ߢ���U�&�N%�}P�5�|$�      ]      x������ � �      O      x�3��/�L��K�I-�4����� ?h4      R      x�3�.�/*��/�/Vp�)M����� Z��      N   �   x�U���D!Eѵc�@����o�����WҤ�q37�K�}NuXs���ї��u�(�훑�4�&�ւ*��܌�j�rx^�͒дj/Ǫ"����g�~?�R�#`u'@���{�/l�s׮ɑj=L��,B�?��"uv�#��J"�m���)�?�����8=      S   �   x�]���0E�o�
7��L�u�C"�"$������A< I�b3@��h+�uOg~r�$�DLvӵvl�u��?�4�K�7�*���dJ;�"�\]�fE���!��%|:�Ry�kY���/��-��N�)�ZgP���f��	�2     
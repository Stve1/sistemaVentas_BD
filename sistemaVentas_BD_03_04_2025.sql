PGDMP  #    $                }            sistemaVentas    17.4    17.4 Y    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            0           1262    16556    sistemaVentas    DATABASE     u   CREATE DATABASE "sistemaVentas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
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
       public         heap r       postgres    false            �            1259    16567    id_categoria_inc    SEQUENCE     �   CREATE SEQUENCE public.id_categoria_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 '   DROP SEQUENCE public.id_categoria_inc;
       public               postgres    false    217            1           0    0    id_categoria_inc    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.id_categoria_inc OWNED BY public.categorias.id_categoria;
          public               postgres    false    219            �            1259    16568    id_cliente_inc    SEQUENCE     �   CREATE SEQUENCE public.id_cliente_inc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999999
    CACHE 1;
 %   DROP SEQUENCE public.id_cliente_inc;
       public               postgres    false    218            2           0    0    id_cliente_inc    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.id_cliente_inc OWNED BY public.clientes.id_cliente;
          public               postgres    false    220            �            1259    16569    metodo_pagos    TABLE     t   CREATE TABLE public.metodo_pagos (
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
       public               postgres    false    221            3           0    0    id_metodo_pago_inc    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.id_metodo_pago_inc OWNED BY public.metodo_pagos.id_metodo_pago;
          public               postgres    false    222            �            1259    16575 	   productos    TABLE     ,  CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying,
    aplicacion_productos character varying,
    costo_producto integer,
    precio_producto integer,
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
       public               postgres    false    223            4           0    0    id_productos_inc    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.id_productos_inc OWNED BY public.productos.id_producto;
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
       public               postgres    false    225            5           0    0    id_salida_inc    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.id_salida_inc OWNED BY public.salidas.id_salida;
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
       public               postgres    false    227            6           0    0    id_subcategoria_inc    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.id_subcategoria_inc OWNED BY public.subcategorias.id_subcategoria;
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
       public               postgres    false    229            7           0    0    id_unidad_inc    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.id_unidad_inc OWNED BY public.unidades.id_unidad;
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
       public               postgres    false    231            8           0    0    id_venta_productos_inc    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.id_venta_productos_inc OWNED BY public.venta_productos.id_venta_producto;
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
       public               postgres    false    233            9           0    0    id_ventas_inc    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.id_ventas_inc OWNED BY public.ventas.id_venta;
          public               postgres    false    234            �            1259    16611 
   parametros    TABLE     �   CREATE TABLE public.parametros (
    id_parametro integer NOT NULL,
    descripcion_parametro character varying,
    valor_parametro integer
);
    DROP TABLE public.parametros;
       public         heap r       postgres    false            �            1259    16685    precios_productos    TABLE     �   CREATE TABLE public.precios_productos (
    id_precio integer NOT NULL,
    precio_producto integer,
    fecha_modificacion timestamp without time zone
);
 %   DROP TABLE public.precios_productos;
       public         heap r       postgres    false            �            1259    16616    v_reportes_diarios    VIEW     I  CREATE VIEW public.v_reportes_diarios AS
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
       public       v       postgres    false    233    218    218    221    221    218    233    233    233    233    233    229    233    233    233            V           2604    16621    categorias id_categoria    DEFAULT     w   ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.id_categoria_inc'::regclass);
 F   ALTER TABLE public.categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public               postgres    false    219    217            W           2604    16622    clientes id_cliente    DEFAULT     q   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.id_cliente_inc'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    220    218            X           2604    16623    metodo_pagos id_metodo_pago    DEFAULT     }   ALTER TABLE ONLY public.metodo_pagos ALTER COLUMN id_metodo_pago SET DEFAULT nextval('public.id_metodo_pago_inc'::regclass);
 J   ALTER TABLE public.metodo_pagos ALTER COLUMN id_metodo_pago DROP DEFAULT;
       public               postgres    false    222    221            Y           2604    16624    productos id_producto    DEFAULT     u   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.id_productos_inc'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public               postgres    false    224    223            [           2604    16625    salidas id_salida    DEFAULT     n   ALTER TABLE ONLY public.salidas ALTER COLUMN id_salida SET DEFAULT nextval('public.id_salida_inc'::regclass);
 @   ALTER TABLE public.salidas ALTER COLUMN id_salida DROP DEFAULT;
       public               postgres    false    226    225            \           2604    16626    subcategorias id_subcategoria    DEFAULT     �   ALTER TABLE ONLY public.subcategorias ALTER COLUMN id_subcategoria SET DEFAULT nextval('public.id_subcategoria_inc'::regclass);
 L   ALTER TABLE public.subcategorias ALTER COLUMN id_subcategoria DROP DEFAULT;
       public               postgres    false    228    227            ]           2604    16627    unidades id_unidad    DEFAULT     o   ALTER TABLE ONLY public.unidades ALTER COLUMN id_unidad SET DEFAULT nextval('public.id_unidad_inc'::regclass);
 A   ALTER TABLE public.unidades ALTER COLUMN id_unidad DROP DEFAULT;
       public               postgres    false    230    229            ^           2604    16628 !   venta_productos id_venta_producto    DEFAULT     �   ALTER TABLE ONLY public.venta_productos ALTER COLUMN id_venta_producto SET DEFAULT nextval('public.id_venta_productos_inc'::regclass);
 P   ALTER TABLE public.venta_productos ALTER COLUMN id_venta_producto DROP DEFAULT;
       public               postgres    false    232    231            _           2604    16629    ventas id_venta    DEFAULT     l   ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.id_ventas_inc'::regclass);
 >   ALTER TABLE public.ventas ALTER COLUMN id_venta DROP DEFAULT;
       public               postgres    false    234    233                      0    16557 
   categorias 
   TABLE DATA           V   COPY public.categorias (id_categoria, nombre_categoria, estado_categoria) FROM stdin;
    public               postgres    false    217   cn                 0    16562    clientes 
   TABLE DATA           p   COPY public.clientes (id_cliente, numero_cliente, nombre_cliente, apellido_cliente, cedula_cliente) FROM stdin;
    public               postgres    false    218   �n                 0    16569    metodo_pagos 
   TABLE DATA           J   COPY public.metodo_pagos (id_metodo_pago, descripcion_metodo) FROM stdin;
    public               postgres    false    221   �n       )          0    16611 
   parametros 
   TABLE DATA           Z   COPY public.parametros (id_parametro, descripcion_parametro, valor_parametro) FROM stdin;
    public               postgres    false    235   	o       *          0    16685    precios_productos 
   TABLE DATA           [   COPY public.precios_productos (id_precio, precio_producto, fecha_modificacion) FROM stdin;
    public               postgres    false    237   &o                 0    16575 	   productos 
   TABLE DATA           �   COPY public.productos (id_producto, nombre_producto, aplicacion_productos, costo_producto, precio_producto, cant_producto, cod_producto, id_subcategoria) FROM stdin;
    public               postgres    false    223   Co                 0    16584    salidas 
   TABLE DATA           p   COPY public.salidas (id_salida, descripcion_salida, valor_salida, metodo_pago_salida, fecha_salida) FROM stdin;
    public               postgres    false    225   �o       !          0    16590    subcategorias 
   TABLE DATA           [   COPY public.subcategorias (id_subcategoria, nombre_subcategoria, id_categoria) FROM stdin;
    public               postgres    false    227   �o       #          0    16596    unidades 
   TABLE DATA           <   COPY public.unidades (id_unidad, nombre_unidad) FROM stdin;
    public               postgres    false    229   p       %          0    16602    venta_productos 
   TABLE DATA           �   COPY public.venta_productos (id_venta_producto, id_producto, cantidad_producto, descuento_producto, incremento_producto, fecha_venta, id_venta) FROM stdin;
    public               postgres    false    231   Dp       '          0    16606    ventas 
   TABLE DATA           �   COPY public.ventas (id_venta, fecha_venta, total_descuento, total_incremento, total_venta, id_cliente, cantidad_productos, metodo_pago, id_unidad) FROM stdin;
    public               postgres    false    233   �p       :           0    0    id_categoria_inc    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_categoria_inc', 1, true);
          public               postgres    false    219            ;           0    0    id_cliente_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_cliente_inc', 1, true);
          public               postgres    false    220            <           0    0    id_metodo_pago_inc    SEQUENCE SET     @   SELECT pg_catalog.setval('public.id_metodo_pago_inc', 4, true);
          public               postgres    false    222            =           0    0    id_productos_inc    SEQUENCE SET     >   SELECT pg_catalog.setval('public.id_productos_inc', 2, true);
          public               postgres    false    224            >           0    0    id_salida_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_salida_inc', 1, false);
          public               postgres    false    226            ?           0    0    id_subcategoria_inc    SEQUENCE SET     A   SELECT pg_catalog.setval('public.id_subcategoria_inc', 1, true);
          public               postgres    false    228            @           0    0    id_unidad_inc    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.id_unidad_inc', 1, true);
          public               postgres    false    230            A           0    0    id_venta_productos_inc    SEQUENCE SET     E   SELECT pg_catalog.setval('public.id_venta_productos_inc', 28, true);
          public               postgres    false    232            B           0    0    id_ventas_inc    SEQUENCE SET     <   SELECT pg_catalog.setval('public.id_ventas_inc', 13, true);
          public               postgres    false    234            b           2606    16631    categorias categorias_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pk PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pk;
       public                 postgres    false    217            d           2606    16633    clientes clientes_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pk;
       public                 postgres    false    218            f           2606    16635    metodo_pagos metodo_pagos_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.metodo_pagos
    ADD CONSTRAINT metodo_pagos_pkey PRIMARY KEY (id_metodo_pago);
 H   ALTER TABLE ONLY public.metodo_pagos DROP CONSTRAINT metodo_pagos_pkey;
       public                 postgres    false    221            x           2606    16637    parametros parametros_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.parametros
    ADD CONSTRAINT parametros_pk PRIMARY KEY (id_parametro);
 B   ALTER TABLE ONLY public.parametros DROP CONSTRAINT parametros_pk;
       public                 postgres    false    235            {           2606    16689 (   precios_productos precios_productos_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.precios_productos
    ADD CONSTRAINT precios_productos_pkey PRIMARY KEY (id_precio);
 R   ALTER TABLE ONLY public.precios_productos DROP CONSTRAINT precios_productos_pkey;
       public                 postgres    false    237            i           2606    16639    productos productos_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pk PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pk;
       public                 postgres    false    223            l           2606    16641    salidas salidas_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT salidas_pkey PRIMARY KEY (id_salida);
 >   ALTER TABLE ONLY public.salidas DROP CONSTRAINT salidas_pkey;
       public                 postgres    false    225            n           2606    16643    subcategorias subcategorias_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pk PRIMARY KEY (id_subcategoria);
 H   ALTER TABLE ONLY public.subcategorias DROP CONSTRAINT subcategorias_pk;
       public                 postgres    false    227            p           2606    16645    unidades unidades_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_pk PRIMARY KEY (id_unidad);
 >   ALTER TABLE ONLY public.unidades DROP CONSTRAINT unidades_pk;
       public                 postgres    false    229            s           2606    16647 "   venta_productos venta_productos_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT venta_productos_pk PRIMARY KEY (id_venta_producto);
 L   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT venta_productos_pk;
       public                 postgres    false    231            v           2606    16649    ventas ventas_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pk PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pk;
       public                 postgres    false    233            y           1259    24903    idx_precios_productos    INDEX     }   CREATE INDEX idx_precios_productos ON public.precios_productos USING btree (id_precio DESC) WITH (deduplicate_items='true');
 )   DROP INDEX public.idx_precios_productos;
       public                 postgres    false    237            g           1259    24899    idx_producto    INDEX     n   CREATE INDEX idx_producto ON public.productos USING btree (id_producto DESC) WITH (deduplicate_items='true');
     DROP INDEX public.idx_producto;
       public                 postgres    false    223            j           1259    24902    idx_salidas    INDEX     i   CREATE INDEX idx_salidas ON public.salidas USING btree (id_salida DESC) WITH (deduplicate_items='true');
    DROP INDEX public.idx_salidas;
       public                 postgres    false    225            q           1259    24901    idx_venta_productos    INDEX     �   CREATE INDEX idx_venta_productos ON public.venta_productos USING btree (id_venta_producto DESC) WITH (deduplicate_items='true');
 '   DROP INDEX public.idx_venta_productos;
       public                 postgres    false    231            t           1259    24900 
   idx_ventas    INDEX     f   CREATE INDEX idx_ventas ON public.ventas USING btree (id_venta DESC) WITH (deduplicate_items='true');
    DROP INDEX public.idx_ventas;
       public                 postgres    false    233            �           2620    16698 '   venta_productos trigger_verificar_stock    TRIGGER     �   CREATE TRIGGER trigger_verificar_stock BEFORE INSERT ON public.venta_productos FOR EACH ROW EXECUTE FUNCTION public.verificar_stock();
 @   DROP TRIGGER trigger_verificar_stock ON public.venta_productos;
       public               postgres    false    238    231            �           2606    16650    ventas id_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) NOT VALID;
 ;   ALTER TABLE ONLY public.ventas DROP CONSTRAINT id_cliente;
       public               postgres    false    218    4708    233            |           2606    24894    productos id_precio    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_precio FOREIGN KEY (precio_producto) REFERENCES public.precios_productos(id_precio) NOT VALID;
 =   ALTER TABLE ONLY public.productos DROP CONSTRAINT id_precio;
       public               postgres    false    4731    237    223                       2606    16655    venta_productos id_producto    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 E   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT id_producto;
       public               postgres    false    231    4713    223            }           2606    16660    productos id_subcategoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_subcategoria FOREIGN KEY (id_subcategoria) REFERENCES public.subcategorias(id_subcategoria) NOT VALID;
 C   ALTER TABLE ONLY public.productos DROP CONSTRAINT id_subcategoria;
       public               postgres    false    4718    223    227            �           2606    16665    ventas id_unidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT id_unidad FOREIGN KEY (id_unidad) REFERENCES public.unidades(id_unidad) NOT VALID;
 :   ALTER TABLE ONLY public.ventas DROP CONSTRAINT id_unidad;
       public               postgres    false    233    4720    229            �           2606    16670    venta_productos id_venta    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta_productos
    ADD CONSTRAINT id_venta FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) NOT VALID;
 B   ALTER TABLE ONLY public.venta_productos DROP CONSTRAINT id_venta;
       public               postgres    false    231    4726    233            �           2606    16675    ventas metodo_pago    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT metodo_pago FOREIGN KEY (metodo_pago) REFERENCES public.metodo_pagos(id_metodo_pago) NOT VALID;
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT metodo_pago;
       public               postgres    false    233    221    4710            ~           2606    16680    salidas metodo_pago_salida    FK CONSTRAINT     �   ALTER TABLE ONLY public.salidas
    ADD CONSTRAINT metodo_pago_salida FOREIGN KEY (metodo_pago_salida) REFERENCES public.metodo_pagos(id_metodo_pago) NOT VALID;
 D   ALTER TABLE ONLY public.salidas DROP CONSTRAINT metodo_pago_salida;
       public               postgres    false    4710    225    221                  x�3�J-(M-.�/�t����� 9�         !   x�3�4426153��4��s"G$�=... }L�         :   x�3�tMKM.�,��2��K-,��2�tJ�K����M�L�2�tI,�,�I,I����� ���      )      x������ � �      *      x������ � �         y   x�=��
�0����)�*�k
�W)ؒO^�F	����[���7���g���g*�N�R�M4���W�D�-T��2�U�A�bh|.o�u���j*�g���{�/�3�Z��C�c���Ƙ/�<!�            x������ � �      !      x�3��/�L��K�I-�4����� ?h4      #      x�3�.�/*��/�/Vp�)M����� Z��      %   �   x�U����0�7�b�H@,��dמ�#]()�� "�R�s�i�`X+n}���
�~����(HyW����B.ou=<��Z���^�Չ���/�i���|�*́��L������wYخ����J��G�N�]�_E��l�Wfg��l�_����-�s��E�3 �G=      '   �   x�]���0E�o�
7��L�u�C"�"$������A< I�b3@��h+�uOg~r�$�DLvӵvl�u��?�4�K�7�*���dJ;�"�\]�fE���!��%|:�Ry�kY���/��-��N�)�ZgP���f��	�2     
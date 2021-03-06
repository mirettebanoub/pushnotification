PGDMP     7                    y            test    11.5    11.2     �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    56485    test    DATABASE     �   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE test;
             smartmap_admin    false                        2615    2200 
   testnotify    SCHEMA        CREATE SCHEMA testnotify;
    DROP SCHEMA testnotify;
             postgres    false                       0    0    SCHEMA testnotify    COMMENT     :   COMMENT ON SCHEMA testnotify IS 'standard public schema';
                  postgres    false    3            �            1255    56492    notify_change()    FUNCTION     �   CREATE FUNCTION testnotify.notify_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
	  if old <> new
	  then
    PERFORM pg_notify('change_status', row_to_json(NEW)::text );
   end if;
    RETURN new;
  END;
  $$;
 *   DROP FUNCTION testnotify.notify_change();
    
   testnotify       smartmap_admin    false    3            �            1259    56489    buses    TABLE     j   CREATE TABLE testnotify.buses (
    bus_id character varying(45),
    bus_status character varying(45)
);
    DROP TABLE testnotify.buses;
    
   testnotify         smartmap_admin    false    3            �            1259    56486    users    TABLE     �   CREATE TABLE testnotify.users (
    name character varying(45),
    bus character varying(45),
    token character varying(500)
);
    DROP TABLE testnotify.users;
    
   testnotify         smartmap_admin    false    3            �
          0    56489    buses 
   TABLE DATA               7   COPY testnotify.buses (bus_id, bus_status) FROM stdin;
 
   testnotify       smartmap_admin    false    197            �
          0    56486    users 
   TABLE DATA               5   COPY testnotify.users (name, bus, token) FROM stdin;
 
   testnotify       smartmap_admin    false    196            �
           2620    56493    buses update_bus_status_trigger    TRIGGER     �   CREATE TRIGGER update_bus_status_trigger AFTER UPDATE ON testnotify.buses FOR EACH ROW EXECUTE PROCEDURE testnotify.notify_change();
 <   DROP TRIGGER update_bus_status_trigger ON testnotify.buses;
    
   testnotify       smartmap_admin    false    197    198            �
   <   x�svq�L,*�,KM�rtr�I-.QHI��W(J-.�)QH�/R�Q(I,������ �d      �
   7  x�-�Yn�@  �o9E/@�����&H1MȰYP�MNߤ�;��m���a'J�.�Nx���{Ί�i�~���@z�̪5X�Ȱ:�/�]����p������b6��P->�K�v ��"��n8/�O©)����
i����[�#g��7c�^�V�����z
$���>ޮTS�4��($V,����Z,W��5��#V̦&n-���/ح�`�����A��C7�bK2ɜT�$�X��e��2�WQ6ꩲ�`�wL ���.@Rn��ZGL^h6Z,u��&Z
��J{_S��E��)rC          �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    56485    test    DATABASE     �   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE test;
             smartmap_admin    false                        2615    2200 
   testnotify    SCHEMA        CREATE SCHEMA testnotify;
    DROP SCHEMA testnotify;
             postgres    false                       0    0    SCHEMA testnotify    COMMENT     :   COMMENT ON SCHEMA testnotify IS 'standard public schema';
                  postgres    false    3            �            1255    56492    notify_change()    FUNCTION     �   CREATE FUNCTION testnotify.notify_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
	  if old <> new
	  then
    PERFORM pg_notify('change_status', row_to_json(NEW)::text );
   end if;
    RETURN new;
  END;
  $$;
 *   DROP FUNCTION testnotify.notify_change();
    
   testnotify       smartmap_admin    false    3            �            1259    56489    buses    TABLE     j   CREATE TABLE testnotify.buses (
    bus_id character varying(45),
    bus_status character varying(45)
);
    DROP TABLE testnotify.buses;
    
   testnotify         smartmap_admin    false    3            �            1259    56486    users    TABLE     �   CREATE TABLE testnotify.users (
    name character varying(45),
    bus character varying(45),
    token character varying(500)
);
    DROP TABLE testnotify.users;
    
   testnotify         smartmap_admin    false    3            �
          0    56489    buses 
   TABLE DATA               7   COPY testnotify.buses (bus_id, bus_status) FROM stdin;
 
   testnotify       smartmap_admin    false    197   �       �
          0    56486    users 
   TABLE DATA               5   COPY testnotify.users (name, bus, token) FROM stdin;
 
   testnotify       smartmap_admin    false    196   �       �
           2620    56493    buses update_bus_status_trigger    TRIGGER     �   CREATE TRIGGER update_bus_status_trigger AFTER UPDATE ON testnotify.buses FOR EACH ROW EXECUTE PROCEDURE testnotify.notify_change();
 <   DROP TRIGGER update_bus_status_trigger ON testnotify.buses;
    
   testnotify       smartmap_admin    false    197    198           
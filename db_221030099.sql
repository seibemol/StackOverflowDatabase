create database db_221030099
use db_221030099



create table tbl_planlar
(
planFreeKisi tinyint,
planBasicKisi tinyint,
planBusinessKisi int,
planEnterpriseKisi int primary key identity(1,1),
)


create table tbl_sirketler
(
sirketAd varchar(30),
sirketKod int primary key identity(100,5),
sirketSektor varchar(70),
sirketK_tarih date,
sirketCalisanS int foreign key references tbl_planlar (planEnterpriseKisi),
sirketTagSayi int
)


create table tbl_tagler
(
tagPopuler nvarchar(30),
tagAlfabetik nvarchar(30),
tagEnYeni nvarchar(30),
tagToplamSayi int,
tagKodu int primary key identity(100,1)
)


create table tbl_topluluk
(
t_kurulusTarih date,
t_uyeSayisi int,
t_tag varchar(40),
t_soruSayisi int,
t_cevapSayisi int,
t_topUyeSkor int primary key identity(1000,1),
t_sirketKod int foreign key references tbl_sirketler (sirketKod),
t_odulSayi int foreign key references tbl_oduller (odulSayi)
)


create table tbl_sorular
(
soruToplamS int,
soruEnYeniS int,
soruAktifS int,
soruCevapsizS int,
soruOdulluS int primary key identity (1,10)
)


create table tbl_moderator
(
mod_Ad varchar(30),
modUyelikSure date,
modKonum nvarchar(200),
modRozetSayisi int primary key identity (10,1)
)


create table tbl_rozetler
(
rozetAd varchar(40),
rozetTarih date,
rozetKodu smallint primary key identity (100,2),
rozetSayi int foreign key references tbl_moderator (modRozetSayisi)
)


create table tbl_uyeler
(
uyeK_ad varchar(30),
uyeKod int primary key identity(10,1),
uye_itibar int foreign key references tbl_topluluk (t_topUyeSkor),
uyeTag int foreign key references tbl_tagler (tagKodu),
uyeRozetSayi int,
uyeRozetKodu smallint foreign key references tbl_rozetler (rozetKodu),
uyeYanit_sayi int,
uyeSoru_sayi int foreign key references tbl_sorular (soruOdulluS),
uyelikSuresi date,
uyeKonum nvarchar(200)
)
EXEC sp_fkeys 'tbl_kariyer'

create table tbl_oduller
(
odulAd nvarchar(100),
odulKod int,
odulTarih date,
odulSayi int primary key identity (1,1)
)


create table tbl_kariyer
(
kariyerID int primary key identity (50,5),
kariyerCesit varchar(15),
kariyerKonum nvarchar(200),
kariyerSektor nvarchar(50),
kariyerOdulSayi int foreign key references tbl_oduller (odulSayi)
)


create table tbl_sirketisilanlari
(
sirketisKod int foreign key references tbl_sirketler (sirketKod),
kariyerID int foreign key references tbl_kariyer (kariyerID),
)


select t_KurulusTarih from tbl_topluluk 

select tagPopuler from tbl_tagler

select rozetAd from tbl_rozetler 

select kariyerKonum from tbl_kariyer

select soruToplamS from tbl_sorular 

select odulTarih from tbl_oduller 

select sirketisKod from tbl_sirketisilanlari
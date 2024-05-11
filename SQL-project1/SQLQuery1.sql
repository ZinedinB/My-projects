create database Banka;
use Banka;

create table Kartica(
broj_kartice char(16),
redni_broj int not null,
brand nvarchar(10),
tip_kartice nvarchar(10),
datum_vezanja date,
jmbg_vlasnika char(13),
iznos_limita decimal(18,2),
status_kartice nvarchar(10),
constraint PK_BrojKartice primary key(broj_kartice, redni_broj),
constraint chk_bk check(iznos_limita between 0 and 10000),
foreign key (brand, tip_kartice) references Vrsta_kartice(brand, tip_kartice),
foreign key (jmbg_vlasnika) references klijent(jmbg)
);

create table Klijent(
jmbg char(13) not null primary key,
ime nvarchar(10) not null,
prezime nvarchar(10) not null,
datum_rodjenja date,
slika image,
constraint JMBG unique(JMBG),
constraint chk_datum check(datum_rodjenja <'2001.01.01')
);

create table Vrsta_kartice(
brand nvarchar(10) not null,
tip_kartice nvarchar(10),
naziv_kartice nvarchar(10),
boja_plastike nvarchar(10),
constraint PK_brand primary key(brand, tip_kartice),
constraint chk_brand check(brand = 'VISA' or brand='MasterCard'),
);

create table Racun(
broj_racuna int not null primary key,
jmbg_vlasnika char(13),
tip_racuna nvarchar(12),
stanje_racuna decimal(18,2),
status_racuna nvarchar(10) Default 'Aktivan',
constraint Broj_racuna unique(broj_racuna),
constraint chk_racun check(status_racuna = 'Aktivan' or status_racuna = 'Blokiran' or status_racuna = 'Ugasen'),
foreign key (jmbg_vlasnika) references Klijent(jmbg)
);
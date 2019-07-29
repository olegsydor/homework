use master
go

if DB_ID('education') is not null
BEGIN
ALTER DATABASE education
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
drop database education
END
go

create database education
go
use education
go

CREATE TABLE details (
       detailid             integer NOT NULL PRIMARY KEY,
       name                 varchar(20) NULL,
       color                varchar(20) NULL,
       weight               integer NULL,
       city                 varchar(20) NULL
)
go

CREATE TABLE products (
       productid            integer NOT NULL PRIMARY KEY,
       name                 varchar(20) NULL,
       city                 varchar(20) NULL
)
go

CREATE TABLE suppliers (
       supplierid           integer NOT NULL PRIMARY KEY,
       name                 varchar(20) NULL,
       rating               integer NULL,
       city                 varchar(20) NULL
)
go

CREATE TABLE supplies (
       supplierid           integer NOT NULL,
       detailid             integer NOT NULL,
       productid            integer NOT NULL,
       quantity             integer NOT NULL default 0,

	   PRIMARY KEY (supplierid ASC, detailid ASC, productid ASC)
)
go


ALTER TABLE supplies
       ADD CONSTRAINT R_4
              FOREIGN KEY (productid)
                             REFERENCES products  (productid)
go
ALTER TABLE supplies
       ADD CONSTRAINT R_3
              FOREIGN KEY (detailid)
                             REFERENCES details  (detailid)
go
ALTER TABLE supplies
       ADD CONSTRAINT R_1
              FOREIGN KEY (supplierid)
                             REFERENCES suppliers  (supplierid)
go



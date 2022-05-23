CREATE TABLE `category` (
  `CAT_ID` int NOT NULL,
  `CAT_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `customer` (
  `CUS_ID` int NOT NULL,
  `CUS_NAME` varchar(20) NOT NULL,
  `CUS_PHONE` varchar(20) NOT NULL,
  `CUS_CITY` varchar(30) NOT NULL,
  `CUS_GENDER` char(1) DEFAULT NULL,
  PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `order` (
  `ORD_ID` int NOT NULL,
  `ORD_AMOUNT` int NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUS_ID` int DEFAULT NULL,
  `PRICING_ID` int DEFAULT NULL,
  PRIMARY KEY (`ORD_ID`),
  KEY `cust_id_idx` (`CUS_ID`),
  KEY `price_id_idx` (`PRICING_ID`),
  CONSTRAINT `cust_id` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`),
  CONSTRAINT `price_id` FOREIGN KEY (`PRICING_ID`) REFERENCES `supplier_pricing` (`PRICING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `product` (
  `PRO_ID` int NOT NULL,
  `PRO_NAME` varchar(20) NOT NULL DEFAULT 'Dummy',
  `PRO_DESC` varchar(60) DEFAULT NULL,
  `CAT_ID` int DEFAULT NULL,
  PRIMARY KEY (`PRO_ID`),
  KEY `CAT_ID_idx` (`CAT_ID`) /*!80000 INVISIBLE */,
  CONSTRAINT `Category_id` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `rating` (
  `RAT_ID` int NOT NULL,
  `ORD_ID` int DEFAULT NULL,
  `RAT_RATSTARS` int NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  KEY `ord_id_idx` (`ORD_ID`),
  CONSTRAINT `ord_id` FOREIGN KEY (`ORD_ID`) REFERENCES `order` (`ORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `supplier` (
  `SUPP_ID` int NOT NULL,
  `SUPP_NAME` varchar(50) NOT NULL,
  `SUPP_CITY` varchar(50) NOT NULL,
  `SUPP_PHONE` varchar(50) NOT NULL,
  PRIMARY KEY (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `supplier_pricing` (
  `PRICING_ID` int NOT NULL,
  `PRO_ID` int DEFAULT NULL,
  `SUPP_ID` int DEFAULT NULL,
  `SUPP_PRICE` int DEFAULT '0',
  PRIMARY KEY (`PRICING_ID`),
  KEY `supp_id_idx` (`SUPP_ID`),
  KEY `pro_id_idx` (`PRO_ID`),
  CONSTRAINT `pro_id` FOREIGN KEY (`PRO_ID`) REFERENCES `product` (`PRO_ID`),
  CONSTRAINT `supp_id` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



insert into `e_commerce`.`supplier` values (1,"Rajesh Retails","Delhi",1234567890);
insert into `e_commerce`.`supplier` values (2,"Appario Ltd.","Mumbai",2589631470);
insert into `e_commerce`.`supplier` values (3,"Knome products","Banglore",9785462315);
insert into `e_commerce`.`supplier` values (4,"Bansal Retails","Kochi",8975463285);
insert into `e_commerce`.`supplier` values (5,"Mittal Ltd.","Lucknow",7898456532);


insert into `e_commerce`.`customer` values (1,"AAKASH",9999999999,"DELHI",'M');
insert into `e_commerce`.`customer` values (2,"AMAN",9785463215,"NOIDA",'M');
insert into `e_commerce`.`customer` values (3,"NEHA",9999999999,"MUMBAI",'F');
insert into `e_commerce`.`customer` values (4,"MEGHA",9994562399,"KOLKATA",'F');
insert into `e_commerce`.`customer` values (5,"PULKIT",7895999999,"LUCKNOW",'M');

insert into `e_commerce`.`category` values (1,"BOOKS");
insert into `e_commerce`.`category` values (2,"GAMES");
insert into `e_commerce`.`category` values (3,"GROCERIES");
insert into `e_commerce`.`category` values (4,"ELECTRONICS");
insert into `e_commerce`.`category` values (5,"CLOTHES");


insert into `product` values(1,"GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into `product` values(2,"TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into `product` values(3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into `product` values(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO `product` VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO `product` VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO `product` VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO `product` VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO `product` VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO `product` VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO `product` VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO `product` VALUES(12,"Train Your Brain","By Shireen Stephen",1);


INSERT INTO `supplier_pricing` VALUES(1,1,2,1500); 
INSERT INTO `supplier_pricing` VALUES(2,3,5,30000); 
INSERT INTO `supplier_pricing` VALUES(3,5,1,3000); 
INSERT INTO `supplier_pricing` VALUES(4,2,3,2500);
INSERT INTO `supplier_pricing` VALUES(5,4,1,1000); 
INSERT INTO `supplier_pricing` VALUES(6,12,2,780); 
INSERT INTO `supplier_pricing` VALUES(7,12,4,789); 
INSERT INTO `supplier_pricing` VALUES(8,3,1,31000); 
INSERT INTO `supplier_pricing` VALUES(9,1,5,1450); 
INSERT INTO `supplier_pricing` VALUES(10,4,2,999); 
INSERT INTO `supplier_pricing` VALUES(11,7,3,549); 
INSERT INTO `supplier_pricing` VALUES(12,7,4,529); 
INSERT INTO `supplier_pricing` VALUES(13,6,2,105); 
INSERT INTO `supplier_pricing` VALUES(14,6,1,99); 
INSERT INTO `supplier_pricing` VALUES(15,2,5,2999); 
INSERT INTO `supplier_pricing` VALUES(16,5,2,2999);


INSERT INTO `order` VALUES(101,1500,"2021-10-06",2,1); 
INSERT INTO `order` VALUES(102,1000,"2021-10-12",3,5); 
INSERT INTO `order` VALUES(103,30000,"2021-09-16",5,2); 
INSERT INTO `order` VALUES(104,1500,"2021-10-05",1,1); 
INSERT INTO `order` VALUES(105,3000,"2021-08-16",4,3); 
INSERT INTO `order` VALUES(106,1450,"2021-08-18",1,9); 
INSERT INTO `order` VALUES(107,789,"2021-09-01",3,7); 
INSERT INTO `order` VALUES(108,780,"2021-09-07",5,6); 
INSERT INTO `order` VALUES(109,3000,"2021-0-10",5,3); 
INSERT INTO `order` VALUES(110,2500,"2021-09-10",2,4); 
INSERT INTO `order` VALUES(111,1000,"2021-09-15",4,5); 
INSERT INTO `order` VALUES(112,789,"2021-09-16",4,7); 
INSERT INTO `order` VALUES(113,31000,"2021-09-16",1,8); 
INSERT INTO `order` VALUES(114,1000,"2021-09-16",3,5); 
INSERT INTO `order` VALUES(115,3000,"2021-09-16",5,3); 
INSERT INTO `order` VALUES(116,99,"2021-09-17",2,14);


INSERT INTO `rating` VALUES(1,101,4);
INSERT INTO `rating` VALUES(2,102,3);
INSERT INTO `rating` VALUES(3,103,1);
INSERT INTO `rating` VALUES(4,104,2);
INSERT INTO `rating` VALUES(5,105,4);
INSERT INTO `rating` VALUES(6,106,3);
INSERT INTO `rating` VALUES(7,107,4);
INSERT INTO `rating` VALUES(8,108,4);
INSERT INTO `rating` VALUES(9,109,3);
INSERT INTO `rating` VALUES(10,110,5); 
INSERT INTO `rating` VALUES(11,111,3);
INSERT INTO `rating` VALUES(12,112,4);
INSERT INTO `rating` VALUES(13,113,2);
INSERT INTO `rating` VALUES(14,114,1);
INSERT INTO `rating` VALUES(15,115,1);
INSERT INTO `rating` VALUES(16,116,2);



-- ans to question 3
select c.CUS_GENDER,count(c.CUS_ID)
from `customer` c inner join `order` o on c.CUS_ID = o.CUS_ID
where o.ORD_AMOUNT >= 3000 group by c.CUS_GENDER;

-- ans to question 4
select o.ORD_ID,p.PRO_NAME
from `order` o 
	 inner join `supplier_pricing` sp on (o.PRICING_ID = sp.PRICING_ID)
     inner join `product` p on (p.PRO_ID = sp.PRO_ID)
where o.CUS_ID = 2
;

-- ans to question 5
select s.SUPP_ID,s.SUPP_NAME,count(p.PRO_ID) number_of_products
from `supplier` s 
	inner join `supplier_pricing` sp on (s.SUPP_ID = sp.SUPP_ID)
    inner join `product` p on (p.PRO_ID = sp.PRO_ID)
group by s.SUPP_ID,s.SUPP_NAME
having count(p.PRO_ID) > 1
;

-- ans to question 6
select c.CAT_ID,c.CAT_NAME,p.PRO_NAME,sp.SUPP_PRICE
from `category` c 
	inner join `product` p on (c.CAT_ID = p.CAT_ID)
	inner join `supplier_pricing` sp on (sp.PRO_ID = p.PRO_ID) 
where sp.SUPP_PRICE in (select min(sp.SUPP_PRICE)
						from `category` c 
							inner join `product` p on (c.CAT_ID = p.CAT_ID)
							inner join `supplier_pricing` sp on (sp.PRO_ID = p.PRO_ID)
						group by  c.CAT_ID)
;


-- ans to question 7
select p.PRO_ID,o.ORD_ID,p.PRO_NAME
from `order` o 
	 inner join `supplier_pricing` sp on (o.PRICING_ID = sp.PRICING_ID)
     inner join `product` p on (p.PRO_ID = sp.PRO_ID)
where o.ORD_DATE > "2021-10-05"
;


-- ans to question 8
select c.CUS_NAME,c.CUS_GENDER
from customer c
where c.CUS_NAME like "A%" OR c.CUS_NAME like "%A"
;


-- ans to question 9
DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
	when report.average = 5 then 'Excellent Service'
    when report.average > 4 then 'Good Service'
    when report.average > 2 then 'Average Service'
    else 'Poor Service' END as type_of_service from 
(select final.supp_id, supplier.SUPP_NAME,final.Average from 
(select test2.supp_id, sum(test2.RAT_RATSTARS)/count(test2.RAT_RATSTARS) as average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join 
(select `order`.pricing_id,rating.ORD_ID,rating.RAT_RATSTARS
from `order` inner join rating on rating.ORD_ID = `order`.ORD_ID
) as test on test.pricing_id = supplier_pricing.PRICING_ID)
as test2 group by supplier_pricing.SUPP_ID)
as final inner join supplier where final.SUPP_ID = supplier.SUPP_ID) as report;
END &&
DELIMITER ;

call proc();
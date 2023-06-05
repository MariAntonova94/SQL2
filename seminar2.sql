Use seminar2;
/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/
DROP TABLE SALES;
CREATE TABLE sales(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount INT NOT NULL
);
INSERT INTO sales(order_date, amount) VALUES
  ("2022-06-04",150),
  ("2023-01-25",315),
  ("2021-10-18",214),
  ("2022-08-03",95);
  SELECT * FROM sales;
  /*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/

SELECT id, order_date, amount,
CASE TRUE
    WHEN amount < 100 THEN 'меньше 100'
    WHEN amount >= 100 AND amount <= 300 THEN '100-300'
    ELSE 'больше 300'
END AS order_size
FROM sales;
/*
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE TABLE orders (
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    orderstatus VARCHAR(45) NOT NULL,
    PRIMARY KEY (orderid)
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
("e03",50.65,"OPEN"),
  ("e02",33.34,"OPEN"),
  ("e03",7.90,"CLOSED"),
  ("e03",58.30,"CLOSED"),
  ("e03",15.02,"CANCELLED"),
  ("e03",83.78,"CLOSED");

SELECT orderid, orderstatus,
CASE orderstatus
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;

/*
4. Чем NULL отличается от 0?
"0" — это значение, константа. 
A "NULL" указывает на "пустое место" — объявленную, но неинициализированную переменную, объект и т.п.
*/
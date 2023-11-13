spool C:\Users\jnvg9\OneDrive\Escritorio\salidasbases\salidaJob.txt

--clear screen;
set linesize 150
set PAGESIZE 99
set COLSEP '|*|'

--Borrado de tablas
DROP TABLE Employee CASCADE CONSTRAINT;
DROP TABLE Screatary CASCADE CONSTRAINT;
DROP TABLE Technician CASCADE CONSTRAINT;
DROP TABLE Engineer CASCADE CONSTRAINT;

--Tablas
CREATE TABLE Employee(
    Ssn NUMBER(10),
    Fname VARCHAR(45),
    Minit VARCHAR(45),
    Lname VARCHAR(45),
    Brith_date VARCHAR(20),
    Address VARCHAR(20),
    Job_type VARCHAR(20)
);

CREATE TABLE Secretary(
    Ssn NUMBER(10),
    Typing_speed NUMBER(10)
);

CREATE TABLE Technician(
    Ssn NUMBER(10),
    Tgrade VARCHAR(45)
);

CREATE TABLE Engineer(
    Ssn NUMBER(10),
    Eng_type VARCHAR(45)
);

--Restricciones
ALTER TABLE  Employee
ADD CONSTRAINT Ssn_PK PRIMARY KEY (Ssn);

ALTER TABLE Secretary
ADD CONSTRAINT Ssn_FKS FOREIGN KEY (Ssn) REFERENCES Employee(Ssn);

ALTER TABLE Technician
ADD CONSTRAINT Ssn_FKT FOREIGN KEY (Ssn) REFERENCES Employee(Ssn);

ALTER TABLE Engineer
ADD CONSTRAINT Ssn_FKE FOREIGN KEY (Ssn) REFERENCES Employee(Ssn);

--Insertar datos
INSERT INTO Employee VALUES (1, 'John', 'D', 'Doe', '01-JAN-1990', '123 Main St', 'Manager');
INSERT INTO Employee VALUES (2, 'Jane', 'A', 'Smith', '15-FEB-1985', '456 Oak St', 'Clerk');

INSERT INTO Secretary VALUES (1, 80);
INSERT INTO Secretary VALUES (3, 60);

INSERT INTO Technician VALUES (2, 'Senior');
INSERT INTO Technician VALUES (4, 'Junior');

INSERT INTO Engineer VALUES (3, 'Civil');
INSERT INTO Engineer VALUES (5, 'Electrical');

--Desplega las tablas
SELECT * FROM Employee;
SELECT * FROM Secretary;
SELECT * FROM Technician;
SELECT * FROM Engineer;


--Da formato a la salida de datos 
rem desplegar por TABLE_NAME & CONSTRAINT
col owner FORMAT A12
col CONSTRAINT_NAME FORMAT A31
col CONSTRAINT_TYPE FORMAT A10
col table_name FORMAT A25
col status  FORMAT A10

--Despliega las restricciones 
SELECT owner, CONSTRAINT_NAME,
    CONSTRAINT_TYPE, status
    from user_constraints
    where table_name in ('Employee', 'Secretary', 'Technician', 'Engineer');

spool off
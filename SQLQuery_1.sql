-- use Course418

-- select * from Students


-- select substring([Email],charindex('@',[Email])+1,len([Email])-charindex('@',[Email])+1) from Students


-- select substring([Email],1,charindex('@',[Email])-1) from Students


-- create view vw_getStudentsById
-- as
-- select * from Students where [Id]>2


-- select * from vw_getStudentsById




-- drop view vw_getStudentsByAge


-- create view vw_getStudentsByAge
-- as
-- select * from Students where [Age] > 25

-- select * from vw_getStudentsByAge


-- drop view vw_orderStudentsByCity


-- create view vw_joinStudentsData
-- as 
-- select st.FullName 'Student' , ct.Name 'City' , co.Name 'Country' from Students st 
-- join Cities ct
-- on st.CityId=ct.Id
-- join Countries co
-- on ct.CountryId=co.Id


-- select * from vw_joinStudentsData



-- create function dbo.getShowWords()
-- returns nvarchar(50)
-- as
-- begin
--    return 'Salllaaammmm'
-- end





-- declare @result nvarchar(59) = (select dbo.getShowWords());

-- print @result



-- create function dbo.showWordWitgParametr(@text nvarchar(50))
-- returns nvarchar(50)
-- as 
-- BEGIN
--     RETURN @text
-- END


-- select dbo.showWordWitgParametr('Semed Huseynov') as 'Name'
-- select dbo.showWordWitgParametr('Tunzale Huseynova') as 'Name'


-- create function dbo.getStudentsAvgAgesByIds(@Id int)
-- returns INT
-- as 
-- begin 
--     declare @count int = (select Count(*) from Students where [Id]>@Id)
--     declare @sumAge int = (select Sum(Age) from Students where [Id]>@Id)
--     return @sumAge/@count
-- end


-- create function dbo.getStudentsAgeAvgByI(@Id int )
-- returns int 
-- AS
-- BEGIN
--     return (select AVG(Age) from Students where [Id]>@Id)
-- END


-- select dbo.getStudentsAvgAgesByIds(3)


-- select dbo.getStudentsAgeAvgByI(3)



-- declare @avgAge int = (select dbo.getStudentsAvgAgesByIds(3))


-- select * from getStudentsByCondition(@avgAge)


-- create function dbo.getStudentsByCondition(@avgAge int)
-- returns table
-- as 
--     return (select * from Students where [Age] > @avgAge)




-- create procedure usp_showText
-- as
-- print 'Salllaaaammmm'


-- exec usp_showText



-- create procedure usp_showTextWithParametr
-- @text nvarchar (50)
-- as
-- print @text




-- exec usp_showTextWithParametr'Israil'


-- create procedure usp_deleteStudentById
-- @Id INT
-- as 
-- delete from Students where [Id]=Id

-- exec usp_deleteStudentById 1


-- select * from Students



-- create procedure usp_deleteEmployeesById
-- @Id INT
-- as
-- delete from Employees where [Id]=@Id


-- exec usp_deleteEmployeesById 1



-- select * from Employees



-- create procedure usp_createEmployee
-- @name nvarchar(50),
-- @surname nvarchar(50),
-- @email nvarchar(150),
-- @age int 
-- as
-- begin 
--     insert into Employees([Name],[Surname],[Email],[Age])
--     values (@name,@surname,@email,@age)
-- end



-- exec usp_createEmployee 'Tofiq', 'Nesibli' , 'tolik@mail.ru' , 29


create function dbo.getEmployeeAgeAvg2()
returns int 
as 
begin
return (select AVG([Age]) from Employees)
end




create procedure usp_deleteEmployeesByAge
AS
BEGIN
    declare @avgAge int = (select dbo.getEmployeeAgeAvg())
    delete from Employees where [Age]> @avgAge
END

exec usp_deleteEmployeesByAge


select * from Employees